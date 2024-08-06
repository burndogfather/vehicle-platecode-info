package main
import (
		"context"
		"log"
		"time"
		"strings"
		"fmt"
		"github.com/chromedp/cdproto/emulation"
		"github.com/chromedp/chromedp"
)

func main() {
	// 크롬 옵션 설정
	opts := append(chromedp.DefaultExecAllocatorOptions[:],
		chromedp.Flag("headless", true),
		chromedp.Flag("disable-gpu", true),
		chromedp.Flag("no-sandbox", true),
		chromedp.Flag("blink-settings", "imagesEnabled=false"),
	)
	taskCtx, cancel := chromedp.NewExecAllocator(context.Background(), opts...)
	defer cancel()
	taskCtx, cancel = chromedp.NewContext(taskCtx)
	defer cancel()
	taskCtx, cancel = context.WithTimeout(taskCtx, 30*time.Second)
	defer cancel()
	crawling(taskCtx, "116하6198")
}

type errorString struct {
		s string
}
func (e *errorString) Error() string {
		return e.s
}

func crawling(ctx context.Context, plateCode string){
	var carSearch string
	err := chromedp.Run(ctx,
		emulation.SetUserAgentOverride(`Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36 `),
		chromedp.Navigate(`https://www.car365.go.kr/web/contents/websold_vehicle.do`),
		chromedp.SendKeys(`input#search_str`, plateCode),
		chromedp.EvaluateAsDevTools(`usedCarCompareInfo("search")`, nil),
		chromedp.Text(`div.tblwrap_basic tbody#usedcarcompare_data`, &carSearch, chromedp.ByQuery),
	)
	if err != nil {
		fmt.Println("error : %s", err);
		return
	}
	
	if strings.Compare(carSearch, "데이터가 없습니다.") == 0 || strings.Compare(carSearch, "") == 0 {
		fmt.Println("error : %s", err);
	}
	
	//탭단위 데이터로 구분하여 가져온다.
	//"팰리세이드(PALISADE)\tLX8ABC-22-H0N\t2021\t1\t24,000,000\t-\t-"
	carDetails := strings.Split(carSearch, "\t")
	fmt.Println("output : %s", carDetails);
	return
}