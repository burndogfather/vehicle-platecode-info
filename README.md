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
  
CentOS7 기준에서 설치하는 방법입니다.   
다른 OS에서 설치시 이 설치방법은 참고용으로만 사용해주세요.
   
종속 라이브러리 목록   
- Go : 프로그램구동용
- Go chromedp : Golang에서 구글크롬을 제어하기 위한 라이브러리
- Go cdproto : Golang에서 구글크롬의 개발자모드를 사용하기 위한 라이브러리
- Google Chrome : 크롤링을 위한 브라우저
- Nginx : 차량조회를 위한 API의 웹프록시
- Certbot : 웹프록시에 Letsencrypt SSL을 사용하기 위한 도구
   

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
# 아래내용 추가
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


### 3. 구글크롬 브라우저 설치
  
```bash
# 참고) 크롬버전 123버전을 설치해야 CentOS7에서 사용하는 glibc 2.17버전에 대응이 가능함.
wget https://dl.google.com/linux/chrome/rpm/stable/x86_64/google-chrome-stable-123.0.6312.105-1.x86_64.rpm
sudo yum -y localinstall google-chrome-stable-123.0.6312.105-1.x86_64.rpm
rm -rf google-chrome-stable-123.0.6312.105-1.x86_64.rpm
```


### 4. 차량조회 프로그램 컴파일 및 설치
  
```bash
yum -y install unzip
cd
wget https://github.com/burndogfather/vehicle-platecode-info/archive/refs/heads/main.zip
unzip main.zip -d /
cd /vehicle-platecode-info-main/
go mod init dadolcorp.com/vehicle-platecode-info
go get github.com/chromedp/chromedp
go get github.com/chromedp/cdproto/emulation

go run vehicleplatecode.go
Ctrl+C

rm -rf vehicleplatecode
go build vehicleplatecode.go 
ls -al
chmod -R 755 ./vehicleplatecode
cd
rm -rf main.zip
```


### 5. 부팅시 차량조회 프로그램 작동하도록 설정
  
```bash
vi /etc/rc.local
# 아래내용 추가
nohup /vehicle-platecode-info-main/vehicleplatecode > /dev/null &
:wq

chmod +x /etc/rc.d/rc.local
systemctl status rc-local.service
systemctl start rc-local.service

vi /usr/lib/systemd/system/rc-local.service
# 아래내용 추가
[Install]
WantedBy=multi-user.target
:wq

systemctl enable rc-local.service
systemctl list-unit-files | grep rc.local
systemctl status rc-local.service
ps -ef | grep vehicleplatecode
```


### 6. Nginx ReversProxy 설치 및 SSL 설정
  
```bash
cd
wget https://nginx.org/packages/rhel/7/x86_64/RPMS/nginx-1.20.1-1.el7.ngx.x86_64.rpm
rpm -Uvh nginx-1.20.1-1.el7.ngx.x86_64.rpm 

vi /etc/yum.repos.d/nginx.repo
# 아래내용 입력
[nginx]
name=nginx repo
baseurl=http://nginx.org/packages/centos/7/$basearch/
gpgcheck=0
enabled=1
:wq

yum -y install pcre-devel libxml2-devel zlib zlib-devel openssl openssl-devel gcc g++ cpp gcc-c++ libxslt libxslt-devel libgd-dev gd gd-devel perl perl-ExtUtils-Embed geoip-devel
yum -y install nginx
service nginx start
sudo systemctl enable nginx

sudo firewall-cmd --permanent --zone=public --add-service=ssh
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload

mkdir /nginx_cache
chmod -R 755 /nginx_cache
chown -R nginx:nginx /nginx_cache

rm -rf /etc/nginx/nginx.conf

vi /etc/nginx/nginx.conf
# 아래내용 입력
user  nginx;
worker_processes  auto;
error_log  /var/log/nginx/error.log crit;
pid        /var/run/nginx.pid;
events {
	worker_connections  1024;
	use epoll;
	multi_accept on;
}
http {
	include       /etc/nginx/mime.types;
	default_type  application/octet-stream;
	server_tokens off;
	client_body_buffer_size 128k;
	client_header_buffer_size 1m;
	client_max_body_size 2000m;
	large_client_header_buffers 8 8k;
	output_buffers 1 32k;
	postpone_output 1460;
	client_header_timeout 3m;
	client_body_timeout   3m;
	send_timeout          3m;
   log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
					  '$status $body_bytes_sent "$http_referer" '
					  '"$http_user_agent" "$http_x_forwarded_for"';
	access_log  off;
	server_names_hash_bucket_size 64;
	server_names_hash_max_size 2048;
	keepalive_timeout 10;
	sendfile        off;
	tcp_nopush     off;
	tcp_nodelay    off;
	types_hash_max_size 2048;
	proxy_cache_path /nginx_cache keys_zone=cache:10m levels=1:2 inactive=600s max_size=1g;
	gzip  on;
	gzip_buffers 16 8k;
	gzip_comp_level 6;
	gzip_http_version 1.0;
	gzip_min_length 1;
	gzip_types application/x-javascript text/css application/javascript text/javascript text/plain application/json application/vnd.ms-fontobject application/x-font-opentype application/x-font-truetype application/x-font-ttf application/xml font/eot font/opentype font/otf image/svg+xml image/vnd.microsoft.icon;

	include /etc/nginx/conf.d/*.conf;
}
:wq

vi /etc/nginx/conf.d/도메인명.conf
# 아래내용 입력
server {
		server_name 도메인명;
		charset utf-8;
		location / {
				proxy_pass http://127.0.0.1:8001;
				proxy_redirect off;
				proxy_pass_header Server;
				proxy_set_header Host $http_host;
				proxy_set_header X-Real-IP $remote_addr;
				proxy_set_header X-Scheme $scheme;
				proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
				proxy_set_header X-Forwarded-Server $host;
				proxy_set_header X-Forwarded-Host $host;

		}
}
:wq

service nginx restart
sudo yum -y install epel-release yum-utils
sudo yum -y install certbot certbot-nginx
sudo certbot --nginx

vi /etc/nginx/conf.d/도메인명.conf
# 아래내용 추가
http2_push_preload on;
# 아래내용 변경
listen 443 ssl; ->> listen 443 ssl http2;
:wq

service nginx restart

sudo crontab -e
# 아래내용 추가
0 1 * * * /usr/bin/certbot renew
:wq

service crond restart
setsebool httpd_can_network_connect on -P
```