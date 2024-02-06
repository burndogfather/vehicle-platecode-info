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
		
		// 크롬 옵션 설정
		opts := append(chromedp.DefaultExecAllocatorOptions[:],
			// Headless 모드 활성화
			chromedp.Flag("headless", true),
			// GPU 가속 비활성화 (Headless 모드에서는 필요 없음)
			chromedp.Flag("disable-gpu", true),
			// 샌드박스 없이 실행 (일부 환경에서 필요할 수 있음)
			chromedp.Flag("no-sandbox", true),
			// 이미지 로딩 비활성화 (크롤링 성능 향상)
			chromedp.Flag("blink-settings", "imagesEnabled=false"),
		)
		
		// 커스텀 옵션을 사용하여 Allocator 컨텍스트 생성
		taskCtx, cancel := chromedp.NewExecAllocator(context.Background(), opts...)
		defer cancel()
		
		// Allocator 컨텍스트를 사용하여 Chromedp 컨텍스트 생성
		taskCtx, cancel = chromedp.NewContext(taskCtx)
		defer cancel()
		
		//최대 대기시간은 15초
		taskCtx, cancel = context.WithTimeout(taskCtx, 30*time.Second)
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
	var carSearch string
	err := chromedp.Run(ctx,
		emulation.SetUserAgentOverride(`Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/119.0.0.0 Safari/537.36`), //USER AGENT설정
		chromedp.Navigate(`https://www.car365.go.kr/web/contents/websold_vehicle.do`),
		//chromedp.WaitVisible(`input#search_str`, chromedp.ByQuery),
		chromedp.SendKeys(`input#search_str`, plateCode),
		chromedp.EvaluateAsDevTools(`usedCarCompareInfo("search")`, nil),
		chromedp.Text(`div.tblwrap_basic tbody#usedcarcompare_data`, &carSearch, chromedp.ByQuery),
	)
	if err != nil {
		//실패시 fail출력
		res.Header().Set("Content-Type", "application/json")
		resdata["status"] = "fail"
		resdata["errormsg"] = err.Error()
		output, err := json.Marshal(resdata)
		if err != nil {
			//log.Fatalf("Error happened in JSON marshal. Err: %s", err)
		}
		res.Write(output)
		return 
	}
	
	if strings.Compare(carSearch, "데이터가 없습니다.") == 0 || strings.Compare(carSearch, "") == 0 {
		//실패시 fail출력
		res.Header().Set("Content-Type", "application/json")
		resdata["status"] = "fail"
		resdata["errormsg"] = "매매사업조합에 제시/매도정보를 제공하지 않은 차량입니다"
		output, err := json.Marshal(resdata)
		if err != nil {
			//log.Fatalf("Error happened in JSON marshal. Err: %s", err)
		}
		res.Write(output)
		return 
	}
	
	//탭단위 데이터로 구분하여 가져온다.
	//"팰리세이드(PALISADE)\tLX8ABC-22-H0N\t2021\t1\t24,000,000\t-\t-"
	carDetails := strings.Split(carSearch, "\t")
	
	//성공시 출력
	res.Header().Set("Content-Type", "application/json")
	resdata["status"] = "success"
	resdata["platecode"] = plateCode
	resdata["name"] = carDetails[0]
	resdata["type"] = carDetails[1]
	resdata["year"] = carDetails[2]
	if len(carDetails) > 4 && carDetails[4] != "" {
		resdata["price"] = carDetails[4]
	} else {
		resdata["price"] = "-"
	}
	output, err := json.Marshal(resdata)
	if err != nil {
		//log.Fatalf("Error happened in JSON marshal. Err: %s", err)
	}
	res.Write(output)
	return 
	
}