package main
import (
	"net/http"
	"encoding/json"
	"context"
	"log"
	"time"
	"strings"
	//"fmt"
	
	"github.com/chromedp/cdproto/emulation"
	"github.com/chromedp/chromedp"
)

//메인함수
func main() {
	
	//8001번 포트로 http 서버열기
	//nginx연결됨 (https://git.coco.sqs.kr/proxy-8001)
	err := http.ListenAndServe(":8001", http.HandlerFunc(requestHandler))
	if err != nil {
		//http 서버 실행실패시 에러처리
		log.Println("Failed to ListenAndServe : ", err)
	}
}

//err.Error() 를 통해 error메시지를 string으로 변환
type errorString struct {
	s string
}
func (e *errorString) Error() string {
	return e.s
}

//요청이 들어오면 실행되는 함수
func requestHandler(res http.ResponseWriter, req *http.Request) {
	
	//반환될 Response 사전정의
	res.WriteHeader(http.StatusCreated)
	
	
	//FORM > POST 데이터 가져오기
	req.ParseForm()
	postdata := req.PostForm
	
	//POST 데이터에서 url이라는 값을 찾아서 String을 벗기기(?)
	if ( postdata["platecode"] != nil){ 
		
		//Map풀기
		plateCode := postdata["platecode"][0]
		//fmt.Println(plateCode);
		
		//Chromedp설정
		taskCtx, cancel := chromedp.NewContext(
			context.Background(),
		)
		defer cancel()
		
		//최대 대기시간은 15초
		taskCtx, cancel = context.WithTimeout(taskCtx, 15*time.Second)
		defer cancel()
		
		crawling(taskCtx, plateCode, res)
		
		
	}else{
		//실패시 fail출력
		res.Header().Set("Content-Type", "application/json")
		resdata := make(map[string]string)
		resdata["status"] = "fail"
		resdata["errormsg"] = "잘못된 데이터 입력입니다"
		output, err := json.Marshal(resdata)
		if err != nil {
			//log.Fatalf("Error happened in JSON marshal. Err: %s", err)
		}
		res.Write(output)
		return 
	}
}

func crawling(ctx context.Context, plateCode string, res http.ResponseWriter){
	
	resdata := make(map[string]string)
	
	//사이트 캡쳐해서 버퍼생성
	var carPrice string
	var carName string
	var carType string
	var carYear string
	err := chromedp.Run(ctx,
		emulation.SetUserAgentOverride(`Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36`), //USER AGENT설정
		chromedp.Navigate(`https://www.car365.go.kr/web/contents/websold_vehicle.do`),
		chromedp.WaitVisible(`input#search_str`, chromedp.ByQuery),
		chromedp.SendKeys(`input#search_str`, plateCode),
		chromedp.EvaluateAsDevTools(`usedCarCompareInfo("search")`, nil),
		chromedp.WaitVisible(`div.tblwrap_basic tbody#usedcarcompare_data > tr > td:nth-of-type(5)`, chromedp.ByQuery),
		chromedp.Text(`div.tblwrap_basic tbody#usedcarcompare_data > tr > td:nth-of-type(1)`, &carName, chromedp.ByQuery),
		chromedp.Text(`div.tblwrap_basic tbody#usedcarcompare_data > tr > td:nth-of-type(2)`, &carType, chromedp.ByQuery),
		chromedp.Text(`div.tblwrap_basic tbody#usedcarcompare_data > tr > td:nth-of-type(3)`, &carYear, chromedp.ByQuery),
		chromedp.Text(`div.tblwrap_basic tbody#usedcarcompare_data > tr > td:nth-of-type(5)`, &carPrice, chromedp.ByQuery),
		chromedp.Stop(),
	)
	if err != nil {
		//실패시 fail출력
		res.Header().Set("Content-Type", "application/json")
		resdata["status"] = "fail"
		resdata["errormsg"] = "차량번호를 찾을 수 없습니다"
		output, err := json.Marshal(resdata)
		if err != nil {
			//log.Fatalf("Error happened in JSON marshal. Err: %s", err)
		}
		res.Write(output)
		return 
	}
	
	if strings.Compare(carName, "") == 0 {
		//실패시 fail출력
		res.Header().Set("Content-Type", "application/json")
		resdata["status"] = "fail"
		resdata["errormsg"] = "차량번호를 찾을 수 없습니다"
		output, err := json.Marshal(resdata)
		if err != nil {
			//log.Fatalf("Error happened in JSON marshal. Err: %s", err)
		}
		res.Write(output)
		return 
	}
	
	//성공시 출력
	res.Header().Set("Content-Type", "application/json")
	resdata["status"] = "success"
	resdata["platecode"] = plateCode
	resdata["name"] = carName
	resdata["type"] = carType
	resdata["year"] = carYear
	resdata["price"] = carPrice
	output, err := json.Marshal(resdata)
	if err != nil {
		//log.Fatalf("Error happened in JSON marshal. Err: %s", err)
	}
	res.Write(output)
	return 
	
}