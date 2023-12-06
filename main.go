package main
import (
	"net/http"
	"encoding/json"
	"context"
	"log"
	"time"
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
	resdata := make(map[string]string)
	
	//FORM > POST 데이터 가져오기
	req.ParseForm()
	postdata := req.PostForm
	
	//POST 데이터에서 차량번호 값을 찾아서 String을 벗기기(?)
	if ( postdata["platecode"] != nil){ 
		
		//Map풀기
		//platecode := postdata["platecode"][0]
		
		
		//Chromedp설정
		taskCtx, cancel := chromedp.NewContext(
			context.Background(),
			chromedp.WithLogf(log.Printf),
		)
		defer cancel()
		
		//최대 대기시간은 15초
		taskCtx, cancel = context.WithTimeout(taskCtx, 15*time.Second)
		defer cancel()
		
		var strVar string
		err := chromedp.Run(taskCtx,
			chromedp.Navigate("https://golang.org/pkg/fmt/"),
			chromedp.WaitVisible("body > footer"),
			chromedp.Click("#pkg-examples > div", chromedp.NodeVisible),
			chromedp.Value("#example_Println .play .input textarea", &strVar),
		)
		
		//실패시 fail출력
		res.Header().Set("Content-Type", "application/json")
		output, err := json.Marshal(strVar)
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