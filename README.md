# vehicle-platecode-info
<img src="https://img.shields.io/github/size/burndogfather/vehicle-platecode-info/vehicleplatecode.go"/>
한국 차량번호 정보조회 (feat. Golang)
   
![스크린샷 2024-06-20 오전 10 53 20](https://github.com/burndogfather/vehicle-platecode-info/assets/101985768/0556fb4b-44ec-4b91-b5da-3e128c98418b)
   
대한민국의 차량번호를 조회하여 해당 차량번호의 차종 및 매매가격을 조회하는 프로그램입니다.   
11가1111, 111가1111, 서울11가1111 등과 같이 대한민국에 등록된 모든 개인차량/법인차량/렌트카/영업용차량을 조회할 수 있습니다.
   
### 반환가능한 데이터  
   
- 조회결과 (status)
- 차량명 (name)
- 연식 (year)
- 차량타입 (type)
- 평균매매가격 (price)
- 조회실패사유 (errormsg)
   
------  
   
# 설치방법
  
```bash
# CentOS7 기준에서 설치하는 방법입니다.
# 다른 OS에서 설치시 이 설치방법은 참고용으로만 사용해주세요.

# 종속 라이브러리 목록
# - Go : 프로그램구동용
# - Go Chromedp : Golang에서 구글크롬을 제어하기 위한 라이브러리
# - Go cdproto : Golang에서 구글크롬의 개발자모드를 사용하기 위한 라이브러리
# - Google Chrome : 크롤링을 위한 브라우저
# - Nginx : 차량조회를 위한 API의 웹프록시
# - Certbot : 웹프록시에 Letsencrypt SSL을 사용하기 위한 도구
```

### 1. 시스템 패키지 및 날짜정보 동기화
  
```bash
yum update -y
yum install net-tools -y
yum install rdate -y
rdate -s time.bora.net
```


### 2. Golang 설치
  
```bash
cd
wget  https://go.dev/dl/go1.22.1.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.1.linux-amd64.tar.gz
cd /usr/local/go/bin
./go version

vi ~/.bash_profile
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin
:wq

source ~/.bash_profile
go version
go env -w GO111MODULE=auto
cd 
rm -rf go1.22.1.linux-amd64.tar.gz
```