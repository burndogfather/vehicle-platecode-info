package main
import (
	"net/http"
	"encoding/json"
	"context"
	"log"
	"time"
	"fmt"
	"github.com/chromedp/cdproto/emulation"
	"github.com/chromedp/cdproto/page"
	"github.com/chromedp/chromedp"
)

//메인함수
func main() {
	
	//8000번 포트로 http 서버열기
	//nginx연결됨 (https://git.coco.sqs.kr/proxy-8000)
	err := http.ListenAndServe(":8000", http.HandlerFunc(requestHandler))
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
	resdata := make(map[string]string)
	
	//FORM > POST 데이터 가져오기
	req.ParseForm()
	postdata := req.PostForm
	fmt.Println(postdata);
	
	//POST 데이터에서 url이라는 값을 찾아서 String을 벗기기(?)
	if ( postdata["platecode"] != nil){ 
		
		//Map풀기
		platecode := postdata["platecode"][0]
		fmt.Println(platecode)
		
		//Chromedp설정
		taskCtx, cancel := chromedp.NewContext(
			context.Background(),
			chromedp.WithLogf(log.Printf),
		)
		defer cancel()
		
		//최대 대기시간은 15초
		taskCtx, cancel = context.WithTimeout(taskCtx, 15*time.Second)
		defer cancel()
		
		//사이트 캡쳐해서 버퍼생성
		var outputStr string
		if err := chromedp.Run(taskCtx, pdfGrabber("https://www.google.co.kr", "body", &outputStr)); err != nil {
			//실패시 fail출력
			res.Header().Set("Content-Type", "application/json")
			resdata["status"] = "fail"
			resdata["errormsg"] = err.Error()
			output, err := json.Marshal(resdata)
			if err != nil {
				log.Fatalf("Error happened in JSON marshal. Err: %s", err)
			}
			res.Write(output)
			return 
		}
		
		//성공시 PDF형태로출력
		res.Header().Set("Content-Type", "application/json")
		resdata["status"] = "success"
		resdata["data"] = outputStr
		output, err := json.Marshal(resdata)
		if err != nil {
			log.Fatalf("Error happened in JSON marshal. Err: %s", err)
		}
		res.Write(output)
		return 
		
	}else{
		//실패시 fail출력
		res.Header().Set("Content-Type", "application/json")
		resdata["status"] = "fail"
		resdata["errormsg"] = "Parameter ERROR!"
		output, err := json.Marshal(resdata)
		if err != nil {
			log.Fatalf("Error happened in JSON marshal. Err: %s", err)
		}
		res.Write(output)
		return 
	}
}

//PDF생성함수
func pdfGrabber(url string, sel string, res string) chromedp.Tasks {
	
	return chromedp.Tasks{
		emulation.SetUserAgentOverride("WebScraper 1.0"), //USER AGENT설정
		chromedp.Navigate(url),
		chromedp.WaitVisible(sel, chromedp.ByQuery),
		chromedp.InnerHTML(`body`, &res),
	}
}
