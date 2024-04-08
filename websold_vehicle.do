<!DOCTYPE HTML>
<html lang="ko"
	>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<!-- <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"> -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="format-detection" content="telephone=no" />

<link href="/resource/common_dz/css/swiper.min.css"
		rel="stylesheet" type="text/css" />
	<link href="/resource/common_dz/css/New_style.css"
		rel="stylesheet" type="text/css" />

	<script src="/resource/templete_common/js/jquery-1.12.0.min.js"></script>
	<script src="/resource/common_ais/js/jquery.js"></script>

	<script src="/resource/templete_common/js/jquery-ui.min.js"></script>
	<script src="/resource/templete_common/js/owl.carousel.min.js"></script>

	<script src="/resource/common_ais/js/common_functions.js"></script>
	<script src="/resource/common_ais/js/modile/common.js"></script>
	<script src="/resource/common_ais/js/modile/touchmovemenu.js"></script>


	<script src="/resource/common_ais/js/slick.js"></script>
	<script src="/resource/common_ais/js/swiper.min.js"></script>
	<script src="/resource/common_dz/js/bgstyle.js"></script>

	<script src="/resource/common_dz/js/guide.js"></script>

	<script src="/resource/common/jquery_plugin/common_functions.js"></script>
<script src="/resource/common_ais/js/jquery.1.12.0.min.js"></script>
<script src="/resource/common_ais/js/jquery.main.js"></script>
<script
	src="/resource/common_ais/js/jquery.bxslider.min.js?ver=1.03"></script>
<script src="/resource/common_ais/js/swiper.min.js"></script>
<script src="/resource/common_ais/js/main.js?ver=1.03"></script>
<script src="/resource/common_ais/js/jquery.js"></script>
<script src="/resource/templete_common/js/jquery-ui.min.js"></script>
<!-- <link rel="shortcut icon" href="#"> -->
<!-- favicon.ico  -->
<script src="/resource/common_dz/js/base64.min.js"></script>




<!--[if lte IE 9]><script src="/templete_common/js/html5shiv.js"></script><![endif]-->



<script>
//<![CDATA[

	$(document).ready(function(){
		
		// 서비스이용설문조사  - 20210312_pjw
		var pageCodeArray = Array("websold_vehicle");
		if( pageCodeArray.indexOf($("#survey_pagecode").val()) != -1 ){
			common_survey("check");
		}
		// 메뉴타이틀 네비게이션 아래로이동
		if( ($(".tit").width()-$(".tit").find("h2").width())/2 < $(".navi").width() ){
			$(".navi").css("top","90%");
		}
		
		
		// url전체주소로 접속시 메인으로 이동  - 20200312_pjw
		/*
		var access_url_array = document.location.href.split("/");
		var access_domain = access_url_array[0]+"//"+access_url_array[2];
		var access_page = document.location.href.replace(access_domain,"");
		if(!parent.AdjustIframeHeight){
			ItgJs.fn_setCookie("access_reload", access_page, 1);
			document.location.href = access_domain;
		}
		*/
		
		$("#subCore").addClass("");//아이콘 색 지정
		var actTab = $(".tabmenuList5").find(".active").children("a");
		actTab.attr("title", "선택됨");
		if (actTab.length > 0) {
			$(".sub_inner").children().eq(0).before("<h3 class='ir'>"+ actTab.html()+"</h3>");
		}
		//아이프레임 크기 변경
		if(parent.AdjustIframeHeight){
			parent.AdjustIframeHeight(document.getElementById("container").scrollHeight+420);
		}
		var param = null;
	
		if(parent.chParentWindowTitle){
			parent.chParentWindowTitle(document.title, param);			
		}

		/* var statusmsg = "대국민 자동차포털"
			function hidestatus(){
				window.status = statusmsg;
				return true;
			}

			function hideURL(){


				window.status = msg;
				timerID = setTimeout("hideURL()", 0);
				}

				hideURL(); */

	});
	
	$(function(){
		$(window).load(function(){

		});
		
		$("#btn_sch").click(function() {
			if ( $("#sch_engine").css('display') == 'none') {
				$("#sch_engine").css('display', 'inline');
				$("#btn_sch").hide();
				$(".gnb").hide();
				$("#btn_close").show();
			}
	    });
		$("#btn_close").click(function() {
			$("#sch_engine").css('display', 'none');
			$("#btn_sch").show();
			$(".gnb").show();
			$("#btn_close").hide();
		});
	});	
	
	$(document).on('click','.m_btn_qtop',function(){
		$("html , body").animate({scrollTop:0},"fast");
	});

	var statusmsg="대국민 자동차포털"

	function hidestatus(){

		window.status=statusmsg;

		return true;

	}
	// 페이지별만족도설문  - 20200417_pjw
	function page_satisfaction_research() {
		if($("#question_url")){
			$("#question_url").val(document.location.href);			
		}
		var clientIp = "";
		
		var questionPagecode = $("#question_pagecode").val();
		var questionUrl = $("#question_url").val();
		var questionValue = $("input[name='question_value']:checked").val();
		var questionObj = $("input[name='question_value']:checked");

		if(questionPagecode=="" || questionUrl=="" || questionValue=="" || questionValue==undefined){
			alert("만족도를 선택해 주십시오.");
			return false;
		}
		
		if (!confirm("`"+questionObj.attr("title")+"`을 선택하셨습니다.\n콘텐츠 만족도 설문조사에 참여하시겠습니까?")) {
			return false;
		}
		
		var url = "/api/satisfactionResearch.do";

		$.ajax({
			type : 'GET',
			url : url,
			data : {
				machineCode : "1",
				questionPagecode : questionPagecode,
				questionUrl : questionUrl,
				questionValue : questionValue,
				clientIp : clientIp
			},
			contentType : "application/json;charset=UTF-8",
			dataType : "json",	
			success:function(data){
				var info_array = data;
				if(info_array.RESULT_CODE=="00"){
					alert("콘텐츠 만족도 설문조사에 참여해 주셔서 감사합니다.");
				}else {
					alert(info_array.RESULT_MSG);
				}
			},
			error : function(xhr, status, error) {
				console.log(xhr);
				console.log(status);
				console.log(error);
				alert(status);
			}
		});
	}
 
//]]>
</script>

<!--[if lte IE 9]><script src="../../js/html5shiv.js"></script><![endif]-->

<title>매매용 차량 신속조회 : 자동차365</title>
</head>

<style>
.link_icon a::after {
	background: url(/resource/common_ais/img/sub/mlist_link_off.png) 0 0
		no-repeat;
	content: "";
	display: inline-block;
	width: 14px;
	height: 14px;
	position: relative;
	left: 10px;
	top: 1px;
}
</style>

<body class="pc">
	<div id="pc_mode">
		<div id="loadmingDiv"
			style="width: 100%; height: 100%; top: 0px; left: 0px; position: absolute; z-index: 105; background: rgb(31, 31, 31); opacity: 0.55; visibility: visible; display: none"></div>
		<header>

			<div class="u_m">
				<ul class="u_l">
					<li><a href="/web/main/index.do" title="처음으로">처음으로</a></li>
					<li><a href="/web/contents/webSitemap.do"
						title="사이트맵">사이트맵</a></li>
					<li style="width: 230px;"><a
						href="https://www.ecar.go.kr/Index.jsp"
						style="padding: 0 20px 0 30px;" target="_blank"
						title="자동차민원 대국민포털">자동차민원 대국민포털</a><span><img
							src="/resource/common_dz/images/gobtn.png" alt="바로가기"
							style="padding-top: 7px; box-sizing: border-box; cursor: pointer;" /></span></li>
					</ul>
			</div>


			<div class="header_wrap">
				<div class="header_wrap_inner">

					<h1 class="pc_logo">
						<a href="/web/main/index.do"><img
							src="/resource/common_dz/images/car_logo.png"
							alt="자동차365 LOGO"></a>
					</h1>
					<nav class="gnb">
						<ul>
							<li class="menu"><a href="/web/contents/newcar_main.do">신차구입</a></li>
							<li class="menu"><a href="/web/contents/running_main.do">운행</a></li>
							<li class="menu"><a href="/web/contents/usedcar_main.do">중고차
									매매</a></li>
							<li class="menu"><a href="/web/contents/disusedcar_main.do">폐차</a></li>
							<li class="menu"><a href="/web/contents/etc_main.do">기타</a></li>
						</ul>
					</nav>

					<div class="New_login">
						<ul>
								<li style="padding: 0 20px;">
									<form id="sch_engine" name="listForm" method="post"
										action="https://www.car365.go.kr/search/front/Search.jsp"
										accept-charset="utf-8" style="display: none;">
										<input type="text" name="qt" id="schStr" value=""
											title="검색어 입력" placeholder="검색어를 입력해주세요."
											style="width: 350px; margin-right: 5px; margin-top: -7px; height: 40px; box-sizing: border-box; font-size: 16px; padding-left: 10px; ime-mode: active;" />
										<input type="image"
											src="/resource/common_dz/images/board_search.png"
											alt="검색"
											style="height: 24px; width: 23px; margin-bottom: 8px;" />
									</form> <a id="btn_close" style="display: none;"> <input
										type="image"
										src="/resource/common_dz/img/common/btn_close.png"
										alt="닫기" style="padding: 0 10px; margin-top: -7px;" />
								</a> <a id="btn_sch"> <input type="image"
										src="/resource/common_dz/images/board_search.png"
										alt="검색" />
								</a>
								</li>
								<li><a href="/web/contents/member_login.do">로그인</a></li>
								<li>|</li>
								<li><a href="/web/contents/member_regist.do">회원가입</a></li>
							</ul>
						</div>

				</div>
			</div>
		</header>

		<div>
			<div class="mob_header">
				<h1 class="logo wrap_c">
					<a href="/web/main/index.do"><img
						src="/resource/common_dz/images/mlogo.png" alt="자동차365 LOGO"></a>
				</h1>

				<div class="mob_menu">
					<p class="mob_btn">
						<a href="javascript:void(0);" class="mmenu"><img
							src="/resource/common_dz/images/menu.png" alt="모바일메뉴보기"></a>
					</p>
					<nav class="mob">
						<h2 class="blind">대메뉴</h2>
						<ul class="mo">
							<li><a href="/web/contents/newcar_main.do">신차구입</a></li>
							<li><a href="/web/contents/running_main.do">운행</a></li>
							<li><a href="/web/contents/usedcar_main.do">중고차 매매</a></li>
							<li><a href="/web/contents/disusedcar_main.do">폐차</a></li>
							<li><a href="/web/contents/etc_main.do">기타</a></li>
						</ul>
					</nav>
				</div>

				<div class="login"
					style="position: absolute; top: 30%; right: 15px;">
					<p>
						<a href="https://www.car365.go.kr/search/front/Search.jsp"> <img
							src="/resource/common_dz/images/search.png" alt="검색"
							style="padding: 0 8px; width: 25px; height: 25px;">
						</a>
						<a href="/web/contents/member_login.do"> <img
								src="/resource/common_dz/images/icon_login.png" alt="로그인">
							</a>
						</p>
				</div>

			</div>
		</div>


		<div style="width: 1200px; position: relative;margin: 0 auto;">
		<div class="m_quick_layer">
			<div class="m_quick_item">
				<p class="m_quick_top">QUICK MENU</p>
				<div class="m_qm_list_w" id="m_qmList" style="touch-action: none;">
					<ul class="m_qm_list iscroll" style="transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms; transform: translate(0px, 0px) translateZ(0px);">
						<li>
							<a href="/web/contents/websold_vehicle.do" class="m_qm_item" style="cursor: pointer;">
								매매용 차량<br/>신속조회</a>
						</li>
						<li>
							<a href="/web/contents/usedcar_price.do" class="m_qm_item" style="cursor: pointer;">
								중고차 시세<br/>조회</a>
						</li>
						<li>
							<a href="/web/contents/newcar_cost.do" class="m_qm_item" style="cursor: pointer;">
								자동차(신차)<br/>등록비용 조회</a>
						</li>
						<li>
							<a href="/web/contents/totalhistory.do" class="m_qm_item" style="cursor: pointer;">
								통합이력<br/>조회</a>
						</li>
						<li>
							<a href="/web/contents/floodedvehicle.do" class="m_qm_item" style="cursor: pointer;">
								중고차<br/>침수정보 조회</a>
						</li>
					</ul>
				</div>
				<button type="button" class="m_btn_qtop"><span>TOP ▲</span></button>
			</div>
		</div>
	</div><section id="container" class="sub">
			<div id="wrap">
				<div class="subContainer">
					<div class="stopTitle">
						<div class="wpb_wrapper">
							<h2 class="sub_top_title">매매용 차량 신속조회</h2>
								</div>
					</div>
					<div class="contentsWrap">
						<!-- <div class="content_w" style="margin: 0 auto; width : 1200px;" id="viewContent"> -->
						<div class="sub_inner">
							<!-- menuType = 0 : 폴더 -->
							<!-- menuType = 1 : CMS 컨텐츠 -->
							<!-- menuType = 2 : 프로그램 -->
							<!-- menuType = 3 : 게시판 -->
							<!-- menuType = 4 : 링크 -->
							<!-- menuType = 5 : 컨텐츠없음 -->
							<!-- menuType = 6 : 폴더+CMS 컨텐츠 -->
							<!-- sub_inner -->
							﻿<script src="/dynaPath/dynapath.js"></script>
<script>
setInterval(function() {
	location.reload();
},900000);	//	15분에 한번씩 reload()
//<![CDATA[

var loginYn;
$(function(){
	$(window).load(function(){
		//$("#roof_area").hide();
		var url = "/web/program/searchLoginYn.do";
		$.ajax({
			type : "GET",
			url : url,
			async : "false",
			contentType : "application/json;charset=UTF-8",
			dataType : "json",	
			success:function(data){
				loginYn = data.LOGIN_YN;
	        },
			error : function(xhr, status, error) {
				console.log(xhr);
				console.log(status);
				console.log(error);					
			}
		});
		
	});
	
	
	$("#imprmn_close").click(function() {
        $("#popup_imprmn").hide();
    });
	
	$("#imprmn_close_btn").click(function() {
        $("#popup_imprmn").hide();
    });
});

$(document).on('keydown','#search_str',function(event){
	if(event.keyCode=='13'){
		soldvehicle_info('koreacarmarket'); 
	}
});

function soldvehicle_info(guild) {
	var toDate = new Date();
	var nowDate = toDate.getFullYear()+'-'+(toDate.getMonth()+1)+'-'+toDate.getDate()+" "+toDate.getHours()+":"+toDate.getMinutes()+":"+toDate.getSeconds();
	if(nowDate >= "2019-10-24 19:00:00" && nowDate <= "2019-10-24 20:30:00"){
		alert("시스템 점검중입니다.\n점검시간 : 19:00~20:30");
		return;
	}
	
	var vhrno = $("#search_str").val();
	$("#vhrno").val(vhrno);
	var clientIp = "";

	if(vhrno==""){
		alert("차량번호를 입력해주세요.");
		$("#search_str").focus();
		return;
	}
	$("#roof_area").show();
	
	vhrno = vhrno.replace(" ","");
	vhrno = $.trim(vhrno);
	$("#search_str").val(vhrno);
	
	var url = "/web/program/soldvehicleData.do";

	$.ajax({
		type : 'GET',
		url : url,
		data : {
			vhrno : vhrno,
			guild : guild,
			clientIp : clientIp
		},
		contentType : "application/json; charset=UTF-8",
		dataType : "json",	
        success:function(data){
        	console.log(data);
        	if(loginYn == "Y") {
        		$("#totalhistory_view").fadeIn();
        		$("#login_alert").hide();
        	} else {
        		$("#login_alert").fadeIn();
        		$("#totalhistory_view").hide();
        		$("#totalhistory_nodata").hide();
        	}
        	
        	var info_array = data;
        	var guild_status = "Y";
			vhrno = info_array.GUILD_CAR_VHRNO;
        	$.each(info_array, function(key, value) {
        		if(key=="GUILD_URL" || key=="GUILD_CAR_VHRNO"){//실매물버튼 , 상세정보버튼
        			var href_url = "javascript:void(0);";
        			var href_url_btn = "N";
        			if(key=="GUILD_URL" && value!=""){
        				href_url = value;
        				href_url_btn = "Y";
        			}else if(key=="GUILD_CAR_VHRNO" && info_array.GUILD_TS_SALE=="Y"){
        				href_url = "http://www.ecar.go.kr/Index.jsp?vhrno="+value;
        				href_url_btn = "Y";
        			}
        			if(href_url_btn == "Y"){
        				$("#"+key).show();
            			$("#"+key).attr("href",href_url);
        			}else {
        				$("#"+key).hide();
        			}
        		}else if(value){
        			if(key=="GUILD_CAR_DSPLVL" || key=="GUILD_CAR_PERSON" || key=="GUILD_CAR_MILEAGE"){//배기량,승차정원,주행거리
        				//value = ItgJs.fn_numberFormat(value*1);
				value = parseInt(value*1);
        			}
        			$("#"+key).html(value);
        			if(key=="GUILD_STATUS" && value=="매도"){//제시,매도
        				guild_status = "N";	
        			}
        		}else {
        			$("#"+key).html("＊＊＊＊＊");
        		}
        		
        	});
        	console.log(info_array.GUILD_ERRORMSG);
        	if(info_array.GUILD_RESULT_CODE=="10003" || info_array.GUILD_RESULT_CODE=="10002" || info_array.GUILD_RESULT_CODE=="006"){
        		result_area_view("first","");
        		if(info_array.GUILD_RESULT_CODE=="10003" || info_array.GUILD_RESULT_CODE=="006"){
        			alert("1대의 PC에서 조회 가능한 횟수(20회)를 초과 하였습니다.");
        		}else {
        			alert(info_array.GUILD_ERRORMSG);
        		}
        		$("#roof_area").hide();
        		return;
        	}
        	
        	if(info_array.GUILD_RETRY!="end"){
        		soldvehicle_info(info_array.GUILD_RETRY);
        		return;
        	}else {
        		$("#roof_area").fadeOut();
        	}
        	
        	if(guild_status=="N"){//조합매도차량
        		//alert("조합매도차량");
        		result_area_view("N","N");
        		totalhist_info();
        	}else if(info_array.GUILD_TYPE=="car365" && info_array.GUILD_TS_SALE=="N"){//조합X,국토부X
        		//alert("조합X,국토부X");
				result_area_view("N","N");
        	}else if(info_array.GUILD_TYPE=="car365" && info_array.GUILD_TS_SALE=="Y"){//조합X,국토부O
        		//alert("조합X,국토부O");
        		$("#GUILD_CAR_NAME").html(info_array.GUILD_TS_CNM);
        		result_area_view("N","Y");
        		totalhist_info();
        	}else if(info_array.GUILD_TS_SALE=="Y"){//조합O,국토부O
        		//alert("조합O,국토부O");
        		$("#GUILD_TS_SALE").html("과 국토교통부에");
        		result_area_view("Y","Y");
        		totalhist_info();
        	}else if(info_array.GUILD_TS_SALE=="N"){//조합O,국토부X
        		//alert("조합O,국토부X");
        		$("#GUILD_TS_SALE").html("에");
        		result_area_view("Y","N");
        		totalhist_info();
        	} else if(info_array.GUILD_TS_SALE=="") {	//조합X
        		//alert("XXXXXXXXXXXXXXXXX");
        		result_area_view(null,null);
        	}
        	
        },
		error : function(xhr, status, error) {
			console.log(xhr);
			console.log(status);
			console.log(error);
			result_area_view("first","");
			$("#roof_area").fadeOut();
		}
	});
	usedCarCompareInfo("search");
}

function usedCarCompareInfo(state) {
	if(state == "search"){
		state = "list";
	}
	
	var vhrno = $("#search_str").val();
	if(vhrno==""){
		alert("차량번호를 입력해주세요.");
		$("#search_str").focus();
		return;
	}
	
	vhrno = vhrno.replace(" ","");
	vhrno = $.trim(vhrno);
	$("#search_str").val(vhrno);

	
/*	기존 로그 주석 처리 
	$.ajax({
		type : 'GET',
		url : "/web/program/usedcarcompareData.do",
		data : {
			state : state,
			vhrno : vhrno
		},
		contentType : "application/json;charset=UTF-8",
		dataType : "json",	
        success:function(data){
        	console.log(data);
        	
        	var listHtml = "";
        	var len = 0;
	        var resultCode = data.RESULT.RESULT_CODE;
        	if( resultCode == 'error' ){
        		return;
			}else if( resultCode == 'list' && state == 'list' ){
				var result = data.RESULT.CARLIST;
	        	var listSize = data.RESULT.CARLIST.length;
	        	var info_array = data;
	        	var dataList = "";
	        	
	        	search_reflash();
	        	if (listSize > 0) {
		        	$.each(info_array.RESULT.CARLIST, function(key, value) {
		        		dataList = "<tr>";
		        		dataList += "<td>" + value.CNM 						+ "</td>";
		        		dataList += "<td>" + value.FOM_NM 					+ "</td>";
		        		dataList += "<td>" + value.PRYE 					+ "</td>";
		        		dataList += "<td>" + value.REGIST_CO_SELL 			+ "</td>";
		        		dataList += "<td>" + value.AVRG_ACQS_AMOUNT_SELL 	+ "</td>";
		        		dataList += "<td>" + value.REGIST_CO_BUY 			+ "</td>";
		        		dataList += "<td>" + value.AVRG_ACQS_AMOUNT_BUY 	+ "</td>";
		        		dataList += "</tr>";
		        		$("#usedcarcompare_data").append( dataList );
	        		});
	        	} else {
	        		$("#usedcarcompare_data").append("<td colspan = 7>데이터가 없습니다.</td>");
	        	}
	        	$("#usedcarcompare_list").fadeIn();
			}
        },
        async : false
	});
	*/
	
		var option = {
			type : 'GET',
			url : "/web/program/usedcarcompareData.do",
			data : {
				state : state,
				vhrno : vhrno
			},
			contentType : "application/json;charset=UTF-8",
			dataType : "json",	
	        success:function(data){
	        	console.log(data);
	        	
	        	var listHtml = "";
	        	var len = 0;
		        var resultCode = data.RESULT.RESULT_CODE;
	        	if( resultCode == 'error' ){
	        		return;
				}else if( resultCode == 'list' && state == 'list' ){
					var result = data.RESULT.CARLIST;
		        	var listSize = data.RESULT.CARLIST.length;
		        	var info_array = data;
		        	var dataList = "";
		        	
		        	search_reflash();
		        	if (listSize > 0) {
			        	$.each(info_array.RESULT.CARLIST, function(key, value) {
			        		dataList = "<tr>";
			        		dataList += "<td>" + value.CNM 						+ "</td>";
			        		dataList += "<td>" + value.FOM_NM 					+ "</td>";
			        		dataList += "<td>" + value.PRYE 					+ "</td>";
			        		dataList += "<td>" + value.REGIST_CO_SELL 			+ "</td>";
			        		dataList += "<td>" + value.AVRG_ACQS_AMOUNT_SELL 	+ "</td>";
			        		dataList += "<td>" + value.REGIST_CO_BUY 			+ "</td>";
			        		dataList += "<td>" + value.AVRG_ACQS_AMOUNT_BUY 	+ "</td>";
			        		dataList += "</tr>";
			        		$("#usedcarcompare_data").append( dataList );
		        		});
		        	} else {
		        		$("#usedcarcompare_data").append("<td colspan = 7>데이터가 없습니다.</td>");
		        	}
		        	$("#usedcarcompare_list").fadeIn();
				}
	        },
	        async : false
		};
					 
		//dynaPath 객체 (dp)가 있으면 	dp.$.ajax(), 없으면  일반 $.ajax()
		typeof dp != 'undefined' ? dp.$.ajax($, option) : $.ajax(option);
	
	
	function search_reflash(){
		$("#usedcarcompare_data").html("");
		$("#insptHist_tbl tbody").empty();
		$("#imprmnHist_tbl tbody").empty();
		$("#uscaSttusHist_tbl tbody").empty();
		$("#carseguroHist_tbl tbody").empty();
		$("#cartaxHist_tbl tbody").empty();
		$("#seizrHist_tbl tbody").empty();
		$("#mrgtHist_tbl tbody").empty();
		$("#scrcarHist_tbl tbody").empty();
		$("#trvlDscntHist_tbl tbody").empty();
		$("#tunning_tbl tbody").empty();
		$("#atlos_process_resn_nm").html("");
		$("#inpst_atlos_co").html("")
		$("#totalhistory_view").find('.check_box').removeClass('on');
		$("#totalhistory_view").find('.check_box > .question').removeClass('on');   
		$(".totalhistory_arr").find('.arr').removeClass('on'); 
		//$("#totalhistory_view").find('.check_box > .question > .arr').removeClass('on');         
		$("#totalhistory_view").find('.check_box > .answer').removeClass('on');      
		$("#totalhistory_view").find('.check_box > .answer').css('display', 'none'); 
		
		//if($(".nocheck_box_btn").hasClass('on')){
			//$(".nocheck_box_btn").removeClass('on');
			/* $(".nocheck_box_btn").parent().find('.check_box').removeClass('on');
			$(".nocheck_box_btn").parent().find('.check_box > .question').removeClass('on');
			$(".nocheck_box_btn").parent().find('.check_box > .arr').removeClass('on');
			$(".nocheck_box_btn").parent().find('.check_box > .answer').removeClass('on');
			$(".nocheck_box_btn").parent().find('.check_box > .answer').css('display', 'none'); */
		/* }else{
			$(".nocheck_box_btn").addClass('on');
			$(".nocheck_box_btn").parent().find('.check_box').addClass('on');
			$(".nocheck_box_btn").parent().find('.check_box > .question').addClass('on');
			$(".nocheck_box_btn").parent().find('.check_box > .answer').addClass('on');
			$(".nocheck_box_btn").parent().find('.check_box > .answer').css('display', 'block');
			
		} */
	}	

	//totalhist_info();
}

function totalhist_info() {
	var vhrno = $("#search_str").val();
	if(vhrno==""){
		alert("차량번호를 입력해주세요.");
		$("#search_str").focus();
		return;
	}
	
	vhrno = vhrno.replace(" ","");
	vhrno = $.trim(vhrno);
	
	var url = "/web/program/totalhistoryData.do";
	$("#roof_area").show();
	$.ajax({
		type : 'GET',
		url : url,
		data : {
			vhrno : vhrno //자동차등록번호
			,setle_se_code : '04' //하드코딩(01:본인차량, 02:타인차량(동의), 03:타인차량(미동의), 04:매매용차량)
		},
		contentType : "application/json;charset=UTF-8",
		dataType : "json",	
        success:function(data){
        	console.log(data);
        	
        	if(loginYn == "Y") {
        		//$("#totalhistory_view").fadeIn();
        		$("#login_alert").hide();
        	} else {
        		$("#login_alert").fadeIn();
        		$("#totalhistory_view").hide();
        		$("#totalhistory_nodata").hide();
        	}
        	
        	if (data.RESULT.RESULT_TYPE == "FAIL"){
/*        		$("#pop_title_txt").text("자동차365");
   				$("#pop_inner_txt").text(data.RESULT.RESULT_MSG);
   				$("#popup").show();
   				$("#roof_area").hide();
   				        			
    				//결제가 안되어있을경우
        		if(data.RESULT.RESULT_CODE == "E99"){
        			$("#pop_href").removeAttr("href");
        			$("#pop_href").attr("onclick","fn_movePage('/web/contents/totalhistory_payment.do')");
        			$("#pop_href").css("cursor","pointer");
        			$("#pop_close_button").show();
        			$("#pop_close_button").attr("onclick","fn_movePage('/web/contents/searchcar_step01.do')");
           			return false;
        		}
        		//기타 오류
	        	else{
	   				$("#pop_href").removeAttr("href");
	   				$("#pop_href").attr("onclick","fn_movePage('/web/contents/searchcar_step01.do')");
	   				$("#pop_href").css("cursor","pointer");
	       			return false;
        		}*/
        	}  
        	
        	//기본정보
        	if (data.RESULT.CARINFOLIST != null && data.RESULT.CARINFOLIST.length > 0) {
        		
        		$.each(data.RESULT.CARINFOLIST, function(key, value) {
	        		$("#vin").html(value.VIN);
	        		$("#prpos_se_nm").html(value.PRPOS_SE_NM);
	        		$("#cnm").html(value.CNM);
	        		$("#vhcty_asort_nm").html(value.VHCTY_ASORT_NM);
	        		var trnsfrDe = value.TRNSFR_DE;
	        		if(trnsfrDe == ""){
	        			trnsfrDe = "-";
	        		}else{
	        			trnsfrDe = trnsfrDe.substr(0,4) + "-" + trnsfrDe.substr(4,2) + "-" + trnsfrDe.substr(6,8);
	        		}
	        		$("#trnsfr_de").html(trnsfrDe);
	        		var frstRegistDe = value.FRST_REGIST_DE;
	        		frstRegistDe = frstRegistDe.substr(0,4) + "-" + frstRegistDe.substr(4,2) + "-" + frstRegistDe.substr(6,8);
	        		$("#frst_regist_de").html(frstRegistDe);									        		
	        		$("#prye").html(value.PRYE);
	        		$("#color_nm").html(value.COLOR_CODE_NM);
	        		$("#inspt_valid_pd").html(value.INSPT_VALID_PD_DE);
	        		$("#transr_regist_co").html(value.TRANSR_REGIST_CO);
	        		$("#cbu_co").html(value.CBU_CO);
	        		var opratStopCmmndDe = value.OPRAT_STOP_CMMND_DE;
	        		if(opratStopCmmndDe == "") opratStopCmmndDe = "-";
	        		$("#oprat_stop_cmmnd_de").html(opratStopCmmndDe);
	        		if(value.ATLOS_PROCESS_RESN_NM == ""){
	        			$("#atlos_process_resn_nm").html("-");
	        		}else{
	        			$("#atlos_process_resn_nm").html(value.ATLOS_PROCESS_RESN_NM);	
	        		}
	        		if(value.INPST_ATLOS_CO == ""){
	        			$("#inpst_atlos_co").html("0");
	        		}else{
	        			$("#atlos_process_resn_nm").html(value.INPST_ATLOS_CO);	
	        		}
        		});
	        	
			} 
        	
        	//검사이력
			if (data.RESULT.INSPTHISTLIST != null && data.RESULT.INSPTHISTLIST.length > 0) {
        		
        		$.each(data.RESULT.INSPTHISTLIST, function(key, value) {
        			$("#insptHist_tbl tbody").append(
        				  "<tr>"
						+ "<td class='frist'>"+value.INSPT_SN+"</td>"
						+ "<td>"+value.INSPT_SE_NAME+"</td>"
						+ "<td>"+value.INSPT_DE+"</td>"
						+ "<td>"+value.INOF_ORGNZT_NM+"</td>"
						+ "<td>"+value.INSPT_VALID_PD+"</td>"
						+ "</tr>"
					);
        		});
	        	
			}else{
				//$("#insptHist_tbl tbody").append("<tr><td colspan='5'>해당 내역이 없습니다.</td></tr>");		
				$("#insptHist_tbl tbody").append("<tr><td colspan='5'><div style='font-size: 16px; text-align: center; vertical-align: middle;''><i class='xi-warning'></i>해당 내역이 없습니다.</div></td></tr>");
			}
        	
        	//정비이력
			if (data.RESULT.IMPRMNHISTLIST != null && data.RESULT.IMPRMNHISTLIST.length > 0) {
        		
        		$.each(data.RESULT.IMPRMNHISTLIST, function(key, value) {
        			$("#imprmnHist_tbl tbody").append(
        				  "<tr>"
						+ "<td class='frist'>"+value.SEQNO+"</td>"
						+ "<td><a href='#;' onclick=\"fn_imprmnHistDtls('"+value.IMPRMN_ENTNUM+"','"+value.INNER_IMPRMN_NO+"','"+value.RCEPT_UPD_SN+"');\"><strong>"+value.BIZ_NM+"</strong></a></td>"
						+ "<td>"+value.DLIVY_DE+"</td>"
						+ "<td>"+value.TRVL_DSTNC+"</td>"
						+ "<td>"+value.WORK_ID_NM+"</td>"
						+ "</tr>"
					);
        		});
	        	
			}else{
				//$("#imprmnHist_tbl tbody").append("<tr><td colspan='5'>해당 내역이 없습니다.</td></tr>");
				$("#imprmnHist_tbl tbody").append("<tr><td colspan='5'><div style='font-size: 16px; text-align: center; vertical-align: middle;''><i class='xi-warning'></i>해당 내역이 없습니다.</div></td></tr>");
			}
        	
			//성능점검
			if (data.RESULT.USCASTTUSHISTLIST != null && data.RESULT.USCASTTUSHISTLIST.length > 0) {
        		
        		$.each(data.RESULT.USCASTTUSHISTLIST, function(key, value) {
        			var rceptNo = value.RCEPT_GRC_CODE + "-" + value.RCEPT_DE + "-" + value.RCEPT_SN; //접수번호
        			$("#uscaSttusHist_tbl tbody").append(
        				  "<tr>"
						+ "<td class='frist'>"+value.SEQNO+"</td>"
						+ "<td><a href='#;' onclick=\"fn_uscaSttusHistDtls('"+value.CHCK_DE+"','"+value.RCEPT_GRC_CODE+"','"+value.RCEPT_SN+"','"+value.RCEPT_DE+"','"+value.RCEPT_UPD_SN+"','"+value.VHMNO+"','"+value.VHRNO+"','"+rceptNo+"','"+value.REFORM_AT+"');\"><strong>"+rceptNo+"</strong></a></td>"
						+ "<td>"+value.NTIC_ENTRPS_NM+"</td>"
						+ "<td>"+value.CHCK_DE+"</td>"
						+ "<td>"+value.TRVL_DSTNC+"</td>"
						+ "<td>"+value.REGIST_STTUS_NM+"</td>"
						+ "</tr>"
					);
        		});
	        	
			}else{
				$("#uscaSttusHist_tbl tbody").append("<tr><td colspan='6'><div style='font-size: 16px; text-align: center; vertical-align: middle;''><i class='xi-warning'></i>해당 내역이 없습니다.</div></td></tr>");
			}
			
			//의무보험
			if (data.RESULT.INSRNCHISTLIST != null && data.RESULT.INSRNCHISTLIST.length > 0) {
        		
        		$.each(data.RESULT.INSRNCHISTLIST, function(key, value) {
        			$("#carseguroHist_tbl tbody").append(
        				  "<tr>"
						+ "<td class='frist'>"+value.SBSCRB_CMPNY_NM+"</td>"
						+ "<td>"+value.INSRNC_ITEM_NM+"</td>"
						+ "<td>"+value.PRSNL_DTA_SE_NM+"</td>"
						+ "<td>"+value.PRSNL_BGNDE+"</td>"
						+ "<td>"+value.PRSNL_ENDDE+"</td>"  
						+ "</tr>"
					);
        		});
	        	
			}else{
				//$("#carseguroHist_tbl tbody").append("<tr><td colspan='5'>해당 내역이 없습니다.</td></tr>");
				$("#carseguroHist_tbl tbody").append("<tr><td colspan='5'><div style='font-size: 16px; text-align: center; vertical-align: middle;''><i class='xi-warning'></i>해당 내역이 없습니다.</div></td></tr>");
			}
			
			//자동차세체납이력
			if (data.RESULT.LLXTAXPAYAMTHISTLIST != null && data.RESULT.LLXTAXPAYAMTHISTLIST.length > 0
				&& data.RESULT.LLXTAXPAYAMTHISTLIST.RESULT_CODE == "SSR0000") {
        		
        		$.each(data.RESULT.LLXTAXPAYAMTHISTLIST, function(key, value) {
        			$("#cartaxHist_tbl tbody").append(
        				  "<tr>"
						+ "<td class='frist'>"+value.TAX_YM+"</td>"
						+ "<td>"+value.TAX_AMT+"</td>"
						+ "<td>"+value.TAX_COD+"</td>"
						+ "</tr>"
					);
        		});
	        	
			}else{
				//$("#cartaxHist_tbl tbody").append("<tr><td colspan='3'>해당 내역이 없습니다.</td></tr>");
				$("#cartaxHist_tbl tbody").append("<tr><td colspan='3'><div style='font-size: 16px; text-align: center; vertical-align: middle;''><i class='xi-warning'></i>해당 내역이 없습니다.</div></td></tr>");
			}
			
			//압류
			if (data.RESULT.SEIZRHISTLIST != null && data.RESULT.SEIZRHISTLIST.length > 0) {
        		
        		$.each(data.RESULT.SEIZRHISTLIST, function(key, value) {
        			$("#seizrHist_tbl tbody").append(
        				  "<tr>"
						+ "<td class='frist'>"+value.SEIZR_REGIST_DT+"</td>"
						+ "<td>"+value.SEIZR_ETTFF_GRC_NM+"</td>"
						+ "<td>"+value.OFLDC_NO+"</td>"
						+ "<td>"+value.SEIZR_DTLS+"</td>"
						+ "</tr>"
					);
        		});
	        	
			}else{
				//$("#seizrHist_tbl tbody").append("<tr><td colspan='4'>해당 내역이 없습니다.</td></tr>");
				$("#seizrHist_tbl tbody").append("<tr><td colspan='4'><div style='font-size: 16px; text-align: center; vertical-align: middle;''><i class='xi-warning'></i>해당 내역이 없습니다.</div></td></tr>");
			}
			
			//저당
			if (data.RESULT.MRTGHISTLIST != null && data.RESULT.MRTGHISTLIST.length > 0) {
        		
        		$.each(data.RESULT.MRTGHISTLIST, function(key, value) {
        			$("#mrgtHist_tbl tbody").append(
        				  "<tr>"
						+ "<td class='frist'>"+value.ESTBS_DE+"</td>"
						+ "<td>"+value.MRTE_NM+"</td>"
						+ "<td>"+value.TOT_CDIT_AMOUNT+"</td>"
						+ "</tr>"
					);
        		});
	        	
			}else{
				//$("#mrgtHist_tbl tbody").append("<tr><td colspan='3'>해당 내역이 없습니다.</td></tr>");
				$("#mrgtHist_tbl tbody").append("<tr><td colspan='3'><div style='font-size: 16px; text-align: center; vertical-align: middle;''><i class='xi-warning'></i>해당 내역이 없습니다.</div></td></tr>");
			}
			
			//폐차정보
			var scrcarUndtakeDe = data.RESULT.CARINFOLIST[0].SCRCAR_UNDTAKE_DE;
			if (scrcarUndtakeDe != "") {
				$.each(data.RESULT.CARINFOLIST, function(key, value) {
					$("#scrcarHist_tbl tbody").append(
	       				  "<tr>"
						+ "<td class='frist'>"+value.SCRCAR_PLACE_NM+"</td>"
						+ "<td>"+value.OWNER_ERSR_REGIST_AT+"</td>"
						+ "<td>"+value.NMPL_RTURN_CO+"</td>"
						+ "<td>"+value.CAR_RGCR_DSUSE_AT+"</td>"
						+ "<td>"+value.SCRCAR_UNDTAKE_DE+"</td>"
						+ "</tr>"
					);					
        		});       			
	        	
			}else{
				//$("#scrcarHist_tbl tbody").append("<tr><td colspan='5'>해당 내역이 없습니다.</td></tr>");
				$("#scrcarHist_tbl tbody").append("<tr><td colspan='5'><div style='font-size: 16px; text-align: center; vertical-align: middle;''><i class='xi-warning'></i>해당 내역이 없습니다.</div></td></tr>");
			}
			
			//주행거리이력
			if (data.RESULT.TRVLDSCNTHISTLIST != null && data.RESULT.TRVLDSCNTHISTLIST.length > 0) {
        		
        		var trvlDscntHistCnt = data.RESULT.TRVLDSCNTHISTLIST.length;
        		
        		$.each(data.RESULT.TRVLDSCNTHISTLIST, function(key, value) {
        			var trvlSeqNo = 1 + Number(key);
        			$("#trvlDscntHist_tbl tbody").append(
        				  "<tr>"
						+ "<td class='frist'>"+trvlSeqNo+"</td>"
						+ "<td>"+value.TRVL_DSTNC_1+"</td>"
						+ "<td>"+value.REGIST_SE_NM+"</td>"
						+ "<td>"+value.REGIST_ENT_NM+"</td>"
						+ "<td>"+value.REGIST_DE+"</td>"
						+ "</tr>"
					);
        		});
	        	
			}else{
				//$("#trvlDscntHist_tbl tbody").append("<tr><td colspan='5'>해당 내역이 없습니다.</td></tr>");
				$("#trvlDscntHist_tbl tbody").append("<tr><td colspan='5'><div style='font-size: 16px; text-align: center; vertical-align: middle;''><i class='xi-warning'></i>해당 내역이 없습니다.</div></td></tr>");
			}
			
			//튜닝이력
			if (data.RESULT.TUNNINGHISTLIST != null && data.RESULT.TUNNINGHISTLIST.length > 0) {
        		
        		$.each(data.RESULT.TUNNINGHISTLIST, function(key, value) {
        			$("#tunning_tbl tbody").append(
        				  "<tr>"
						+ "<td class='frist'>"+value.STMD_DE+"</td>"
						+ "<td>"+value.STMD_DTLS+"</td>"
						+ "</tr>"
					);
        		});
	        	
			}else{
				//$("#tunning_tbl tbody").append("<tr><td colspan='2'>해당 내역이 없습니다.</td></tr>");
				$("#tunning_tbl tbody").append("<tr><td colspan='2'><div style='font-size: 16px; text-align: center; vertical-align: middle;''><i class='xi-warning'></i>해당 내역이 없습니다.</div></td></tr>");
			}
        	
			$("#roof_area").hide();
        	
        },
		error : function(xhr, status, error) {
			console.log(xhr);
			console.log(status);
			console.log(error);
			alert(status);
			$("#roof_area").fadeOut();
		}
	});
}

function result_area_view(guild,molit){	
	if(guild=="N" && molit=="Y"){//조합X,국토부O
		//$("#view_info02").show();
		$("#view_area02").show();	//	매매상품용으로 확인 되지 않은 차량입니다.
		$("#totalhistory_view").fadeIn();
	}else if(guild=="Y"){//조합O,국토부O , 조합O,국토부X
		$("#view_info02").show();
	}
	if(guild=="first"){//초기화
		$("#view_area01").hide();
		$("#view_area02").hide();
		$("#totalhistory_view").hide();
		$("#totalhistory_nodata").hide();
	}else if(guild=="Y" || molit=="Y"){//차량이존재할때
		$("#view_area01").fadeIn();
		$("#view_area02").hide();
		$("#totalhistory_view").fadeIn();
		$("#totalhistory_nodata").hide();
		$("#tit_total").hide();
	}else {//차량이없을때
		$("#view_area01").hide();
		$("#view_area02").fadeIn();
		$("#totalhistory_view").hide();
		
		if(loginYn == "Y") {
			$("#totalhistory_nodata").fadeIn();
			$("#tit_total").fadeIn();
			$("#login_alert").hide();
    	} else {
    		$("#login_alert").fadeIn();
    		$("#totalhistory_nodata").hide();
    	}
	}
}

$(document).on('click','.usedcarcompare_info',function(){
	$(this).hide();
});

//정비이력 상세
function fn_imprmnHistDtls(obj0, obj1, obj2){
	
	//alert("2021-12-11 아직 화면 입히는중");
	//return false;
	
	var url = "/web/program/imprmnHistDtlsData.do";
	
	var imprmnEntnum  	 = obj0;
	var innerImprmnNo 	 = obj1;
	var imprmnRceptUpdSn = obj2;
	
	$.ajax({
		type : 'GET',
		url : url,
		data : {
			imprmnEntnum : imprmnEntnum
			,innerImprmnNo : innerImprmnNo
			,imprmnRceptUpdSn : imprmnRceptUpdSn
		},
		contentType : "application/json;charset=UTF-8",
		dataType : "json",	
        success:function(data){
        	if (data.RESULT.RESULT_TYPE == "FAIL"){
        		alert(data.RESULT.RESULT_MSG);
        		return;
        	}
        	
        	$("#popup_imprmn").show();
        	//정비이력 데이터 입혀주기.
    		if (data.RESULT.REPAIRLIST != null && data.RESULT.REPAIRLIST.length > 0) {
    			$.each(data.RESULT.REPAIRLIST, function(key, value) {
    				$("#imprmn_vhrno").html(value.VHRNO);
	        		$("#imprmn_cnm").html(value.CNM);
	        		$("#imprmn_vhcty_asort_nm").html(value.VHCTY_ASORT_NM);
	        		var imprmn_wrhousng_de = value.WRHOUSNG_DE;
	        		imprmn_wrhousng_de = imprmn_wrhousng_de.substr(0,4) + "-" + imprmn_wrhousng_de.substr(4,2) + "-" + imprmn_wrhousng_de.substr(6,8);
	        		$("#imprmn_wrhousng_de").html(imprmn_wrhousng_de);
	        		var imprmn_trvl_dstnc = value.TRVL_DSTNC;
	        		imprmn_trvl_dstnc = parseInt(imprmn_trvl_dstnc.replaceAll(",","").replaceAll("，",""));
	        		//imprmn_trvl_dstnc = imprmn_trvl_dstnc.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        		$("#imprmn_trvl_dstnc").html(imprmn_trvl_dstnc+ " km");
	        		$("#imprmn_biz_nm").html(value.BIZ_NM);
	        		var imprmn_biz_no = value.BIZ_NO;
	        		imprmn_biz_no = imprmn_biz_no.substr(0,3) + "-" + imprmn_biz_no.substr(3,5) + "-" + imprmn_biz_no.substr(5,10);
	        		$("#imprmn_biz_no").html(value.BIZ_NO);
	        		var imprmn_entnum = value.IMPRMN_ENTNUM;
	        		imprmn_entnum = imprmn_entnum.substr(2,2) + "-" + imprmn_entnum.substr(4,4) + "-" + imprmn_entnum.substr(8,6);
	        		$("#imprmn_entnum").html(imprmn_entnum);
	        		$("#imprmn_biz_rep_nm").html(value.BIZ_REP_NM);
	        		$("#imprmn_biz_telno").html(value.BIZ_TELNO);
	        		$("#imprmn_adres_nm").html(value.BIZ_ADRES_NM);
	        		var imprmn_dlivy_de = value.DLIVY_DE;
	        		imprmn_dlivy_de = imprmn_dlivy_de.substr(0,4) + "-" + imprmn_dlivy_de.substr(4,2) + "-" + imprmn_dlivy_de.substr(6,8);
	        		$("#imprmn_dlivy_de").html(imprmn_dlivy_de);
	        		$("#imprmn_rspnber_nm").html(value.IMPRMN_RSPNBER_NM);
	        		var imprmn_compt_de = value.IMPRMN_COMPT_DE;
	        		imprmn_compt_de = imprmn_compt_de.substr(0,4) + "-" + imprmn_compt_de.substr(4,2) + "-" + imprmn_compt_de.substr(6,8);
	        		$("#imprmn_compt_de").html(imprmn_compt_de);
	        		$("#imprmn_upd_reason").html(value.UPD_REASON);
	        		$("#imprmn_inner_imprmn_no").html(value.INNER_IMPRMN_NO);
	        		$("#imprmn_agre_at").html(value.ADIT_IMPRMN_AGRE_AT);
	        		
        		});	
			}
        	
    		$("#imprmn_detail_tbl tbody").empty();
    		
    		//정비이력 상세
			if (data.RESULT.DETAILLIST != null && data.RESULT.DETAILLIST.length > 0) {
        		
        		$.each(data.RESULT.DETAILLIST, function(key, value) {
        			$("#imprmn_detail_tbl tbody").append(
        				  "<tr>"
						+ "<td>"+value.WORK_NM+"</td>"
						+ "<td>"+value.CMPNT_SE_NM+"</td>"
						+ "</tr>"
					);
        		});
	        	
			}else{
				//$("#tunning_tbl tbody").append("<tr><td colspan='2'>해당 내역이 없습니다.</td></tr>");
				$("#imprmn_detail_tbl tbody").append("<tr><td colspan='2'><div style='font-size: 16px; text-align: center; vertical-align: middle;''><i class='xi-warning'></i>해당 내역이 없습니다.</div></td></tr>");
			}
        	
        },
		error : function(xhr, status, error) {
			console.log(xhr);
			console.log(status);
			console.log(error);
			alert("정보처리 중 오류가 발생하였습니다. 오류가 지속되면 고객센터로 문의 주세요.");
		}
	});
}

//중고차성능점검기록부 상세
function fn_uscaSttusHistDtls(obj0, obj1, obj2, obj3, obj4, obj5, obj6, obj7, obj8){

	var chckDe 		 = obj0;
	
	if(chckDe != "-"){
		var rceptGrcCode = obj1;
		var rceptSn 	 = obj2;
		var rceptDe 	 = obj3;
		var rceptUpdSn 	 = obj4;
		var vhmno 		 = obj5;
		var vhrno 		 = obj6;
		var rceptNo 	 = obj7;
		var refoamAt 	 = obj8;
		var checkAtNew   = "";
		
		var strUscaChckDe = chckDe.replace(/-/gi,"");
		if(strUscaChckDe >= 20200927){
			refoamAt   = "3";
		}
		
		var url = "/web/program/uscaSttusHistDtlsData.do";
		$.ajax({
			type : 'GET',
			url : url,
			data : {
				rceptGrcCode : rceptGrcCode
				,rceptSn : rceptSn
				,rceptDe : rceptDe
				,rceptUpdSn : rceptUpdSn
				,vhmno : vhmno
				,vhrno : vhrno
				,rceptNo : rceptNo
				,refoamAt : refoamAt
				,checkAtNew : checkAtNew
			},
			contentType : "application/json;charset=UTF-8",
			dataType : "json",	
	        success:function(data){
	        	console.log(data);
	        	if (data.RESULT.RESULT_TYPE == "FAIL"){
	        		alert(data.RESULT.RESULT_MSG);
	        		return;
	        	}
	        	
	        	refoam_at = refoamAt;
	        	var sn = "";
	        	
	        	if("1" == refoam_at){	//개정서식 1번
	        		sn = "b_";
	        		$("[id^='b_'][id^='b_usca'][id!='b_popup_uscaSttus'][id!='b_uscaSttus_close_btn'][id!='b_uscasttus_tab_1'][id!='b_uscasttus_tab_2'][id!='b_uscasttus_tab_3'][id!='b_uscasttus_tab_4'][id!='b_uscasttus_tab_5']").text("");
	        		$("[id^='b_s'][id^='b_p'][id^='b_m']").text("");
	        	}else if("2" == refoam_at){	//개정서식 2번
	        		sn = "c_";
	        		$("[id^='c_'][id^='c_usca'][id!='c_popup_uscaSttus'][id!='c_uscaSttus_close_btn'][id!='c_uscasttus_tab_1'][id!='c_uscasttus_tab_2'][id!='c_uscasttus_tab_3'][id!='c_uscasttus_tab_4'][id!='c_uscasttus_tab_5']").text("");
	        		$("[id^='c_s'][id^='c_p'][id^='c_m']").text("");
	        	}else if("3" == refoam_at){	//개정서식 3번 - 최근
	        		//$("[id!='popup_uscaSttus'][id!='uscaSttus_close_btn'][id!='uscasttus_tab_1'][id!='uscasttus_tab_2'][id!='uscasttus_tab_3'][id!='uscasttus_tab_4'][id!='uscasttus_tab_5']").text("");
	        		//$("[id^='s0'][id^='p0'][id^='m0']").text("");
	        	}else{
	        		sn = "a_";    //기존서식
	        		$("[id^='a_'][id^='a_usca'][id!='a_popup_uscaSttus'][id!='a_uscaSttus_close_btn'][id!='a_uscasttus_tab_1'][id!='a_uscasttus_tab_2'][id!='a_uscasttus_tab_3'][id!='a_uscasttus_tab_4'][id!='a_uscasttus_tab_5']").text("");
	        		$("[id^='a_s'][id^='a_p'][id^='a_m']").text("");
	        	}
	        	
	        	$("#"+sn+"popup_uscaSttus").show();
	        	//$("[id^="+sn+"_]").html("");
	        	//$("[id^="+sn+"usca_]").html("");
	        	
	        	//성능점검 기록부  데이터 입혀주기.
	    		if (data.RESULT.USCASTTUSLIST != null && data.RESULT.USCASTTUSLIST.length > 0) {
	    			$.each(data.RESULT.USCASTTUSLIST, function(key, value) {
	    				
	    				$("#"+sn+"usca_recpt_no").html(rceptGrcCode +"-"+ rceptDe +"-" +rceptSn);
	    				$("#"+sn+"usca_vhrno").html(value.VHRNO);  
	    				$("#"+sn+"usca_rcept_sn").html(value.RCEPT_SN);             
	    				$("#"+sn+"usca_vhcty_asort_code").html(value.VHCTY_ASORT_CODE);  
	    				$("#"+sn+"usca_cnm").html(value.CNM); 
	    				$("#"+sn+"usca_prye").html(value.PRYE);   
	    				$("#"+sn+"usca_vin").html(value.VIN);  
	    				$("#"+sn+"usca_register_nm").html(value.REGISTER_NM); 
	    				$("#"+sn+"usca_r_rcept_de").html(fd_format(value.RCEPT_DE));         
	    				$("#"+sn+"usca_rcept_grc_code_txt").html(value.RCEPT_GRC_CODE);              
	    				$("#"+sn+"usca_rcept_sn_txt").html(value.RCEPT_SN);              
	    				$("#"+sn+"usca_frst_regist_de").html(fd_format(value.FRST_REGIST_DE));  
	    				$("#"+sn+"usca_inspt_valid_pd_de").html(fd_format(value.INSPT_VALID_PD_BGNDE)+" ~ "+fd_format(value.INSPT_VALID_PD_ENDDE)); 
	    				$("#"+sn+"usca_mtrs_fom").html(value.MTRS_FOM);  
	    				$("#"+sn+"usca_trvl_dstnc").html(value.TRVL_DSTNC +" km"); 
	    				if(""==value.GAUGE_FNCT_AT || "0"==value.GAUGE_FNCT_AT) $("#"+sn+"usca_gauge_fnct_at").html( eval(sn+"M02_0") );
	    				else $("#"+sn+"usca_gauge_fnct_at").html( eval(sn+"M02_1") );
	    				$("#"+sn+"usca_samenss_cnfirm_code").html( eval(sn+"M05_"+value.SAMENSS_CNFIRM_CODE));
	    				$("#"+sn+"usca_unlaw_stmd_at").html( eval(sn+"M06_"+value.UNLAW_STMD_AT));
	    				$("#"+sn+"usca_acdnt_at").html( eval(sn+"M11_"+value.ACDNT_AT));
	    				$("#"+sn+"usca_flud_at").html( eval(sn+"M07_"+value.FLUD_AT));
	    				$("#"+sn+"usca_grbx_knd_code").html( eval(sn+"M03_"+value.GRBX_KND_CODE));
	    				$("#"+sn+"usca_grbx_knd_dtls").html(value.GRBX_KND_DTLS);
	    				$("#"+sn+"usca_assrnc_ty_se_code").html( eval(sn+"M04_"+value.ASSRNC_TY_SE_CODE));
	    				$("#"+sn+"usca_engine_stblt_at").html( eval(sn+"M08_"+value.ENGINE_STBLT_AT));
	    				$("#"+sn+"usca_grbx_stblt_at").html( eval(sn+"M09_"+value.GRBX_STBLT_AT) );
	    				$("#"+sn+"usca_crmn_mesure_value").html(value.CRMN_MESURE_VALUE +" %");
	    				$("#"+sn+"usca_hydr_mesure_value").html(value.HYDR_MESURE_VALUE +" ppm");  
	    				$("#"+sn+"usca_smoke_mesure_value").html(value.SMOKE_MESURE_VALUE +" %");  
	    				$("#"+sn+"usca_register_nm_txt").html(value.REGISTER_NM); 
	    				$("#"+sn+"usca_ntic_person_nm_txt").html(value.NTIC_PERSON_NM); 
	    				$("#"+sn+"usca_r_rcept_de_txt").html(fd_format(value.RCEPT_DE));         
	    				$("#"+sn+"usca_buyer_nm").html(value.BUYER_NM); 
	    				$("#"+sn+"usca_chck_de").html(fd_format(value.CHCK_DE)); 
	    				$("#"+sn+"usca_buyer_de").html(fd_format(value.BUYER_DE)); 
	    				$("#"+sn+"usca_assrnc_pd_bgnde").html(fd_format(value.assrnc_pd_bgnde)); 
	    				$("#"+sn+"usca_assrnc_pd_endde").html(fd_format(value.assrnc_pd_endde));            
	    				var v_chck_imprmn_entrps_id = value.CHCK_IMPRMN_ENTRPS_ID;
	    				$("#"+sn+"usca_chck_imprmn_entrps_id").html(v_chck_imprmn_entrps_id); 
	    				$("#"+sn+"usca_chck_entrps_nm").html(value.CHCK_ENTRPS_NM); 
	    				$("#"+sn+"usca_insctr_nm").html(value.INSCTR_NM); 
	    				$("#"+sn+"usca_etc_matter").html(value.ETC_MATTER); 
	    				$("#"+sn+"usca_register_nm_txt").html(value.REGISTER_NM); 
	    				$("#"+sn+"usca_ntic_entrps_nm").html(value.NTIC_ENTRPS_NM); 
	    				var upd_reason = value.UPD_REASON;
	    				upd_reason = upd_reason.replace("\r\n", "<br>");
	    				$("#"+sn+"usca_upd_reason_txt").html("<pre>" + upd_reason + "</pre>"); 	//경정사유
	    				$("#"+sn+"usca_current_date").html(value.CURRENT_DATE); 	//현재일
	    				$("#"+sn+"usca_submit_de").html(value.SUBMIT_DE); 	//현재일
	    				$("#"+sn+"usca_final_de").html(value.FINAL_DE); 	//현재일	   
	    				
	    				if("2"==refoam_at || "3"==refoam_at){
	    					$("#"+sn+"usca_unlaw_stmd_iem_se_code").html( eval(sn+"M62_"+value.UNLAW_STMD_IEM_SE_CODE));
	    	                $("#"+sn+"usca_prpos_change_se_code").html( eval(sn+"M21_"+value.PRPOS_CHANGE_SE_CODE));
	    	                $("#"+sn+"usca_trvl_dstnc_sttus_code").html( eval(sn+"M20_"+value.TRVL_DSTNC_STTUS_CODE));
	    	                $("#"+sn+"usca_use_fuel_code").html( eval(sn+"M10_"+value.USE_FUEL_CODE));
	    	                $("#"+sn+"usca_simpl_repair_at").html(eval(sn+"M27_"+value.SIMPL_REPAIR_AT));
	    	                $("#"+sn+"usca_acdnt_at").html(eval(sn+"M27_"+value.ACDNT_AT));
	    	                $("#"+sn+"usca_recall_trget_at").html( eval(sn+"M63_"+value.RECALL_TRGET_AT));
	    	                $("#"+sn+"usca_recall_flfl_at").html( eval(sn+"M64_"+value.RECALL_FLFL_AT));
		    				//}
	    	                if("1" == value.PC_CALC_CHOISE_AT){
	    	                	$("#"+sn+"usca_color_at").text( eval("M22_"+value.COLOR_CHANGE_AT));
	    	                    $("#"+sn+"usca_color_change_at").text( eval("M23_"+value.MAIN_OPTN_VHCLE_RF_AT));
	    	                    $("#"+sn+"usca_main_optn_vhcle_rf_at").text("썬루프 : " + eval("M24_"+value.MAIN_OPTN_ROAD_GUIDANCE_AT));
	    	                    $("#"+sn+"usca_main_optn_road_guidance_at").text("네비게이션 : "+ eval("M25_"+value.MAIN_OPTN_ETC_AT));
	    	                    $("#"+sn+"usca_main_optn_etc_at").text("기타 : " + eval("M26_"+value.EXTRR_REPAIR_NEED_AT));
	    	                    $("#"+sn+"usca_extrr_repair_need_at").text(eval("M29_"+value.ITRDECO_REPAIR_NEED_AT));
	    	                    $("#"+sn+"usca_itrdeco_repair_need_at").text(eval("M30_"+value.ITRDECO_REPAIR_NEED_AT));
	    	                    $("#"+sn+"usca_metal_surfc_clnsg_need_at").text(eval("M31_"+value.METAL_SURFC_CLNSG_NEED_AT));
	    	                    $("#"+sn+"usca_engine_room_cln_repair_need_at").text(eval("M32_"+value.ENGINE_ROOM_CLN_REPAIR_NEED_AT));
	    	                    $("#"+sn+"usca_glass_repair_need_at").text(eval("M33_"+value.GLASS_REPAIR_NEED_AT));
	    	                    $("#"+sn+"usca_pc_calc_stdr_asoc_code").text(eval("M28_"+value.PC_CALC_STDR_ASOC_CODE));
	    	                    $("#"+sn+"usca_pc_examin_calc_entrps_nm").text(value.PC_EXAMIN_CALC_ENTRPS_NM);
	    	                    $("#"+sn+"usca_pc_examin_calc_de").text(fd_format(value.PC_EXAMIN_CALC_DE),'YYYY-MM-DD');
	    	                    $("#"+sn+"usca_pc_examin_calc_charger_nm").text(value.PC_EXAMIN_CALC_CHARGER_NM);
	    	                    $("#"+sn+"usca_spcabl_matter_nd_calc_resn").text(value.SPCABL_MATTER_ND_CALC_RESN);
	    	                    $("#"+sn+"usca_amount_check_yn").attr("checked","checked");
	    	                    
	    	                    /* 휠-운전석-전 */
	    	                    if("1" == value.RIM_DRV_SEAT_FRNT_REPAIR_AT){
	    	                        $(":input:checkbox[name="+sn+"usca_rim_drv_seat_frnt_repair_at]").attr("checked","checked");
	    	                    }
	    	                    /* 휠-운전석-후 */
	    	                    if("1" == value.RIM_DRV_SEAT_AFTR_REPAIR_AT){
	    	                        $(":input:checkbox[name="+sn+"usca_rim_drv_seat_aftr_repair_at]").attr("checked","checked");
	    	                    }
	    	                    /* 휠-동반석-전 */
	    	                    if("1" == value.RIM_ACPSEAT_FRNT_REPAIR_AT){
	    	                        $(":input:checkbox[name="+sn+"usca_rim_acpseat_frnt_repair_at]").attr("checked","checked");
	    	                    }
	    	                    /* 휠-동반석-후 */
	    	                    if("1" == value.RIM_ACPSEAT_AFTR_REPAIR_AT){
	    	                        $(":input:checkbox[name="+sn+"usca_rim_acpseat_aftr_repair_at]").attr("checked","checked");
	    	                    }
	    	                    /* 휠-응급 */
	    	                    if("1" == value.RIM_EMGNCY_REPAIR_NEED_AT){
	    	                        $(":input:checkbox[name="+sn+"usca_rim_emgncy_repair_need_at]").attr("checked","checked");
	    	                    }				
	    	                    /* 타이어-운전석-전 */
	    	                    if("1" == value.TIRE_DRV_SEAT_FRNT_REPAIR_AT){
	    	                        $(":input:checkbox[name="+sn+"usca_tire_drv_seat_frnt_repair_at]").attr("checked","checked");
	    	                    }
	    	                    /* 타이어-운전석-후 */
	    	                    if("1" == value.TIRE_DRV_SEAT_AFTR_REPAIR_AT){
	    	                        $(":input:checkbox[name="+sn+"usca_tire_drv_seat_aftr_repair_at]").attr("checked","checked");
	    	                    }
	    	                    /* 타이어-동반석-전 */
	    	                    if("1" == value.TIRE_ACPSEAT_FRNT_REPAIR_AT){
	    	                        $(":input:checkbox[name="+sn+"usca_tire_acpseat_frnt_repair_at]").attr("checked","checked");
	    	                    }
	    	                    /* 타이어-동반석-후 */
	    	                    if("1" == value.TIRE_ACPSEAT_AFTR_REPAIR_AT){
	    	                        $(":input:checkbox[name="+sn+"usca_tire_acpseat_aftr_repair_at]").attr("checked","checked");
	    	                    }
	    	                    /* 타이어-응급 */
	    	                    if("1" == value.RIM_EMGNCY_REPAIR_NEED_AT){
	    	                        $(":input:checkbox[name="+sn+"usca_tire_emgncy_repair_need_at]").attr("checked","checked");
	    	                    }
	
	    	                    /* 사용설명서 */
	    	                    if("1" == value.BASS_PRDLST_HOLD_USE_MNL_AT){
	    	                        $(":input:checkbox[name="+sn+"usca_bass_prdlst_hold_use_mnl_at]").attr("checked","checked");
	    	                    }
	    	                    /* 안전삼각대 */
	    	                    if("1" == value.BASS_PRDLST_HOLD_TH_BRAKT_AT){
	    	                        $(":input:checkbox[name="+sn+"usca_bass_prdlst_hold_th_brakt_at]").attr("checked","checked");
	    	                    }
	    	                    /* 잭 */
	    	                    if("1" == value.BASS_PRDLST_HOLD_TOOL_AT){
	    	                        $(":input:checkbox[name="+sn+"usca_bass_prdlst_hold_tool_at]").attr("checked","checked");
	    	                    }
	    	                    /* 스패너 */
	    	                    if("1" == value.BASS_PRDLST_HOLD_TQWRNCH_AT){
	    	                        $(":input:checkbox[name="+sn+"usca_bass_prdlst_hold_tqwrnch_at]").attr("checked","checked");
	    	                    }
	    	                }
		    			}	
	        		});	
				}
				
	        	//상세 입히기. (상태)
	    		if (data.RESULT.USCASTTUSDTLSLIST != null && data.RESULT.USCASTTUSDTLSLIST.length > 0) {
	    			$.each(data.RESULT.USCASTTUSDTLSLIST, function(key, value) {
	    				$("#"+sn+value.PRFOMNC_STTUS_CHCK_IEM_CODE).text( eval(sn+value.PRFOMNC_STTUS_CHCK_IEM_CODE+"_"+value.RESULT_DETAIL_SN ) );
	    			});	
				}
	        	
	    		//상세 입히기. (가격조사 산정액)
	    		if (data.RESULT.USCACALCPCLIST != null && data.RESULT.USCACALCPCLIST.length > 0) {
	    			$.each(data.RESULT.USCACALCPCLIST, function(key, value) {
	    				$("#"+sn+value.PRFOMNC_STTUS_CALC_ITEM_CODE).text(sn+ value.CALC_PC_AMOUNT +"만원" );
	    			});	
				}
	    		
	    		//상세 입히기. (특기사항)
	    		if (data.RESULT.USCASPCABLMATTERLIST != null && data.RESULT.USCASPCABLMATTERLIST.length > 0) {
	    			$.each(data.RESULT.USCASPCABLMATTERLIST, function(key, value) {
	    				$("#"+sn+value.SPCABL_MATTER_ITEM_CODE).text(sn+ value.SPCABL_MATTER_DETAIL_CN);
	    			});	
				}
	    		//상세 입히기. (주요부위 상태표시)
	    		if (data.RESULT.USCASPARTBYSTTUSLIST != null && data.RESULT.USCASPARTBYSTTUSLIST.length > 0) {
	    			$.each(data.RESULT.USCASPARTBYSTTUSLIST, function(key, value) {
	    				
	    				if(value.PART_STTUS_CODE == "W") {
	    					$("#"+sn+"area"+value.CRDNT_SN).attr("style", "color:red; font-weight: bold;position:absolute; left:"+value.XCNTS+"px; top:"+value.YDNTS+"px;");
	    					$("#"+sn+"area"+value.CRDNT_SN).attr("style", "color:white; ").html(value.PART_STTUS_CODE);
	    					$("#"+sn+"td_"+value.CRDNT_SN).attr("style", "background-color:red; filter:alpha(opacity=50); opacity:0.5;");
	    				}else if(value.PART_STTUS_CODE == "X"){
	    					$("#"+sn+"area"+value.CRDNT_SN).attr("style", "color:blue; font-weight: bold;position:absolute; left:"+value.XCNTS+"px; top:"+value.YDNTS+"px;");
	    					$("#"+sn+"area"+value.CRDNT_SN).attr("style", "color:white;").html(value.PART_STTUS_CODE);
	    					$("#"+sn+"td_"+value.CRDNT_SN).attr("style", "background-color:blue; filter:alpha(opacity=50); opacity:0.5;");
	    				}else if(value.PART_STTUS_CODE == "A"){
	    					$("#"+sn+"area"+value.CRDNT_SN).attr("style", "color:orange; font-weight: bold;position:absolute; left:"+value.XCNTS+"px; top:"+value.YDNTS+"px;");
	    					$("#"+sn+"area"+value.CRDNT_SN).attr("style", "color:white;").html(value.PART_STTUS_CODE);
	    					$("#"+sn+"td_"+value.CRDNT_SN).attr("style", "background-color:blue; filter:alpha(opacity=50); opacity:0.5;");
	    				}else if(value.PART_STTUS_CODE == "U"){
	    					$("#"+sn+"area"+value.CRDNT_SN).attr("style", "color:purple; font-weight: bold;position:absolute; left:"+value.XCNTS+"px; top:"+value.YDNTS+"px;");
	    					$("#"+sn+"area"+value.CRDNT_SN).attr("style", "color:white;").html(value.PART_STTUS_CODE);
	    					$("#"+sn+"td_"+value.CRDNT_SN).attr("style", "background-color:blue; filter:alpha(opacity=50); opacity:0.5;");
	    				}else if(value.PART_STTUS_CODE == "T"){
	    					$("#"+sn+"area"+value.CRDNT_SN).attr("style", "color:gray; font-weight: bold;position:absolute; left:"+value.XCNTS+"px; top:"+value.YDNTS+"px;");
	    					$("#"+sn+"area"+value.CRDNT_SN).attr("style", "color:white;").html(value.PART_STTUS_CODE);
	    					$("#"+sn+"td_"+value.CRDNT_SN).attr("style", "background-color:blue; filter:alpha(opacity=50); opacity:0.5;");
	    				}else{
	    					$("#"+sn+"area"+value.CRDNT_SN).attr("style", "color:green; font-weight: bold;position:absolute; left:"+value.XCNTS+"px; top:"+value.YDNTS+"px;");
	    					$("#"+sn+"area"+value.CRDNT_SN).attr("style", "color:white;").html(value.PART_STTUS_CODE);
	    					$("#"+sn+"td_"+value.CRDNT_SN).attr("style", "background-color:blue; filter:alpha(opacity=50); opacity:0.5;");
	    				}
	    				
	    				$("#"+sn+"stat"+value.CRDNT_SN).val(value.PART_STTUS_CODE);
	    				$("#"+sn+"xx"+value.CRDNT_SN).val(value.XCNTS);
	    				$("#"+sn+"yy"+value.CRDNT_SN).val(value.YDNTS);
	    			});
	    		}
	        },
			error : function(xhr, status, error) {
				console.log(xhr);
				console.log(status);
				console.log(error);
				alert("데이터처리 중 오류가 발생하였습니다. 오류가 지속되면 고객센터로 문의 주세요.");
			}
		});
	}else{//검정일자가 존재하지 않으면  기록부 작성이 완료되지 않은 상태 이므로 상세페이지를 보여주지 않는다.
		alert("현재 작성 신청중이며 최종 기록부 작성이 완료되지 않았습니다.");
	}
}

function fd_format(arg){
	if(typeof arg == "undefined"){
		return false;
	}
	
	var date = arg;
		date = arg.substr(0,4) + "-" + arg.substr(4,2) + "-" + arg.substr(6,8);
	return date;
}

function carStateMark(idNum,left,top){
	return;
}

function fn_searchCar(){
	$("#setle_se_code").val('04');
	soldFrm.action = "/web/contents/total_search.do";
	soldFrm.submit();
}
//]]>
</script>
	<span id="GUILD_GUBUN" style="display:none;"></span>
	
	<form id="soldFrm" method="post" >
		<input type="hidden" name="vhrno" id="vhrno" title="차량번호" />
		<input type="hidden" name="setle_se_code" id="setle_se_code" />
	</form>
	
	<div class="New_agbox">
		<h2 class="tit"><span></span>매매용 차량 신속조회 </h2>
	</div>
	<div class='alrtwrap'>
	    <ul>
	        <!-- <li class='first'>
    <div class="info_box">
	        <p href='#' class="info">안내</p>
	    </div>
	</li> -->
	        <li class='sub_alrt'>
	            <ul class="alt_list">
	                <li>중고차 실매물 조회 서비스는 국토교통부의 매매상품용 차량 자료와 한국자동차매매사업조합연합회 및 전국자동차매매사업조합연합회 의 제시ㆍ매도 차량 정보를 기초로 제공되는 자료로 중고차 구매를 위한 참고용으로 제공되는 서비스입니다.</li>
	                <li>매매사업조합에서 제시ㆍ매도 정보를 제공하지 않는 경우 실매물 확인 불가</li>
	            </ul>
	        </li>
	    </ul>
	</div>

	<p class="search_title">조회를 원하시는 차량번호를 입력해주세요.</p>
	<div class="New_car_num New_car_num_mob">
		<span>차량 번호</span>
		<input type="text" id="search_str" title="차량번호" maxlength="9" value="">
		<a href="javascript:void(0);" id="search_btn" class="btn btn_soldvehicle" onclick="soldvehicle_info('koreacarmarket')">조회</a>
	</div>	
		
	<div class="New_agbox">
		<h2 class="tit"><span></span>차량정보 </h2>
	
	<div class="New_car_data car_info_data" style="text-align: center; font-size: 18px;">
		<br/>
		<p>매매용 차량정보 조회 서비스는 국토교통부의 매매상품용 차량 자료와 한국자동차매매사업조합연합회 및 전국자동차매매사업조합연합회의<br/>제시ㆍ매도 차량 정보를 기초로 제공되는 자료로  중고차 구매를 위한 참고용으로 제공되는 서비스입니다.<br/><br/></p>
		<p class="point_red_bold">※ 매매사업조합에서 제시ㆍ매도 정보를 제공하지 않는 경우 실매물 확인 불가</p>
		<br/>
	</div>
	
	<div class="New_car_data" id="view_area01" style="display:none;">
		<div class="tblwrap_noborder" id="view_info02" style="margin-top:15px;">
			<table>
				<colgroup>
					<col style="width: 20%;">
					<col style="width: 30%;">
					<col style="width: 20%;">
					<col style="width: 30%;">
				</colgroup>
				<tr>
					<th>차명 :</th>
					<td><span id="GUILD_CAR_NAME">＊＊＊＊＊</span></td>
					<th>차종 :</th>
					<td><span id="GUILD_CAR_MODEL">＊＊＊＊＊</span></td>
				</tr>
				<tr>
					<th>용도 :</th>
					<td><span id="GUILD_CAR_USE">＊＊＊＊＊</span></td>
					<th>최초 등록일 :</th>
					<td><span id="GUILD_CAR_FIRSTDATE">＊＊＊＊＊</span></td>
				</tr>
				<tr>
					<th>연료 :</th>
					<td><span id="GUILD_CAR_FUEL">＊＊＊＊＊</span></td>
					<th>배기량 :</th>
					<td><span id="GUILD_CAR_DSPLVL">＊＊＊＊＊</span>CC</td>
				</tr>
				<tr>
					<th>색상 :</th>
					<td><span id="GUILD_CAR_COLOR">＊＊＊＊＊</span></td>
					<th>승차정원 :</th>
					<td><span id="GUILD_CAR_PERSON">＊＊＊＊＊</span>명</td>
				</tr>
				<tr>
					<th>변속기 :</th>
					<td><span id="GUILD_CAR_TRANSMISSION">＊＊＊＊＊</span></td>
					<th>주행거리 :</th>
					<td><span id="GUILD_CAR_MILEAGE">＊＊＊＊＊</span>Km</td>
				</tr>
			</table>
			<p style="margin:0 auto; text-align:center;" class="Sold_car_num" >
				<a href="javascript:void(0);" class="sangse" id="GUILD_URL" target="_blank" style="background-color: #003764; display:none;" title="차량 상세 정보">차량 상세 정보</a>
				<!-- <a href="javascript:void(0);" class="sangse" id="GUILD_CAR_VHRNO" target="_blank" style="display:none;" title="차량 이력 확인">차량 이력 확인</a> -->
			</p>
		</div>
	</div>
	
	
	<div class="New_car_data" id="view_area02" style="display:none; text-align: center;">
		<br/><br/>
		<h3>※ 조회하신 차량은 매매상품용으로 확인 되지 않은 차량입니다. 차량번호를 확인하여 주시기 바랍니다.<br/><br/>
		                해당 차량이 실매물로 확인이 안되었다고 반드시 허위매물은 아니며, 허위매물로 인한 피해를 입으신 경우 <br/>
		                관할 관청ㆍ경찰서 및 <a href="https://www.kca.go.kr" style="color:#003764;" target="_blank">소비자보호원</a>으로 신고하시기 바랍니다.</h3>
		<br/><br/>
	</div>
	
	<div class="New_agbox">
		<h2 class="tit"><span></span>중고차 매매 평균금액</h2>
	</div>
	
	<div class="tblwrap_basic tblwrap_topth" id="usedcarcompare_list" style="margin-top:15px; display:none;">
           <table>
               <colgroup>
                   <col style="width: 10%;">
                   <col style="width: 10%;">
                   <col style="width: 10%;">
                   <col style="width: 10%;">
                   <col style="width: 10%;">
                   <col style="width: 10%;">
                   <col style="width: 10%;">
               </colgroup>
               
               <thead>
                <tr>
                    <th rowspan="2">차명</th>
                    <th rowspan="2">형식</th>
                    <th rowspan="2">연식</th>
                    <th colspan="2">매도</th>
                    <th colspan="2">매수</th>
                </tr>
                <tr>
                    <th>대상건수(건)</th>
                    <th>평균매매금액(원)</th>
                    <th>대상건수(건)</th>
                    <th>평균매매금액(원)</th>
                </tr>
            </thead>
               <tbody id="usedcarcompare_data"></tbody>
           </table>
       </div>

	<div class="New_agbox">
		<h2 class="tit" id="tit_total"><span></span>통합이력조회</h2>
	</div>
	<p style="margin:0 auto; text-align:center;" class="Sold_car_num" >
		<a href="#" onclick="fn_searchCar();" class="sangse" id="totalhistory_view" target="_blank" style="background-color: #003764; display:none;" title="중고차 이력조회 바로가기(유료)">중고차 이력조회 바로가기(유료)</a>
	</p>
	
	
	<div id="login_alert" class="New_car_data login_need" style="display:none; text-align: center;">
			<p class="point_red_bold">본인인증 로그인이 필요한 서비스입니다. 로그인페이지로 이동합니다.</p>
			<div><a href="/web/contents/member_login.do">로그인</a></div>
		</div>
	</div>
			
	

 
	<div class="New_car_data" id="totalhistory_nodata" style="display:none; text-align: center;">
		<br/><br/>
		<h3>※ 조회하신 차량은 매매상품용으로 확인 되지 않은 차량입니다. 차량번호를 확인하여 주시기 바랍니다.<br/><br/>
		                해당 차량이 실매물로 확인이 안되었다고 반드시 허위매물은 아니며, 허위매물로 인한 피해를 입으신 경우 <br/>
		                관할 관청ㆍ경찰서 및<a href="https://www.kca.go.kr" style="color:#003764;" target="_blank">소비자보호원</a>으로 신고하시기 바랍니다.</h3>
		<br/><br/>
	</div>


</div><!-- contents_wrap -->

<!-- 중고차 성능점검 기록부 세팅 화면 처리 부분이 너무 길어서 짤라놨음. -->
<script>

$(document).on('click','#item1',function(){
	$('#uscasttus_tab_1').show();
	$('#uscasttus_tab_2').hide();
	$('#uscasttus_tab_3').hide();
	$('#uscasttus_tab_4').hide();
	$('#uscasttus_tab_5').hide();
});
$(document).on('click','#item2',function(){
	$('#uscasttus_tab_1').hide();
	$('#uscasttus_tab_2').show();
	$('#uscasttus_tab_3').hide();
	$('#uscasttus_tab_4').hide();
	$('#uscasttus_tab_5').hide();
});
$(document).on('click','#item3',function(){
	$('#uscasttus_tab_1').hide();
	$('#uscasttus_tab_2').hide();
	$('#uscasttus_tab_3').show();
	$('#uscasttus_tab_4').hide();
	$('#uscasttus_tab_5').hide();
});
$(document).on('click','#item4',function(){
	$('#uscasttus_tab_1').hide();
	$('#uscasttus_tab_2').hide();
	$('#uscasttus_tab_3').hide();
	$('#uscasttus_tab_4').show();
	$('#uscasttus_tab_5').hide();
});
$(document).on('click','#item5',function(){
	$('#uscasttus_tab_1').hide();
	$('#uscasttus_tab_2').hide();
	$('#uscasttus_tab_3').hide();
	$('#uscasttus_tab_4').hide();
	$('#uscasttus_tab_5').show();
});

$(function(){
	
	$("#uscaSttus_close").click(function() {
	    $("#popup_uscaSttus").hide();
	});
	
	$("#uscaSttus_close_btn").click(function() {
		$("#popup_uscaSttus").hide();
	});

});

var M01_  = ''; var M01_1 = '승용'; var M01_2 = '승합'; var M01_3 = '화물'; var M01_4 = '특수'; var M01_5 = '이륜'; var M01_9 = '기타';
var M02_ = ''; var M02_0 = '양호'; var M02_1 = '불량'; 
var M03_ = ''; var M03_A = '자동'; var M03_C = '무단변속기'; var M03_M = '수동'; var M03_S = '세미오토'; var M03_X = '기타';
var M04_ = ''; var M04_1 = '자가 보증'; var M04_2 = '보험사 보증';
var M05_ = ''; var M05_1 = '양호'; var M05_2 = '상이'; var M05_3 = '부식'; var M05_4 = '훼손(오손)'; var M05_5 = '변조(변타)'; var M05_6 = '도말';
var M06_ = ''; var M06_0 = '없음'; var M06_1 = '적법'; var M06_2 = '불법';
var M07_ = ''; var M07_0 = '없음'; var M07_1 = '침수'; var M07_2 = '화재';
var M08_ = ''; var M08_1 = '양호'; var M08_2 = '불량';
var M09_ = ''; var M09_1 = '양호'; var M09_2 = '불량';
var M10_ = ''; var M10_a = '가솔린'; var M10_b = '디젤'; var M10_c = 'LPG'; var M10_d = '전기'; var M10_e = '수소전기'; var M10_x = '하이브리드'; var M10_z = '기타';
var M11_ = ''; var M11_0 = '무'; var M11_1 = '유';

var M20_ = "";   var M20_1 = '적음'; var M20_2 = '보통'; var M20_3 = '많음'; //주행거리상태
var M21_ = '없음'; var M21_0 = '없음'; var M21_1 = '렌트'; var M21_2 = '리스'; var M21_3 = '영업용'; //용도변경
var M22_ = '없음'; var M22_0 = '없음'; var M22_1 = '무채색'; var M22_2 = '유채색'; //색상여부
var M23_ = '없음'; var M23_0 = '없음'; var M23_1 = '전체도색'; var M23_2 = '색상변경'; //색상변경여부
var M24_ = '없음'; var M24_0 = '없음'; var M24_1 = '있음'; //주요옵션_썬루프
var M25_ = '없음'; var M25_0 = '없음'; var M25_1 = '있음'; //주요옵션_네비게이션
var M26_ = '없음'; var M26_0 = '없음'; var M26_1 = '있음'; //주요옵션_기타
var M27_ = '없음'; var M27_0 = '없음'; var M27_1 = '있음'; //단순수리
var M28_0 = '기술사회'; var M28_1 = '한국자동차진단보증협회'; //가격산정기준협회
var M29_ = '양호'; var M29_0 = '양호'; var M29_1 = '불량'; //기타_외장
var M30_ = '양호'; var M30_0 = '양호'; var M30_1 = '불량'; //기타_내장
var M31_ = '양호'; var M31_0 = '양호'; var M31_1 = '불량'; //기타_광택
var M32_ = '양호'; var M32_0 = '양호'; var M32_1 = '불량'; //기타_룸크리닝
var M33_ = '양호'; var M33_0 = '양호'; var M33_1 = '불량'; //기타_유리

var M62_ = '없음';   var M62_0 = '없음';   var M62_1 = '구조'; var M62_2 = '장치'; //불법구조변경,튜닝
var M63_ = '해당없음'; var M63_0 = '해당없음'; var M63_1 = '해당'; //리콜대상여부
var M64_ = '해당없음'; var M64_0 = '미이행';  var M64_1 = '이행'; var M64_2 = ''; //리콜이행여부

var s001_1='양호'; var s001_5='불량';
var s003_1='없음'; var s003_2='미세누유'; var s003_3='누유';
var s005_1='적정'; var s005_2='부족';
var s007_1='없음'; var s007_2='미세누수'; var s007_3='누수';
var s008_1='없음'; var s008_2='미세누수'; var s008_3='누수';
var s009_1='없음'; var s009_2='미세누수'; var s009_3='누수';
var s010_1='적정'; var s010_2='부족';
var s011_1='양호'; var s011_3='불량';
var s012_1='없음'; var s012_2='미세누유'; var s012_3='누유';
var s013_1='적정'; var s013_2='부족'; var s013_3='과다';
var s016_1='양호'; var s016_6='불량';
var s017_1='없음'; var s017_2='미세누유'; var s017_3='누유';
var s018_1='양호'; var s018_5='불량';
var s019_1='적정'; var s019_2='부족'; var s019_3='과다';
var s020_1='양호'; var s020_6='불량';
var s021_1='양호'; var s021_7='불량';
var s022_1='양호'; var s022_4='불량';
var s023_1='양호'; var s023_5='불량';
var s024_1='없음'; var s024_2='미세누유'; var s024_3='누유';
var s025_1='양호'; var s025_5='불량';
var s026_1='양호'; var s026_4='불량';
var s027_1='양호'; var s027_3='불량';
var s029_1='없음'; var s029_2='정비요'; var s029_3='누유';
var s030_1='양호'; var s030_3='불량';
var s031_1='양호'; var s031_3='불량';
var s032_1='양호'; var s032_3='불량';
var s033_1='양호'; var s033_4='불량';
var s034_1='양호'; var s034_4='불량';
var s035_1='없음'; var s035_2='있음';
var s036_1='양호'; var s036_4='불량';

var s037_1='해당없음'; var s037_2='교환'; var s037_3='판금 또는 용접'; var s037_4='부식'; var s037_5='흠집'; var s037_6='요철'; var s037_7='손상';
var s038_1='해당없음'; var s038_2='교환'; var s038_3='판금 또는 용접'; var s038_4='부식'; var s038_5='흠집'; var s038_6='요철'; var s038_7='손상';
var s039_1='해당없음'; var s039_2='교환'; var s039_3='판금 또는 용접'; var s039_4='부식'; var s039_5='흠집'; var s039_6='요철'; var s039_7='손상';
var s040_1='해당없음'; var s040_2='교환'; var s040_3='판금 또는 용접'; var s040_4='부식'; var s040_5='흠집'; var s040_6='요철'; var s040_7='손상';
var s041_1='해당없음'; var s041_2='교환'; var s041_3='판금 또는 용접'; var s041_4='부식'; var s041_5='흠집'; var s041_6='요철'; var s041_7='손상';
var s042_1='해당없음'; var s042_2='교환'; var s042_3='판금 또는 용접'; var s042_4='부식'; var s042_5='흠집'; var s042_6='요철'; var s042_7='손상';
var s043_1='해당없음'; var s043_2='교환'; var s043_3='판금 또는 용접'; var s043_4='부식'; var s043_5='흠집'; var s043_6='요철'; var s043_7='손상';
var s044_1='해당없음'; var s044_2='교환'; var s044_3='판금 또는 용접'; var s044_4='부식'; var s044_5='흠집'; var s044_6='요철'; var s044_7='손상';
var s045_1='해당없음'; var s045_2='교환'; var s045_3='판금 또는 용접'; var s045_4='부식'; var s045_5='흠집'; var s045_6='요철'; var s045_7='손상';
var s046_1='해당없음'; var s046_2='교환'; var s046_3='판금 또는 용접'; var s046_4='부식'; var s046_5='흠집'; var s046_6='요철'; var s046_7='손상';
var s047_1='해당없음'; var s047_2='교환'; var s047_3='판금 또는 용접'; var s047_4='부식'; var s047_5='흠집'; var s047_6='요철'; var s047_7='손상';
var s048_1='해당없음'; var s048_2='교환'; var s048_3='판금 또는 용접'; var s048_4='부식'; var s048_5='흠집'; var s048_6='요철'; var s048_7='손상';
var s049_1='해당없음'; var s049_2='교환'; var s049_3='판금 또는 용접'; var s049_4='부식'; var s049_5='흠집'; var s049_6='요철'; var s049_7='손상';
var s050_1='해당없음'; var s050_2='교환'; var s050_3='판금 또는 용접'; var s050_4='부식'; var s050_5='흠집'; var s050_6='요철'; var s050_7='손상';
var s051_1='해당없음'; var s051_2='교환'; var s051_3='판금 또는 용접'; var s051_4='부식'; var s051_5='흠집'; var s051_6='요철'; var s051_7='손상';
var s052_1='해당없음'; var s052_2='교환'; var s052_3='판금 또는 용접'; var s052_4='부식'; var s052_5='흠집'; var s052_6='요철'; var s052_7='손상';
var s053_1='해당없음'; var s053_2='교환'; var s053_3='판금 또는 용접'; var s053_4='부식'; var s053_5='흠집'; var s053_6='요철'; var s053_7='손상';
var s054_1='해당없음'; var s054_2='교환'; var s054_3='판금 또는 용접'; var s054_4='부식'; var s054_5='흠집'; var s054_6='요철'; var s054_7='손상';
var s055_1='양호'; var s055_3='불량'; 
var s056_1='해당없음'; var s056_2='교환'; var s056_3='판금 또는 용접'; var s056_4='부식'; var s056_5='흠집'; var s056_6='요철'; var s056_7='손상';
var s057_1='없음'; var s057_2='미세누유'; var s057_3='누유';
var s058_1='없음'; var s058_2='미세누유'; var s058_3='누유';
var s059_1='없음'; var s059_2='미세누유'; var s059_3='누유';
var s060_1='양호'; var s060_5='불량';
var s061_1='양호'; var s061_5='불량';
var s062_1='양호'; var s062_5='불량';
var s063_1='양호'; var s063_5='불량';
var s064_1='양호'; var s064_5='불량';
var s065_1='양호'; var s065_5='불량';

</script>

<div id="popup_uscaSttus" style="display: none;">
 <div class="popup_contents popup_full_popup">
     <div class="popup_title popup_full_title">
         <span>중고차성능상태점검기록부 상세</span>
         <button type="button" class="close" id="uscaSttus_close"> <span onclick="">×</span> </button>
     </div>
     <div class="popup_full_box">
         <div class="popup_full_sub_box">
             <!--                세부내역 넣는곳-->
             <div class="New_agbox">
                 <h2 class="tit"><span></span>자동차 기본정보</h2>
             </div>
             <div class="tblwrap_basic">
                 <table>
                     <colgroup>
                         <col style="width: 15%;">
                         <col style="width: 20%;">
                         <col style="width: 15%;">
                         <col style="width: 20%;">
                         <col style="width: 10%;">
                         <col style="width: 10%;">
                     </colgroup>
                     <tr>
                         <th>접수번호</th>
                         <td colspan="5" id="usca_recpt_no"></td>
                     </tr>
                     <tr>
                         <th>차명</th>
                         <td id="usca_cnm">
                         </td>
                         <th>차량등록번호</th>
                         <td id="usca_vhrno"></td>
                         <th>차종</th>
                         <td id="usca_vhcty_asort_code"></td>
                     </tr>
                     <tr>
                         <th>연식</th>
                         <td id="usca_prye"></td>
                         <th>검사유효기간</th>
                         <td colspan="3" id="usca_inspt_valid_pd_de"></td>
                     </tr>
                      <tr>
                         <th>최초등록일</th>
                         <td id="usca_frst_regist_de"></td>
                         <th>차대변호</th>
                         <td colspan="3" id="usca_vin"></td>
                     </tr>
                      <tr>
                         <th>변속기 종류</th>
                         <td id="usca_grbx_knd_code"></td>
                         <th>사용연료</th>
                         <td colspan="3" id="usca_use_fuel_code"></td>
                     </tr>
                      <tr>
                         <th>원동기형식</th>
                         <td id="usca_mtrs_fom"></td>
                         <th>보증 유형</th>
                         <td colspan="3" id="usca_assrnc_ty_se_code"></td>
                     </tr>
                 </table>
             </div>
             
             <div class="New_agbox">
                 <h2 class="tit"><span></span>자동차 종합상태</h2>
             </div>
             
             <div class="tblwrap_basic">
                 <table>
                     <colgroup>
                         <col style="width: 33%;">
                         <col style="width: 33%;">
                         <col style="width: 33%;">
                     </colgroup>
                     <tr>
                         <th>사용이력</th>
                         <th>상태</th>
                         <th>항목 / 해당부품</th>
                     </tr>
                    <tr>
                         <th>계기상태</th>
                         <td id="usca_gauge_fnct_at"></td>
                         <td rowspan="2" id="usca_trvl_dstnc"></td>
                     </tr>
                     <tr>
                         <th>주행거리</th>
                         <td id="usca_trvl_dstnc_sttus_code"></td>
                     </tr>
                     <tr>
                         <th>차대번호표기</th>
                         <td colspan="2" id="usca_samenss_cnfirm_code"></td>
                     </tr>
                     <tr>
                         <th>튜닝</th>
                         <td id="usca_unlaw_stmd_at"></td>
                         <td id="usca_unlaw_stmd_iem_se_code"></td>
                     </tr>
                    <tr>
                         <th>특별이력</th>
                         <td colspan="2" id="usca_flud_at"></td>
                     </tr>
                     <tr>
                         <th>용도변경</th>
                         <td colspan="2" id="usca_prpos_change_se_code"></td>
                     </tr>
                     <tr>
                         <th>리콜대상여부</th>
                         <td colspan="2" id="usca_recall_trget_at"></td>
                     </tr>
                     <tr>
                         <th>리콜이행여부</th>
                         <td colspan="2" id="usca_recall_flfl_at"></td>
                     </tr>
                 </table>
             </div>
             
             <div class="New_agbox">
                 <h2 class="tit"><span></span>자기진단사항</h2>
             </div>
             
             <div class="tblwrap_basic">
                 <table>
                     <colgroup>
                         <col style="width: 30%;">
                         <col style="width: 70%;">
                     </colgroup>
                     <tr>
                         <th>원동기</th>
                         <td id="usca_engine_stblt_at"></td>
                     </tr>
                     <tr>
                         <th>변속기</th>
                         <td id="usca_grbx_stblt_at"></td>
                     </tr>
                 </table>
             </div>
              
             <div class="New_agbox">
                 <h2 class="tit"><span></span>배출가스</h2>
             </div>
                             
             <div class="tblwrap_basic">
                 <table>
                     <colgroup>
                         <col style="width: 30%;">
                         <col style="width: 70%;">
                     </colgroup>
                     <tr>
                         <th>일산화탄소(CO)</th>
                         <td id="usca_crmn_mesure_value"></td>
                     </tr>
                     <tr>
                         <th>탄화수소(HC)</th>
                         <td id="usca_hydr_mesure_value"></td>
                     </tr>
                     <tr>
                         <th>매연</th>
                         <td id="usca_smoke_mesure_value"></td>
                     </tr>
                 </table>
             </div>
             
             <div class="New_agbox">
                 <h2 class="tit"><span></span>사고이력</h2>
             </div>
             
             <div class="tblwrap_basic">
                 <table>
                     <colgroup>
                         <col style="width: 20%;">
                         <col style="width: 30%;">
                         <col style="width: 20%;">
                         <col style="width: 30%;">
                        </colgroup>
                        <tr>
                            <th>사고이력</th>
                            <td id="usca_acdnt_at"></td>
                            <th>단순수리</th>
                            <td id="usca_simpl_repair_at"></td>
                        </tr>
                 </table>
             </div>
             
             <div class="New_agbox">
                 <h2 class="tit"><span></span>경정사유</h2>
             </div>
             
             <div class="tblwrap_basic">
                 <table>
                     <tr>
                         <td><em id="usca_upd_reason_txt"></em></td>
                     </tr>
                 </table>
             </div>
             <br/><br/>
             <div class="tab_box01">
				<div class="box_layout">
					<ul class="New_tbls">
						<li class="tbl_cell">
							<label class="box-radio-input">
								<input type="radio" name="item1" id="item1" checked="checked">
								<span style="font-size: 8px;">자동차의 상태표시</span>
							</label>
						</li>
						<li class="tbl_cell">
							<label class="box-radio-input">
								<input type="radio" name="item1" id="item2">
								<span style="font-size: 8px;">외판/주요골격</span>
							</label>
						</li>
						<li class="tbl_cell">
							<label class="box-radio-input">
								<input type="radio" name="item1" id="item3">
								<span style="font-size: 8px;">원동기/동력전달</span>
							</label>
						</li>
						<li class="tbl_cell">
							<label class="box-radio-input">
								<input type="radio" name="item1" id="item4">
								<span style="font-size: 8px;">조향/제동/전기</span>
							</label>
						</li>
						<li class="tbl_cell">
							<label class="box-radio-input">
								<input type="radio" name="item1" id="item5">
								<span style="font-size: 8px;">처리정보</span>
							</label>
						</li>
					</ul>
				</div>
			</div>
			
			<div id="uscasttus_tab_1">
				<h5 style="text-align:left;">상태표시부호</h5>
				<p style="text-align:left;">
				<strong style="color:blue;">X</strong> : 교환(교체), 
				<strong style="color:red;">W</strong> : 판금,용접, 
				<strong style="color:green;">C</strong> : 부식 
				<strong style="color:orange;">A</strong> : 흠집,
				<strong style="color:purple;">U</strong> : 요철,
				<strong style="color:gray;">T</strong> : 손상<br />
				※ 승용차 외에는 승용차에 준하여 표시<br />
				</p>
				<br />
										
				<div style="background:url('/resource/common_dz/images/ao_car_state_new.jpg'); text-align:center; padding-top:32px;">
					<div id="MarkArea" style="position:relative;">
						<table id="MarkAreaTable" cellpadding="0" cellspacing="0" border="0" width="580px" height="230px" bordercolor="#000000" style="margin-left:35px;">
							<colgroup>
								<col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" />
								<col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" />
								<col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" />
								<col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" />
							</colgroup>
			
							<tr>
								<td id="td_1" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(1,5,7);"><b><div id="area1">&nbsp;</div></b><input type="hidden"  id="stat1" name="stat1" value=""/><input type="hidden" id="xx1" name="xx1" value=""/><input type="hidden" id="yy1" name="yy1" value=""/></td>
								<td id="td_2" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(2,34,7);"><b><div id="area2">&nbsp;</div></b><input type="hidden"  id="stat2" name="stat2" value=""/><input type="hidden" id="xx2" name="xx2" value=""/><input type="hidden" id="yy2" name="yy2" value=""/></td>
								<td id="td_3" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(3,63,7);"><b><div id="area3">&nbsp;</div></b><input type="hidden"  id="stat3" name="stat3" value=""/><input type="hidden" id="xx3" name="xx3" value=""/><input type="hidden" id="yy3" name="yy3" value=""/></td>
								<td id="td_4" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(4,92,7);"><b><div id="area4">&nbsp;</div></b><input type="hidden"  id="stat4" name="stat4" value=""/><input type="hidden" id="xx4" name="xx4" value=""/><input type="hidden" id="yy4" name="yy4" value=""/></td>
								<td id="td_5" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(5,121,7);"><b><div id="area5">&nbsp;</div></b><input type="hidden"  id="stat5" name="stat5" value=""/><input type="hidden" id="xx5" name="xx5" value=""/><input type="hidden" id="yy5" name="yy5" value=""/></td>
								<td id="td_6" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(6,150,7);"><b><div id="area6">&nbsp;</div></b><input type="hidden"  id="stat6" name="stat6" value=""/><input type="hidden" id="xx6" name="xx6" value=""/><input type="hidden" id="yy6" name="yy6" value=""/></td>
								<td id="td_7" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(7,179,7);"><b><div id="area7">&nbsp;</div></b><input type="hidden"  id="stat7" name="stat7" value=""/><input type="hidden" id="xx7" name="xx7" value=""/><input type="hidden" id="yy7" name="yy7" value=""/></td>
								<td id="td_8" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(8,208,7);"><b><div id="area8">&nbsp;</div></b><input type="hidden"  id="stat8" name="stat8" value=""/><input type="hidden" id="xx8" name="xx8" value=""/><input type="hidden" id="yy8" name="yy8" value=""/></td>
								<td id="td_9" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(9,230,7);"><b><div id="area9">&nbsp;</div></b><input type="hidden"  id="stat9" name="stat9" value=""/><input type="hidden" id="xx9" name="xx9" value=""/><input type="hidden" id="yy9" name="yy9" value=""/></td>
								<td id="td_10" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(10,266,7);"><b><div id="area10">&nbsp;</div></b><input type="hidden"  id="stat10" name="stat10" value=""/><input type="hidden" id="xx10" name="xx10" value=""/><input type="hidden" id="yy10" name="yy10" value=""/></td>
								<td id="td_11" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(11,295,7);"><b><div id="area11">&nbsp;</div></b><input type="hidden"  id="stat11" name="stat11" value=""/><input type="hidden" id="xx11" name="xx11" value=""/><input type="hidden" id="yy11" name="yy11" value=""/></td>
								<td id="td_12" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(12,324,7);"><b><div id="area12">&nbsp;</div></b><input type="hidden"  id="stat12" name="stat12" value=""/><input type="hidden" id="xx12" name="xx12" value=""/><input type="hidden" id="yy12" name="yy12" value=""/></td>
								<td id="td_13" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(13,353,7);"><b><div id="area13">&nbsp;</div></b><input type="hidden"  id="stat13" name="stat13" value=""/><input type="hidden" id="xx13" name="xx13" value=""/><input type="hidden" id="yy13" name="yy13" value=""/></td>
								<td id="td_14" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(14,382,7);"><b><div id="area14">&nbsp;</div></b><input type="hidden"  id="stat14" name="stat14" value=""/><input type="hidden" id="xx14" name="xx14" value=""/><input type="hidden" id="yy14" name="yy14" value=""/></td>
								<td id="td_15" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(15,411,7);"><b><div id="area15">&nbsp;</div></b><input type="hidden"  id="stat15" name="stat15" value=""/><input type="hidden" id="xx15" name="xx15" value=""/><input type="hidden" id="yy15" name="yy15" value=""/></td>
								<td id="td_16" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(16,440,7);"><b><div id="area16">&nbsp;</div></b><input type="hidden"  id="stat16" name="stat16" value=""/><input type="hidden" id="xx16" name="xx16" value=""/><input type="hidden" id="yy16" name="yy16" value=""/></td>
								<td id="td_17" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(17,469,7);"><b><div id="area17">&nbsp;</div></b><input type="hidden"  id="stat17" name="stat17" value=""/><input type="hidden" id="xx17" name="xx17" value=""/><input type="hidden" id="yy17" name="yy17" value=""/></td>
								<td id="td_18" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(18,498,7);"><b><div id="area18">&nbsp;</div></b><input type="hidden"  id="stat18" name="stat18" value=""/><input type="hidden" id="xx18" name="xx18" value=""/><input type="hidden" id="yy18" name="yy18" value=""/></td>
								<td id="td_19" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(19,527,7);"><b><div id="area19">&nbsp;</div></b><input type="hidden"  id="stat19" name="stat19" value=""/><input type="hidden" id="xx19" name="xx19" value=""/><input type="hidden" id="yy19" name="yy19" value=""/></td>
								<td id="td_20" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(20,556,7);"><b><div id="area20">&nbsp;</div></b><input type="hidden"  id="stat20" name="stat20" value=""/><input type="hidden" id="xx20" name="xx20" value=""/><input type="hidden" id="yy20" name="yy20" value=""/></td>
							</tr>
							<tr>
								<td id="td_21" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(21,5,30);"><b><div id="area21">&nbsp;</div></b><input type="hidden"  id="stat21" name="stat21" value=""/><input type="hidden" id="xx21" name="xx21" value=""/><input type="hidden" id="yy21" name="yy21" value=""/></td>
								<td id="td_22" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(22,34,30);"><b><div id="area22">&nbsp;</div></b><input type="hidden"  id="stat22" name="stat22" value=""/><input type="hidden" id="xx22" name="xx22" value=""/><input type="hidden" id="yy22" name="yy22" value=""/></td>
								<td id="td_23" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(23,63,30);"><b><div id="area23">&nbsp;</div></b><input type="hidden"  id="stat23" name="stat23" value=""/><input type="hidden" id="xx23" name="xx23" value=""/><input type="hidden" id="yy23" name="yy23" value=""/></td>
								<td id="td_24" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(24,92,30);"><b><div id="area24">&nbsp;</div></b><input type="hidden"  id="stat24" name="stat24" value=""/><input type="hidden" id="xx24" name="xx24" value=""/><input type="hidden" id="yy24" name="yy24" value=""/></td>
								<td id="td_25" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(25,121,30);"><b><div id="area25">&nbsp;</div></b><input type="hidden"  id="stat25" name="stat25" value=""/><input type="hidden" id="xx25" name="xx25" value=""/><input type="hidden" id="yy25" name="yy25" value=""/></td>
								<td id="td_26" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(26,150,30);"><b><div id="area26">&nbsp;</div></b><input type="hidden"  id="stat26" name="stat26" value=""/><input type="hidden" id="xx26" name="xx26" value=""/><input type="hidden" id="yy26" name="yy26" value=""/></td>
								<td id="td_27" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(27,179,30);"><b><div id="area27">&nbsp;</div></b><input type="hidden"  id="stat27" name="stat27" value=""/><input type="hidden" id="xx27" name="xx27" value=""/><input type="hidden" id="yy27" name="yy27" value=""/></td>
								<td id="td_28" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(28,208,30);"><b><div id="area28">&nbsp;</div></b><input type="hidden"  id="stat28" name="stat28" value=""/><input type="hidden" id="xx28" name="xx28" value=""/><input type="hidden" id="yy28" name="yy28" value=""/></td>
								<td id="td_29" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(29,237,30);"><b><div id="area29">&nbsp;</div></b><input type="hidden"  id="stat29" name="stat29" value=""/><input type="hidden" id="xx29" name="xx29" value=""/><input type="hidden" id="yy29" name="yy29" value=""/></td>
								<td id="td_30" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(30,266,30);"><b><div id="area30">&nbsp;</div></b><input type="hidden"  id="stat30" name="stat30" value=""/><input type="hidden" id="xx30" name="xx30" value=""/><input type="hidden" id="yy30" name="yy30" value=""/></td>
								<td id="td_31" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(31,295,30);"><b><div id="area31">&nbsp;</div></b><input type="hidden"  id="stat31" name="stat31" value=""/><input type="hidden" id="xx31" name="xx31" value=""/><input type="hidden" id="yy31" name="yy31" value=""/></td>
								<td id="td_32" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(32,324,30);"><b><div id="area32">&nbsp;</div></b><input type="hidden"  id="stat32" name="stat32" value=""/><input type="hidden" id="xx32" name="xx32" value=""/><input type="hidden" id="yy32" name="yy32" value=""/></td>
								<td id="td_33" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(33,353,30);"><b><div id="area33">&nbsp;</div></b><input type="hidden"  id="stat33" name="stat33" value=""/><input type="hidden" id="xx33" name="xx33" value=""/><input type="hidden" id="yy33" name="yy33" value=""/></td>
								<td id="td_34" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(34,382,30);"><b><div id="area34">&nbsp;</div></b><input type="hidden"  id="stat34" name="stat34" value=""/><input type="hidden" id="xx34" name="xx34" value=""/><input type="hidden" id="yy34" name="yy34" value=""/></td>
								<td id="td_35" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(35,402,30);"><b><div id="area35">&nbsp;</div></b><input type="hidden"  id="stat35" name="stat35" value=""/><input type="hidden" id="xx35" name="xx35" value=""/><input type="hidden" id="yy35" name="yy35" value=""/></td>
								<td id="td_36" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(36,452,30);"><b><div id="area36">&nbsp;</div></b><input type="hidden"  id="stat36" name="stat36" value=""/><input type="hidden" id="xx36" name="xx36" value=""/><input type="hidden" id="yy36" name="yy36" value=""/></td>
								<td id="td_37" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(37,469,30);"><b><div id="area37">&nbsp;</div></b><input type="hidden"  id="stat37" name="stat37" value=""/><input type="hidden" id="xx37" name="xx37" value=""/><input type="hidden" id="yy37" name="yy37" value=""/></td>
								<td id="td_38" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(38,498,30);"><b><div id="area38">&nbsp;</div></b><input type="hidden"  id="stat38" name="stat38" value=""/><input type="hidden" id="xx38" name="xx38" value=""/><input type="hidden" id="yy38" name="yy38" value=""/></td>
								<td id="td_39" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(39,527,30);"><b><div id="area39">&nbsp;</div></b><input type="hidden"  id="stat39" name="stat39" value=""/><input type="hidden" id="xx39" name="xx39" value=""/><input type="hidden" id="yy39" name="yy39" value=""/></td>
								<td id="td_40" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(40,556,30);"><b><div id="area40">&nbsp;</div></b><input type="hidden"  id="stat40" name="stat40" value=""/><input type="hidden" id="xx40" name="xx40" value=""/><input type="hidden" id="yy40" name="yy40" value=""/></td>
							</tr>
							<tr>
								<td id="td_41" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(41,5,53);"><b><div id="area41">&nbsp;</div></b><input type="hidden"  id="stat41" name="stat41" value=""/><input type="hidden" id="xx41" name="xx41" value=""/><input type="hidden" id="yy41" name="yy41" value=""/></td>
								<td id="td_42" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(42,34,53);"><b><div id="area42">&nbsp;</div></b><input type="hidden"  id="stat42" name="stat42" value=""/><input type="hidden" id="xx42" name="xx42" value=""/><input type="hidden" id="yy42" name="yy42" value=""/></td>
								<td id="td_43" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(43,63,53);"><b><div id="area43">&nbsp;</div></b><input type="hidden"  id="stat43" name="stat43" value=""/><input type="hidden" id="xx43" name="xx43" value=""/><input type="hidden" id="yy43" name="yy43" value=""/></td>
								<td id="td_44" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(44,92,53);"><b><div id="area44">&nbsp;</div></b><input type="hidden"  id="stat44" name="stat44" value=""/><input type="hidden" id="xx44" name="xx44" value=""/><input type="hidden" id="yy44" name="yy44" value=""/></td>
								<td id="td_45" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(45,121,53);"><b><div id="area45">&nbsp;</div></b><input type="hidden"  id="stat45" name="stat45" value=""/><input type="hidden" id="xx45" name="xx45" value=""/><input type="hidden" id="yy45" name="yy45" value=""/></td>
								<td id="td_46" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(46,150,53);"><b><div id="area46">&nbsp;</div></b><input type="hidden"  id="stat46" name="stat46" value=""/><input type="hidden" id="xx46" name="xx46" value=""/><input type="hidden" id="yy46" name="yy46" value=""/></td>
								<td id="td_47" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(47,179,53);"><b><div id="area47">&nbsp;</div></b><input type="hidden"  id="stat47" name="stat47" value=""/><input type="hidden" id="xx47" name="xx47" value=""/><input type="hidden" id="yy47" name="yy47" value=""/></td>
								<td id="td_48" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(48,208,53);"><b><div id="area48">&nbsp;</div></b><input type="hidden"  id="stat48" name="stat48" value=""/><input type="hidden" id="xx48" name="xx48" value=""/><input type="hidden" id="yy48" name="yy48" value=""/></td>
								<td id="td_49" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(49,237,53);"><b><div id="area49">&nbsp;</div></b><input type="hidden"  id="stat49" name="stat49" value=""/><input type="hidden" id="xx49" name="xx49" value=""/><input type="hidden" id="yy49" name="yy49" value=""/></td>
								<td id="td_50" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(50,266,53);"><b><div id="area50">&nbsp;</div></b><input type="hidden"  id="stat50" name="stat50" value=""/><input type="hidden" id="xx50" name="xx50" value=""/><input type="hidden" id="yy50" name="yy50" value=""/></td>
								<td id="td_51" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(51,295,53);"><b><div id="area51">&nbsp;</div></b><input type="hidden"  id="stat51" name="stat51" value=""/><input type="hidden" id="xx51" name="xx51" value=""/><input type="hidden" id="yy51" name="yy51" value=""/></td>
								<td id="td_52" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(52,324,53);"><b><div id="area52">&nbsp;</div></b><input type="hidden"  id="stat52" name="stat52" value=""/><input type="hidden" id="xx52" name="xx52" value=""/><input type="hidden" id="yy52" name="yy52" value=""/></td>
								<td id="td_53" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(53,353,53);"><b><div id="area53">&nbsp;</div></b><input type="hidden"  id="stat53" name="stat53" value=""/><input type="hidden" id="xx53" name="xx53" value=""/><input type="hidden" id="yy53" name="yy53" value=""/></td>
								<td id="td_54" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(54,382,53);"><b><div id="area54">&nbsp;</div></b><input type="hidden"  id="stat54" name="stat54" value=""/><input type="hidden" id="xx54" name="xx54" value=""/><input type="hidden" id="yy54" name="yy54" value=""/></td>
								<td id="td_55" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(55,402,53);"><b><div id="area55">&nbsp;</div></b><input type="hidden"  id="stat55" name="stat55" value=""/><input type="hidden" id="xx55" name="xx55" value=""/><input type="hidden" id="yy55" name="yy55" value=""/></td>
								<td id="td_56" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(56,452,53);"><b><div id="area56">&nbsp;</div></b><input type="hidden"  id="stat56" name="stat56" value=""/><input type="hidden" id="xx56" name="xx56" value=""/><input type="hidden" id="yy56" name="yy56" value=""/></td>
								<td id="td_57" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(57,469,53);"><b><div id="area57">&nbsp;</div></b><input type="hidden"  id="stat57" name="stat57" value=""/><input type="hidden" id="xx57" name="xx57" value=""/><input type="hidden" id="yy57" name="yy57" value=""/></td>
								<td id="td_58" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(58,498,53);"><b><div id="area58">&nbsp;</div></b><input type="hidden"  id="stat58" name="stat58" value=""/><input type="hidden" id="xx58" name="xx58" value=""/><input type="hidden" id="yy58" name="yy58" value=""/></td>
								<td id="td_59" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(59,527,53);"><b><div id="area59">&nbsp;</div></b><input type="hidden"  id="stat59" name="stat59" value=""/><input type="hidden" id="xx59" name="xx59" value=""/><input type="hidden" id="yy59" name="yy59" value=""/></td>
								<td id="td_60" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(60,556,53);"><b><div id="area60">&nbsp;</div></b><input type="hidden"  id="stat60" name="stat60" value=""/><input type="hidden" id="xx60" name="xx60" value=""/><input type="hidden" id="yy60" name="yy60" value=""/></td>
							</tr>
							<tr>
								<td id="td_61" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(61,5,76);"><b><div id="area61">&nbsp;</div></b><input type="hidden"  id="stat61" name="stat61" value=""/><input type="hidden" id="xx61" name="xx61" value=""/><input type="hidden" id="yy61" name="yy61" value=""/></td>
								<td id="td_62" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(62,34,76);"><b><div id="area62">&nbsp;</div></b><input type="hidden"  id="stat62" name="stat62" value=""/><input type="hidden" id="xx62" name="xx62" value=""/><input type="hidden" id="yy62" name="yy62" value=""/></td>
								<td id="td_63" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(63,63,76);"><b><div id="area63">&nbsp;</div></b><input type="hidden"  id="stat63" name="stat63" value=""/><input type="hidden" id="xx63" name="xx63" value=""/><input type="hidden" id="yy63" name="yy63" value=""/></td>
								<td id="td_64" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(64,92,76);"><b><div id="area64">&nbsp;</div></b><input type="hidden"  id="stat64" name="stat64" value=""/><input type="hidden" id="xx64" name="xx64" value=""/><input type="hidden" id="yy64" name="yy64" value=""/></td>
								<td id="td_65" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(65,121,76);"><b><div id="area65">&nbsp;</div></b><input type="hidden"  id="stat65" name="stat65" value=""/><input type="hidden" id="xx65" name="xx65" value=""/><input type="hidden" id="yy65" name="yy65" value=""/></td>
								<td id="td_66" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(66,150,76);"><b><div id="area66">&nbsp;</div></b><input type="hidden"  id="stat66" name="stat66" value=""/><input type="hidden" id="xx66" name="xx66" value=""/><input type="hidden" id="yy66" name="yy66" value=""/></td>
								<td id="td_67" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(67,179,76);"><b><div id="area67">&nbsp;</div></b><input type="hidden"  id="stat67" name="stat67" value=""/><input type="hidden" id="xx67" name="xx67" value=""/><input type="hidden" id="yy67" name="yy67" value=""/></td>
								<td id="td_68" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(68,208,76);"><b><div id="area68">&nbsp;</div></b><input type="hidden"  id="stat68" name="stat68" value=""/><input type="hidden" id="xx68" name="xx68" value=""/><input type="hidden" id="yy68" name="yy68" value=""/></td>
								<td id="td_69" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(69,237,76);"><b><div id="area69">&nbsp;</div></b><input type="hidden"  id="stat69" name="stat69" value=""/><input type="hidden" id="xx69" name="xx69" value=""/><input type="hidden" id="yy69" name="yy69" value=""/></td>
								<td id="td_70" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(70,266,76);"><b><div id="area70">&nbsp;</div></b><input type="hidden"  id="stat70" name="stat70" value=""/><input type="hidden" id="xx70" name="xx70" value=""/><input type="hidden" id="yy70" name="yy70" value=""/></td>
								<td id="td_71" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(71,295,76);"><b><div id="area71">&nbsp;</div></b><input type="hidden"  id="stat71" name="stat71" value=""/><input type="hidden" id="xx71" name="xx71" value=""/><input type="hidden" id="yy71" name="yy71" value=""/></td>
								<td id="td_72" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(72,324,76);"><b><div id="area72">&nbsp;</div></b><input type="hidden"  id="stat72" name="stat72" value=""/><input type="hidden" id="xx72" name="xx72" value=""/><input type="hidden" id="yy72" name="yy72" value=""/></td>
								<td id="td_73" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(73,353,76);"><b><div id="area73">&nbsp;</div></b><input type="hidden"  id="stat73" name="stat73" value=""/><input type="hidden" id="xx73" name="xx73" value=""/><input type="hidden" id="yy73" name="yy73" value=""/></td>
								<td id="td_74" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(74,380,76);"><b><div id="area74">&nbsp;</div></b><input type="hidden"  id="stat74" name="stat74" value=""/><input type="hidden" id="xx74" name="xx74" value=""/><input type="hidden" id="yy74" name="yy74" value=""/></td>
								<td id="td_75" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(75,411,76);"><b><div id="area75">&nbsp;</div></b><input type="hidden"  id="stat75" name="stat75" value=""/><input type="hidden" id="xx75" name="xx75" value=""/><input type="hidden" id="yy75" name="yy75" value=""/></td>
								<td id="td_76" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(76,440,76);"><b><div id="area76">&nbsp;</div></b><input type="hidden"  id="stat76" name="stat76" value=""/><input type="hidden" id="xx76" name="xx76" value=""/><input type="hidden" id="yy76" name="yy76" value=""/></td>
								<td id="td_77" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(77,469,76);"><b><div id="area77">&nbsp;</div></b><input type="hidden"  id="stat77" name="stat77" value=""/><input type="hidden" id="xx77" name="xx77" value=""/><input type="hidden" id="yy77" name="yy77" value=""/></td>
								<td id="td_78" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(78,498,76);"><b><div id="area78">&nbsp;</div></b><input type="hidden"  id="stat78" name="stat78" value=""/><input type="hidden" id="xx78" name="xx78" value=""/><input type="hidden" id="yy78" name="yy78" value=""/></td>
								<td id="td_79" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(79,527,76);"><b><div id="area79">&nbsp;</div></b><input type="hidden"  id="stat79" name="stat79" value=""/><input type="hidden" id="xx79" name="xx79" value=""/><input type="hidden" id="yy79" name="yy79" value=""/></td>
								<td id="td_80" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(80,556,76);"><b><div id="area80">&nbsp;</div></b><input type="hidden"  id="stat80" name="stat80" value=""/><input type="hidden" id="xx80" name="xx80" value=""/><input type="hidden" id="yy80" name="yy80" value=""/></td>
							</tr>
							<tr>
								<td id="td_81" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(81,5,99);"><b><div id="area81">&nbsp;</div></b><input type="hidden"  id="stat81" name="stat81" value=""/><input type="hidden" id="xx81" name="xx81" value=""/><input type="hidden" id="yy81" name="yy81" value=""/></td>
								<td id="td_82" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(82,34,99);"><b><div id="area82">&nbsp;</div></b><input type="hidden"  id="stat82" name="stat82" value=""/><input type="hidden" id="xx82" name="xx82" value=""/><input type="hidden" id="yy82" name="yy82" value=""/></td>
								<td id="td_83" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(83,63,99);"><b><div id="area83">&nbsp;</div></b><input type="hidden"  id="stat83" name="stat83" value=""/><input type="hidden" id="xx83" name="xx83" value=""/><input type="hidden" id="yy83" name="yy83" value=""/></td>
								<td id="td_84" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(84,92,99);"><b><div id="area84">&nbsp;</div></b><input type="hidden"  id="stat84" name="stat84" value=""/><input type="hidden" id="xx84" name="xx84" value=""/><input type="hidden" id="yy84" name="yy84" value=""/></td>
								<td id="td_85" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(85,121,99);"><b><div id="area85">&nbsp;</div></b><input type="hidden"  id="stat85" name="stat85" value=""/><input type="hidden" id="xx85" name="xx85" value=""/><input type="hidden" id="yy85" name="yy85" value=""/></td>
								<td id="td_86" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(86,150,99);"><b><div id="area86">&nbsp;</div></b><input type="hidden"  id="stat86" name="stat86" value=""/><input type="hidden" id="xx86" name="xx86" value=""/><input type="hidden" id="yy86" name="yy86" value=""/></td>
								<td id="td_87" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(87,179,99);"><b><div id="area87">&nbsp;</div></b><input type="hidden"  id="stat87" name="stat87" value=""/><input type="hidden" id="xx87" name="xx87" value=""/><input type="hidden" id="yy87" name="yy87" value=""/></td>
								<td id="td_88" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(88,208,99);"><b><div id="area88">&nbsp;</div></b><input type="hidden"  id="stat88" name="stat88" value=""/><input type="hidden" id="xx88" name="xx88" value=""/><input type="hidden" id="yy88" name="yy88" value=""/></td>
								<td id="td_89" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(89,237,99);"><b><div id="area89">&nbsp;</div></b><input type="hidden"  id="stat89" name="stat89" value=""/><input type="hidden" id="xx89" name="xx89" value=""/><input type="hidden" id="yy89" name="yy89" value=""/></td>
								<td id="td_90" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(90,266,99);"><b><div id="area90">&nbsp;</div></b><input type="hidden"  id="stat90" name="stat90" value=""/><input type="hidden" id="xx90" name="xx90" value=""/><input type="hidden" id="yy90" name="yy90" value=""/></td>
								<td id="td_91" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(91,295,99);"><b><div id="area91">&nbsp;</div></b><input type="hidden"  id="stat91" name="stat91" value=""/><input type="hidden" id="xx91" name="xx91" value=""/><input type="hidden" id="yy91" name="yy91" value=""/></td>
								<td id="td_92" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(92,324,99);"><b><div id="area92">&nbsp;</div></b><input type="hidden"  id="stat92" name="stat92" value=""/><input type="hidden" id="xx92" name="xx92" value=""/><input type="hidden" id="yy92" name="yy92" value=""/></td>
								<td id="td_93" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(93,353,99);"><b><div id="area93">&nbsp;</div></b><input type="hidden"  id="stat93" name="stat93" value=""/><input type="hidden" id="xx93" name="xx93" value=""/><input type="hidden" id="yy93" name="yy93" value=""/></td>
								<td id="td_94" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(94,382,99);"><b><div id="area94">&nbsp;</div></b><input type="hidden"  id="stat94" name="stat94" value=""/><input type="hidden" id="xx94" name="xx94" value=""/><input type="hidden" id="yy94" name="yy94" value=""/></td>
								<td id="td_95" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(95,411,99);"><b><div id="area95">&nbsp;</div></b><input type="hidden"  id="stat95" name="stat95" value=""/><input type="hidden" id="xx95" name="xx95" value=""/><input type="hidden" id="yy95" name="yy95" value=""/></td>
								<td id="td_96" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(96,440,99);"><b><div id="area96">&nbsp;</div></b><input type="hidden"  id="stat96" name="stat96" value=""/><input type="hidden" id="xx96" name="xx96" value=""/><input type="hidden" id="yy96" name="yy96" value=""/></td>
								<td id="td_97" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(97,469,99);"><b><div id="area97">&nbsp;</div></b><input type="hidden"  id="stat97" name="stat97" value=""/><input type="hidden" id="xx97" name="xx97" value=""/><input type="hidden" id="yy97" name="yy97" value=""/></td>
								<td id="td_98" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(98,498,99);"><b><div id="area98">&nbsp;</div></b><input type="hidden"  id="stat98" name="stat98" value=""/><input type="hidden" id="xx98" name="xx98" value=""/><input type="hidden" id="yy98" name="yy98" value=""/></td>
								<td id="td_99" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(99,527,99);"><b><div id="area99">&nbsp;</div></b><input type="hidden"  id="stat99" name="stat99" value=""/><input type="hidden" id="xx99" name="xx99" value=""/><input type="hidden" id="yy99" name="yy99" value=""/></td>
								<td id="td_100" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(100,556,99);"><b><div id="area100">&nbsp;</div></b><input type="hidden"  id="stat100" name="stat100" value=""/><input type="hidden" id="xx100" name="xx100" value=""/><input type="hidden" id="yy100" name="yy100" value=""/></td>
							</tr>
							<tr>
								<td id="td_101" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(101,5,122);"><b><div id="area101">&nbsp;</div></b><input type="hidden"  id="stat101" name="stat101" value=""/><input type="hidden" id="xx101" name="xx101" value=""/><input type="hidden" id="yy101" name="yy101" value=""/></td>
								<td id="td_102" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(102,34,122);"><b><div id="area102">&nbsp;</div></b><input type="hidden"  id="stat102" name="stat102" value=""/><input type="hidden" id="xx102" name="xx102" value=""/><input type="hidden" id="yy102" name="yy102" value=""/></td>
								<td id="td_103" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(103,63,122);"><b><div id="area103">&nbsp;</div></b><input type="hidden"  id="stat103" name="stat103" value=""/><input type="hidden" id="xx103" name="xx103" value=""/><input type="hidden" id="yy103" name="yy103" value=""/></td>
								<td id="td_104" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(104,92,122);"><b><div id="area104">&nbsp;</div></b><input type="hidden"  id="stat104" name="stat104" value=""/><input type="hidden" id="xx104" name="xx104" value=""/><input type="hidden" id="yy104" name="yy104" value=""/></td>
								<td id="td_105" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(105,121,122);"><b><div id="area105">&nbsp;</div></b><input type="hidden"  id="stat105" name="stat105" value=""/><input type="hidden" id="xx105" name="xx105" value=""/><input type="hidden" id="yy105" name="yy105" value=""/></td>
								<td id="td_106" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(106,150,122);"><b><div id="area106">&nbsp;</div></b><input type="hidden"  id="stat106" name="stat106" value=""/><input type="hidden" id="xx106" name="xx106" value=""/><input type="hidden" id="yy106" name="yy106" value=""/></td>
								<td id="td_107" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(107,179,122);"><b><div id="area107">&nbsp;</div></b><input type="hidden"  id="stat107" name="stat107" value=""/><input type="hidden" id="xx107" name="xx107" value=""/><input type="hidden" id="yy107" name="yy107" value=""/></td>
								<td id="td_108" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(108,208,122);"><b><div id="area108">&nbsp;</div></b><input type="hidden"  id="stat108" name="stat108" value=""/><input type="hidden" id="xx108" name="xx108" value=""/><input type="hidden" id="yy108" name="yy108" value=""/></td>
								<td id="td_109" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(109,237,122);"><b><div id="area109">&nbsp;</div></b><input type="hidden"  id="stat109" name="stat109" value=""/><input type="hidden" id="xx109" name="xx109" value=""/><input type="hidden" id="yy109" name="yy109" value=""/></td>
								<td id="td_110" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(110,266,122);"><b><div id="area110">&nbsp;</div></b><input type="hidden"  id="stat110" name="stat110" value=""/><input type="hidden" id="xx110" name="xx110" value=""/><input type="hidden" id="yy110" name="yy110" value=""/></td>
								<td id="td_111" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(111,295,122);"><b><div id="area111">&nbsp;</div></b><input type="hidden"  id="stat111" name="stat111" value=""/><input type="hidden" id="xx111" name="xx111" value=""/><input type="hidden" id="yy111" name="yy111" value=""/></td>
								<td id="td_112" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(112,324,122);"><b><div id="area112">&nbsp;</div></b><input type="hidden"  id="stat112" name="stat112" value=""/><input type="hidden" id="xx112" name="xx112" value=""/><input type="hidden" id="yy112" name="yy112" value=""/></td>
								<td id="td_113" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(113,353,122);"><b><div id="area113">&nbsp;</div></b><input type="hidden"  id="stat113" name="stat113" value=""/><input type="hidden" id="xx113" name="xx113" value=""/><input type="hidden" id="yy113" name="yy113" value=""/></td>
								<td id="td_114" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(114,382,122);"><b><div id="area114">&nbsp;</div></b><input type="hidden"  id="stat114" name="stat114" value=""/><input type="hidden" id="xx114" name="xx114" value=""/><input type="hidden" id="yy114" name="yy114" value=""/></td>
								<td id="td_115" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(115,411,122);"><b><div id="area115">&nbsp;</div></b><input type="hidden"  id="stat115" name="stat115" value=""/><input type="hidden" id="xx115" name="xx115" value=""/><input type="hidden" id="yy115" name="yy115" value=""/></td>
								<td id="td_116" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(116,440,122);"><b><div id="area116">&nbsp;</div></b><input type="hidden"  id="stat116" name="stat116" value=""/><input type="hidden" id="xx116" name="xx116" value=""/><input type="hidden" id="yy116" name="yy116" value=""/></td>
								<td id="td_117" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(117,469,122);"><b><div id="area117">&nbsp;</div></b><input type="hidden"  id="stat117" name="stat117" value=""/><input type="hidden" id="xx117" name="xx117" value=""/><input type="hidden" id="yy117" name="yy117" value=""/></td>
								<td id="td_118" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(118,498,122);"><b><div id="area118">&nbsp;</div></b><input type="hidden"  id="stat118" name="stat118" value=""/><input type="hidden" id="xx118" name="xx118" value=""/><input type="hidden" id="yy118" name="yy118" value=""/></td>
								<td id="td_119" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(119,527,122);"><b><div id="area119">&nbsp;</div></b><input type="hidden"  id="stat119" name="stat119" value=""/><input type="hidden" id="xx119" name="xx119" value=""/><input type="hidden" id="yy119" name="yy119" value=""/></td>
								<td id="td_120" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(120,556,122);"><b><div id="area120">&nbsp;</div></b><input type="hidden"  id="stat120" name="stat120" value=""/><input type="hidden" id="xx120" name="xx120" value=""/><input type="hidden" id="yy120" name="yy120" value=""/></td>
							</tr>
							<tr>
								<td id="td_121" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(121,5,145);"><b><div id="area121">&nbsp;</div></b><input type="hidden"  id="stat121" name="stat121" value=""/><input type="hidden" id="xx121" name="xx121" value=""/><input type="hidden" id="yy121" name="yy121" value=""/></td>
								<td id="td_122" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(122,34,145);"><b><div id="area122">&nbsp;</div></b><input type="hidden"  id="stat122" name="stat122" value=""/><input type="hidden" id="xx122" name="xx122" value=""/><input type="hidden" id="yy122" name="yy122" value=""/></td>
								<td id="td_123" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(123,63,145);"><b><div id="area123">&nbsp;</div></b><input type="hidden"  id="stat123" name="stat123" value=""/><input type="hidden" id="xx123" name="xx123" value=""/><input type="hidden" id="yy123" name="yy123" value=""/></td>
								<td id="td_124" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(124,92,145);"><b><div id="area124">&nbsp;</div></b><input type="hidden"  id="stat124" name="stat124" value=""/><input type="hidden" id="xx124" name="xx124" value=""/><input type="hidden" id="yy124" name="yy124" value=""/></td>
								<td id="td_125" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(125,121,145);"><b><div id="area125">&nbsp;</div></b><input type="hidden"  id="stat125" name="stat125" value=""/><input type="hidden" id="xx125" name="xx125" value=""/><input type="hidden" id="yy125" name="yy125" value=""/></td>
								<td id="td_126" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(126,150,145);"><b><div id="area126">&nbsp;</div></b><input type="hidden"  id="stat126" name="stat126" value=""/><input type="hidden" id="xx126" name="xx126" value=""/><input type="hidden" id="yy126" name="yy126" value=""/></td>
								<td id="td_127" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(127,179,145);"><b><div id="area127">&nbsp;</div></b><input type="hidden"  id="stat127" name="stat127" value=""/><input type="hidden" id="xx127" name="xx127" value=""/><input type="hidden" id="yy127" name="yy127" value=""/></td>
								<td id="td_128" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(128,208,145);"><b><div id="area128">&nbsp;</div></b><input type="hidden"  id="stat128" name="stat128" value=""/><input type="hidden" id="xx128" name="xx128" value=""/><input type="hidden" id="yy128" name="yy128" value=""/></td>
								<td id="td_129" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(129,237,145);"><b><div id="area129">&nbsp;</div></b><input type="hidden"  id="stat129" name="stat129" value=""/><input type="hidden" id="xx129" name="xx129" value=""/><input type="hidden" id="yy129" name="yy129" value=""/></td>
								<td id="td_130" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(130,266,145);"><b><div id="area130">&nbsp;</div></b><input type="hidden"  id="stat130" name="stat130" value=""/><input type="hidden" id="xx130" name="xx130" value=""/><input type="hidden" id="yy130" name="yy130" value=""/></td>
								<td id="td_131" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(131,295,145);"><b><div id="area131">&nbsp;</div></b><input type="hidden"  id="stat131" name="stat131" value=""/><input type="hidden" id="xx131" name="xx131" value=""/><input type="hidden" id="yy131" name="yy131" value=""/></td>
								<td id="td_132" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(132,324,145);"><b><div id="area132">&nbsp;</div></b><input type="hidden"  id="stat132" name="stat132" value=""/><input type="hidden" id="xx132" name="xx132" value=""/><input type="hidden" id="yy132" name="yy132" value=""/></td>
								<td id="td_133" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(133,353,145);"><b><div id="area133">&nbsp;</div></b><input type="hidden"  id="stat133" name="stat133" value=""/><input type="hidden" id="xx133" name="xx133" value=""/><input type="hidden" id="yy133" name="yy133" value=""/></td>
								<td id="td_134" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(134,382,145);"><b><div id="area134">&nbsp;</div></b><input type="hidden"  id="stat134" name="stat134" value=""/><input type="hidden" id="xx134" name="xx134" value=""/><input type="hidden" id="yy134" name="yy134" value=""/></td>
								<td id="td_135" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(135,411,145);"><b><div id="area135">&nbsp;</div></b><input type="hidden"  id="stat135" name="stat135" value=""/><input type="hidden" id="xx135" name="xx135" value=""/><input type="hidden" id="yy135" name="yy135" value=""/></td>
								<td id="td_136" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(136,440,145);"><b><div id="area136">&nbsp;</div></b><input type="hidden"  id="stat136" name="stat136" value=""/><input type="hidden" id="xx136" name="xx136" value=""/><input type="hidden" id="yy136" name="yy136" value=""/></td>
								<td id="td_137" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(137,469,145);"><b><div id="area137">&nbsp;</div></b><input type="hidden"  id="stat137" name="stat137" value=""/><input type="hidden" id="xx137" name="xx137" value=""/><input type="hidden" id="yy137" name="yy137" value=""/></td>
								<td id="td_138" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(138,498,145);"><b><div id="area138">&nbsp;</div></b><input type="hidden"  id="stat138" name="stat138" value=""/><input type="hidden" id="xx138" name="xx138" value=""/><input type="hidden" id="yy138" name="yy138" value=""/></td>
								<td id="td_139" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(139,527,145);"><b><div id="area139">&nbsp;</div></b><input type="hidden"  id="stat139" name="stat139" value=""/><input type="hidden" id="xx139" name="xx139" value=""/><input type="hidden" id="yy139" name="yy139" value=""/></td>
								<td id="td_140" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(140,556,145);"><b><div id="area140">&nbsp;</div></b><input type="hidden"  id="stat140" name="stat140" value=""/><input type="hidden" id="xx140" name="xx140" value=""/><input type="hidden" id="yy140" name="yy140" value=""/></td>
							</tr>
							<tr>
								<td id="td_141" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(141,5,168);"><b><div id="area141">&nbsp;</div></b><input type="hidden"  id="stat141" name="stat141" value=""/><input type="hidden" id="xx141" name="xx141" value=""/><input type="hidden" id="yy141" name="yy141" value=""/></td>
								<td id="td_142" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(142,34,168);"><b><div id="area142">&nbsp;</div></b><input type="hidden"  id="stat142" name="stat142" value=""/><input type="hidden" id="xx142" name="xx142" value=""/><input type="hidden" id="yy142" name="yy142" value=""/></td>
								<td id="td_143" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(143,63,168);"><b><div id="area143">&nbsp;</div></b><input type="hidden"  id="stat143" name="stat143" value=""/><input type="hidden" id="xx143" name="xx143" value=""/><input type="hidden" id="yy143" name="yy143" value=""/></td>
								<td id="td_144" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(144,92,168);"><b><div id="area144">&nbsp;</div></b><input type="hidden"  id="stat144" name="stat144" value=""/><input type="hidden" id="xx144" name="xx144" value=""/><input type="hidden" id="yy144" name="yy144" value=""/></td>
								<td id="td_145" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(145,121,168);"><b><div id="area145">&nbsp;</div></b><input type="hidden"  id="stat145" name="stat145" value=""/><input type="hidden" id="xx145" name="xx145" value=""/><input type="hidden" id="yy145" name="yy145" value=""/></td>
								<td id="td_146" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(146,150,168);"><b><div id="area146">&nbsp;</div></b><input type="hidden"  id="stat146" name="stat146" value=""/><input type="hidden" id="xx146" name="xx146" value=""/><input type="hidden" id="yy146" name="yy146" value=""/></td>
								<td id="td_147" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(147,179,168);"><b><div id="area147">&nbsp;</div></b><input type="hidden"  id="stat147" name="stat147" value=""/><input type="hidden" id="xx147" name="xx147" value=""/><input type="hidden" id="yy147" name="yy147" value=""/></td>
								<td id="td_148" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(148,208,168);"><b><div id="area148">&nbsp;</div></b><input type="hidden"  id="stat148" name="stat148" value=""/><input type="hidden" id="xx148" name="xx148" value=""/><input type="hidden" id="yy148" name="yy148" value=""/></td>
								<td id="td_149" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(149,237,168);"><b><div id="area149">&nbsp;</div></b><input type="hidden"  id="stat149" name="stat149" value=""/><input type="hidden" id="xx149" name="xx149" value=""/><input type="hidden" id="yy149" name="yy149" value=""/></td>
								<td id="td_150" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(150,266,168);"><b><div id="area150">&nbsp;</div></b><input type="hidden"  id="stat150" name="stat150" value=""/><input type="hidden" id="xx150" name="xx150" value=""/><input type="hidden" id="yy150" name="yy150" value=""/></td>
								<td id="td_151" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(151,295,168);"><b><div id="area151">&nbsp;</div></b><input type="hidden"  id="stat151" name="stat151" value=""/><input type="hidden" id="xx151" name="xx151" value=""/><input type="hidden" id="yy151" name="yy151" value=""/></td>
								<td id="td_152" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(152,324,168);"><b><div id="area152">&nbsp;</div></b><input type="hidden"  id="stat152" name="stat152" value=""/><input type="hidden" id="xx152" name="xx152" value=""/><input type="hidden" id="yy152" name="yy152" value=""/></td>
								<td id="td_153" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(153,353,168);"><b><div id="area153">&nbsp;</div></b><input type="hidden"  id="stat153" name="stat153" value=""/><input type="hidden" id="xx153" name="xx153" value=""/><input type="hidden" id="yy153" name="yy153" value=""/></td>
								<td id="td_154" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(154,382,168);"><b><div id="area154">&nbsp;</div></b><input type="hidden"  id="stat154" name="stat154" value=""/><input type="hidden" id="xx154" name="xx154" value=""/><input type="hidden" id="yy154" name="yy154" value=""/></td>
								<td id="td_155" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(155,411,168);"><b><div id="area155">&nbsp;</div></b><input type="hidden"  id="stat155" name="stat155" value=""/><input type="hidden" id="xx155" name="xx155" value=""/><input type="hidden" id="yy155" name="yy155" value=""/></td>
								<td id="td_156" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(156,440,168);"><b><div id="area156">&nbsp;</div></b><input type="hidden"  id="stat156" name="stat156" value=""/><input type="hidden" id="xx156" name="xx156" value=""/><input type="hidden" id="yy156" name="yy156" value=""/></td>
								<td id="td_157" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(157,469,168);"><b><div id="area157">&nbsp;</div></b><input type="hidden"  id="stat157" name="stat157" value=""/><input type="hidden" id="xx157" name="xx157" value=""/><input type="hidden" id="yy157" name="yy157" value=""/></td>
								<td id="td_158" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(158,498,168);"><b><div id="area158">&nbsp;</div></b><input type="hidden"  id="stat158" name="stat158" value=""/><input type="hidden" id="xx158" name="xx158" value=""/><input type="hidden" id="yy158" name="yy158" value=""/></td>
								<td id="td_159" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(159,527,168);"><b><div id="area159">&nbsp;</div></b><input type="hidden"  id="stat159" name="stat159" value=""/><input type="hidden" id="xx159" name="xx159" value=""/><input type="hidden" id="yy159" name="yy159" value=""/></td>
								<td id="td_160" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(160,556,168);"><b><div id="area160">&nbsp;</div></b><input type="hidden"  id="stat160" name="stat160" value=""/><input type="hidden" id="xx160" name="xx160" value=""/><input type="hidden" id="yy160" name="yy160" value=""/></td>
							</tr>
							<tr>
								<td id="td_161" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(161,5,191);"><b><div id="area161">&nbsp;</div></b><input type="hidden"  id="stat161" name="stat161" value=""/><input type="hidden" id="xx161" name="xx161" value=""/><input type="hidden" id="yy161" name="yy161" value=""/></td>
								<td id="td_162" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(162,34,191);"><b><div id="area162">&nbsp;</div></b><input type="hidden"  id="stat162" name="stat162" value=""/><input type="hidden" id="xx162" name="xx162" value=""/><input type="hidden" id="yy162" name="yy162" value=""/></td>
								<td id="td_163" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(163,63,191);"><b><div id="area163">&nbsp;</div></b><input type="hidden"  id="stat163" name="stat163" value=""/><input type="hidden" id="xx163" name="xx163" value=""/><input type="hidden" id="yy163" name="yy163" value=""/></td>
								<td id="td_164" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(164,92,191);"><b><div id="area164">&nbsp;</div></b><input type="hidden"  id="stat164" name="stat164" value=""/><input type="hidden" id="xx164" name="xx164" value=""/><input type="hidden" id="yy164" name="yy164" value=""/></td>
								<td id="td_165" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(165,121,191);"><b><div id="area165">&nbsp;</div></b><input type="hidden"  id="stat165" name="stat165" value=""/><input type="hidden" id="xx165" name="xx165" value=""/><input type="hidden" id="yy165" name="yy165" value=""/></td>
								<td id="td_166" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(166,150,191);"><b><div id="area166">&nbsp;</div></b><input type="hidden"  id="stat166" name="stat166" value=""/><input type="hidden" id="xx166" name="xx166" value=""/><input type="hidden" id="yy166" name="yy166" value=""/></td>
								<td id="td_167" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(167,179,191);"><b><div id="area167">&nbsp;</div></b><input type="hidden"  id="stat167" name="stat167" value=""/><input type="hidden" id="xx167" name="xx167" value=""/><input type="hidden" id="yy167" name="yy167" value=""/></td>
								<td id="td_168" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(168,208,191);"><b><div id="area168">&nbsp;</div></b><input type="hidden"  id="stat168" name="stat168" value=""/><input type="hidden" id="xx168" name="xx168" value=""/><input type="hidden" id="yy168" name="yy168" value=""/></td>
								<td id="td_169" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(169,237,191);"><b><div id="area169">&nbsp;</div></b><input type="hidden"  id="stat169" name="stat169" value=""/><input type="hidden" id="xx169" name="xx169" value=""/><input type="hidden" id="yy169" name="yy169" value=""/></td>
								<td id="td_170" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(170,266,191);"><b><div id="area170">&nbsp;</div></b><input type="hidden"  id="stat170" name="stat170" value=""/><input type="hidden" id="xx170" name="xx170" value=""/><input type="hidden" id="yy170" name="yy170" value=""/></td>
								<td id="td_171" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(171,295,191);"><b><div id="area171">&nbsp;</div></b><input type="hidden"  id="stat171" name="stat171" value=""/><input type="hidden" id="xx171" name="xx171" value=""/><input type="hidden" id="yy171" name="yy171" value=""/></td>
								<td id="td_172" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(172,324,191);"><b><div id="area172">&nbsp;</div></b><input type="hidden"  id="stat172" name="stat172" value=""/><input type="hidden" id="xx172" name="xx172" value=""/><input type="hidden" id="yy172" name="yy172" value=""/></td>
								<td id="td_173" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(173,353,191);"><b><div id="area173">&nbsp;</div></b><input type="hidden"  id="stat173" name="stat173" value=""/><input type="hidden" id="xx173" name="xx173" value=""/><input type="hidden" id="yy173" name="yy173" value=""/></td>
								<td id="td_174" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(174,382,191);"><b><div id="area174">&nbsp;</div></b><input type="hidden"  id="stat174" name="stat174" value=""/><input type="hidden" id="xx174" name="xx174" value=""/><input type="hidden" id="yy174" name="yy174" value=""/></td>
								<td id="td_175" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(175,402,191);"><b><div id="area175">&nbsp;</div></b><input type="hidden"  id="stat175" name="stat175" value=""/><input type="hidden" id="xx175" name="xx175" value=""/><input type="hidden" id="yy175" name="yy175" value=""/></td>
								<td id="td_176" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(176,452,191);"><b><div id="area176">&nbsp;</div></b><input type="hidden"  id="stat176" name="stat176" value=""/><input type="hidden" id="xx176" name="xx176" value=""/><input type="hidden" id="yy176" name="yy176" value=""/></td>
								<td id="td_177" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(177,469,191);"><b><div id="area177">&nbsp;</div></b><input type="hidden"  id="stat177" name="stat177" value=""/><input type="hidden" id="xx177" name="xx177" value=""/><input type="hidden" id="yy177" name="yy177" value=""/></td>
								<td id="td_178" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(178,498,191);"><b><div id="area178">&nbsp;</div></b><input type="hidden"  id="stat178" name="stat178" value=""/><input type="hidden" id="xx178" name="xx178" value=""/><input type="hidden" id="yy178" name="yy178" value=""/></td>
								<td id="td_179" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(179,527,191);"><b><div id="area179">&nbsp;</div></b><input type="hidden"  id="stat179" name="stat179" value=""/><input type="hidden" id="xx179" name="xx179" value=""/><input type="hidden" id="yy179" name="yy179" value=""/></td>
								<td id="td_180" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(180,556,191);"><b><div id="area180">&nbsp;</div></b><input type="hidden"  id="stat180" name="stat180" value=""/><input type="hidden" id="xx180" name="xx180" value=""/><input type="hidden" id="yy180" name="yy180" value=""/></td>
							</tr>
							<tr>
								<td id="td_181" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(181,5,214);"><b><div id="area181">&nbsp;</div></b><input type="hidden"  id="stat181" name="stat181" value=""/><input type="hidden" id="xx181" name="xx181" value=""/><input type="hidden" id="yy181" name="yy181" value=""/></td>
								<td id="td_182" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(182,34,214);"><b><div id="area182">&nbsp;</div></b><input type="hidden"  id="stat182" name="stat182" value=""/><input type="hidden" id="xx182" name="xx182" value=""/><input type="hidden" id="yy182" name="yy182" value=""/></td>
								<td id="td_183" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(183,63,214);"><b><div id="area183">&nbsp;</div></b><input type="hidden"  id="stat183" name="stat183" value=""/><input type="hidden" id="xx183" name="xx183" value=""/><input type="hidden" id="yy183" name="yy183" value=""/></td>
								<td id="td_184" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(184,92,214);"><b><div id="area184">&nbsp;</div></b><input type="hidden"  id="stat184" name="stat184" value=""/><input type="hidden" id="xx184" name="xx184" value=""/><input type="hidden" id="yy184" name="yy184" value=""/></td>
								<td id="td_185" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(185,121,214);"><b><div id="area185">&nbsp;</div></b><input type="hidden"  id="stat185" name="stat185" value=""/><input type="hidden" id="xx185" name="xx185" value=""/><input type="hidden" id="yy185" name="yy185" value=""/></td>
								<td id="td_186" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(186,150,214);"><b><div id="area186">&nbsp;</div></b><input type="hidden"  id="stat186" name="stat186" value=""/><input type="hidden" id="xx186" name="xx186" value=""/><input type="hidden" id="yy186" name="yy186" value=""/></td>
								<td id="td_187" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(187,179,214);"><b><div id="area187">&nbsp;</div></b><input type="hidden"  id="stat187" name="stat187" value=""/><input type="hidden" id="xx187" name="xx187" value=""/><input type="hidden" id="yy187" name="yy187" value=""/></td>
								<td id="td_188" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(188,208,214);"><b><div id="area188">&nbsp;</div></b><input type="hidden"  id="stat188" name="stat188" value=""/><input type="hidden" id="xx188" name="xx188" value=""/><input type="hidden" id="yy188" name="yy188" value=""/></td>
								<td id="td_189" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(189,237,214);"><b><div id="area189">&nbsp;</div></b><input type="hidden"  id="stat189" name="stat189" value=""/><input type="hidden" id="xx189" name="xx189" value=""/><input type="hidden" id="yy189" name="yy189" value=""/></td>
								<td id="td_190" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(190,266,214);"><b><div id="area190">&nbsp;</div></b><input type="hidden"  id="stat190" name="stat190" value=""/><input type="hidden" id="xx190" name="xx190" value=""/><input type="hidden" id="yy190" name="yy190" value=""/></td>
								<td id="td_191" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(191,295,214);"><b><div id="area191">&nbsp;</div></b><input type="hidden"  id="stat191" name="stat191" value=""/><input type="hidden" id="xx191" name="xx191" value=""/><input type="hidden" id="yy191" name="yy191" value=""/></td>
								<td id="td_192" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(192,324,214);"><b><div id="area192">&nbsp;</div></b><input type="hidden"  id="stat192" name="stat192" value=""/><input type="hidden" id="xx192" name="xx192" value=""/><input type="hidden" id="yy192" name="yy192" value=""/></td>
								<td id="td_193" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(193,353,214);"><b><div id="area193">&nbsp;</div></b><input type="hidden"  id="stat193" name="stat193" value=""/><input type="hidden" id="xx193" name="xx193" value=""/><input type="hidden" id="yy193" name="yy193" value=""/></td>
								<td id="td_194" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(194,382,214);"><b><div id="area194">&nbsp;</div></b><input type="hidden"  id="stat194" name="stat194" value=""/><input type="hidden" id="xx194" name="xx194" value=""/><input type="hidden" id="yy194" name="yy194" value=""/></td>
								<td id="td_195" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(195,411,214);"><b><div id="area195">&nbsp;</div></b><input type="hidden"  id="stat195" name="stat195" value=""/><input type="hidden" id="xx195" name="xx195" value=""/><input type="hidden" id="yy195" name="yy195" value=""/></td>
								<td id="td_196" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(196,440,214);"><b><div id="area196">&nbsp;</div></b><input type="hidden"  id="stat196" name="stat196" value=""/><input type="hidden" id="xx196" name="xx196" value=""/><input type="hidden" id="yy196" name="yy196" value=""/></td>
								<td id="td_197" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(197,469,214);"><b><div id="area197">&nbsp;</div></b><input type="hidden"  id="stat197" name="stat197" value=""/><input type="hidden" id="xx197" name="xx197" value=""/><input type="hidden" id="yy197" name="yy197" value=""/></td>
								<td id="td_198" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(198,498,214);"><b><div id="area198">&nbsp;</div></b><input type="hidden"  id="stat198" name="stat198" value=""/><input type="hidden" id="xx198" name="xx198" value=""/><input type="hidden" id="yy198" name="yy198" value=""/></td>
								<td id="td_199" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(199,527,214);"><b><div id="area199">&nbsp;</div></b><input type="hidden"  id="stat199" name="stat199" value=""/><input type="hidden" id="xx199" name="xx199" value=""/><input type="hidden" id="yy199" name="yy199" value=""/></td>
								<td id="td_200" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(200,556,214);"><b><div id="area200">&nbsp;</div></b><input type="hidden"  id="stat200" name="stat200" value=""/><input type="hidden" id="xx200" name="xx200" value=""/><input type="hidden" id="yy200" name="yy200" value=""/></td>
							</tr>
						</table>
					</div>
				</div>
			</div><!-- //tab_content04 -->

			
			<div id="uscasttus_tab_2" style="display:none;">
				<div class="New_agbox">
	                <h2 class="tit"><span></span>외판부위 및 주요골격</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	                <table>
	                    <colgroup>
	                        <col style="width: 20%;">
	                        <col style="width: 20%;">
	                        <col style="width: 15%;">
	                        <col style="width: 20%;">
	                        <col style="width: 25%;">
	                    </colgroup>
	                    <tr>
							<th colspan="2">항목/해당부품</th>
							<th>상태</th>
							<th class="amount">가격조사 산정액</th>
							<th class="amount">특기사항</th>
						</tr>
						<tr>
							<th rowspan="8">외판부위</th>
							<th scope="row">후드</th>
							<td>
								<div id="s037" name="s037">해당없음</div>
							</td>
							<td rowspan="19" class="amount">
								<div id="p078" name="p078"></div>
							</td>
							<td rowspan="19" class="amount">
								<div id="m075" name="m075"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">프론드휀더</th>
							<td>
								<div id="s038" name="s038">해당없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">도어</th>
							<td>
								<div id="s039" name="s039">해당없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">트렁크리드</th>
							<td >
								<div id="s040" name="s040">해당없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">라디에이터서포트(볼트체결부품)</th>
							<td >
								<div id="s041" name="s041">해당없음</div>
							</td>                                  
						</tr>
						<tr>
							<th scope="row">쿼터패널(리어휀다)</th>
							<td>
								<div id="s043" name="s043">해당없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">루프패널</th>
							<td>
								<div id="s042" name="s042">해당없음</div>                                            
							</td>
						</tr>
						<tr>
							<th scope="row">사이드실패널</th>
							<td>
								<div id="s044" name="s044">해당없음</div>
							</td>
						</tr>
						<tr>
							<th rowspan="11">주요골격</th>
							<th scope="row">프론트패널</th>
							<td>
								<div id="s045" name="s045">해당없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">크로스멤버</th>
							<td>
								<div id="s046" name="s046">해당없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">인사이드패널</th>
							<td>
								<div id="s047" name="s047">해당없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">트렁크플로어</th>
							<td>
								<div id="s054" name="s054">해당없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">리어패널</th>
							<td>
								<div id="s053" name="s053">해당없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">사이드멤버</th>
							<td>
								<div id="s048" name="s048">해당없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">휠하우스</th>
							<td>
								<div id="s049" name="s049">해당없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">필러패널</th>
							<td>
								<div id="s052" name="s052">해당없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">패키지프레이</th>
							<td>
								<div id="s056" name="s056">해당없음</div>
							</td>                                  
						</tr>
						<tr>
							<th scope="row">대쉬패널</th>
							<td>
								<div id="s050" name="s050">해당없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">플로어패널</th>
							<td>
								<div id="s051" name="s051">해당없음</div>
							</td>
						</tr>
	                </table>
	            </div>
	        </div>    
	        
			<div id="uscasttus_tab_3" style="display:none;">
				<div class="New_agbox">
	                <h2 class="tit"><span></span>원동기 점검결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	                    <colgroup>
	                        <col style="width: 40%;">
	                        <col style="width: 15%;">
	                        <col style="width: 20%;">
	                        <col style="width: 25%;">
	                    </colgroup>
	                    <tr>
							<th>항목/해당부품</th>
							<th>상태</th>
							<th class="amount">가격조사 산정액</th>
							<th class="amount">특기사항</th>
						</tr>
						<tr>
							<th scope="row">작동상태(공회전)</th>
							<td style="padding:5px">
								<div id="s001" name="s001">양호</div>
							</td>
							<td rowspan='10' class="amount">
								<div id="p001" name="p001"></div>
							</td>
							<td class="amount">
								<div id="m001" name="m001"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">오일누유 - 실린더 커버(로커암 커버)</th>
							<td style="padding:5px">
								<div id="s057" name="s057">없음</div>
							</td>
							<td class="amount">
								<div id="m057" name="m057"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">오일누유 - 실린더 헤드/가스켓</th>
							<td style="padding:5px">
								<div id="s003">없음</div>
							</td>
							<td class="amount">
								<div id="m003" name="m003"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">오일누유 - 실린더 블록/오일팬</th>
							<td style="padding:5px">
								<div id="s058" name="s058">없음</div>
							</td>
							<td class="amount">
								<div id="m058" name="m058"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">오일유량</th>
							<td style="padding:5px">
								<div id="s005" name="s005">적정</div>
							</td>  
							<td class="amount">
								<div id="m005" name="m005"></div>
							</td>
						</tr>                                
						<tr>
							<th scope="row">냉각수누수 - 실린더 헤드/개스킷</th>
							<td style="padding:5px">
								<div id="s007" name="s007">없음</div>
							</td>
							<td class="amount">
								<div id="m007" name="m007"></div>
							</td>
						</tr>                 
						<tr>
							<th scope="row">냉각수누수 - 워터펌프</th>
							<td style="padding:5px">
								<div id="s008" name="s008">없음</div>
							</td>
							<td class="amount">
								<div id="m008" name="m008"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">냉각수누수 - 라디에이터</th>
							<td style="padding:5px">
								<div id="s009" name="s009">없음</div>
							</td>
							<td class="amount">
								<div id="m009" name="m009"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">냉각수 누수 - 냉각수 수량</th>
							<td style="padding:5px">
								<div id="s010" name="s010">적정</div>
							</td>
							<td class="amount">
								<div id="m010" name="m010"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">커먼레일</th>
							<td style="padding:5px">
								<div id="s011" name="s011"></div>
							</td>
							<td class="amount">
								<div id="m011" name="m011"></div>
							</td>
						</tr>
	                </table>    
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>동력전달장치 점검결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	                    <colgroup>
							<col width="40%"/>
							<col width="15%"/>
							<col width="20%"/>
							<col width="25%"/>
						</colgroup>
						<tr>
							<th>항목/해당부품</th>
							<th>상태</th>
							<th class="amount">가격조사 산정액</th>
							<th class="amount">특기사항</th>
						</tr>
						<tr>
							<th scope="row">자동변속기(A/T) - 오일누유</th>
							<td style="padding:5px">
								<div id="s012" name="s012">없음</div>
							</td>
							<td rowspan='7' class="amount">
								<div id="p012" name="p012"></div>
							</td>
							<td class="amount">
								<div id="m012" name="m012"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">자동변속기(A/T) - 오일유량및상태</th>
							<td style="padding:5px">
								<div id="s013" name="s013">적정</div>
							</td>
							<td class="amount">
								<div id="m013" name="m013"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">자동변속기(A/T) - 작동상태(공회전)</th>
							<td style="padding:5px">
								<div id="s016" name="s016">양호</div>
							</td>
							<td class="amount">
								<div id="m016" name="m016"></div>
							</td>
						</tr>                            
						
						<tr>
							<th scope="row">수동변속기(M/T) - 오일누유</th>
							<td style="padding:5px">
								<div id="s017" name="s017">없음</div>
							</td>
							<td class="amount">
								<div id="m017" name="m017"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">수동변속기(M/T) - 기어변속장치</th>
							<td style="padding:5px">
								<div id="s018" name="s018">양호</div>
							</td>
							<td class="amount">
								<div id="m018" name="m018"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">수동변속기(M/T) - 오일유량및상태</th>
							<td style="padding:5px">
								<div id="s019" name="s019">적정</div>
							</td>
							<td class="amount">
								<div id="m019" name="m019"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">수동변속기(M/T) - 작동상태(공회전)</th>
							<td style="padding:5px">
								<div id="s020" name="s020">양호</div>
							</td>
							<td class="amount">
								<div id="m020" name="m020"></div>
							</td>
						</tr>
						<!--  동력전달  -->
						<tr>
							<th scope="row">동력전달 - 클러치 어셈블러</th>
							<td style="padding:5px">
								<div id="s021" name="s021">양호</div>
							</td>
							<td rowspan='4' class="amount">
								<div id="p021" name="p021"></div>
							</td>
							<td class="amount">
								<div id="m021" name="m021"></div>
							</td>
						</tr>
						<tr>	
							<th scope="row">동력전달 - 등속죠인트</th>
							<td style="padding:5px">
								<div id="s022" name="s022"></div>
							</td>
							<td class="amount">
								<div id="m022" name="m022"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">동력전달 - 추진축 및 베어링</th>
							<td style="padding:5px">
								<div id="s023" name="s023"></div>
							</td>
							<td class="amount">
								<div id="m023" name="m023"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">동력전달 - 디퍼렌셜 기어</th>
							<td style="padding:5px">
								<div id="s060" name="s060"></div>
							</td>
							<td class="amount">
								<div id="m037" name="m037"></div>
							</td>
						</tr>
	                </table> 
	            </div>
	        </div>   
	        
	        <div id="uscasttus_tab_4" style="display:none;">
				<div class="New_agbox">
	                <h2 class="tit"><span></span>조향장치 점걸결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="40%"/>
						<col width="15%"/>
						<col width="20%"/>
						<col width="25%"/>
					</colgroup>
					<tr>
						<th>항목/해당부품</th>
						<th>상태</th>
						<th class="amount">가격조사 산정액</th>
						<th class="amount">특기사항</th>
					</tr>
					<tr>
						<th scope="row">동력조향 작동 오일 누유</th>
						<td style="padding:5px">
							<div id="s024" name="s024">없음</div>
						</td>
						<td rowspan='6' class="amount">
							<div id="p024" name="p024"></div>
						</td>
						<td class="amount">
							<div id="m024" name="m024"></div>
						</td>
					</tr>
					<tr>
						<th scope="row">작동상태 - 스티어링 기어(MDPS포함)</th>
						<td style="padding:5px">
							<div id="s025" name="s025">양호</div>
						</td>
						<td class="amount">
							<div id="m025" name="m025"></div>
						</td>
					</tr>
					<tr>
						<th scope="row">작동상태 - 스티어링 펌프</th>
						<td style="padding:5px">
							<div id="s026" name="s026">양호</div>
						</td>
						<td class="amount">
							<div id="m026" name="m026"></div>
						</td>
					</tr>
					<tr>
						<th scope="row">작동상태 - 스티어링조인트</th>
						<td style="padding:5px">
							<div id="s061" name="s061">양호</div>
						</td>
						<td class="amount">
							<div id="m038" name="m038"></div>
						</td>
					</tr>
					<tr>
						<th scope="row">작동상태 - 파워고압호스</th>
						<td style="padding:5px">
							<div id="s062" name="s062">양호</div>
						</td>
						<td class="amount">
							<div id="m039" name="m039"></div>
						</td>
					</tr>
					<tr>
						<th scope="row">타이로드앤드 및 볼 죠인트</th>
						<td style="padding:5px">
							<div id="s027" name="s027">양호</div>
						</td>
						<td class="amount">
							<div id="m027" name="m027"></div>
						</td>
					</tr>
					</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>제동장치 점검결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="40%"/>
						<col width="15%"/>
						<col width="20%"/>
						<col width="25%"/>
					</colgroup>
					<tr>
						<th>항목/해당부품</th>
						<th>상태</th>
						<th class="amount">가격조사 산정액</th>
						<th class="amount">특기사항</th>
					</tr>
					<tr>
						<th scope="row">브레이크 마스터 실린더오일 누유</th>
						<td style="padding:5px">
							<div id="s059" name="s059">없음</div>
						</td>
						<td rowspan='3' class="amount">
							<div id="p059" name="p059"></div>
						</td>
						<td class="amount">
							<div id="m059" name="m059"></div>
						</td>
					</tr>
					<tr>
						<th scope="row">브레이크 오일 누유</th>
						<td style="padding:5px">
							<div id="s029" name="s029">없음</div>
						</td>
						<td class="amount">
							<div id="m029" name="m029"></div>
						</td>
					</tr>
					<tr>
						<th scope="row">배력장치 상태</th>
						<td style="padding:5px">
							<div id="s030" name="s030">양호</div>
						</td>
						<td class="amount">
							<div id="m030" name="m030"></div>
						</td>
					</tr>
					</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>전기장치 점검결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
                        <col width="40%"/>
                        <col width="15%"/>
                        <col width="20%"/>
                        <col width="25%"/>
                    </colgroup>
                    <tr>
                        <th>항목/해당부품</th>
                        <th>상태</th>
                        <th class="amount">가격조사 산정액</th>
                        <th class="amount">특기사항</th>
                    </tr>
                    <tr>
                        <th scope="row">발전기 출력</th>
                        <td style="padding:5px">
                            <div id="s031" name="s031">양호</div>
                        </td>
                        <td rowspan='6' class="amount">
                            <div id="p031" name="p031"></div>
                        </td>
                        <td class="amount">
                            <div id="m031" name="m031"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">시동 모터</th>
                        <td style="padding:5px">
                            <div id="s055" name="s055">양호</div>
                        </td>
                        <td class="amount">
                            <div id="m055" name="m055"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">와이퍼 모터 기능</th>
                        <td style="padding:5px">
                            <div id="s032" name="s032">양호</div>
                        </td>
                        <td class="amount">
                            <div id="m032" name="m032"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">실내송풍 모터</th>
                        <td style="padding:5px">
                            <div id="s033" name="s033">양호</div>
                        </td>
                        <td class="amount">
                            <div id="m033" name="m033"></div>
                        </td>
                    </tr>
                    <tr>                         
                        <th scope="row">라디에이터 팬 모터</th>
                        <td style="padding:5px" >
                            <div id="s034" name="s034">양호</div>
                        </td>
                        <td class="amount">
                            <div id="m034" name="m034"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">원도우모터작동</th>
                        <td style="padding:5px">
                            <div id="s036" name="s036">양호</div>
                        </td>
                        <td class="amount">
                            <div id="m036" name="m036"></div>
                        </td>
                    </tr>
                    </table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>고전원 전기장치 점검결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
                        <col width="40%"/>
                        <col width="15%"/>
                        <col width="20%"/>
                        <col width="25%"/>
                    </colgroup>
                    <tr>
						<th>항목/해당부품</th>
						<th>상태</th>
						<th class="amount">가격조사 산정액</th>
						<th class="amount">특기사항</th>
					</tr>
					<tr>
						<th scope="row">충전구 절연 상태</th>
						<td style="padding:5px">
							<div id="s063" name="s063">양호</div>
						</td>
						<td rowspan='3' class="amount">
							<div id="p077" name="p077"></div>
						</td>
						<td class="amount">
							<div id="m040" name="m040"></div>
						</td>
					</tr>
					<tr>
						<th scope="row">구동축전지 격리 상태</th>
						<td style="padding:5px">
							<div id="s064" name="s064">양호</div>
						</td>
						<td class="amount">
							<div id="m041" name="m041"></div>
						</td>
					</tr>
					<tr>
						<th scope="row">고전원전기배선 상태<br/>(접속단자, 피복, 보호기구)</th>
						<td style="padding:5px">
							<div id="s065" name="s065">양호</div>
						</td>
						<td class="amount">
							<div id="m042" name="m042"></div>
						</td>
					</tr>
                    
                    </table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>연료장치 점검결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
                        <col width="40%"/>
                        <col width="15%"/>
                        <col width="20%"/>
                        <col width="25%"/>
                    </colgroup>
                    <tr>
                        <th>항목/해당부품</th>
                        <th>상태</th>
                        <th class="amount">가격조사 산정액</th>
                    <th class="amount">특기사항</th>
                    </tr>
                    <tr>
                        <th scope="row">연료누출(LP가스포함)</th>
                        <td style="padding:5px">
                            <div id="s035" name="s035">없음</div>
                        </td>
                        <td class="amount">
                            <div id="p035" name="p035"></div>
                        </td>
                        <td class="amount">
                            <div id="m035" name="m035"></div>
                        </td>
                    </tr>                    
                    </table>
	            </div>
	        </div> 
	        
	        <div id="uscasttus_tab_5" style="display:none;">
				<div class="New_agbox">
	                <h2 class="tit"><span></span>고지정보</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="19%" />
						<col width="31%" />
						<col width="19%" />
						<col width="31%" />
					</colgroup>
					<tbody>
					<tr>
						<th scope="row">접수자(명칭)</th>
						<td><em id="usca_register_nm_txt" name="usca_register_nm_txt"></em></td>
						<th scope="row">접수일</th>
						<td><em id="usca_r_rcept_de_txt" name="usca_r_rcept_de_txt"></em></td>
					</tr>
					<tr>
						<th scope="row">고지업체명</th>
						<td><em id="usca_ntic_entrps_nm" name="usca_ntic_entrps_nm"></em></td>
						<th scope="row">고지자명</th>
						<td><em id="usca_ntic_person_nm_txt" name="usca_ntic_person_nm_txt"></em></td>
					</tr>
	            	</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>점검정보</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="19%" />
						<col width="31%" />
						<col width="19%" />
						<col width="31%" />
					</colgroup>
					<tbody>
					<tr>
						<th scope="row">등록번호</th>
					  	<td>
					  		<em id="usca_chck_imprmn_entrps_id"></em>
					  	</td>
						<th scope="row">등록업체명</th>
						<td class="last">
							<em id="usca_chck_entrps_nm"></em>
						</td>
					</tr>
					<tr>
						<th scope="row">점검일</th>
						<td>
							<em id="usca_chck_de"></em>
						</td>
						<th scope="row">점검자명</th>
						<td class="last">
							<em id="usca_insctr_nm"></em>
						</td>
					</tr>
	            	</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>매수정보</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="19%" />
						<col width="31%" />
						<col width="19%" />
						<col width="31%" />
					</colgroup>
					<tbody>
					<tr>
						<th scope="row">매수일</th>
						<td>
							<em id="usca_buyer_de"></em>
						</td>
						<th scope="row">매수인명</th>
						<td>
							<em id="usca_buyer_nm"></em>
						</td>
					</tr>
	            	</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>특기사항 및 점검자의 의견</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<tr>
                        <td class="last">
                            <em id="usca_etc_matter"></em>
                        </td>
                    </tr>
	            	</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>자동차 기타정보</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="14%" />
                        <col width="14%" />
                        <col width="20%" />
                        <col width="14%" />
                        <col width="20%" />
                        <col width="18%" />
					</colgroup>
					<tbody>
					<tr>
                        <th rowspan='5'>수리필요</th>
                        <th scope="row">외장</th>
                        <td class = "etc_check">
                            <div id="usca_extrr_repair_need_at" name="usca_extrr_repair_need_at"></div>
                        </td>
                        <th scope="row">내장</th>
                        <td class = "etc_check">
                            <div id="usca_itrdeco_repair_need_at" name="usca_itrdeco_repair_need_at"></div>
                        </td>
                        <td rowspan='6' class="amount">
                            <div id="p075" name="p075"></div>
                        </td>
                    </tr>								
                    <tr>
                        <th scope="row">광택</th>
                        <td class = "etc_check">
                            <div id="usca_metal_surfc_clnsg_need_at" name="usca_metal_surfc_clnsg_need_at"></div>
                        </td>
                        <th scope="row">룸크리닝</th>
                        <td class = "etc_check">
                            <div id="usca_engine_room_cln_repair_need_at" name="usca_engine_room_cln_repair_need_at"></div>
                        </td>
                    </tr>
                    
                    <tr>
                        <th scope="row">휠</th>
                        <td colspan="3" class = "etc_check3">
                            운전석 
                            (<input type="checkbox" id="usca_rim_drv_seat_frnt_repair_at" name="usca_rim_drv_seat_frnt_repair_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;전</label>
                            <input type="checkbox" id="usca_rim_drv_seat_aftr_repair_at" name="usca_rim_drv_seat_aftr_repair_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;후</label>
                            ) / 동반석 (
                            <input type="checkbox" id="usca_rim_acpseat_frnt_repair_at" name="usca_rim_acpseat_frnt_repair_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;전</label>
                            <input type="checkbox" id="usca_rim_acpseat_aftr_repair_at" name="usca_rim_acpseat_aftr_repair_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;후</label>
                            )/
                            <input type="checkbox" id="usca_rim_emgncy_repair_need_at" name="usca_rim_emgncy_repair_need_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;응급</label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">타이어</th>
                        <td colspan="3" class = "etc_check3">
                            운전석 
                            (<input type="checkbox" id="usca_tire_drv_seat_frnt_repair_at" name="usca_tire_drv_seat_frnt_repair_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;전</label>
                            <input type="checkbox" id="usca_tire_drv_seat_aftr_repair_at" name="usca_tire_drv_seat_aftr_repair_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;후</label>
                            ) / 동반석 (
                            <input type="checkbox" id="usca_tire_acpseat_frnt_repair_at" name="usca_tire_acpseat_frnt_repair_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;전</label>
                            <input type="checkbox" id="usca_tire_acpseat_aftr_repair_at" name="usca_tire_acpseat_aftr_repair_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;후</label>
                            )/
                            <input type="checkbox" id="usca_tire_emgncy_repair_need_at" name="usca_tire_emgncy_repair_need_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;응급</label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">유리</th>
                        <td colspan="3" class = "etc_check">
                            <div id="usca_glass_repair_need_at" name="usca_glass_repair_need_at"></div>
                        </td>
                    </tr>
                    <tr>
                        <th>기본품목</th>
                        <th scope="row">보유상태</th>
                        <td colspan="3" class = "etc_check3">
                            <input type="checkbox" id="usca_bass_prdlst_hold_use_mnl_at" name="usca_bass_prdlst_hold_use_mnl_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;사용설명서</label>
                            <input type="checkbox" id="usca_bass_prdlst_hold_th_brakt_at" name="usca_bass_prdlst_hold_th_brakt_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;안전삼각대</label>
                            <input type="checkbox" id="usca_bass_prdlst_hold_tool_at" name="usca_bass_prdlst_hold_tool_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;잭</label>
                            <input type="checkbox" id="usca_bass_prdlst_hold_tqwrnch_at" name="usca_bass_prdlst_hold_tqwrnch_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;스패너</label>
                        </td>

                    </tr>
                    <tr>
                        <th colspan='5' style="font-size:30px;">최종 가격조사 산정금액</th>
                        <td class="amount">
                            <div id="p076" name="p076"></div>
                        </td>
                    </tr>
	            	</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>가격조사산정 정보</h2>
	            </div>
	            
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="19%" />
                        <col width="31%" />
                        <col width="19%" />
                        <col width="31%" />
					</colgroup>
					<tbody>
						<tr>
                            <th scope="row">가격산정<br/> 기준협회</th>
                            <td class = "etc_check">
                                <em id="usca_pc_calc_stdr_asoc_code"></em>
                            </td>
                            <th scope="row">가격산정<br/> 등록업체명</th>
                            <td class="PC_EXAMIN">
                                <em id="usca_pc_examin_calc_entrps_nm"></em>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">가격조사산정일</th>
                            <td class = "etc_check">
                                <em id="usca_pc_examin_calc_de"></em>
                            </td>
                            <th scope="row">가격조사<br/>산정자명</th>
                            <td class="PC_EXAMIN">
                                <em id="usca_pc_examin_calc_charger_nm"></em>
                            </td>
                        </tr>
					</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>가격조사산정 정보</h2>
	            </div>
	            
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
                    </colgroup>
	            	<tbody>
                        <tr>
                            <td class="last">
                                <em id="usca_spcabl_matter_nd_calc_resn"></em>
                            </td>
                        </tr>
                    </tbody>
                    </table>
                </div>    
	        </div>
        </div>
        
    </div>
    <div class="popup_add_btn" id="uscaSttus_close_btn"><a href="#none">확인</a></div>
    </div>
</div><script>

$(document).on('click','#a_item1',function(){
	$('#a_uscasttus_tab_1').show();
	$('#a_uscasttus_tab_2').hide();
	$('#a_uscasttus_tab_3').hide();
	$('#a_uscasttus_tab_4').hide();
	$('#a_uscasttus_tab_5').hide();
});
$(document).on('click','#a_item2',function(){
	$('#a_uscasttus_tab_1').hide();
	$('#a_uscasttus_tab_2').show();
	$('#a_uscasttus_tab_3').hide();
	$('#a_uscasttus_tab_4').hide();
	$('#a_uscasttus_tab_5').hide();
});
$(document).on('click','#a_item3',function(){
	$('#a_uscasttus_tab_1').hide();
	$('#a_uscasttus_tab_2').hide();
	$('#a_uscasttus_tab_3').show();
	$('#a_uscasttus_tab_4').hide();
	$('#a_uscasttus_tab_5').hide();
});
$(document).on('click','#a_item4',function(){
	$('#a_uscasttus_tab_1').hide();
	$('#a_uscasttus_tab_2').hide();
	$('#a_uscasttus_tab_3').hide();
	$('#a_uscasttus_tab_4').show();
	$('#a_uscasttus_tab_5').hide();
});
$(document).on('click','#a_item5',function(){
	$('#a_uscasttus_tab_1').hide();
	$('#a_uscasttus_tab_2').hide();
	$('#a_uscasttus_tab_3').hide();
	$('#a_uscasttus_tab_4').hide();
	$('#a_uscasttus_tab_5').show();
});

$(function(){
	$("#a_uscaSttus_close").click(function() {
	    $("#a_popup_uscaSttus").hide();
	});
	
	$("#a_uscaSttus_close_btn").click(function() {
	    $("#a_popup_uscaSttus").hide();
	});
});

var a_M01_  = ''; var a_M01_1 = '승용'; var a_M01_2 = '승합'; var a_M01_3 = '화물'; var a_M01_4 = '특수'; var a_M01_5 = '이륜'; var a_M01_6 = '피견인'; var a_M01_9 = '기타';
var a_M02_ = ''; var a_M02_0 = '작동'; var a_M02_1 = '작동불량'; 
var a_M03_ = ''; var a_M03_A = '자동'; var a_M03_C = '무단변속기'; var a_M03_M = '수동'; var a_M03_S = '세미오토'; var a_M03_X = '기타';
var a_M04_ = ''; var a_M04_1 = '자가 보증'; var a_M04_2 = '보험사 보증';
var a_M05_ = ''; var a_M05_1 = '양호'; var a_M05_2 = '상이'; var a_M05_3 = '부식'; var a_M05_4 = '훼손(오손)'; var a_M05_5 = '변조(변타)'; var a_M05_6 = '도말';
var a_M06_ = ''; var a_M06_0 = '없음'; var a_M06_1 = '있음'; var a_M06_2 = '불법';
var a_M07_ = ''; var a_M07_0 = '무'; var a_M07_1 = '유'; 
var a_M08_ = ''; var a_M08_1 = '양호'; var a_M08_2 = '정비요';
var a_M09_ = ''; var a_M09_1 = '양호'; var a_M09_2 = '정비요';
var a_M10_ = ''; var a_M10_a = '가솔린'; var a_M10_b = '디젤'; var a_M10_c = 'LPG'; var a_M10_d = '전기'; var a_M10_e = '수소전기'; var a_M10_x = '하이브리드'; var a_M10_z = '기타';
var a_M11_ = ''; var a_M11_0 = '무'; var a_M11_1 = '유';


var a_s001_1='양호'; var a_s001_3='소음'; var a_s001_4='정비요'; var a_s001_5='불량';
var a_s002_1='양호'; var a_s002_2='불량'; var a_s002_3='정비요';

var a_s003_1='없음'; var a_s003_2='미세누유'; var a_s003_3='누유'; var a_s003_4='정비요';
var a_s004_1='없음'; var a_s004_2='미세누유'; var a_s004_3='누유'; var a_s004_4='정비요';
var a_s005_1='적정'; var a_s005_2='부족'; var a_s005_3='오염'; var a_s005_4='교환요';
var a_s006_1='없음'; var a_s006_2='미세누수'; var a_s006_3='정비요';
var a_s007_1='없음'; var a_s007_2='미세누수'; var a_s007_3='누수';
var a_s008_1='없음'; var a_s008_2='미세누수'; var a_s008_3='누수';
var a_s009_1='없음'; var a_s009_2='미세누수'; var a_s009_3='누수';
var a_s010_1='적정'; var a_s010_2='부족'; var a_s010_3='오염'; var a_s010_4='교환요(부식)';
var a_s011_1='양호'; var a_s011_2='정비요'; var a_s011_3='불량';
var a_s012_1='없음'; var a_s012_2='미세누유'; var a_s012_3='누유';
var a_s013_1='적정'; var a_s013_2='부족'; var a_s013_3='과다'; var a_s013_4='오염(희석)';
var a_s014_1='양호'; var a_s014_2='슬립'; var a_s014_3='충격'; var a_s014_4='출력부족';
var a_s015_1='양호'; var a_s015_2='슬립'; var a_s015_3='충격'; var a_s015_4='출력부족';
var a_s016_1='양호'; var a_s016_2='지연'; var a_s016_3='소음'; var a_s016_5='충격'; var a_s016_6='불량';
var a_s017_0='없음'; var a_s017_1='없음'; var a_s017_2='미세누유'; var a_s017_3='누유'; var a_s017_4='정비요';
var a_s018_0='양호'; var a_s018_1='양호'; var a_s018_2='물림/빠짐이상'; var a_s018_3='소음'; var a_s018_4='정비요'; var a_s018_5='불량';
var a_s019_0='적정'; var a_s019_1='적정'; var a_s019_2='부족'; var a_s019_3='과다'; var a_s019_4='오염(희석)';
var a_s020_0='양호'; var a_s020_1='양호'; var a_s020_4='정비요'; var a_s020_5='이상'; var a_s020_6='불량';
var a_s021_1='양호'; var a_s021_2='누유'; var a_s021_3='슬립'; var a_s021_4='소음'; var a_s021_5='정비요'; var a_s021_6='이상'; var a_s021_7='불량';
var a_s022_1='양호'; var a_s022_2='고무부트손상'; var a_s022_3='정비요'; var a_s022_4='불량';
var a_s023_1='양호'; var a_s023_2='소음'; var a_s023_3='유격'; var a_s023_4='정비요'; var a_s023_5='불량';
var a_s024_1='없음'; var a_s024_2='미세누유'; var a_s024_3='누유'; var a_s024_4='정비요'; 
var a_s025_1='양호'; var a_s025_2='소음'; var a_s025_3='유격'; var a_s025_5='불량';
var a_s026_1='양호'; var a_s026_2='소음'; var a_s026_4='불량';
var a_s027_1='양호'; var a_s027_2='정비요'; var a_s027_3='불량';
var a_s028_1='적정'; var a_s028_2='부족'; var a_s028_3='오염'; var a_s028_4='교환요';
var a_s029_1='없음'; var a_s029_2='정비요'; var a_s029_3='누유'; var a_s029_4='미세누유';
var a_s030_1='양호'; var a_s030_2='정비요'; var a_s030_3='불량';
var a_s031_1='양호'; var a_s031_2='정비요'; var a_s031_3='불량';
var a_s032_1='양호'; var a_s032_2='정비요'; var a_s032_3='불량';
var a_s033_1='양호'; var a_s033_2='소음'; var a_s033_3='정비요'; var a_s033_4='불량';
var a_s034_1='양호'; var a_s034_2='소음'; var a_s034_3='정비요'; var a_s034_4='불량';
var a_s035_1='없음'; var a_s035_2='있음';
var a_s036_1='양호'; var a_s036_2='소음'; var a_s036_3='정비요'; var a_s036_4='불량';
var a_s037_1='해당없음'; var a_s037_2='교환(교체)'; var a_s037_3='판금,용접'; var a_s037_4='부식';
var a_s038_1='해당없음'; var a_s038_2='교환(교체)'; var a_s038_3='판금,용접'; var a_s038_4='부식';
var a_s039_1='해당없음'; var a_s039_2='교환(교체)'; var a_s039_3='판금,용접'; var a_s039_4='부식';
var a_s040_1='해당없음'; var a_s040_2='교환(교체)'; var a_s040_3='판금,용접'; var a_s040_4='부식';
var a_s041_1='해당없음'; var a_s041_2='교환(교체)'; var a_s041_3='판금,용접'; var a_s041_4='부식';
var a_s042_1='해당없음'; var a_s042_2='교환(교체)'; var a_s042_3='판금,용접'; var a_s042_4='부식';
var a_s043_1='해당없음'; var a_s043_2='교환(교체)'; var a_s043_3='판금,용접'; var a_s043_4='부식';
var a_s044_1='해당없음'; var a_s044_2='교환(교체)'; var a_s044_3='판금,용접'; var a_s044_4='부식';
var a_s045_1='해당없음'; var a_s045_2='교환(교체)'; var a_s045_3='판금,용접'; var a_s045_4='부식';
var a_s046_1='해당없음'; var a_s046_2='교환(교체)'; var a_s046_3='판금,용접'; var a_s046_4='부식';
var a_s047_1='해당없음'; var a_s047_2='교환(교체)'; var a_s047_3='판금,용접'; var a_s047_4='부식';
var a_s048_1='해당없음'; var a_s048_2='교환(교체)'; var a_s048_3='판금,용접'; var a_s048_4='부식';
var a_s049_1='해당없음'; var a_s049_2='교환(교체)'; var a_s049_3='판금,용접'; var a_s049_4='부식';
var a_s050_1='해당없음'; var a_s050_2='교환(교체)'; var a_s050_3='판금,용접'; var a_s050_4='부식';
var a_s051_1='해당없음'; var a_s051_2='교환(교체)'; var a_s051_3='판금,용접'; var a_s051_4='부식';
var a_s052_1='해당없음'; var a_s052_2='교환(교체)'; var a_s052_3='판금,용접'; var a_s052_4='부식';
var a_s053_1='해당없음'; var a_s053_2='교환(교체)'; var a_s053_3='판금,용접'; var a_s053_4='부식';
var a_s054_1='해당없음'; var a_s054_2='교환(교체)'; var a_s054_3='판금,용접'; var a_s054_4='부식';
var a_s055_1='양호'; var a_s055_2='정비요'; var a_s055_3='불량'; 
var a_s056_1='해당없음'; var a_s056_2='교환(교체)'; var a_s056_3='판금,용접'; var a_s056_4='부식'; 


</script>

<div id="a_popup_uscaSttus" style="display: none;">
 <div class="popup_contents popup_full_popup">
     <div class="popup_title popup_full_title">
         <span>중고차성능상태점검기록부 상세</span>
         <button type="button" class="close" id="a_uscaSttus_close"> <span onclick="">×</span> </button>
     </div>
     <div class="popup_full_box">
         <div class="popup_full_sub_box">
             <!--                세부내역 넣는곳-->
             <div class="New_agbox">
                 <h2 class="tit"><span></span>자동차 기본정보</h2>
             </div>
             <div class="tblwrap_basic">
                 <table>
                     <colgroup>
                         <col style="width: 14%;">
                         <col style="width: 23%;">
                         <col style="width: 13%;">
                         <col style="width: 19%;">
                         <col style="width: 11%;">
                         <col style="width: 19%;">
                     </colgroup>
                     <tr>
                         <th>접수번호</th>
                         <td colspan="5" id="a_usca_recpt_no"></td>
                     </tr>
                     <tr>
                         <th>차량등록번호</th>
                         <td id="a_usca_vhrno"></td>
                         <th>차종</th>
                         <td id="a_usca_vhcty_asort_code"></td>
                         <th>차명</th>
                         <td id="a_usca_cnm">
                         </td>
                     </tr>
                     <tr>
                         <th>최초등록일</th>
                         <td id="a_usca_frst_regist_de"></td>
                         <th>연식</th>
                         <td id="a_usca_prye"></td>
                         <th>원동기형식</th>
                         <td id="a_usca_mtrs_fom"></td>
                         
                         
                     </tr>
                     <tr>
                         <th>차대변호</th>
                         <td id="a_usca_vin"></td>
                         <th>검사유효기간</th>
                         <td colspan="3" id="a_usca_inspt_valid_pd_de"></td>
                     </tr>                                         
                 </table>
             </div>
             
             <div class="New_agbox">
                 <h2 class="tit"><span></span>점검사항</h2>
             </div>
             
             <div class="tblwrap_basic">
                 <table>
                     <colgroup>
                         <col width="15%" />
                         <col width="18%" />
                         <col width="15%" />
                         <col width="18%" />
                         <col width="15%" />
                         <col width="18%" />
                     </colgroup>
                     <tr>
                         <th scope="row">주행거리</th>
                         <td>
                             <div name='a_usca_trvl_dstnc' id='a_usca_trvl_dstnc'></div>
                         </td>
                         <th scope="row">계기상태</th>
                         <td>
                             <div id="a_usca_gauge_fnct_at"></div>
                         </td>
                         <th scope="row">동일성확인<br />(차대번호표기)</th>
                         <td>
                             <div id="a_usca_samenss_cnfirm_code"></div>
                         </td>
                     </tr>
                     <tr>
                         <th scope="row">보증 유형</th>
                         <td>
                             <div id="a_usca_assrnc_ty_se_code"></div>
                         </td>
                         <th scope="row">변속기 종류</th>
                         <td colspan=3 >
                             <div id="a_usca_grbx_knd_code"></div>
                             <div id="a_usca_grbx_knd_dtls"></div>                
                         </td>
                     </tr>   
                     <tr>
                         <th scope="row">불법구조변경</th>
                         <td class="row">
                             <div id="a_usca_unlaw_stmd_at"></div>
                         </td>            
                         <th scope="row">사고유무<br />(단순수리제외)</th>
                         <td class="row" colspan="3">
                             <div id="a_usca_acdnt_at"></div>
                         </td>
                         
                     </tr>                    
                 </table>
             </div>
             
             <div class="New_agbox">
                 <h2 class="tit"><span></span>자기진단사항</h2>
             </div>
             
             <div class="tblwrap_basic">
                 <table>
                     <colgroup>
                         <col style="width: 30%;">
                         <col style="width: 70%;">
                     </colgroup>
                     <tr>
                         <th>엔진</th>
                         <td id="a_usca_engine_stblt_at"></td>
                     </tr>
                     <tr>
                         <th>변속기</th>
                         <td id="a_usca_grbx_stblt_at"></td>
                     </tr>
                 </table>
             </div>
              
             <div class="New_agbox">
                 <h2 class="tit"><span></span>배출가스</h2>
             </div>
                             
             <div class="tblwrap_basic">
                 <table>
                     <colgroup>
                         <col style="width: 30%;">
                         <col style="width: 70%;">
                     </colgroup>
                     <tr>
                         <th>일산화탄소(CO)</th>
                         <td id="a_usca_crmn_mesure_value"></td>
                     </tr>
                     <tr>
                         <th>탄화수소(HC)</th>
                         <td id="a_usca_hydr_mesure_value"></td>
                     </tr>
                     <tr>
                         <th>매연</th>
                         <td id="a_usca_smoke_mesure_value"></td>
                     </tr>
                 </table>
             </div>             
                          
             <div class="New_agbox">
                 <h2 class="tit"><span></span>경정사유</h2>
             </div>
             
             <div class="tblwrap_basic">
                 <table>
                     <tr>
                         <td><em id="a_usca_upd_reason_txt"></em></td>
                     </tr>
                 </table>
             </div>
             <br/><br/>
             
             
             <div class="tab_box01">
				<div class="box_layout">
					<ul class="New_tbls">
						<li class="tbl_cell">
							<label class="box-radio-input">
								<input type="radio" name="a_item1" id="a_item3" checked="checked">
								<span style="font-size: 8px;">원동기/동력전달</span>
							</label>
						</li>
						<li class="tbl_cell">
							<label class="box-radio-input">
								<input type="radio" name="a_item1" id="a_item4">
								<span style="font-size: 8px;">조향/제동/전기</span>
							</label>
						</li>
						<li class="tbl_cell">
							<label class="box-radio-input">
								<input type="radio" name="a_item1" id="a_item2">
								<span style="font-size: 8px;">외판/주요골격</span>
							</label>
						</li>
						
						<li class="tbl_cell">
							<label class="box-radio-input">
								<input type="radio" name="a_item1" id="a_item1">
								<span style="font-size: 8px;">자동차의 상태표시</span>
							</label>
						</li>
						<li class="tbl_cell">
							<label class="box-radio-input">
								<input type="radio" name="a_item1" id="a_item5">
								<span style="font-size: 8px;">처리정보</span>
							</label>
						</li>
					</ul>
				</div>
			</div>
			
			<div id="a_uscasttus_tab_1" style="display:none;">
				<h5 style="text-align:left;">상태표시부호</h5>
				<p style="text-align:left;">
				<strong style="color:blue;">X</strong> : 교환(교체), 
                <strong style="color:red;">W</strong> : 판금,용접, 
                <strong style="color:green;">C</strong> : 부식 / ※ 승용차 외에는 승용차에 준하여 표시<br />
				</p>
				<br />
										
				<div style="width:650px; height:289px; background:url('/resource/common_dz/images/ao_car_state.gif'); text-align:center; padding-top:32px;">
					<div id="a_markArea" style="position:relative; width:580px; height:230px; margin:0 auto;">
						<table id="a_markAreaTable" cellpadding="0" cellspacing="0" border="0" width="580px" height="230px" bordercolor="#000000" style="margin-left:35px;">
							<colgroup>
								<col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" />
								<col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" />
								<col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" />
								<col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" />
							</colgroup>
			
							<tr>
								<td id="a_td_1" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(1,5,7);"><b><div id="a_area1">&nbsp;</div></b><input type="hidden"  id="a_stat1" name="a_stat1" value=""/><input type="hidden" id="a_xx1" name="a_xx1" value=""/><input type="hidden" id="a_yy1" name="a_yy1" value=""/></td>
								<td id="a_td_2" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(2,34,7);"><b><div id="a_area2">&nbsp;</div></b><input type="hidden"  id="a_stat2" name="a_stat2" value=""/><input type="hidden" id="a_xx2" name="a_xx2" value=""/><input type="hidden" id="a_yy2" name="a_yy2" value=""/></td>
								<td id="a_td_3" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(3,63,7);"><b><div id="a_area3">&nbsp;</div></b><input type="hidden"  id="a_stat3" name="a_stat3" value=""/><input type="hidden" id="a_xx3" name="a_xx3" value=""/><input type="hidden" id="a_yy3" name="a_yy3" value=""/></td>
								<td id="a_td_4" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(4,92,7);"><b><div id="a_area4">&nbsp;</div></b><input type="hidden"  id="a_stat4" name="a_stat4" value=""/><input type="hidden" id="a_xx4" name="a_xx4" value=""/><input type="hidden" id="a_yy4" name="a_yy4" value=""/></td>
								<td id="a_td_5" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(5,121,7);"><b><div id="a_area5">&nbsp;</div></b><input type="hidden"  id="a_stat5" name="a_stat5" value=""/><input type="hidden" id="a_xx5" name="a_xx5" value=""/><input type="hidden" id="a_yy5" name="a_yy5" value=""/></td>
								<td id="a_td_6" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(6,150,7);"><b><div id="a_area6">&nbsp;</div></b><input type="hidden"  id="a_stat6" name="a_stat6" value=""/><input type="hidden" id="a_xx6" name="a_xx6" value=""/><input type="hidden" id="a_yy6" name="a_yy6" value=""/></td>
								<td id="a_td_7" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(7,179,7);"><b><div id="a_area7">&nbsp;</div></b><input type="hidden"  id="a_stat7" name="a_stat7" value=""/><input type="hidden" id="a_xx7" name="a_xx7" value=""/><input type="hidden" id="a_yy7" name="a_yy7" value=""/></td>
								<td id="a_td_8" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(8,208,7);"><b><div id="a_area8">&nbsp;</div></b><input type="hidden"  id="a_stat8" name="a_stat8" value=""/><input type="hidden" id="a_xx8" name="a_xx8" value=""/><input type="hidden" id="a_yy8" name="a_yy8" value=""/></td>
								<td id="a_td_9" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(9,230,7);"><b><div id="a_area9">&nbsp;</div></b><input type="hidden"  id="a_stat9" name="a_stat9" value=""/><input type="hidden" id="a_xx9" name="a_xx9" value=""/><input type="hidden" id="a_yy9" name="a_yy9" value=""/></td>
								<td id="a_td_10" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(10,266,7);"><b><div id="a_area10">&nbsp;</div></b><input type="hidden"  id="a_stat10" name="a_stat10" value=""/><input type="hidden" id="a_xx10" name="a_xx10" value=""/><input type="hidden" id="a_yy10" name="a_yy10" value=""/></td>
								<td id="a_td_11" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(11,295,7);"><b><div id="a_area11">&nbsp;</div></b><input type="hidden"  id="a_stat11" name="a_stat11" value=""/><input type="hidden" id="a_xx11" name="a_xx11" value=""/><input type="hidden" id="a_yy11" name="a_yy11" value=""/></td>
								<td id="a_td_12" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(12,324,7);"><b><div id="a_area12">&nbsp;</div></b><input type="hidden"  id="a_stat12" name="a_stat12" value=""/><input type="hidden" id="a_xx12" name="a_xx12" value=""/><input type="hidden" id="a_yy12" name="a_yy12" value=""/></td>
								<td id="a_td_13" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(13,353,7);"><b><div id="a_area13">&nbsp;</div></b><input type="hidden"  id="a_stat13" name="a_stat13" value=""/><input type="hidden" id="a_xx13" name="a_xx13" value=""/><input type="hidden" id="a_yy13" name="a_yy13" value=""/></td>
								<td id="a_td_14" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(14,382,7);"><b><div id="a_area14">&nbsp;</div></b><input type="hidden"  id="a_stat14" name="a_stat14" value=""/><input type="hidden" id="a_xx14" name="a_xx14" value=""/><input type="hidden" id="a_yy14" name="a_yy14" value=""/></td>
								<td id="a_td_15" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(15,411,7);"><b><div id="a_area15">&nbsp;</div></b><input type="hidden"  id="a_stat15" name="a_stat15" value=""/><input type="hidden" id="a_xx15" name="a_xx15" value=""/><input type="hidden" id="a_yy15" name="a_yy15" value=""/></td>
								<td id="a_td_16" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(16,440,7);"><b><div id="a_area16">&nbsp;</div></b><input type="hidden"  id="a_stat16" name="a_stat16" value=""/><input type="hidden" id="a_xx16" name="a_xx16" value=""/><input type="hidden" id="a_yy16" name="a_yy16" value=""/></td>
								<td id="a_td_17" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(17,469,7);"><b><div id="a_area17">&nbsp;</div></b><input type="hidden"  id="a_stat17" name="a_stat17" value=""/><input type="hidden" id="a_xx17" name="a_xx17" value=""/><input type="hidden" id="a_yy17" name="a_yy17" value=""/></td>
								<td id="a_td_18" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(18,498,7);"><b><div id="a_area18">&nbsp;</div></b><input type="hidden"  id="a_stat18" name="a_stat18" value=""/><input type="hidden" id="a_xx18" name="a_xx18" value=""/><input type="hidden" id="a_yy18" name="a_yy18" value=""/></td>
								<td id="a_td_19" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(19,527,7);"><b><div id="a_area19">&nbsp;</div></b><input type="hidden"  id="a_stat19" name="a_stat19" value=""/><input type="hidden" id="a_xx19" name="a_xx19" value=""/><input type="hidden" id="a_yy19" name="a_yy19" value=""/></td>
								<td id="a_td_20" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(20,556,7);"><b><div id="a_area20">&nbsp;</div></b><input type="hidden"  id="a_stat20" name="a_stat20" value=""/><input type="hidden" id="a_xx20" name="a_xx20" value=""/><input type="hidden" id="a_yy20" name="a_yy20" value=""/></td>
							</tr>
							<tr>
								<td id="a_td_21" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(21,5,30);"><b><div id="a_area21">&nbsp;</div></b><input type="hidden"  id="a_stat21" name="a_stat21" value=""/><input type="hidden" id="a_xx21" name="a_xx21" value=""/><input type="hidden" id="a_yy21" name="a_yy21" value=""/></td>
								<td id="a_td_22" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(22,34,30);"><b><div id="a_area22">&nbsp;</div></b><input type="hidden"  id="a_stat22" name="a_stat22" value=""/><input type="hidden" id="a_xx22" name="a_xx22" value=""/><input type="hidden" id="a_yy22" name="a_yy22" value=""/></td>
								<td id="a_td_23" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(23,63,30);"><b><div id="a_area23">&nbsp;</div></b><input type="hidden"  id="a_stat23" name="a_stat23" value=""/><input type="hidden" id="a_xx23" name="a_xx23" value=""/><input type="hidden" id="a_yy23" name="a_yy23" value=""/></td>
								<td id="a_td_24" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(24,92,30);"><b><div id="a_area24">&nbsp;</div></b><input type="hidden"  id="a_stat24" name="a_stat24" value=""/><input type="hidden" id="a_xx24" name="a_xx24" value=""/><input type="hidden" id="a_yy24" name="a_yy24" value=""/></td>
								<td id="a_td_25" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(25,121,30);"><b><div id="a_area25">&nbsp;</div></b><input type="hidden"  id="a_stat25" name="a_stat25" value=""/><input type="hidden" id="a_xx25" name="a_xx25" value=""/><input type="hidden" id="a_yy25" name="a_yy25" value=""/></td>
								<td id="a_td_26" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(26,150,30);"><b><div id="a_area26">&nbsp;</div></b><input type="hidden"  id="a_stat26" name="a_stat26" value=""/><input type="hidden" id="a_xx26" name="a_xx26" value=""/><input type="hidden" id="a_yy26" name="a_yy26" value=""/></td>
								<td id="a_td_27" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(27,179,30);"><b><div id="a_area27">&nbsp;</div></b><input type="hidden"  id="a_stat27" name="a_stat27" value=""/><input type="hidden" id="a_xx27" name="a_xx27" value=""/><input type="hidden" id="a_yy27" name="a_yy27" value=""/></td>
								<td id="a_td_28" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(28,208,30);"><b><div id="a_area28">&nbsp;</div></b><input type="hidden"  id="a_stat28" name="a_stat28" value=""/><input type="hidden" id="a_xx28" name="a_xx28" value=""/><input type="hidden" id="a_yy28" name="a_yy28" value=""/></td>
								<td id="a_td_29" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(29,237,30);"><b><div id="a_area29">&nbsp;</div></b><input type="hidden"  id="a_stat29" name="a_stat29" value=""/><input type="hidden" id="a_xx29" name="a_xx29" value=""/><input type="hidden" id="a_yy29" name="a_yy29" value=""/></td>
								<td id="a_td_30" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(30,266,30);"><b><div id="a_area30">&nbsp;</div></b><input type="hidden"  id="a_stat30" name="a_stat30" value=""/><input type="hidden" id="a_xx30" name="a_xx30" value=""/><input type="hidden" id="a_yy30" name="a_yy30" value=""/></td>
								<td id="a_td_31" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(31,295,30);"><b><div id="a_area31">&nbsp;</div></b><input type="hidden"  id="a_stat31" name="a_stat31" value=""/><input type="hidden" id="a_xx31" name="a_xx31" value=""/><input type="hidden" id="a_yy31" name="a_yy31" value=""/></td>
								<td id="a_td_32" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(32,324,30);"><b><div id="a_area32">&nbsp;</div></b><input type="hidden"  id="a_stat32" name="a_stat32" value=""/><input type="hidden" id="a_xx32" name="a_xx32" value=""/><input type="hidden" id="a_yy32" name="a_yy32" value=""/></td>
								<td id="a_td_33" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(33,353,30);"><b><div id="a_area33">&nbsp;</div></b><input type="hidden"  id="a_stat33" name="a_stat33" value=""/><input type="hidden" id="a_xx33" name="a_xx33" value=""/><input type="hidden" id="a_yy33" name="a_yy33" value=""/></td>
								<td id="a_td_34" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(34,382,30);"><b><div id="a_area34">&nbsp;</div></b><input type="hidden"  id="a_stat34" name="a_stat34" value=""/><input type="hidden" id="a_xx34" name="a_xx34" value=""/><input type="hidden" id="a_yy34" name="a_yy34" value=""/></td>
								<td id="a_td_35" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(35,402,30);"><b><div id="a_area35">&nbsp;</div></b><input type="hidden"  id="a_stat35" name="a_stat35" value=""/><input type="hidden" id="a_xx35" name="a_xx35" value=""/><input type="hidden" id="a_yy35" name="a_yy35" value=""/></td>
								<td id="a_td_36" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(36,452,30);"><b><div id="a_area36">&nbsp;</div></b><input type="hidden"  id="a_stat36" name="a_stat36" value=""/><input type="hidden" id="a_xx36" name="a_xx36" value=""/><input type="hidden" id="a_yy36" name="a_yy36" value=""/></td>
								<td id="a_td_37" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(37,469,30);"><b><div id="a_area37">&nbsp;</div></b><input type="hidden"  id="a_stat37" name="a_stat37" value=""/><input type="hidden" id="a_xx37" name="a_xx37" value=""/><input type="hidden" id="a_yy37" name="a_yy37" value=""/></td>
								<td id="a_td_38" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(38,498,30);"><b><div id="a_area38">&nbsp;</div></b><input type="hidden"  id="a_stat38" name="a_stat38" value=""/><input type="hidden" id="a_xx38" name="a_xx38" value=""/><input type="hidden" id="a_yy38" name="a_yy38" value=""/></td>
								<td id="a_td_39" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(39,527,30);"><b><div id="a_area39">&nbsp;</div></b><input type="hidden"  id="a_stat39" name="a_stat39" value=""/><input type="hidden" id="a_xx39" name="a_xx39" value=""/><input type="hidden" id="a_yy39" name="a_yy39" value=""/></td>
								<td id="a_td_40" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(40,556,30);"><b><div id="a_area40">&nbsp;</div></b><input type="hidden"  id="a_stat40" name="a_stat40" value=""/><input type="hidden" id="a_xx40" name="a_xx40" value=""/><input type="hidden" id="a_yy40" name="a_yy40" value=""/></td>
							</tr>
							<tr>
								<td id="a_td_41" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(41,5,53);"><b><div id="a_area41">&nbsp;</div></b><input type="hidden"  id="a_stat41" name="a_stat41" value=""/><input type="hidden" id="a_xx41" name="a_xx41" value=""/><input type="hidden" id="a_yy41" name="a_yy41" value=""/></td>
								<td id="a_td_42" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(42,34,53);"><b><div id="a_area42">&nbsp;</div></b><input type="hidden"  id="a_stat42" name="a_stat42" value=""/><input type="hidden" id="a_xx42" name="a_xx42" value=""/><input type="hidden" id="a_yy42" name="a_yy42" value=""/></td>
								<td id="a_td_43" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(43,63,53);"><b><div id="a_area43">&nbsp;</div></b><input type="hidden"  id="a_stat43" name="a_stat43" value=""/><input type="hidden" id="a_xx43" name="a_xx43" value=""/><input type="hidden" id="a_yy43" name="a_yy43" value=""/></td>
								<td id="a_td_44" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(44,92,53);"><b><div id="a_area44">&nbsp;</div></b><input type="hidden"  id="a_stat44" name="a_stat44" value=""/><input type="hidden" id="a_xx44" name="a_xx44" value=""/><input type="hidden" id="a_yy44" name="a_yy44" value=""/></td>
								<td id="a_td_45" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(45,121,53);"><b><div id="a_area45">&nbsp;</div></b><input type="hidden"  id="a_stat45" name="a_stat45" value=""/><input type="hidden" id="a_xx45" name="a_xx45" value=""/><input type="hidden" id="a_yy45" name="a_yy45" value=""/></td>
								<td id="a_td_46" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(46,150,53);"><b><div id="a_area46">&nbsp;</div></b><input type="hidden"  id="a_stat46" name="a_stat46" value=""/><input type="hidden" id="a_xx46" name="a_xx46" value=""/><input type="hidden" id="a_yy46" name="a_yy46" value=""/></td>
								<td id="a_td_47" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(47,179,53);"><b><div id="a_area47">&nbsp;</div></b><input type="hidden"  id="a_stat47" name="a_stat47" value=""/><input type="hidden" id="a_xx47" name="a_xx47" value=""/><input type="hidden" id="a_yy47" name="a_yy47" value=""/></td>
								<td id="a_td_48" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(48,208,53);"><b><div id="a_area48">&nbsp;</div></b><input type="hidden"  id="a_stat48" name="a_stat48" value=""/><input type="hidden" id="a_xx48" name="a_xx48" value=""/><input type="hidden" id="a_yy48" name="a_yy48" value=""/></td>
								<td id="a_td_49" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(49,237,53);"><b><div id="a_area49">&nbsp;</div></b><input type="hidden"  id="a_stat49" name="a_stat49" value=""/><input type="hidden" id="a_xx49" name="a_xx49" value=""/><input type="hidden" id="a_yy49" name="a_yy49" value=""/></td>
								<td id="a_td_50" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(50,266,53);"><b><div id="a_area50">&nbsp;</div></b><input type="hidden"  id="a_stat50" name="a_stat50" value=""/><input type="hidden" id="a_xx50" name="a_xx50" value=""/><input type="hidden" id="a_yy50" name="a_yy50" value=""/></td>
								<td id="a_td_51" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(51,295,53);"><b><div id="a_area51">&nbsp;</div></b><input type="hidden"  id="a_stat51" name="a_stat51" value=""/><input type="hidden" id="a_xx51" name="a_xx51" value=""/><input type="hidden" id="a_yy51" name="a_yy51" value=""/></td>
								<td id="a_td_52" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(52,324,53);"><b><div id="a_area52">&nbsp;</div></b><input type="hidden"  id="a_stat52" name="a_stat52" value=""/><input type="hidden" id="a_xx52" name="a_xx52" value=""/><input type="hidden" id="a_yy52" name="a_yy52" value=""/></td>
								<td id="a_td_53" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(53,353,53);"><b><div id="a_area53">&nbsp;</div></b><input type="hidden"  id="a_stat53" name="a_stat53" value=""/><input type="hidden" id="a_xx53" name="a_xx53" value=""/><input type="hidden" id="a_yy53" name="a_yy53" value=""/></td>
								<td id="a_td_54" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(54,382,53);"><b><div id="a_area54">&nbsp;</div></b><input type="hidden"  id="a_stat54" name="a_stat54" value=""/><input type="hidden" id="a_xx54" name="a_xx54" value=""/><input type="hidden" id="a_yy54" name="a_yy54" value=""/></td>
								<td id="a_td_55" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(55,402,53);"><b><div id="a_area55">&nbsp;</div></b><input type="hidden"  id="a_stat55" name="a_stat55" value=""/><input type="hidden" id="a_xx55" name="a_xx55" value=""/><input type="hidden" id="a_yy55" name="a_yy55" value=""/></td>
								<td id="a_td_56" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(56,452,53);"><b><div id="a_area56">&nbsp;</div></b><input type="hidden"  id="a_stat56" name="a_stat56" value=""/><input type="hidden" id="a_xx56" name="a_xx56" value=""/><input type="hidden" id="a_yy56" name="a_yy56" value=""/></td>
								<td id="a_td_57" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(57,469,53);"><b><div id="a_area57">&nbsp;</div></b><input type="hidden"  id="a_stat57" name="a_stat57" value=""/><input type="hidden" id="a_xx57" name="a_xx57" value=""/><input type="hidden" id="a_yy57" name="a_yy57" value=""/></td>
								<td id="a_td_58" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(58,498,53);"><b><div id="a_area58">&nbsp;</div></b><input type="hidden"  id="a_stat58" name="a_stat58" value=""/><input type="hidden" id="a_xx58" name="a_xx58" value=""/><input type="hidden" id="a_yy58" name="a_yy58" value=""/></td>
								<td id="a_td_59" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(59,527,53);"><b><div id="a_area59">&nbsp;</div></b><input type="hidden"  id="a_stat59" name="a_stat59" value=""/><input type="hidden" id="a_xx59" name="a_xx59" value=""/><input type="hidden" id="a_yy59" name="a_yy59" value=""/></td>
								<td id="a_td_60" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(60,556,53);"><b><div id="a_area60">&nbsp;</div></b><input type="hidden"  id="a_stat60" name="a_stat60" value=""/><input type="hidden" id="a_xx60" name="a_xx60" value=""/><input type="hidden" id="a_yy60" name="a_yy60" value=""/></td>
							</tr>
							<tr>
								<td id="a_td_61" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(61,5,76);"><b><div id="a_area61">&nbsp;</div></b><input type="hidden"  id="a_stat61" name="a_stat61" value=""/><input type="hidden" id="a_xx61" name="a_xx61" value=""/><input type="hidden" id="a_yy61" name="a_yy61" value=""/></td>
								<td id="a_td_62" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(62,34,76);"><b><div id="a_area62">&nbsp;</div></b><input type="hidden"  id="a_stat62" name="a_stat62" value=""/><input type="hidden" id="a_xx62" name="a_xx62" value=""/><input type="hidden" id="a_yy62" name="a_yy62" value=""/></td>
								<td id="a_td_63" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(63,63,76);"><b><div id="a_area63">&nbsp;</div></b><input type="hidden"  id="a_stat63" name="a_stat63" value=""/><input type="hidden" id="a_xx63" name="a_xx63" value=""/><input type="hidden" id="a_yy63" name="a_yy63" value=""/></td>
								<td id="a_td_64" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(64,92,76);"><b><div id="a_area64">&nbsp;</div></b><input type="hidden"  id="a_stat64" name="a_stat64" value=""/><input type="hidden" id="a_xx64" name="a_xx64" value=""/><input type="hidden" id="a_yy64" name="a_yy64" value=""/></td>
								<td id="a_td_65" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(65,121,76);"><b><div id="a_area65">&nbsp;</div></b><input type="hidden"  id="a_stat65" name="a_stat65" value=""/><input type="hidden" id="a_xx65" name="a_xx65" value=""/><input type="hidden" id="a_yy65" name="a_yy65" value=""/></td>
								<td id="a_td_66" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(66,150,76);"><b><div id="a_area66">&nbsp;</div></b><input type="hidden"  id="a_stat66" name="a_stat66" value=""/><input type="hidden" id="a_xx66" name="a_xx66" value=""/><input type="hidden" id="a_yy66" name="a_yy66" value=""/></td>
								<td id="a_td_67" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(67,179,76);"><b><div id="a_area67">&nbsp;</div></b><input type="hidden"  id="a_stat67" name="a_stat67" value=""/><input type="hidden" id="a_xx67" name="a_xx67" value=""/><input type="hidden" id="a_yy67" name="a_yy67" value=""/></td>
								<td id="a_td_68" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(68,208,76);"><b><div id="a_area68">&nbsp;</div></b><input type="hidden"  id="a_stat68" name="a_stat68" value=""/><input type="hidden" id="a_xx68" name="a_xx68" value=""/><input type="hidden" id="a_yy68" name="a_yy68" value=""/></td>
								<td id="a_td_69" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(69,237,76);"><b><div id="a_area69">&nbsp;</div></b><input type="hidden"  id="a_stat69" name="a_stat69" value=""/><input type="hidden" id="a_xx69" name="a_xx69" value=""/><input type="hidden" id="a_yy69" name="a_yy69" value=""/></td>
								<td id="a_td_70" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(70,266,76);"><b><div id="a_area70">&nbsp;</div></b><input type="hidden"  id="a_stat70" name="a_stat70" value=""/><input type="hidden" id="a_xx70" name="a_xx70" value=""/><input type="hidden" id="a_yy70" name="a_yy70" value=""/></td>
								<td id="a_td_71" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(71,295,76);"><b><div id="a_area71">&nbsp;</div></b><input type="hidden"  id="a_stat71" name="a_stat71" value=""/><input type="hidden" id="a_xx71" name="a_xx71" value=""/><input type="hidden" id="a_yy71" name="a_yy71" value=""/></td>
								<td id="a_td_72" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(72,324,76);"><b><div id="a_area72">&nbsp;</div></b><input type="hidden"  id="a_stat72" name="a_stat72" value=""/><input type="hidden" id="a_xx72" name="a_xx72" value=""/><input type="hidden" id="a_yy72" name="a_yy72" value=""/></td>
								<td id="a_td_73" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(73,353,76);"><b><div id="a_area73">&nbsp;</div></b><input type="hidden"  id="a_stat73" name="a_stat73" value=""/><input type="hidden" id="a_xx73" name="a_xx73" value=""/><input type="hidden" id="a_yy73" name="a_yy73" value=""/></td>
								<td id="a_td_74" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(74,380,76);"><b><div id="a_area74">&nbsp;</div></b><input type="hidden"  id="a_stat74" name="a_stat74" value=""/><input type="hidden" id="a_xx74" name="a_xx74" value=""/><input type="hidden" id="a_yy74" name="a_yy74" value=""/></td>
								<td id="a_td_75" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(75,411,76);"><b><div id="a_area75">&nbsp;</div></b><input type="hidden"  id="a_stat75" name="a_stat75" value=""/><input type="hidden" id="a_xx75" name="a_xx75" value=""/><input type="hidden" id="a_yy75" name="a_yy75" value=""/></td>
								<td id="a_td_76" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(76,440,76);"><b><div id="a_area76">&nbsp;</div></b><input type="hidden"  id="a_stat76" name="a_stat76" value=""/><input type="hidden" id="a_xx76" name="a_xx76" value=""/><input type="hidden" id="a_yy76" name="a_yy76" value=""/></td>
								<td id="a_td_77" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(77,469,76);"><b><div id="a_area77">&nbsp;</div></b><input type="hidden"  id="a_stat77" name="a_stat77" value=""/><input type="hidden" id="a_xx77" name="a_xx77" value=""/><input type="hidden" id="a_yy77" name="a_yy77" value=""/></td>
								<td id="a_td_78" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(78,498,76);"><b><div id="a_area78">&nbsp;</div></b><input type="hidden"  id="a_stat78" name="a_stat78" value=""/><input type="hidden" id="a_xx78" name="a_xx78" value=""/><input type="hidden" id="a_yy78" name="a_yy78" value=""/></td>
								<td id="a_td_79" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(79,527,76);"><b><div id="a_area79">&nbsp;</div></b><input type="hidden"  id="a_stat79" name="a_stat79" value=""/><input type="hidden" id="a_xx79" name="a_xx79" value=""/><input type="hidden" id="a_yy79" name="a_yy79" value=""/></td>
								<td id="a_td_80" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(80,556,76);"><b><div id="a_area80">&nbsp;</div></b><input type="hidden"  id="a_stat80" name="a_stat80" value=""/><input type="hidden" id="a_xx80" name="a_xx80" value=""/><input type="hidden" id="a_yy80" name="a_yy80" value=""/></td>
							</tr>
							<tr>
								<td id="a_td_81" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(81,5,99);"><b><div id="a_area81">&nbsp;</div></b><input type="hidden"  id="a_stat81" name="a_stat81" value=""/><input type="hidden" id="a_xx81" name="a_xx81" value=""/><input type="hidden" id="a_yy81" name="a_yy81" value=""/></td>
								<td id="a_td_82" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(82,34,99);"><b><div id="a_area82">&nbsp;</div></b><input type="hidden"  id="a_stat82" name="a_stat82" value=""/><input type="hidden" id="a_xx82" name="a_xx82" value=""/><input type="hidden" id="a_yy82" name="a_yy82" value=""/></td>
								<td id="a_td_83" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(83,63,99);"><b><div id="a_area83">&nbsp;</div></b><input type="hidden"  id="a_stat83" name="a_stat83" value=""/><input type="hidden" id="a_xx83" name="a_xx83" value=""/><input type="hidden" id="a_yy83" name="a_yy83" value=""/></td>
								<td id="a_td_84" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(84,92,99);"><b><div id="a_area84">&nbsp;</div></b><input type="hidden"  id="a_stat84" name="a_stat84" value=""/><input type="hidden" id="a_xx84" name="a_xx84" value=""/><input type="hidden" id="a_yy84" name="a_yy84" value=""/></td>
								<td id="a_td_85" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(85,121,99);"><b><div id="a_area85">&nbsp;</div></b><input type="hidden"  id="a_stat85" name="a_stat85" value=""/><input type="hidden" id="a_xx85" name="a_xx85" value=""/><input type="hidden" id="a_yy85" name="a_yy85" value=""/></td>
								<td id="a_td_86" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(86,150,99);"><b><div id="a_area86">&nbsp;</div></b><input type="hidden"  id="a_stat86" name="a_stat86" value=""/><input type="hidden" id="a_xx86" name="a_xx86" value=""/><input type="hidden" id="a_yy86" name="a_yy86" value=""/></td>
								<td id="a_td_87" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(87,179,99);"><b><div id="a_area87">&nbsp;</div></b><input type="hidden"  id="a_stat87" name="a_stat87" value=""/><input type="hidden" id="a_xx87" name="a_xx87" value=""/><input type="hidden" id="a_yy87" name="a_yy87" value=""/></td>
								<td id="a_td_88" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(88,208,99);"><b><div id="a_area88">&nbsp;</div></b><input type="hidden"  id="a_stat88" name="a_stat88" value=""/><input type="hidden" id="a_xx88" name="a_xx88" value=""/><input type="hidden" id="a_yy88" name="a_yy88" value=""/></td>
								<td id="a_td_89" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(89,237,99);"><b><div id="a_area89">&nbsp;</div></b><input type="hidden"  id="a_stat89" name="a_stat89" value=""/><input type="hidden" id="a_xx89" name="a_xx89" value=""/><input type="hidden" id="a_yy89" name="a_yy89" value=""/></td>
								<td id="a_td_90" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(90,266,99);"><b><div id="a_area90">&nbsp;</div></b><input type="hidden"  id="a_stat90" name="a_stat90" value=""/><input type="hidden" id="a_xx90" name="a_xx90" value=""/><input type="hidden" id="a_yy90" name="a_yy90" value=""/></td>
								<td id="a_td_91" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(91,295,99);"><b><div id="a_area91">&nbsp;</div></b><input type="hidden"  id="a_stat91" name="a_stat91" value=""/><input type="hidden" id="a_xx91" name="a_xx91" value=""/><input type="hidden" id="a_yy91" name="a_yy91" value=""/></td>
								<td id="a_td_92" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(92,324,99);"><b><div id="a_area92">&nbsp;</div></b><input type="hidden"  id="a_stat92" name="a_stat92" value=""/><input type="hidden" id="a_xx92" name="a_xx92" value=""/><input type="hidden" id="a_yy92" name="a_yy92" value=""/></td>
								<td id="a_td_93" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(93,353,99);"><b><div id="a_area93">&nbsp;</div></b><input type="hidden"  id="a_stat93" name="a_stat93" value=""/><input type="hidden" id="a_xx93" name="a_xx93" value=""/><input type="hidden" id="a_yy93" name="a_yy93" value=""/></td>
								<td id="a_td_94" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(94,382,99);"><b><div id="a_area94">&nbsp;</div></b><input type="hidden"  id="a_stat94" name="a_stat94" value=""/><input type="hidden" id="a_xx94" name="a_xx94" value=""/><input type="hidden" id="a_yy94" name="a_yy94" value=""/></td>
								<td id="a_td_95" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(95,411,99);"><b><div id="a_area95">&nbsp;</div></b><input type="hidden"  id="a_stat95" name="a_stat95" value=""/><input type="hidden" id="a_xx95" name="a_xx95" value=""/><input type="hidden" id="a_yy95" name="a_yy95" value=""/></td>
								<td id="a_td_96" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(96,440,99);"><b><div id="a_area96">&nbsp;</div></b><input type="hidden"  id="a_stat96" name="a_stat96" value=""/><input type="hidden" id="a_xx96" name="a_xx96" value=""/><input type="hidden" id="a_yy96" name="a_yy96" value=""/></td>
								<td id="a_td_97" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(97,469,99);"><b><div id="a_area97">&nbsp;</div></b><input type="hidden"  id="a_stat97" name="a_stat97" value=""/><input type="hidden" id="a_xx97" name="a_xx97" value=""/><input type="hidden" id="a_yy97" name="a_yy97" value=""/></td>
								<td id="a_td_98" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(98,498,99);"><b><div id="a_area98">&nbsp;</div></b><input type="hidden"  id="a_stat98" name="a_stat98" value=""/><input type="hidden" id="a_xx98" name="a_xx98" value=""/><input type="hidden" id="a_yy98" name="a_yy98" value=""/></td>
								<td id="a_td_99" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(99,527,99);"><b><div id="a_area99">&nbsp;</div></b><input type="hidden"  id="a_stat99" name="a_stat99" value=""/><input type="hidden" id="a_xx99" name="a_xx99" value=""/><input type="hidden" id="a_yy99" name="a_yy99" value=""/></td>
								<td id="a_td_100" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(100,556,99);"><b><div id="a_area100">&nbsp;</div></b><input type="hidden"  id="a_stat100" name="a_stat100" value=""/><input type="hidden" id="a_xx100" name="a_xx100" value=""/><input type="hidden" id="a_yy100" name="a_yy100" value=""/></td>
							</tr>
							<tr>
								<td id="a_td_101" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(101,5,122);"><b><div id="a_area101">&nbsp;</div></b><input type="hidden"  id="a_stat101" name="a_stat101" value=""/><input type="hidden" id="a_xx101" name="a_xx101" value=""/><input type="hidden" id="a_yy101" name="a_yy101" value=""/></td>
								<td id="a_td_102" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(102,34,122);"><b><div id="a_area102">&nbsp;</div></b><input type="hidden"  id="a_stat102" name="a_stat102" value=""/><input type="hidden" id="a_xx102" name="a_xx102" value=""/><input type="hidden" id="a_yy102" name="a_yy102" value=""/></td>
								<td id="a_td_103" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(103,63,122);"><b><div id="a_area103">&nbsp;</div></b><input type="hidden"  id="a_stat103" name="a_stat103" value=""/><input type="hidden" id="a_xx103" name="a_xx103" value=""/><input type="hidden" id="a_yy103" name="a_yy103" value=""/></td>
								<td id="a_td_104" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(104,92,122);"><b><div id="a_area104">&nbsp;</div></b><input type="hidden"  id="a_stat104" name="a_stat104" value=""/><input type="hidden" id="a_xx104" name="a_xx104" value=""/><input type="hidden" id="a_yy104" name="a_yy104" value=""/></td>
								<td id="a_td_105" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(105,121,122);"><b><div id="a_area105">&nbsp;</div></b><input type="hidden"  id="a_stat105" name="a_stat105" value=""/><input type="hidden" id="a_xx105" name="a_xx105" value=""/><input type="hidden" id="a_yy105" name="a_yy105" value=""/></td>
								<td id="a_td_106" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(106,150,122);"><b><div id="a_area106">&nbsp;</div></b><input type="hidden"  id="a_stat106" name="a_stat106" value=""/><input type="hidden" id="a_xx106" name="a_xx106" value=""/><input type="hidden" id="a_yy106" name="a_yy106" value=""/></td>
								<td id="a_td_107" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(107,179,122);"><b><div id="a_area107">&nbsp;</div></b><input type="hidden"  id="a_stat107" name="a_stat107" value=""/><input type="hidden" id="a_xx107" name="a_xx107" value=""/><input type="hidden" id="a_yy107" name="a_yy107" value=""/></td>
								<td id="a_td_108" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(108,208,122);"><b><div id="a_area108">&nbsp;</div></b><input type="hidden"  id="a_stat108" name="a_stat108" value=""/><input type="hidden" id="a_xx108" name="a_xx108" value=""/><input type="hidden" id="a_yy108" name="a_yy108" value=""/></td>
								<td id="a_td_109" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(109,237,122);"><b><div id="a_area109">&nbsp;</div></b><input type="hidden"  id="a_stat109" name="a_stat109" value=""/><input type="hidden" id="a_xx109" name="a_xx109" value=""/><input type="hidden" id="a_yy109" name="a_yy109" value=""/></td>
								<td id="a_td_110" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(110,266,122);"><b><div id="a_area110">&nbsp;</div></b><input type="hidden"  id="a_stat110" name="a_stat110" value=""/><input type="hidden" id="a_xx110" name="a_xx110" value=""/><input type="hidden" id="a_yy110" name="a_yy110" value=""/></td>
								<td id="a_td_111" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(111,295,122);"><b><div id="a_area111">&nbsp;</div></b><input type="hidden"  id="a_stat111" name="a_stat111" value=""/><input type="hidden" id="a_xx111" name="a_xx111" value=""/><input type="hidden" id="a_yy111" name="a_yy111" value=""/></td>
								<td id="a_td_112" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(112,324,122);"><b><div id="a_area112">&nbsp;</div></b><input type="hidden"  id="a_stat112" name="a_stat112" value=""/><input type="hidden" id="a_xx112" name="a_xx112" value=""/><input type="hidden" id="a_yy112" name="a_yy112" value=""/></td>
								<td id="a_td_113" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(113,353,122);"><b><div id="a_area113">&nbsp;</div></b><input type="hidden"  id="a_stat113" name="a_stat113" value=""/><input type="hidden" id="a_xx113" name="a_xx113" value=""/><input type="hidden" id="a_yy113" name="a_yy113" value=""/></td>
								<td id="a_td_114" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(114,382,122);"><b><div id="a_area114">&nbsp;</div></b><input type="hidden"  id="a_stat114" name="a_stat114" value=""/><input type="hidden" id="a_xx114" name="a_xx114" value=""/><input type="hidden" id="a_yy114" name="a_yy114" value=""/></td>
								<td id="a_td_115" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(115,411,122);"><b><div id="a_area115">&nbsp;</div></b><input type="hidden"  id="a_stat115" name="a_stat115" value=""/><input type="hidden" id="a_xx115" name="a_xx115" value=""/><input type="hidden" id="a_yy115" name="a_yy115" value=""/></td>
								<td id="a_td_116" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(116,440,122);"><b><div id="a_area116">&nbsp;</div></b><input type="hidden"  id="a_stat116" name="a_stat116" value=""/><input type="hidden" id="a_xx116" name="a_xx116" value=""/><input type="hidden" id="a_yy116" name="a_yy116" value=""/></td>
								<td id="a_td_117" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(117,469,122);"><b><div id="a_area117">&nbsp;</div></b><input type="hidden"  id="a_stat117" name="a_stat117" value=""/><input type="hidden" id="a_xx117" name="a_xx117" value=""/><input type="hidden" id="a_yy117" name="a_yy117" value=""/></td>
								<td id="a_td_118" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(118,498,122);"><b><div id="a_area118">&nbsp;</div></b><input type="hidden"  id="a_stat118" name="a_stat118" value=""/><input type="hidden" id="a_xx118" name="a_xx118" value=""/><input type="hidden" id="a_yy118" name="a_yy118" value=""/></td>
								<td id="a_td_119" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(119,527,122);"><b><div id="a_area119">&nbsp;</div></b><input type="hidden"  id="a_stat119" name="a_stat119" value=""/><input type="hidden" id="a_xx119" name="a_xx119" value=""/><input type="hidden" id="a_yy119" name="a_yy119" value=""/></td>
								<td id="a_td_120" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(120,556,122);"><b><div id="a_area120">&nbsp;</div></b><input type="hidden"  id="a_stat120" name="a_stat120" value=""/><input type="hidden" id="a_xx120" name="a_xx120" value=""/><input type="hidden" id="a_yy120" name="a_yy120" value=""/></td>
							</tr>
							<tr>
								<td id="a_td_121" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(121,5,145);"><b><div id="a_area121">&nbsp;</div></b><input type="hidden"  id="a_stat121" name="a_stat121" value=""/><input type="hidden" id="a_xx121" name="a_xx121" value=""/><input type="hidden" id="a_yy121" name="a_yy121" value=""/></td>
								<td id="a_td_122" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(122,34,145);"><b><div id="a_area122">&nbsp;</div></b><input type="hidden"  id="a_stat122" name="a_stat122" value=""/><input type="hidden" id="a_xx122" name="a_xx122" value=""/><input type="hidden" id="a_yy122" name="a_yy122" value=""/></td>
								<td id="a_td_123" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(123,63,145);"><b><div id="a_area123">&nbsp;</div></b><input type="hidden"  id="a_stat123" name="a_stat123" value=""/><input type="hidden" id="a_xx123" name="a_xx123" value=""/><input type="hidden" id="a_yy123" name="a_yy123" value=""/></td>
								<td id="a_td_124" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(124,92,145);"><b><div id="a_area124">&nbsp;</div></b><input type="hidden"  id="a_stat124" name="a_stat124" value=""/><input type="hidden" id="a_xx124" name="a_xx124" value=""/><input type="hidden" id="a_yy124" name="a_yy124" value=""/></td>
								<td id="a_td_125" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(125,121,145);"><b><div id="a_area125">&nbsp;</div></b><input type="hidden"  id="a_stat125" name="a_stat125" value=""/><input type="hidden" id="a_xx125" name="a_xx125" value=""/><input type="hidden" id="a_yy125" name="a_yy125" value=""/></td>
								<td id="a_td_126" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(126,150,145);"><b><div id="a_area126">&nbsp;</div></b><input type="hidden"  id="a_stat126" name="a_stat126" value=""/><input type="hidden" id="a_xx126" name="a_xx126" value=""/><input type="hidden" id="a_yy126" name="a_yy126" value=""/></td>
								<td id="a_td_127" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(127,179,145);"><b><div id="a_area127">&nbsp;</div></b><input type="hidden"  id="a_stat127" name="a_stat127" value=""/><input type="hidden" id="a_xx127" name="a_xx127" value=""/><input type="hidden" id="a_yy127" name="a_yy127" value=""/></td>
								<td id="a_td_128" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(128,208,145);"><b><div id="a_area128">&nbsp;</div></b><input type="hidden"  id="a_stat128" name="a_stat128" value=""/><input type="hidden" id="a_xx128" name="a_xx128" value=""/><input type="hidden" id="a_yy128" name="a_yy128" value=""/></td>
								<td id="a_td_129" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(129,237,145);"><b><div id="a_area129">&nbsp;</div></b><input type="hidden"  id="a_stat129" name="a_stat129" value=""/><input type="hidden" id="a_xx129" name="a_xx129" value=""/><input type="hidden" id="a_yy129" name="a_yy129" value=""/></td>
								<td id="a_td_130" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(130,266,145);"><b><div id="a_area130">&nbsp;</div></b><input type="hidden"  id="a_stat130" name="a_stat130" value=""/><input type="hidden" id="a_xx130" name="a_xx130" value=""/><input type="hidden" id="a_yy130" name="a_yy130" value=""/></td>
								<td id="a_td_131" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(131,295,145);"><b><div id="a_area131">&nbsp;</div></b><input type="hidden"  id="a_stat131" name="a_stat131" value=""/><input type="hidden" id="a_xx131" name="a_xx131" value=""/><input type="hidden" id="a_yy131" name="a_yy131" value=""/></td>
								<td id="a_td_132" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(132,324,145);"><b><div id="a_area132">&nbsp;</div></b><input type="hidden"  id="a_stat132" name="a_stat132" value=""/><input type="hidden" id="a_xx132" name="a_xx132" value=""/><input type="hidden" id="a_yy132" name="a_yy132" value=""/></td>
								<td id="a_td_133" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(133,353,145);"><b><div id="a_area133">&nbsp;</div></b><input type="hidden"  id="a_stat133" name="a_stat133" value=""/><input type="hidden" id="a_xx133" name="a_xx133" value=""/><input type="hidden" id="a_yy133" name="a_yy133" value=""/></td>
								<td id="a_td_134" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(134,382,145);"><b><div id="a_area134">&nbsp;</div></b><input type="hidden"  id="a_stat134" name="a_stat134" value=""/><input type="hidden" id="a_xx134" name="a_xx134" value=""/><input type="hidden" id="a_yy134" name="a_yy134" value=""/></td>
								<td id="a_td_135" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(135,411,145);"><b><div id="a_area135">&nbsp;</div></b><input type="hidden"  id="a_stat135" name="a_stat135" value=""/><input type="hidden" id="a_xx135" name="a_xx135" value=""/><input type="hidden" id="a_yy135" name="a_yy135" value=""/></td>
								<td id="a_td_136" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(136,440,145);"><b><div id="a_area136">&nbsp;</div></b><input type="hidden"  id="a_stat136" name="a_stat136" value=""/><input type="hidden" id="a_xx136" name="a_xx136" value=""/><input type="hidden" id="a_yy136" name="a_yy136" value=""/></td>
								<td id="a_td_137" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(137,469,145);"><b><div id="a_area137">&nbsp;</div></b><input type="hidden"  id="a_stat137" name="a_stat137" value=""/><input type="hidden" id="a_xx137" name="a_xx137" value=""/><input type="hidden" id="a_yy137" name="a_yy137" value=""/></td>
								<td id="a_td_138" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(138,498,145);"><b><div id="a_area138">&nbsp;</div></b><input type="hidden"  id="a_stat138" name="a_stat138" value=""/><input type="hidden" id="a_xx138" name="a_xx138" value=""/><input type="hidden" id="a_yy138" name="a_yy138" value=""/></td>
								<td id="a_td_139" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(139,527,145);"><b><div id="a_area139">&nbsp;</div></b><input type="hidden"  id="a_stat139" name="a_stat139" value=""/><input type="hidden" id="a_xx139" name="a_xx139" value=""/><input type="hidden" id="a_yy139" name="a_yy139" value=""/></td>
								<td id="a_td_140" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(140,556,145);"><b><div id="a_area140">&nbsp;</div></b><input type="hidden"  id="a_stat140" name="a_stat140" value=""/><input type="hidden" id="a_xx140" name="a_xx140" value=""/><input type="hidden" id="a_yy140" name="a_yy140" value=""/></td>
							</tr>
							<tr>
								<td id="a_td_141" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(141,5,168);"><b><div id="a_area141">&nbsp;</div></b><input type="hidden"  id="a_stat141" name="a_stat141" value=""/><input type="hidden" id="a_xx141" name="a_xx141" value=""/><input type="hidden" id="a_yy141" name="a_yy141" value=""/></td>
								<td id="a_td_142" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(142,34,168);"><b><div id="a_area142">&nbsp;</div></b><input type="hidden"  id="a_stat142" name="a_stat142" value=""/><input type="hidden" id="a_xx142" name="a_xx142" value=""/><input type="hidden" id="a_yy142" name="a_yy142" value=""/></td>
								<td id="a_td_143" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(143,63,168);"><b><div id="a_area143">&nbsp;</div></b><input type="hidden"  id="a_stat143" name="a_stat143" value=""/><input type="hidden" id="a_xx143" name="a_xx143" value=""/><input type="hidden" id="a_yy143" name="a_yy143" value=""/></td>
								<td id="a_td_144" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(144,92,168);"><b><div id="a_area144">&nbsp;</div></b><input type="hidden"  id="a_stat144" name="a_stat144" value=""/><input type="hidden" id="a_xx144" name="a_xx144" value=""/><input type="hidden" id="a_yy144" name="a_yy144" value=""/></td>
								<td id="a_td_145" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(145,121,168);"><b><div id="a_area145">&nbsp;</div></b><input type="hidden"  id="a_stat145" name="a_stat145" value=""/><input type="hidden" id="a_xx145" name="a_xx145" value=""/><input type="hidden" id="a_yy145" name="a_yy145" value=""/></td>
								<td id="a_td_146" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(146,150,168);"><b><div id="a_area146">&nbsp;</div></b><input type="hidden"  id="a_stat146" name="a_stat146" value=""/><input type="hidden" id="a_xx146" name="a_xx146" value=""/><input type="hidden" id="a_yy146" name="a_yy146" value=""/></td>
								<td id="a_td_147" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(147,179,168);"><b><div id="a_area147">&nbsp;</div></b><input type="hidden"  id="a_stat147" name="a_stat147" value=""/><input type="hidden" id="a_xx147" name="a_xx147" value=""/><input type="hidden" id="a_yy147" name="a_yy147" value=""/></td>
								<td id="a_td_148" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(148,208,168);"><b><div id="a_area148">&nbsp;</div></b><input type="hidden"  id="a_stat148" name="a_stat148" value=""/><input type="hidden" id="a_xx148" name="a_xx148" value=""/><input type="hidden" id="a_yy148" name="a_yy148" value=""/></td>
								<td id="a_td_149" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(149,237,168);"><b><div id="a_area149">&nbsp;</div></b><input type="hidden"  id="a_stat149" name="a_stat149" value=""/><input type="hidden" id="a_xx149" name="a_xx149" value=""/><input type="hidden" id="a_yy149" name="a_yy149" value=""/></td>
								<td id="a_td_150" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(150,266,168);"><b><div id="a_area150">&nbsp;</div></b><input type="hidden"  id="a_stat150" name="a_stat150" value=""/><input type="hidden" id="a_xx150" name="a_xx150" value=""/><input type="hidden" id="a_yy150" name="a_yy150" value=""/></td>
								<td id="a_td_151" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(151,295,168);"><b><div id="a_area151">&nbsp;</div></b><input type="hidden"  id="a_stat151" name="a_stat151" value=""/><input type="hidden" id="a_xx151" name="a_xx151" value=""/><input type="hidden" id="a_yy151" name="a_yy151" value=""/></td>
								<td id="a_td_152" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(152,324,168);"><b><div id="a_area152">&nbsp;</div></b><input type="hidden"  id="a_stat152" name="a_stat152" value=""/><input type="hidden" id="a_xx152" name="a_xx152" value=""/><input type="hidden" id="a_yy152" name="a_yy152" value=""/></td>
								<td id="a_td_153" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(153,353,168);"><b><div id="a_area153">&nbsp;</div></b><input type="hidden"  id="a_stat153" name="a_stat153" value=""/><input type="hidden" id="a_xx153" name="a_xx153" value=""/><input type="hidden" id="a_yy153" name="a_yy153" value=""/></td>
								<td id="a_td_154" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(154,382,168);"><b><div id="a_area154">&nbsp;</div></b><input type="hidden"  id="a_stat154" name="a_stat154" value=""/><input type="hidden" id="a_xx154" name="a_xx154" value=""/><input type="hidden" id="a_yy154" name="a_yy154" value=""/></td>
								<td id="a_td_155" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(155,411,168);"><b><div id="a_area155">&nbsp;</div></b><input type="hidden"  id="a_stat155" name="a_stat155" value=""/><input type="hidden" id="a_xx155" name="a_xx155" value=""/><input type="hidden" id="a_yy155" name="a_yy155" value=""/></td>
								<td id="a_td_156" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(156,440,168);"><b><div id="a_area156">&nbsp;</div></b><input type="hidden"  id="a_stat156" name="a_stat156" value=""/><input type="hidden" id="a_xx156" name="a_xx156" value=""/><input type="hidden" id="a_yy156" name="a_yy156" value=""/></td>
								<td id="a_td_157" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(157,469,168);"><b><div id="a_area157">&nbsp;</div></b><input type="hidden"  id="a_stat157" name="a_stat157" value=""/><input type="hidden" id="a_xx157" name="a_xx157" value=""/><input type="hidden" id="a_yy157" name="a_yy157" value=""/></td>
								<td id="a_td_158" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(158,498,168);"><b><div id="a_area158">&nbsp;</div></b><input type="hidden"  id="a_stat158" name="a_stat158" value=""/><input type="hidden" id="a_xx158" name="a_xx158" value=""/><input type="hidden" id="a_yy158" name="a_yy158" value=""/></td>
								<td id="a_td_159" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(159,527,168);"><b><div id="a_area159">&nbsp;</div></b><input type="hidden"  id="a_stat159" name="a_stat159" value=""/><input type="hidden" id="a_xx159" name="a_xx159" value=""/><input type="hidden" id="a_yy159" name="a_yy159" value=""/></td>
								<td id="a_td_160" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(160,556,168);"><b><div id="a_area160">&nbsp;</div></b><input type="hidden"  id="a_stat160" name="a_stat160" value=""/><input type="hidden" id="a_xx160" name="a_xx160" value=""/><input type="hidden" id="a_yy160" name="a_yy160" value=""/></td>
							</tr>
							<tr>
								<td id="a_td_161" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(161,5,191);"><b><div id="a_area161">&nbsp;</div></b><input type="hidden"  id="a_stat161" name="a_stat161" value=""/><input type="hidden" id="a_xx161" name="a_xx161" value=""/><input type="hidden" id="a_yy161" name="a_yy161" value=""/></td>
								<td id="a_td_162" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(162,34,191);"><b><div id="a_area162">&nbsp;</div></b><input type="hidden"  id="a_stat162" name="a_stat162" value=""/><input type="hidden" id="a_xx162" name="a_xx162" value=""/><input type="hidden" id="a_yy162" name="a_yy162" value=""/></td>
								<td id="a_td_163" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(163,63,191);"><b><div id="a_area163">&nbsp;</div></b><input type="hidden"  id="a_stat163" name="a_stat163" value=""/><input type="hidden" id="a_xx163" name="a_xx163" value=""/><input type="hidden" id="a_yy163" name="a_yy163" value=""/></td>
								<td id="a_td_164" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(164,92,191);"><b><div id="a_area164">&nbsp;</div></b><input type="hidden"  id="a_stat164" name="a_stat164" value=""/><input type="hidden" id="a_xx164" name="a_xx164" value=""/><input type="hidden" id="a_yy164" name="a_yy164" value=""/></td>
								<td id="a_td_165" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(165,121,191);"><b><div id="a_area165">&nbsp;</div></b><input type="hidden"  id="a_stat165" name="a_stat165" value=""/><input type="hidden" id="a_xx165" name="a_xx165" value=""/><input type="hidden" id="a_yy165" name="a_yy165" value=""/></td>
								<td id="a_td_166" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(166,150,191);"><b><div id="a_area166">&nbsp;</div></b><input type="hidden"  id="a_stat166" name="a_stat166" value=""/><input type="hidden" id="a_xx166" name="a_xx166" value=""/><input type="hidden" id="a_yy166" name="a_yy166" value=""/></td>
								<td id="a_td_167" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(167,179,191);"><b><div id="a_area167">&nbsp;</div></b><input type="hidden"  id="a_stat167" name="a_stat167" value=""/><input type="hidden" id="a_xx167" name="a_xx167" value=""/><input type="hidden" id="a_yy167" name="a_yy167" value=""/></td>
								<td id="a_td_168" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(168,208,191);"><b><div id="a_area168">&nbsp;</div></b><input type="hidden"  id="a_stat168" name="a_stat168" value=""/><input type="hidden" id="a_xx168" name="a_xx168" value=""/><input type="hidden" id="a_yy168" name="a_yy168" value=""/></td>
								<td id="a_td_169" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(169,237,191);"><b><div id="a_area169">&nbsp;</div></b><input type="hidden"  id="a_stat169" name="a_stat169" value=""/><input type="hidden" id="a_xx169" name="a_xx169" value=""/><input type="hidden" id="a_yy169" name="a_yy169" value=""/></td>
								<td id="a_td_170" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(170,266,191);"><b><div id="a_area170">&nbsp;</div></b><input type="hidden"  id="a_stat170" name="a_stat170" value=""/><input type="hidden" id="a_xx170" name="a_xx170" value=""/><input type="hidden" id="a_yy170" name="a_yy170" value=""/></td>
								<td id="a_td_171" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(171,295,191);"><b><div id="a_area171">&nbsp;</div></b><input type="hidden"  id="a_stat171" name="a_stat171" value=""/><input type="hidden" id="a_xx171" name="a_xx171" value=""/><input type="hidden" id="a_yy171" name="a_yy171" value=""/></td>
								<td id="a_td_172" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(172,324,191);"><b><div id="a_area172">&nbsp;</div></b><input type="hidden"  id="a_stat172" name="a_stat172" value=""/><input type="hidden" id="a_xx172" name="a_xx172" value=""/><input type="hidden" id="a_yy172" name="a_yy172" value=""/></td>
								<td id="a_td_173" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(173,353,191);"><b><div id="a_area173">&nbsp;</div></b><input type="hidden"  id="a_stat173" name="a_stat173" value=""/><input type="hidden" id="a_xx173" name="a_xx173" value=""/><input type="hidden" id="a_yy173" name="a_yy173" value=""/></td>
								<td id="a_td_174" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(174,382,191);"><b><div id="a_area174">&nbsp;</div></b><input type="hidden"  id="a_stat174" name="a_stat174" value=""/><input type="hidden" id="a_xx174" name="a_xx174" value=""/><input type="hidden" id="a_yy174" name="a_yy174" value=""/></td>
								<td id="a_td_175" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(175,402,191);"><b><div id="a_area175">&nbsp;</div></b><input type="hidden"  id="a_stat175" name="a_stat175" value=""/><input type="hidden" id="a_xx175" name="a_xx175" value=""/><input type="hidden" id="a_yy175" name="a_yy175" value=""/></td>
								<td id="a_td_176" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(176,452,191);"><b><div id="a_area176">&nbsp;</div></b><input type="hidden"  id="a_stat176" name="a_stat176" value=""/><input type="hidden" id="a_xx176" name="a_xx176" value=""/><input type="hidden" id="a_yy176" name="a_yy176" value=""/></td>
								<td id="a_td_177" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(177,469,191);"><b><div id="a_area177">&nbsp;</div></b><input type="hidden"  id="a_stat177" name="a_stat177" value=""/><input type="hidden" id="a_xx177" name="a_xx177" value=""/><input type="hidden" id="a_yy177" name="a_yy177" value=""/></td>
								<td id="a_td_178" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(178,498,191);"><b><div id="a_area178">&nbsp;</div></b><input type="hidden"  id="a_stat178" name="a_stat178" value=""/><input type="hidden" id="a_xx178" name="a_xx178" value=""/><input type="hidden" id="a_yy178" name="a_yy178" value=""/></td>
								<td id="a_td_179" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(179,527,191);"><b><div id="a_area179">&nbsp;</div></b><input type="hidden"  id="a_stat179" name="a_stat179" value=""/><input type="hidden" id="a_xx179" name="a_xx179" value=""/><input type="hidden" id="a_yy179" name="a_yy179" value=""/></td>
								<td id="a_td_180" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(180,556,191);"><b><div id="a_area180">&nbsp;</div></b><input type="hidden"  id="a_stat180" name="a_stat180" value=""/><input type="hidden" id="a_xx180" name="a_xx180" value=""/><input type="hidden" id="a_yy180" name="a_yy180" value=""/></td>
							</tr>
							<tr>
								<td id="a_td_181" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(181,5,214);"><b><div id="a_area181">&nbsp;</div></b><input type="hidden"  id="a_stat181" name="a_stat181" value=""/><input type="hidden" id="a_xx181" name="a_xx181" value=""/><input type="hidden" id="a_yy181" name="a_yy181" value=""/></td>
								<td id="a_td_182" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(182,34,214);"><b><div id="a_area182">&nbsp;</div></b><input type="hidden"  id="a_stat182" name="a_stat182" value=""/><input type="hidden" id="a_xx182" name="a_xx182" value=""/><input type="hidden" id="a_yy182" name="a_yy182" value=""/></td>
								<td id="a_td_183" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(183,63,214);"><b><div id="a_area183">&nbsp;</div></b><input type="hidden"  id="a_stat183" name="a_stat183" value=""/><input type="hidden" id="a_xx183" name="a_xx183" value=""/><input type="hidden" id="a_yy183" name="a_yy183" value=""/></td>
								<td id="a_td_184" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(184,92,214);"><b><div id="a_area184">&nbsp;</div></b><input type="hidden"  id="a_stat184" name="a_stat184" value=""/><input type="hidden" id="a_xx184" name="a_xx184" value=""/><input type="hidden" id="a_yy184" name="a_yy184" value=""/></td>
								<td id="a_td_185" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(185,121,214);"><b><div id="a_area185">&nbsp;</div></b><input type="hidden"  id="a_stat185" name="a_stat185" value=""/><input type="hidden" id="a_xx185" name="a_xx185" value=""/><input type="hidden" id="a_yy185" name="a_yy185" value=""/></td>
								<td id="a_td_186" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(186,150,214);"><b><div id="a_area186">&nbsp;</div></b><input type="hidden"  id="a_stat186" name="a_stat186" value=""/><input type="hidden" id="a_xx186" name="a_xx186" value=""/><input type="hidden" id="a_yy186" name="a_yy186" value=""/></td>
								<td id="a_td_187" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(187,179,214);"><b><div id="a_area187">&nbsp;</div></b><input type="hidden"  id="a_stat187" name="a_stat187" value=""/><input type="hidden" id="a_xx187" name="a_xx187" value=""/><input type="hidden" id="a_yy187" name="a_yy187" value=""/></td>
								<td id="a_td_188" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(188,208,214);"><b><div id="a_area188">&nbsp;</div></b><input type="hidden"  id="a_stat188" name="a_stat188" value=""/><input type="hidden" id="a_xx188" name="a_xx188" value=""/><input type="hidden" id="a_yy188" name="a_yy188" value=""/></td>
								<td id="a_td_189" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(189,237,214);"><b><div id="a_area189">&nbsp;</div></b><input type="hidden"  id="a_stat189" name="a_stat189" value=""/><input type="hidden" id="a_xx189" name="a_xx189" value=""/><input type="hidden" id="a_yy189" name="a_yy189" value=""/></td>
								<td id="a_td_190" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(190,266,214);"><b><div id="a_area190">&nbsp;</div></b><input type="hidden"  id="a_stat190" name="a_stat190" value=""/><input type="hidden" id="a_xx190" name="a_xx190" value=""/><input type="hidden" id="a_yy190" name="a_yy190" value=""/></td>
								<td id="a_td_191" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(191,295,214);"><b><div id="a_area191">&nbsp;</div></b><input type="hidden"  id="a_stat191" name="a_stat191" value=""/><input type="hidden" id="a_xx191" name="a_xx191" value=""/><input type="hidden" id="a_yy191" name="a_yy191" value=""/></td>
								<td id="a_td_192" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(192,324,214);"><b><div id="a_area192">&nbsp;</div></b><input type="hidden"  id="a_stat192" name="a_stat192" value=""/><input type="hidden" id="a_xx192" name="a_xx192" value=""/><input type="hidden" id="a_yy192" name="a_yy192" value=""/></td>
								<td id="a_td_193" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(193,353,214);"><b><div id="a_area193">&nbsp;</div></b><input type="hidden"  id="a_stat193" name="a_stat193" value=""/><input type="hidden" id="a_xx193" name="a_xx193" value=""/><input type="hidden" id="a_yy193" name="a_yy193" value=""/></td>
								<td id="a_td_194" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(194,382,214);"><b><div id="a_area194">&nbsp;</div></b><input type="hidden"  id="a_stat194" name="a_stat194" value=""/><input type="hidden" id="a_xx194" name="a_xx194" value=""/><input type="hidden" id="a_yy194" name="a_yy194" value=""/></td>
								<td id="a_td_195" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(195,411,214);"><b><div id="a_area195">&nbsp;</div></b><input type="hidden"  id="a_stat195" name="a_stat195" value=""/><input type="hidden" id="a_xx195" name="a_xx195" value=""/><input type="hidden" id="a_yy195" name="a_yy195" value=""/></td>
								<td id="a_td_196" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(196,440,214);"><b><div id="a_area196">&nbsp;</div></b><input type="hidden"  id="a_stat196" name="a_stat196" value=""/><input type="hidden" id="a_xx196" name="a_xx196" value=""/><input type="hidden" id="a_yy196" name="a_yy196" value=""/></td>
								<td id="a_td_197" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(197,469,214);"><b><div id="a_area197">&nbsp;</div></b><input type="hidden"  id="a_stat197" name="a_stat197" value=""/><input type="hidden" id="a_xx197" name="a_xx197" value=""/><input type="hidden" id="a_yy197" name="a_yy197" value=""/></td>
								<td id="a_td_198" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(198,498,214);"><b><div id="a_area198">&nbsp;</div></b><input type="hidden"  id="a_stat198" name="a_stat198" value=""/><input type="hidden" id="a_xx198" name="a_xx198" value=""/><input type="hidden" id="a_yy198" name="a_yy198" value=""/></td>
								<td id="a_td_199" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(199,527,214);"><b><div id="a_area199">&nbsp;</div></b><input type="hidden"  id="a_stat199" name="a_stat199" value=""/><input type="hidden" id="a_xx199" name="a_xx199" value=""/><input type="hidden" id="a_yy199" name="a_yy199" value=""/></td>
								<td id="a_td_200" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(200,556,214);"><b><div id="a_area200">&nbsp;</div></b><input type="hidden"  id="a_stat200" name="a_stat200" value=""/><input type="hidden" id="a_xx200" name="a_xx200" value=""/><input type="hidden" id="a_yy200" name="a_yy200" value=""/></td>
							</tr>
						</table>
					</div>
				</div>
			</div><!-- //tab_content04 -->

			
			<div id="a_uscasttus_tab_2" style="display:none;">
				<div class="New_agbox">
	                <h2 class="tit"><span></span>외부부위 상태표시</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	                <table>
	                    <colgroup>
	                        <col width="20%" />
                            <col width="30%" />
                            <col width="20%" />
                            <col width="30%" />
	                    </colgroup>	                    
						<tr>
                            <th scope="row">후드</th>
                            <td>
                                <div id="a_s037">해당없음</div>
                            </td>
                            <th scope="row">프론드휀더</th>
                            <td class="last">
                                <div  id="a_s038">해당없음</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">도어</th>
                            <td>
                                <div id="a_s039">해당없음</div>
                            </td>
                            <th scope="row">트렁크리드</th>
                            <td class="last">
                                <div  id="a_s040">해당없음</div>
                            </td>
                        </tr>
	                </table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>주요골격 부위 상태표시</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	                <table>
	                    <colgroup>
	                        <col width="20%" />
                            <col width="30%" />
                            <col width="20%" />
                            <col width="30%" />
	                    </colgroup>	                    
						<tr>
                            <th scope="row">프론트패널</th>
                            <td>
                                <div  id="a_s045">해당없음</div>
                            </td>
                            <th scope="row">인사이드패널</th>
                            <td class="last">
                                <div  id="a_s047">해당없음</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">휠하우스</th>
                            <td>
                                <div  id="a_s049">해당없음</div>
                            </td>
                            <th scope="row">루프패널</th>
                            <td class="last">
                                <div  id="a_s042">해당없음</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">쿼터패널</th>
                            <td>
                                <div  id="a_s043">해당없음</div>
                            </td>
                            <th scope="row">플로어패널</th>
                            <td class="last">
                                <div  id="a_s051">해당없음</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">리어패널</th>
                            <td>
                                <div  id="a_s053">해당없음</div>
                            </td>
                            <th scope="row">사이드멤버</th>
                            <td class="last">
                                <div  id="a_s048">해당없음</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">크로스멤버</th>
                            <td>
                                <div  id="a_s046">해당없음</div>
                            </td>
                            <th scope="row">필러패널</th>
                            <td class="last">
                                <div  id="a_s052">해당없음</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">대쉬패널</th>
                            <td>
                                <div  id="a_s050">해당없음</div>
                            </td>
                            <th scope="row">트렁크플로어</th>
                            <td class="last">
                                <div  id="a_s054">해당없음</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">사이드실패널</th>
                            <td class="row">
                                <div  id="a_s044">해당없음</div>
                            </td>
                            <th scope="row">라디에이터 서포트 </th>
                            <td class="last">
                                <div  id="a_s041">해당없음</div>
                            </td>                                  
                        </tr>
	                </table>
	            </div>
	        </div>    
	        
			<div id="a_uscasttus_tab_3">
				<div class="New_agbox">
	                <h2 class="tit"><span></span>원동기 점검결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	                    <colgroup>
	                        <col style="width: 30%;">
	                        <col style="width: 20%;">
	                        <col style="width: 30%;">
	                        <col style="width: 20%;">
	                    </colgroup>
	                    <tr>
							<th scope="row">작동상태(공회전)</th>
							<td style="padding:5px">
								<div id="a_s001" name="a_s001">양호</div>
							</td>
							<th scope="row">압축상태(공회전)</th>
							<td style="padding:5px">
								<div id="a_s002">없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">오일누유 - 실린더 헤드</th>
							<td style="padding:5px">
								<div id="a_s003">없음</div>
							</td>
							<th scope="row">오일누유-실린더블럭</th>
                            <td class="row" style="padding:5px">
                                <div id="a_s004">없음</div>
                            </td>
                             
						</tr>
						<tr>
							<th scope="row">오일유량 및 오염</th>
                            <td class="last" style="padding:5px">
                                <div id="a_s005">적정</div>
                            </td>
                            <th scope="row">냉각수누수-실린더 블럭</th>
                            <td class="row" style="padding:5px">
                                <div id="a_s006">없음</div>
                            </td>
                        </tr>
						<tr>
							<th scope="row">냉각수누수-시린더 해드/가스켓</th>
                            <td class="last" style="padding:5px" colspan="3">
                                <div id="a_s007">없음</div>
                            </td>
                        </tr>
                        <tr>
                        	<th scope="row">냉각수누수-워터펌프</th>
                            <td style="padding:5px">
                                <div id="a_s008">없음</div>
                            </td>
                            <th scope="row">냉각수누수-냉각쿨러(라디에이터)</th>
                            <td class="last" style="padding:5px">
                                <div id="a_s009">없음</div>
                            </td>
                        </tr>
                        <tr>    
                            <th scope="row">냉각수 누수-냉각수량 및 오염</th>
                            <td style="padding:5px">
                                <div id="a_s010">적정</div>
                            </td>
                            <th scope="row">고압펌프(커먼레일)</th>
                            <td class="last" style="padding:5px">
                                <div id="a_s011">양호</div>
                            </td>
                        </tr>
	                </table>    
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>동력전달장치 점검결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	                    <colgroup>
							<col width="30%"/>
							<col width="20%"/>
							<col width="30%"/>
							<col width="20%"/>
						</colgroup>
						<tr>
                            <th scope="row">자동변속기(A/T)-오일누유</th>
                            <td style="padding:5px">
                                <div  id="a_s012">없음</div>
                            </td>
                            <th scope="row">자동변속기(A/T)-오일유량및상태</th>
                            <td class="last" style="padding:5px">
                                <div  id="a_s013">적정</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">자동변속기(A/T)-스톨시험(전진)</th>
                            <td style="padding:5px">
                                <div  id="a_s014">양호</div>
                            </td>
                            <th scope="row">자동변속기(A/T)-스톨시험(후진)</th>
                            <td class="last" style="padding:5px">
                                <div  id="a_s015">양호</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">자동변속기(A/T)-작동상태(공회전)</th>
                            <td colspan=3 class="last" style="padding:5px">
                                <div  id="a_s016">양호</div>
                            </td>
                        </tr>                            
                        
                        <tr>
                            <th scope="row">수동변속기(M/T)-오일누유</th>
                            <td colspan=3 class="last" style="padding:5px">
                                <div  id="a_s017" name="a_s017">없음</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">수동변속기(M/T)-기어변속장치</th>
                            <td colspan=3 class="last" style="padding:5px">
                                <div  id="a_s018">양호</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">수동변속기(M/T)-오일유량및상태</th>
                            <td style="padding:5px">
                                <div  id="a_s019">적정</div>
                            </td>
                            <th scope="row">수동변속기(M/T)-작동상태(공회전)</th>
                            <td class="last" style="padding:5px">
                                <div  id="a_s020">양호</div>
                            </td>
                        </tr>
                        <!--  동력전달  -->
                        <tr>
                            <th scope="row">동력전달-클러치 어셈블러</th>
                            <td class="last" colspan="3" style="padding:5px">
                                <div  id="a_s021">양호</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">동력전달-등속죠인트</th>
                            <td class="last" colspan="3" style="padding:5px">
                                <div  id="a_s022">양호</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">동력전달-추진축 및 베어링</th>
                            <td class="last" colspan=3 style="padding:5px">
                                <div  id="a_s023">양호</div>
                            </td>
                        </tr>                      
						
	                </table> 
	            </div>
	        </div>   
	        
	        <div id="a_uscasttus_tab_4" style="display:none;">
				<div class="New_agbox">
	                <h2 class="tit"><span></span>조향장치 점걸결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="30%"/>
						<col width="70%"/>
					</colgroup>
					<tr>
                        <th scope="row">동력조향 작동 오일 누유</th>
                        <td class="last" style="padding:5px">
                            <div  id="a_s024" name="a_s024">없음</div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">작동상태 - 스티어링 기어</th>
                        <td class="last" style="padding:5px">
                            <div  id="a_s025" name="a_s025">양호</div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">작동상태 - 스티어링 펌프</th>
                        <td class="last" style="padding:5px">
                            <div  id="a_s026" name="a_s026">양호</div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">타이로드앤드 및 볼 죠인트</th>
                        <td class="last" style="padding:5px">
                            <div  id="a_s027" name="a_s027">양호</div>
                        </td>
                    </tr>
					</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>제동장치 점검결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="30%"/>
						<col width="20%"/>
						<col width="30%"/>
						<col width="20%"/>
					</colgroup>
					<tr>
                        <th scope="row">브레이크 오일 유량</th>
                            <td style="padding:5px">
                            <div id="a_s028" >적정</div>
                        </td>
                        <th scope="row">브레이크 오일 누유</th>
                        <td class="last" style="padding:5px">
                            <div id="a_s029" >없음</div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">배력장치 작동상태</th>
                        <td class="last" colspan="3" style="padding:5px">
                            <div id="a_s030">양호</div>
                        </td>
                    </tr>
					</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>전기장치 점검결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
                        <col width="30%"/>
                        <col width="20%"/>
                        <col width="30%"/>
                        <col width="20%"/>
                    </colgroup>                    
                    <tr>
                        <th scope="row">발전기 출력</th>
                        <td style="padding:5px">
                            <div id="a_s031">양호</div>
                        </td>
                        <th scope="row">와이퍼모터기능</th>
                        <td class="row" style="padding:5px">
                            <div id="a_s032">양호</div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">실내송풍모터</th>
                        <td class="last" style="padding:5px">
                            <div id="a_s033">양호</div>
                        </td>
                        <th scope="row">라디에이터 팬 모터</th>
                        <td colspan=3 class="last" style="padding:5px" >
                            <div id="a_s034">양호</div>
                        </td>  
                    </tr>
                    </table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>기타장치 점검결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
                        <col width="30%"/>
                        <col width="20%"/>
                        <col width="30%"/>
                        <col width="20%"/>
                    </colgroup>                    
                    <tr>
                        <th scope="row">연료누출(LP가스포함)</th>
                        <td style="padding:5px">
                            <div id="a_s035" name="a_s035">없음</div>
                        </td>
                        <th scope="row">원도우모터작동</th>
                        <td class="last">
                            <div id="a_s036">양호</div>
                        </td>
                    </tr>                    
                    </table>
	            </div>
	        </div> 
	        
	        <div id="a_uscasttus_tab_5" style="display:none;">
				<div class="New_agbox">
	                <h2 class="tit"><span></span>고지정보</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="19%" />
						<col width="31%" />
						<col width="19%" />
						<col width="31%" />
					</colgroup>
					<tbody>
					<tr>
						<th scope="row">접수자(명칭)</th>
						<td><em id="a_usca_register_nm_txt" name="a_usca_register_nm_txt"></em></td>
						<th scope="row">접수일</th>
						<td><em id="a_usca_r_rcept_de_txt" name="a_usca_r_rcept_de_txt"></em></td>
					</tr>
					<tr>
						<th scope="row">고지업체명</th>
						<td><em id="a_usca_ntic_entrps_nm" name="a_usca_ntic_entrps_nm"></em></td>
						<th scope="row">고지자명</th>
						<td><em id="a_usca_ntic_person_nm_txt" name="a_usca_ntic_person_nm_txt"></em></td>
					</tr>
	            	</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>점검정보</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="19%" />
						<col width="31%" />
						<col width="19%" />
						<col width="31%" />
					</colgroup>
					<tbody>
					<tr>
						<th scope="row">등록번호</th>
					  	<td>
					  		<em id="a_usca_chck_imprmn_entrps_id"></em>
					  	</td>
						<th scope="row">등록업체명</th>
						<td class="last">
							<em id="a_usca_chck_entrps_nm"></em>
						</td>
					</tr>
					<tr>
						<th scope="row">점검일</th>
						<td>
							<em id="a_usca_chck_de"></em>
						</td>
						<th scope="row">점검자명</th>
						<td class="last">
							<em id="a_usca_insctr_nm"></em>
						</td>
					</tr>
	            	</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>매수정보</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="19%" />
						<col width="31%" />
						<col width="19%" />
						<col width="31%" />
					</colgroup>
					<tbody>
					<tr>
						<th scope="row">매수일</th>
						<td>
							<em id="a_usca_buyer_de"></em>
						</td>
						<th scope="row">매수인명</th>
						<td>
							<em id="a_usca_buyer_nm"></em>
						</td>
					</tr>
	            	</table>
	            </div>
	            
	             <div class="New_agbox">
	                <h2 class="tit"><span></span>특기사항 및 점검자의 의견</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<tr>
                        <td class="last">
                            <em id="a_usca_etc_matter"></em>
                        </td>
                    </tr>
	            	</table>
	            </div>
	        </div>
        </div>
        
    </div>
    <div class="popup_add_btn" id="a_uscaSttus_close_btn"><a href="#none">확인</a></div>
    </div>
</div><script>

$(document).on('click','#b_item1',function(){
	$('#b_uscasttus_tab_1').show();
	$('#b_uscasttus_tab_2').hide();
	$('#b_uscasttus_tab_3').hide();
	$('#b_uscasttus_tab_4').hide();
	$('#b_uscasttus_tab_5').hide();
});
$(document).on('click','#b_item2',function(){
	$('#b_uscasttus_tab_1').hide();
	$('#b_uscasttus_tab_2').show();
	$('#b_uscasttus_tab_3').hide();
	$('#b_uscasttus_tab_4').hide();
	$('#b_uscasttus_tab_5').hide();
});
$(document).on('click','#b_item3',function(){
	$('#b_uscasttus_tab_1').hide();
	$('#b_uscasttus_tab_2').hide();
	$('#b_uscasttus_tab_3').show();
	$('#b_uscasttus_tab_4').hide();
	$('#b_uscasttus_tab_5').hide();
});
$(document).on('click','#b_item4',function(){
	$('#b_uscasttus_tab_1').hide();
	$('#b_uscasttus_tab_2').hide();
	$('#b_uscasttus_tab_3').hide();
	$('#b_uscasttus_tab_4').show();
	$('#b_uscasttus_tab_5').hide();
});
$(document).on('click','#b_item5',function(){
	$('#b_uscasttus_tab_1').hide();
	$('#b_uscasttus_tab_2').hide();
	$('#b_uscasttus_tab_3').hide();
	$('#b_uscasttus_tab_4').hide();
	$('#b_uscasttus_tab_5').show();
});

$(function(){
	$("#b_uscaSttus_close").click(function() {
	    $("#b_popup_uscaSttus").hide();
	});
	
	$("#b_uscaSttus_close_btn").click(function() {
	    $("#b_popup_uscaSttus").hide();
	});
});

var b_M01_  = ''; var b_M01_1 = '승용'; var b_M01_2 = '승합'; var b_M01_3 = '화물'; var b_M01_4 = '특수'; var b_M01_5 = '이륜'; var b_M01_6 = '피견인'; var b_M01_9 = '기타';
var b_M02_ = ''; var b_M02_0 = '작동'; var b_M02_1 = '작동불량'; 
var b_M03_ = ''; var b_M03_A = '자동'; var b_M03_C = '무단변속기'; var b_M03_M = '수동'; var b_M03_S = '세미오토'; var b_M03_X = '기타';
var b_M04_ = ''; var b_M04_1 = '자가 보증'; var b_M04_2 = '보험사 보증';
var b_M05_ = ''; var b_M05_1 = '양호'; var b_M05_2 = '상이'; var b_M05_3 = '부식'; var b_M05_4 = '훼손(오손)'; var b_M05_5 = '변조(변타)'; var b_M05_6 = '도말';
var b_M06_ = ''; var b_M06_0 = '없음'; var b_M06_1 = '있음'; var b_M06_2 = '불법';
var b_M07_ = ''; var b_M07_0 = '무'; var b_M07_1 = '유'; 
var b_M08_ = ''; var b_M08_1 = '양호'; var b_M08_2 = '정비요';
var b_M09_ = ''; var b_M09_1 = '양호'; var b_M09_2 = '정비요';
var b_M10_ = ''; var b_M10_a = '가솔린'; var b_M10_b = '디젤'; var b_M10_c = 'LPG'; var b_M10_d = '전기'; var b_M10_e = '수소전기'; var b_M10_x = '하이브리드'; var b_M10_z = '기타';
var b_M11_ = ''; var b_M11_0 = '무'; var b_M11_1 = '유';


var b_s001_1='양호'; var b_s001_3='소음'; var b_s001_4='정비요'; var b_s001_5='불량';

var b_s003_1='없음'; var b_s003_2='미세누유'; var b_s003_3='누유'; var b_s003_4='정비요';
var b_s004_1='없음'; var b_s004_2='미세누유'; var b_s004_3='누유'; var b_s004_4='정비요';
var b_s005_1='적정'; var b_s005_2='부족'; var b_s005_3='오염'; var b_s005_4='교환요';
var b_s006_1='없음'; var b_s006_2='미세누수'; var b_s006_3='정비요';
var b_s007_1='없음'; var b_s007_2='미세누수'; var b_s007_3='누수';
var b_s008_1='없음'; var b_s008_2='미세누수'; var b_s008_3='누수';
var b_s009_1='없음'; var b_s009_2='미세누수'; var b_s009_3='누수';
var b_s010_1='적정'; var b_s010_2='부족'; var b_s010_3='오염'; var b_s010_4='교환요(부식)';
var b_s011_1='양호'; var b_s011_2='정비요'; var b_s011_3='불량';
var b_s012_1='없음'; var b_s012_2='미세누유'; var b_s012_3='누유';
var b_s013_1='적정'; var b_s013_2='부족'; var b_s013_3='과다'; var b_s013_4='오염(희석)';
var b_s016_1='양호'; var b_s016_2='지연'; var b_s016_3='소음'; var b_s016_5='충격'; var b_s016_6='불량';
var b_s017_1='없음'; var b_s017_2='미세누유'; var b_s017_3='누유'; var b_s017_4='정비요';
var b_s018_1='양호'; var b_s018_2='물림/빠짐이상'; var b_s018_3='소음'; var b_s018_4='정비요'; var b_s018_5='불량';
var b_s019_1='적정'; var b_s019_2='부족'; var b_s019_3='과다'; var b_s019_4='오염(희석)';
var b_s020_1='양호'; var b_s020_4='정비요'; var b_s020_5='이상'; var b_s020_6='불량';
var b_s021_1='양호'; var b_s021_2='누유'; var b_s021_3='슬립'; var b_s021_4='소음'; var b_s021_5='정비요'; var b_s021_6='이상'; var b_s021_7='불량';
var b_s022_1='양호'; var b_s022_2='고무부트손상'; var b_s022_3='정비요'; var b_s022_4='불량';
var b_s023_1='양호'; var b_s023_2='소음'; var b_s023_3='유격'; var b_s023_4='정비요'; var b_s023_5='불량';
var b_s024_1='없음'; var b_s024_2='미세누유'; var b_s024_3='누유'; var b_s024_4='정비요'; 
var b_s025_1='양호'; var b_s025_2='소음'; var b_s025_3='유격'; var b_s025_5='불량';
var b_s026_1='양호'; var b_s026_2='소음'; var b_s026_4='불량';
var b_s027_1='양호'; var b_s027_2='정비요'; var b_s027_3='불량';
var b_s028_1='적정'; var b_s028_2='부족'; var b_s028_3='오염'; var b_s028_4='교환요';
var b_s029_1='없음'; var b_s029_2='정비요'; var b_s029_3='누유'; var b_s029_4='미세누유';
var b_s030_1='양호'; var b_s030_2='정비요'; var b_s030_3='불량';
var b_s031_1='양호'; var b_s031_2='정비요'; var b_s031_3='불량';
var b_s032_1='양호'; var b_s032_2='정비요'; var b_s032_3='불량';
var b_s033_1='양호'; var b_s033_2='소음'; var b_s033_3='정비요'; var b_s033_4='불량';
var b_s034_1='양호'; var b_s034_2='소음'; var b_s034_3='정비요'; var b_s034_4='불량';
var b_s035_1='없음'; var b_s035_2='있음';
var b_s036_1='양호'; var b_s036_2='소음'; var b_s036_3='정비요'; var b_s036_4='불량';
var b_s037_1='해당없음'; var b_s037_2='교환(교체)'; var b_s037_3='판금,용접'; var b_s037_4='부식';
var b_s038_1='해당없음'; var b_s038_2='교환(교체)'; var b_s038_3='판금,용접'; var b_s038_4='부식';
var b_s039_1='해당없음'; var b_s039_2='교환(교체)'; var b_s039_3='판금,용접'; var b_s039_4='부식';
var b_s040_1='해당없음'; var b_s040_2='교환(교체)'; var b_s040_3='판금,용접'; var b_s040_4='부식';
var b_s041_1='해당없음'; var b_s041_2='교환(교체)'; var b_s041_3='판금,용접'; var b_s041_4='부식';
var b_s042_1='해당없음'; var b_s042_2='교환(교체)'; var b_s042_3='판금,용접'; var b_s042_4='부식';
var b_s043_1='해당없음'; var b_s043_2='교환(교체)'; var b_s043_3='판금,용접'; var b_s043_4='부식';
var b_s044_1='해당없음'; var b_s044_2='교환(교체)'; var b_s044_3='판금,용접'; var b_s044_4='부식';
var b_s045_1='해당없음'; var b_s045_2='교환(교체)'; var b_s045_3='판금,용접'; var b_s045_4='부식';
var b_s046_1='해당없음'; var b_s046_2='교환(교체)'; var b_s046_3='판금,용접'; var b_s046_4='부식';
var b_s047_1='해당없음'; var b_s047_2='교환(교체)'; var b_s047_3='판금,용접'; var b_s047_4='부식';
var b_s048_1='해당없음'; var b_s048_2='교환(교체)'; var b_s048_3='판금,용접'; var b_s048_4='부식';
var b_s049_1='해당없음'; var b_s049_2='교환(교체)'; var b_s049_3='판금,용접'; var b_s049_4='부식';
var b_s050_1='해당없음'; var b_s050_2='교환(교체)'; var b_s050_3='판금,용접'; var b_s050_4='부식';
var b_s051_1='해당없음'; var b_s051_2='교환(교체)'; var b_s051_3='판금,용접'; var b_s051_4='부식';
var b_s052_1='해당없음'; var b_s052_2='교환(교체)'; var b_s052_3='판금,용접'; var b_s052_4='부식';
var b_s053_1='해당없음'; var b_s053_2='교환(교체)'; var b_s053_3='판금,용접'; var b_s053_4='부식';
var b_s054_1='해당없음'; var b_s054_2='교환(교체)'; var b_s054_3='판금,용접'; var b_s054_4='부식';
var b_s055_1='양호'; var b_s055_2='정비요'; var b_s055_3='불량'; 
var b_s056_1='해당없음'; var b_s056_2='교환(교체)'; var b_s056_3='판금,용접'; var b_s056_4='부식'; 


</script>

<div id="b_popup_uscaSttus" style="display: none;">
 <div class="popup_contents popup_full_popup">
     <div class="popup_title popup_full_title">
         <span>중고차성능상태점검기록부 상세</span>
         <button type="button" class="close" id="b_uscaSttus_close"> <span onclick="">×</span> </button>
     </div>
     <div class="popup_full_box">
         <div class="popup_full_sub_box">
             <!--                세부내역 넣는곳-->
             <div class="New_agbox">
                 <h2 class="tit"><span></span>자동차 기본정보</h2>
             </div>
             <div class="tblwrap_basic">
                 <table>
                     <colgroup>
                         <col style="width: 14%;">
                         <col style="width: 23%;">
                         <col style="width: 13%;">
                         <col style="width: 19%;">
                         <col style="width: 11%;">
                         <col style="width: 19%;">
                     </colgroup>
                     <tr>
                         <th>접수번호</th>
                         <td colspan="5" id="b_usca_recpt_no"></td>
                     </tr>
                     <tr>
                         <th>차량등록번호</th>
                         <td id="b_usca_vhrno"></td>
                         <th>차종</th>
                         <td id="b_usca_vhcty_asort_code"></td>
                         <th>차명</th>
                         <td id="b_usca_cnm">
                         </td>
                     </tr>
                     <tr>
                         <th>최초등록일</th>
                         <td id="b_usca_frst_regist_de"></td>
                         <th>연식</th>
                         <td id="b_usca_prye"></td>
                         <th>원동기형식</th>
                         <td id="b_usca_mtrs_fom"></td>
                         
                         
                     </tr>
                     <tr>
                         <th>차대변호</th>
                         <td id="b_usca_vin"></td>
                         <th>검사유효기간</th>
                         <td colspan="3" id="b_usca_inspt_valid_pd_de"></td>
                     </tr>                                         
                 </table>
             </div>
             
             <div class="New_agbox">
                 <h2 class="tit"><span></span>점검사항</h2>
             </div>
             
             <div class="tblwrap_basic">
                 <table>
                     <colgroup>
                         <col width="15%" />
                         <col width="18%" />
                         <col width="15%" />
                         <col width="18%" />
                         <col width="15%" />
                         <col width="18%" />
                     </colgroup>
                     <tr>
                         <th scope="row">주행거리</th>
                         <td>
                             <div name='b_usca_trvl_dstnc' id='b_usca_trvl_dstnc'></div>
                         </td>
                         <th scope="row">계기상태</th>
                         <td>
                             <div id="b_usca_gauge_fnct_at"></div>
                         </td>
                         <th scope="row">동일성확인<br />(차대번호표기)</th>
                         <td>
                             <div id="b_usca_samenss_cnfirm_code"></div>
                         </td>
                     </tr>
                     <tr>
                         <th scope="row">보증 유형</th>
                         <td>
                             <div id="b_usca_assrnc_ty_se_code"></div>
                         </td>
                         <th scope="row">변속기 종류</th>
                         <td colspan=3 >
                             <div id="b_usca_grbx_knd_code"></div>
                             <div id="b_usca_grbx_knd_dtls"></div>                
                         </td>
                     </tr>   
                     <tr>
                         <th scope="row">불법구조변경</th>
                         <td class="row">
                             <div id="b_usca_unlaw_stmd_at"></div>
                         </td>            
                         <th scope="row">사고유무<br />(단순수리제외)</th>
                         <td class="row">
                             <div id="b_usca_acdnt_at"></div>
                         </td>
                         <th scope="row">침수유무<br />(단순수리제외)</th>
                         <td>
                             <div id="b_usca_flud_at"></div>
                         </td>
                     </tr>                    
                 </table>
             </div>
             
             <div class="New_agbox">
                 <h2 class="tit"><span></span>자기진단사항</h2>
             </div>
             
             <div class="tblwrap_basic">
                 <table>
                     <colgroup>
                         <col style="width: 30%;">
                         <col style="width: 70%;">
                     </colgroup>
                     <tr>
                         <th>엔진</th>
                         <td id="b_usca_engine_stblt_at"></td>
                     </tr>
                     <tr>
                         <th>변속기</th>
                         <td id="b_usca_grbx_stblt_at"></td>
                     </tr>
                 </table>
             </div>
              
             <div class="New_agbox">
                 <h2 class="tit"><span></span>배출가스</h2>
             </div>
                             
             <div class="tblwrap_basic">
                 <table>
                     <colgroup>
                         <col style="width: 30%;">
                         <col style="width: 70%;">
                     </colgroup>
                     <tr>
                         <th>일산화탄소(CO)</th>
                         <td id="b_usca_crmn_mesure_value"></td>
                     </tr>
                     <tr>
                         <th>탄화수소(HC)</th>
                         <td id="b_usca_hydr_mesure_value"></td>
                     </tr>
                     <tr>
                         <th>매연</th>
                         <td id="b_usca_smoke_mesure_value"></td>
                     </tr>
                 </table>
             </div>             
                          
             <div class="New_agbox">
                 <h2 class="tit"><span></span>경정사유</h2>
             </div>
             
             <div class="tblwrap_basic">
                 <table>
                     <tr>
                         <td><em id="b_usca_upd_reason_txt"></em></td>
                     </tr>
                 </table>
             </div>
             <br/><br/>
             
             
             <div class="tab_box01">
				<div class="box_layout">
					<ul class="New_tbls">
						<li class="tbl_cell">
							<label class="box-radio-input">
								<input type="radio" name="b_item1" id="b_item3" checked="checked">
								<span style="font-size: 8px;">원동기/동력전달</span>
							</label>
						</li>
						<li class="tbl_cell">
							<label class="box-radio-input">
								<input type="radio" name="b_item1" id="b_item4">
								<span style="font-size: 8px;">조향/제동/전기</span>
							</label>
						</li>
						<li class="tbl_cell">
							<label class="box-radio-input">
								<input type="radio" name="b_item1" id="b_item2">
								<span style="font-size: 8px;">외판/주요골격</span>
							</label>
						</li>
						
						<li class="tbl_cell">
							<label class="box-radio-input">
								<input type="radio" name="b_item1" id="b_item1">
								<span style="font-size: 8px;">자동차의 상태표시</span>
							</label>
						</li>
						<li class="tbl_cell">
							<label class="box-radio-input">
								<input type="radio" name="b_item1" id="b_item5">
								<span style="font-size: 8px;">처리정보</span>
							</label>
						</li>
					</ul>
				</div>
			</div>
			
			<div id="b_uscasttus_tab_1" style="display:none;">
				<h5 style="text-align:left;">상태표시부호</h5>
				<p style="text-align:left;">
				<strong style="color:blue;">X</strong> : 교환(교체), 
                <strong style="color:red;">W</strong> : 판금,용접, 
                <strong style="color:green;">C</strong> : 부식 / ※ 승용차 외에는 승용차에 준하여 표시<br />
				</p>
				<br />
										
				<div style="width:650px; height:289px; background:url('/resource/common_dz/images/ao_car_state_new.gif'); text-align:center; padding-top:32px;">
					<div id="b_markArea" style="position:relative; width:580px; height:230px; margin:0 auto;">
						<table id="b_markAreaTable" cellpadding="0" cellspacing="0" border="0" width="580px" height="230px" bordercolor="#000000" >
							<colgroup>
								<col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" />
								<col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" />
								<col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" />
								<col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" />
							</colgroup>
			
							<tr>
								<td id="b_td_1" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(1,5,7);"><b><div id="b_area1">&nbsp;</div></b><input type="hidden"  id="b_stat1" name="b_stat1" value=""/><input type="hidden" id="b_xx1" name="b_xx1" value=""/><input type="hidden" id="b_yy1" name="b_yy1" value=""/></td>
								<td id="b_td_2" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(2,34,7);"><b><div id="b_area2">&nbsp;</div></b><input type="hidden"  id="b_stat2" name="b_stat2" value=""/><input type="hidden" id="b_xx2" name="b_xx2" value=""/><input type="hidden" id="b_yy2" name="b_yy2" value=""/></td>
								<td id="b_td_3" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(3,63,7);"><b><div id="b_area3">&nbsp;</div></b><input type="hidden"  id="b_stat3" name="b_stat3" value=""/><input type="hidden" id="b_xx3" name="b_xx3" value=""/><input type="hidden" id="b_yy3" name="b_yy3" value=""/></td>
								<td id="b_td_4" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(4,92,7);"><b><div id="b_area4">&nbsp;</div></b><input type="hidden"  id="b_stat4" name="b_stat4" value=""/><input type="hidden" id="b_xx4" name="b_xx4" value=""/><input type="hidden" id="b_yy4" name="b_yy4" value=""/></td>
								<td id="b_td_5" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(5,121,7);"><b><div id="b_area5">&nbsp;</div></b><input type="hidden"  id="b_stat5" name="b_stat5" value=""/><input type="hidden" id="b_xx5" name="b_xx5" value=""/><input type="hidden" id="b_yy5" name="b_yy5" value=""/></td>
								<td id="b_td_6" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(6,150,7);"><b><div id="b_area6">&nbsp;</div></b><input type="hidden"  id="b_stat6" name="b_stat6" value=""/><input type="hidden" id="b_xx6" name="b_xx6" value=""/><input type="hidden" id="b_yy6" name="b_yy6" value=""/></td>
								<td id="b_td_7" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(7,179,7);"><b><div id="b_area7">&nbsp;</div></b><input type="hidden"  id="b_stat7" name="b_stat7" value=""/><input type="hidden" id="b_xx7" name="b_xx7" value=""/><input type="hidden" id="b_yy7" name="b_yy7" value=""/></td>
								<td id="b_td_8" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(8,208,7);"><b><div id="b_area8">&nbsp;</div></b><input type="hidden"  id="b_stat8" name="b_stat8" value=""/><input type="hidden" id="b_xx8" name="b_xx8" value=""/><input type="hidden" id="b_yy8" name="b_yy8" value=""/></td>
								<td id="b_td_9" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(9,230,7);"><b><div id="b_area9">&nbsp;</div></b><input type="hidden"  id="b_stat9" name="b_stat9" value=""/><input type="hidden" id="b_xx9" name="b_xx9" value=""/><input type="hidden" id="b_yy9" name="b_yy9" value=""/></td>
								<td id="b_td_10" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(10,266,7);"><b><div id="b_area10">&nbsp;</div></b><input type="hidden"  id="b_stat10" name="b_stat10" value=""/><input type="hidden" id="b_xx10" name="b_xx10" value=""/><input type="hidden" id="b_yy10" name="b_yy10" value=""/></td>
								<td id="b_td_11" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(11,295,7);"><b><div id="b_area11">&nbsp;</div></b><input type="hidden"  id="b_stat11" name="b_stat11" value=""/><input type="hidden" id="b_xx11" name="b_xx11" value=""/><input type="hidden" id="b_yy11" name="b_yy11" value=""/></td>
								<td id="b_td_12" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(12,324,7);"><b><div id="b_area12">&nbsp;</div></b><input type="hidden"  id="b_stat12" name="b_stat12" value=""/><input type="hidden" id="b_xx12" name="b_xx12" value=""/><input type="hidden" id="b_yy12" name="b_yy12" value=""/></td>
								<td id="b_td_13" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(13,353,7);"><b><div id="b_area13">&nbsp;</div></b><input type="hidden"  id="b_stat13" name="b_stat13" value=""/><input type="hidden" id="b_xx13" name="b_xx13" value=""/><input type="hidden" id="b_yy13" name="b_yy13" value=""/></td>
								<td id="b_td_14" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(14,382,7);"><b><div id="b_area14">&nbsp;</div></b><input type="hidden"  id="b_stat14" name="b_stat14" value=""/><input type="hidden" id="b_xx14" name="b_xx14" value=""/><input type="hidden" id="b_yy14" name="b_yy14" value=""/></td>
								<td id="b_td_15" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(15,411,7);"><b><div id="b_area15">&nbsp;</div></b><input type="hidden"  id="b_stat15" name="b_stat15" value=""/><input type="hidden" id="b_xx15" name="b_xx15" value=""/><input type="hidden" id="b_yy15" name="b_yy15" value=""/></td>
								<td id="b_td_16" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(16,440,7);"><b><div id="b_area16">&nbsp;</div></b><input type="hidden"  id="b_stat16" name="b_stat16" value=""/><input type="hidden" id="b_xx16" name="b_xx16" value=""/><input type="hidden" id="b_yy16" name="b_yy16" value=""/></td>
								<td id="b_td_17" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(17,469,7);"><b><div id="b_area17">&nbsp;</div></b><input type="hidden"  id="b_stat17" name="b_stat17" value=""/><input type="hidden" id="b_xx17" name="b_xx17" value=""/><input type="hidden" id="b_yy17" name="b_yy17" value=""/></td>
								<td id="b_td_18" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(18,498,7);"><b><div id="b_area18">&nbsp;</div></b><input type="hidden"  id="b_stat18" name="b_stat18" value=""/><input type="hidden" id="b_xx18" name="b_xx18" value=""/><input type="hidden" id="b_yy18" name="b_yy18" value=""/></td>
								<td id="b_td_19" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(19,527,7);"><b><div id="b_area19">&nbsp;</div></b><input type="hidden"  id="b_stat19" name="b_stat19" value=""/><input type="hidden" id="b_xx19" name="b_xx19" value=""/><input type="hidden" id="b_yy19" name="b_yy19" value=""/></td>
								<td id="b_td_20" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(20,556,7);"><b><div id="b_area20">&nbsp;</div></b><input type="hidden"  id="b_stat20" name="b_stat20" value=""/><input type="hidden" id="b_xx20" name="b_xx20" value=""/><input type="hidden" id="b_yy20" name="b_yy20" value=""/></td>
							</tr>
							<tr>
								<td id="b_td_21" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(21,5,30);"><b><div id="b_area21">&nbsp;</div></b><input type="hidden"  id="b_stat21" name="b_stat21" value=""/><input type="hidden" id="b_xx21" name="b_xx21" value=""/><input type="hidden" id="b_yy21" name="b_yy21" value=""/></td>
								<td id="b_td_22" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(22,34,30);"><b><div id="b_area22">&nbsp;</div></b><input type="hidden"  id="b_stat22" name="b_stat22" value=""/><input type="hidden" id="b_xx22" name="b_xx22" value=""/><input type="hidden" id="b_yy22" name="b_yy22" value=""/></td>
								<td id="b_td_23" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(23,63,30);"><b><div id="b_area23">&nbsp;</div></b><input type="hidden"  id="b_stat23" name="b_stat23" value=""/><input type="hidden" id="b_xx23" name="b_xx23" value=""/><input type="hidden" id="b_yy23" name="b_yy23" value=""/></td>
								<td id="b_td_24" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(24,92,30);"><b><div id="b_area24">&nbsp;</div></b><input type="hidden"  id="b_stat24" name="b_stat24" value=""/><input type="hidden" id="b_xx24" name="b_xx24" value=""/><input type="hidden" id="b_yy24" name="b_yy24" value=""/></td>
								<td id="b_td_25" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(25,121,30);"><b><div id="b_area25">&nbsp;</div></b><input type="hidden"  id="b_stat25" name="b_stat25" value=""/><input type="hidden" id="b_xx25" name="b_xx25" value=""/><input type="hidden" id="b_yy25" name="b_yy25" value=""/></td>
								<td id="b_td_26" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(26,150,30);"><b><div id="b_area26">&nbsp;</div></b><input type="hidden"  id="b_stat26" name="b_stat26" value=""/><input type="hidden" id="b_xx26" name="b_xx26" value=""/><input type="hidden" id="b_yy26" name="b_yy26" value=""/></td>
								<td id="b_td_27" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(27,179,30);"><b><div id="b_area27">&nbsp;</div></b><input type="hidden"  id="b_stat27" name="b_stat27" value=""/><input type="hidden" id="b_xx27" name="b_xx27" value=""/><input type="hidden" id="b_yy27" name="b_yy27" value=""/></td>
								<td id="b_td_28" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(28,208,30);"><b><div id="b_area28">&nbsp;</div></b><input type="hidden"  id="b_stat28" name="b_stat28" value=""/><input type="hidden" id="b_xx28" name="b_xx28" value=""/><input type="hidden" id="b_yy28" name="b_yy28" value=""/></td>
								<td id="b_td_29" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(29,237,30);"><b><div id="b_area29">&nbsp;</div></b><input type="hidden"  id="b_stat29" name="b_stat29" value=""/><input type="hidden" id="b_xx29" name="b_xx29" value=""/><input type="hidden" id="b_yy29" name="b_yy29" value=""/></td>
								<td id="b_td_30" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(30,266,30);"><b><div id="b_area30">&nbsp;</div></b><input type="hidden"  id="b_stat30" name="b_stat30" value=""/><input type="hidden" id="b_xx30" name="b_xx30" value=""/><input type="hidden" id="b_yy30" name="b_yy30" value=""/></td>
								<td id="b_td_31" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(31,295,30);"><b><div id="b_area31">&nbsp;</div></b><input type="hidden"  id="b_stat31" name="b_stat31" value=""/><input type="hidden" id="b_xx31" name="b_xx31" value=""/><input type="hidden" id="b_yy31" name="b_yy31" value=""/></td>
								<td id="b_td_32" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(32,324,30);"><b><div id="b_area32">&nbsp;</div></b><input type="hidden"  id="b_stat32" name="b_stat32" value=""/><input type="hidden" id="b_xx32" name="b_xx32" value=""/><input type="hidden" id="b_yy32" name="b_yy32" value=""/></td>
								<td id="b_td_33" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(33,353,30);"><b><div id="b_area33">&nbsp;</div></b><input type="hidden"  id="b_stat33" name="b_stat33" value=""/><input type="hidden" id="b_xx33" name="b_xx33" value=""/><input type="hidden" id="b_yy33" name="b_yy33" value=""/></td>
								<td id="b_td_34" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(34,382,30);"><b><div id="b_area34">&nbsp;</div></b><input type="hidden"  id="b_stat34" name="b_stat34" value=""/><input type="hidden" id="b_xx34" name="b_xx34" value=""/><input type="hidden" id="b_yy34" name="b_yy34" value=""/></td>
								<td id="b_td_35" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(35,402,30);"><b><div id="b_area35">&nbsp;</div></b><input type="hidden"  id="b_stat35" name="b_stat35" value=""/><input type="hidden" id="b_xx35" name="b_xx35" value=""/><input type="hidden" id="b_yy35" name="b_yy35" value=""/></td>
								<td id="b_td_36" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(36,452,30);"><b><div id="b_area36">&nbsp;</div></b><input type="hidden"  id="b_stat36" name="b_stat36" value=""/><input type="hidden" id="b_xx36" name="b_xx36" value=""/><input type="hidden" id="b_yy36" name="b_yy36" value=""/></td>
								<td id="b_td_37" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(37,469,30);"><b><div id="b_area37">&nbsp;</div></b><input type="hidden"  id="b_stat37" name="b_stat37" value=""/><input type="hidden" id="b_xx37" name="b_xx37" value=""/><input type="hidden" id="b_yy37" name="b_yy37" value=""/></td>
								<td id="b_td_38" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(38,498,30);"><b><div id="b_area38">&nbsp;</div></b><input type="hidden"  id="b_stat38" name="b_stat38" value=""/><input type="hidden" id="b_xx38" name="b_xx38" value=""/><input type="hidden" id="b_yy38" name="b_yy38" value=""/></td>
								<td id="b_td_39" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(39,527,30);"><b><div id="b_area39">&nbsp;</div></b><input type="hidden"  id="b_stat39" name="b_stat39" value=""/><input type="hidden" id="b_xx39" name="b_xx39" value=""/><input type="hidden" id="b_yy39" name="b_yy39" value=""/></td>
								<td id="b_td_40" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(40,556,30);"><b><div id="b_area40">&nbsp;</div></b><input type="hidden"  id="b_stat40" name="b_stat40" value=""/><input type="hidden" id="b_xx40" name="b_xx40" value=""/><input type="hidden" id="b_yy40" name="b_yy40" value=""/></td>
							</tr>
							<tr>
								<td id="b_td_41" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(41,5,53);"><b><div id="b_area41">&nbsp;</div></b><input type="hidden"  id="b_stat41" name="b_stat41" value=""/><input type="hidden" id="b_xx41" name="b_xx41" value=""/><input type="hidden" id="b_yy41" name="b_yy41" value=""/></td>
								<td id="b_td_42" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(42,34,53);"><b><div id="b_area42">&nbsp;</div></b><input type="hidden"  id="b_stat42" name="b_stat42" value=""/><input type="hidden" id="b_xx42" name="b_xx42" value=""/><input type="hidden" id="b_yy42" name="b_yy42" value=""/></td>
								<td id="b_td_43" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(43,63,53);"><b><div id="b_area43">&nbsp;</div></b><input type="hidden"  id="b_stat43" name="b_stat43" value=""/><input type="hidden" id="b_xx43" name="b_xx43" value=""/><input type="hidden" id="b_yy43" name="b_yy43" value=""/></td>
								<td id="b_td_44" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(44,92,53);"><b><div id="b_area44">&nbsp;</div></b><input type="hidden"  id="b_stat44" name="b_stat44" value=""/><input type="hidden" id="b_xx44" name="b_xx44" value=""/><input type="hidden" id="b_yy44" name="b_yy44" value=""/></td>
								<td id="b_td_45" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(45,121,53);"><b><div id="b_area45">&nbsp;</div></b><input type="hidden"  id="b_stat45" name="b_stat45" value=""/><input type="hidden" id="b_xx45" name="b_xx45" value=""/><input type="hidden" id="b_yy45" name="b_yy45" value=""/></td>
								<td id="b_td_46" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(46,150,53);"><b><div id="b_area46">&nbsp;</div></b><input type="hidden"  id="b_stat46" name="b_stat46" value=""/><input type="hidden" id="b_xx46" name="b_xx46" value=""/><input type="hidden" id="b_yy46" name="b_yy46" value=""/></td>
								<td id="b_td_47" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(47,179,53);"><b><div id="b_area47">&nbsp;</div></b><input type="hidden"  id="b_stat47" name="b_stat47" value=""/><input type="hidden" id="b_xx47" name="b_xx47" value=""/><input type="hidden" id="b_yy47" name="b_yy47" value=""/></td>
								<td id="b_td_48" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(48,208,53);"><b><div id="b_area48">&nbsp;</div></b><input type="hidden"  id="b_stat48" name="b_stat48" value=""/><input type="hidden" id="b_xx48" name="b_xx48" value=""/><input type="hidden" id="b_yy48" name="b_yy48" value=""/></td>
								<td id="b_td_49" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(49,237,53);"><b><div id="b_area49">&nbsp;</div></b><input type="hidden"  id="b_stat49" name="b_stat49" value=""/><input type="hidden" id="b_xx49" name="b_xx49" value=""/><input type="hidden" id="b_yy49" name="b_yy49" value=""/></td>
								<td id="b_td_50" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(50,266,53);"><b><div id="b_area50">&nbsp;</div></b><input type="hidden"  id="b_stat50" name="b_stat50" value=""/><input type="hidden" id="b_xx50" name="b_xx50" value=""/><input type="hidden" id="b_yy50" name="b_yy50" value=""/></td>
								<td id="b_td_51" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(51,295,53);"><b><div id="b_area51">&nbsp;</div></b><input type="hidden"  id="b_stat51" name="b_stat51" value=""/><input type="hidden" id="b_xx51" name="b_xx51" value=""/><input type="hidden" id="b_yy51" name="b_yy51" value=""/></td>
								<td id="b_td_52" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(52,324,53);"><b><div id="b_area52">&nbsp;</div></b><input type="hidden"  id="b_stat52" name="b_stat52" value=""/><input type="hidden" id="b_xx52" name="b_xx52" value=""/><input type="hidden" id="b_yy52" name="b_yy52" value=""/></td>
								<td id="b_td_53" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(53,353,53);"><b><div id="b_area53">&nbsp;</div></b><input type="hidden"  id="b_stat53" name="b_stat53" value=""/><input type="hidden" id="b_xx53" name="b_xx53" value=""/><input type="hidden" id="b_yy53" name="b_yy53" value=""/></td>
								<td id="b_td_54" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(54,382,53);"><b><div id="b_area54">&nbsp;</div></b><input type="hidden"  id="b_stat54" name="b_stat54" value=""/><input type="hidden" id="b_xx54" name="b_xx54" value=""/><input type="hidden" id="b_yy54" name="b_yy54" value=""/></td>
								<td id="b_td_55" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(55,402,53);"><b><div id="b_area55">&nbsp;</div></b><input type="hidden"  id="b_stat55" name="b_stat55" value=""/><input type="hidden" id="b_xx55" name="b_xx55" value=""/><input type="hidden" id="b_yy55" name="b_yy55" value=""/></td>
								<td id="b_td_56" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(56,452,53);"><b><div id="b_area56">&nbsp;</div></b><input type="hidden"  id="b_stat56" name="b_stat56" value=""/><input type="hidden" id="b_xx56" name="b_xx56" value=""/><input type="hidden" id="b_yy56" name="b_yy56" value=""/></td>
								<td id="b_td_57" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(57,469,53);"><b><div id="b_area57">&nbsp;</div></b><input type="hidden"  id="b_stat57" name="b_stat57" value=""/><input type="hidden" id="b_xx57" name="b_xx57" value=""/><input type="hidden" id="b_yy57" name="b_yy57" value=""/></td>
								<td id="b_td_58" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(58,498,53);"><b><div id="b_area58">&nbsp;</div></b><input type="hidden"  id="b_stat58" name="b_stat58" value=""/><input type="hidden" id="b_xx58" name="b_xx58" value=""/><input type="hidden" id="b_yy58" name="b_yy58" value=""/></td>
								<td id="b_td_59" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(59,527,53);"><b><div id="b_area59">&nbsp;</div></b><input type="hidden"  id="b_stat59" name="b_stat59" value=""/><input type="hidden" id="b_xx59" name="b_xx59" value=""/><input type="hidden" id="b_yy59" name="b_yy59" value=""/></td>
								<td id="b_td_60" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(60,556,53);"><b><div id="b_area60">&nbsp;</div></b><input type="hidden"  id="b_stat60" name="b_stat60" value=""/><input type="hidden" id="b_xx60" name="b_xx60" value=""/><input type="hidden" id="b_yy60" name="b_yy60" value=""/></td>
							</tr>
							<tr>
								<td id="b_td_61" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(61,5,76);"><b><div id="b_area61">&nbsp;</div></b><input type="hidden"  id="b_stat61" name="b_stat61" value=""/><input type="hidden" id="b_xx61" name="b_xx61" value=""/><input type="hidden" id="b_yy61" name="b_yy61" value=""/></td>
								<td id="b_td_62" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(62,34,76);"><b><div id="b_area62">&nbsp;</div></b><input type="hidden"  id="b_stat62" name="b_stat62" value=""/><input type="hidden" id="b_xx62" name="b_xx62" value=""/><input type="hidden" id="b_yy62" name="b_yy62" value=""/></td>
								<td id="b_td_63" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(63,63,76);"><b><div id="b_area63">&nbsp;</div></b><input type="hidden"  id="b_stat63" name="b_stat63" value=""/><input type="hidden" id="b_xx63" name="b_xx63" value=""/><input type="hidden" id="b_yy63" name="b_yy63" value=""/></td>
								<td id="b_td_64" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(64,92,76);"><b><div id="b_area64">&nbsp;</div></b><input type="hidden"  id="b_stat64" name="b_stat64" value=""/><input type="hidden" id="b_xx64" name="b_xx64" value=""/><input type="hidden" id="b_yy64" name="b_yy64" value=""/></td>
								<td id="b_td_65" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(65,121,76);"><b><div id="b_area65">&nbsp;</div></b><input type="hidden"  id="b_stat65" name="b_stat65" value=""/><input type="hidden" id="b_xx65" name="b_xx65" value=""/><input type="hidden" id="b_yy65" name="b_yy65" value=""/></td>
								<td id="b_td_66" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(66,150,76);"><b><div id="b_area66">&nbsp;</div></b><input type="hidden"  id="b_stat66" name="b_stat66" value=""/><input type="hidden" id="b_xx66" name="b_xx66" value=""/><input type="hidden" id="b_yy66" name="b_yy66" value=""/></td>
								<td id="b_td_67" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(67,179,76);"><b><div id="b_area67">&nbsp;</div></b><input type="hidden"  id="b_stat67" name="b_stat67" value=""/><input type="hidden" id="b_xx67" name="b_xx67" value=""/><input type="hidden" id="b_yy67" name="b_yy67" value=""/></td>
								<td id="b_td_68" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(68,208,76);"><b><div id="b_area68">&nbsp;</div></b><input type="hidden"  id="b_stat68" name="b_stat68" value=""/><input type="hidden" id="b_xx68" name="b_xx68" value=""/><input type="hidden" id="b_yy68" name="b_yy68" value=""/></td>
								<td id="b_td_69" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(69,237,76);"><b><div id="b_area69">&nbsp;</div></b><input type="hidden"  id="b_stat69" name="b_stat69" value=""/><input type="hidden" id="b_xx69" name="b_xx69" value=""/><input type="hidden" id="b_yy69" name="b_yy69" value=""/></td>
								<td id="b_td_70" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(70,266,76);"><b><div id="b_area70">&nbsp;</div></b><input type="hidden"  id="b_stat70" name="b_stat70" value=""/><input type="hidden" id="b_xx70" name="b_xx70" value=""/><input type="hidden" id="b_yy70" name="b_yy70" value=""/></td>
								<td id="b_td_71" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(71,295,76);"><b><div id="b_area71">&nbsp;</div></b><input type="hidden"  id="b_stat71" name="b_stat71" value=""/><input type="hidden" id="b_xx71" name="b_xx71" value=""/><input type="hidden" id="b_yy71" name="b_yy71" value=""/></td>
								<td id="b_td_72" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(72,324,76);"><b><div id="b_area72">&nbsp;</div></b><input type="hidden"  id="b_stat72" name="b_stat72" value=""/><input type="hidden" id="b_xx72" name="b_xx72" value=""/><input type="hidden" id="b_yy72" name="b_yy72" value=""/></td>
								<td id="b_td_73" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(73,353,76);"><b><div id="b_area73">&nbsp;</div></b><input type="hidden"  id="b_stat73" name="b_stat73" value=""/><input type="hidden" id="b_xx73" name="b_xx73" value=""/><input type="hidden" id="b_yy73" name="b_yy73" value=""/></td>
								<td id="b_td_74" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(74,380,76);"><b><div id="b_area74">&nbsp;</div></b><input type="hidden"  id="b_stat74" name="b_stat74" value=""/><input type="hidden" id="b_xx74" name="b_xx74" value=""/><input type="hidden" id="b_yy74" name="b_yy74" value=""/></td>
								<td id="b_td_75" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(75,411,76);"><b><div id="b_area75">&nbsp;</div></b><input type="hidden"  id="b_stat75" name="b_stat75" value=""/><input type="hidden" id="b_xx75" name="b_xx75" value=""/><input type="hidden" id="b_yy75" name="b_yy75" value=""/></td>
								<td id="b_td_76" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(76,440,76);"><b><div id="b_area76">&nbsp;</div></b><input type="hidden"  id="b_stat76" name="b_stat76" value=""/><input type="hidden" id="b_xx76" name="b_xx76" value=""/><input type="hidden" id="b_yy76" name="b_yy76" value=""/></td>
								<td id="b_td_77" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(77,469,76);"><b><div id="b_area77">&nbsp;</div></b><input type="hidden"  id="b_stat77" name="b_stat77" value=""/><input type="hidden" id="b_xx77" name="b_xx77" value=""/><input type="hidden" id="b_yy77" name="b_yy77" value=""/></td>
								<td id="b_td_78" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(78,498,76);"><b><div id="b_area78">&nbsp;</div></b><input type="hidden"  id="b_stat78" name="b_stat78" value=""/><input type="hidden" id="b_xx78" name="b_xx78" value=""/><input type="hidden" id="b_yy78" name="b_yy78" value=""/></td>
								<td id="b_td_79" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(79,527,76);"><b><div id="b_area79">&nbsp;</div></b><input type="hidden"  id="b_stat79" name="b_stat79" value=""/><input type="hidden" id="b_xx79" name="b_xx79" value=""/><input type="hidden" id="b_yy79" name="b_yy79" value=""/></td>
								<td id="b_td_80" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(80,556,76);"><b><div id="b_area80">&nbsp;</div></b><input type="hidden"  id="b_stat80" name="b_stat80" value=""/><input type="hidden" id="b_xx80" name="b_xx80" value=""/><input type="hidden" id="b_yy80" name="b_yy80" value=""/></td>
							</tr>
							<tr>
								<td id="b_td_81" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(81,5,99);"><b><div id="b_area81">&nbsp;</div></b><input type="hidden"  id="b_stat81" name="b_stat81" value=""/><input type="hidden" id="b_xx81" name="b_xx81" value=""/><input type="hidden" id="b_yy81" name="b_yy81" value=""/></td>
								<td id="b_td_82" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(82,34,99);"><b><div id="b_area82">&nbsp;</div></b><input type="hidden"  id="b_stat82" name="b_stat82" value=""/><input type="hidden" id="b_xx82" name="b_xx82" value=""/><input type="hidden" id="b_yy82" name="b_yy82" value=""/></td>
								<td id="b_td_83" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(83,63,99);"><b><div id="b_area83">&nbsp;</div></b><input type="hidden"  id="b_stat83" name="b_stat83" value=""/><input type="hidden" id="b_xx83" name="b_xx83" value=""/><input type="hidden" id="b_yy83" name="b_yy83" value=""/></td>
								<td id="b_td_84" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(84,92,99);"><b><div id="b_area84">&nbsp;</div></b><input type="hidden"  id="b_stat84" name="b_stat84" value=""/><input type="hidden" id="b_xx84" name="b_xx84" value=""/><input type="hidden" id="b_yy84" name="b_yy84" value=""/></td>
								<td id="b_td_85" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(85,121,99);"><b><div id="b_area85">&nbsp;</div></b><input type="hidden"  id="b_stat85" name="b_stat85" value=""/><input type="hidden" id="b_xx85" name="b_xx85" value=""/><input type="hidden" id="b_yy85" name="b_yy85" value=""/></td>
								<td id="b_td_86" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(86,150,99);"><b><div id="b_area86">&nbsp;</div></b><input type="hidden"  id="b_stat86" name="b_stat86" value=""/><input type="hidden" id="b_xx86" name="b_xx86" value=""/><input type="hidden" id="b_yy86" name="b_yy86" value=""/></td>
								<td id="b_td_87" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(87,179,99);"><b><div id="b_area87">&nbsp;</div></b><input type="hidden"  id="b_stat87" name="b_stat87" value=""/><input type="hidden" id="b_xx87" name="b_xx87" value=""/><input type="hidden" id="b_yy87" name="b_yy87" value=""/></td>
								<td id="b_td_88" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(88,208,99);"><b><div id="b_area88">&nbsp;</div></b><input type="hidden"  id="b_stat88" name="b_stat88" value=""/><input type="hidden" id="b_xx88" name="b_xx88" value=""/><input type="hidden" id="b_yy88" name="b_yy88" value=""/></td>
								<td id="b_td_89" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(89,237,99);"><b><div id="b_area89">&nbsp;</div></b><input type="hidden"  id="b_stat89" name="b_stat89" value=""/><input type="hidden" id="b_xx89" name="b_xx89" value=""/><input type="hidden" id="b_yy89" name="b_yy89" value=""/></td>
								<td id="b_td_90" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(90,266,99);"><b><div id="b_area90">&nbsp;</div></b><input type="hidden"  id="b_stat90" name="b_stat90" value=""/><input type="hidden" id="b_xx90" name="b_xx90" value=""/><input type="hidden" id="b_yy90" name="b_yy90" value=""/></td>
								<td id="b_td_91" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(91,295,99);"><b><div id="b_area91">&nbsp;</div></b><input type="hidden"  id="b_stat91" name="b_stat91" value=""/><input type="hidden" id="b_xx91" name="b_xx91" value=""/><input type="hidden" id="b_yy91" name="b_yy91" value=""/></td>
								<td id="b_td_92" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(92,324,99);"><b><div id="b_area92">&nbsp;</div></b><input type="hidden"  id="b_stat92" name="b_stat92" value=""/><input type="hidden" id="b_xx92" name="b_xx92" value=""/><input type="hidden" id="b_yy92" name="b_yy92" value=""/></td>
								<td id="b_td_93" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(93,353,99);"><b><div id="b_area93">&nbsp;</div></b><input type="hidden"  id="b_stat93" name="b_stat93" value=""/><input type="hidden" id="b_xx93" name="b_xx93" value=""/><input type="hidden" id="b_yy93" name="b_yy93" value=""/></td>
								<td id="b_td_94" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(94,382,99);"><b><div id="b_area94">&nbsp;</div></b><input type="hidden"  id="b_stat94" name="b_stat94" value=""/><input type="hidden" id="b_xx94" name="b_xx94" value=""/><input type="hidden" id="b_yy94" name="b_yy94" value=""/></td>
								<td id="b_td_95" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(95,411,99);"><b><div id="b_area95">&nbsp;</div></b><input type="hidden"  id="b_stat95" name="b_stat95" value=""/><input type="hidden" id="b_xx95" name="b_xx95" value=""/><input type="hidden" id="b_yy95" name="b_yy95" value=""/></td>
								<td id="b_td_96" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(96,440,99);"><b><div id="b_area96">&nbsp;</div></b><input type="hidden"  id="b_stat96" name="b_stat96" value=""/><input type="hidden" id="b_xx96" name="b_xx96" value=""/><input type="hidden" id="b_yy96" name="b_yy96" value=""/></td>
								<td id="b_td_97" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(97,469,99);"><b><div id="b_area97">&nbsp;</div></b><input type="hidden"  id="b_stat97" name="b_stat97" value=""/><input type="hidden" id="b_xx97" name="b_xx97" value=""/><input type="hidden" id="b_yy97" name="b_yy97" value=""/></td>
								<td id="b_td_98" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(98,498,99);"><b><div id="b_area98">&nbsp;</div></b><input type="hidden"  id="b_stat98" name="b_stat98" value=""/><input type="hidden" id="b_xx98" name="b_xx98" value=""/><input type="hidden" id="b_yy98" name="b_yy98" value=""/></td>
								<td id="b_td_99" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(99,527,99);"><b><div id="b_area99">&nbsp;</div></b><input type="hidden"  id="b_stat99" name="b_stat99" value=""/><input type="hidden" id="b_xx99" name="b_xx99" value=""/><input type="hidden" id="b_yy99" name="b_yy99" value=""/></td>
								<td id="b_td_100" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(100,556,99);"><b><div id="b_area100">&nbsp;</div></b><input type="hidden"  id="b_stat100" name="b_stat100" value=""/><input type="hidden" id="b_xx100" name="b_xx100" value=""/><input type="hidden" id="b_yy100" name="b_yy100" value=""/></td>
							</tr>
							<tr>
								<td id="b_td_101" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(101,5,122);"><b><div id="b_area101">&nbsp;</div></b><input type="hidden"  id="b_stat101" name="b_stat101" value=""/><input type="hidden" id="b_xx101" name="b_xx101" value=""/><input type="hidden" id="b_yy101" name="b_yy101" value=""/></td>
								<td id="b_td_102" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(102,34,122);"><b><div id="b_area102">&nbsp;</div></b><input type="hidden"  id="b_stat102" name="b_stat102" value=""/><input type="hidden" id="b_xx102" name="b_xx102" value=""/><input type="hidden" id="b_yy102" name="b_yy102" value=""/></td>
								<td id="b_td_103" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(103,63,122);"><b><div id="b_area103">&nbsp;</div></b><input type="hidden"  id="b_stat103" name="b_stat103" value=""/><input type="hidden" id="b_xx103" name="b_xx103" value=""/><input type="hidden" id="b_yy103" name="b_yy103" value=""/></td>
								<td id="b_td_104" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(104,92,122);"><b><div id="b_area104">&nbsp;</div></b><input type="hidden"  id="b_stat104" name="b_stat104" value=""/><input type="hidden" id="b_xx104" name="b_xx104" value=""/><input type="hidden" id="b_yy104" name="b_yy104" value=""/></td>
								<td id="b_td_105" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(105,121,122);"><b><div id="b_area105">&nbsp;</div></b><input type="hidden"  id="b_stat105" name="b_stat105" value=""/><input type="hidden" id="b_xx105" name="b_xx105" value=""/><input type="hidden" id="b_yy105" name="b_yy105" value=""/></td>
								<td id="b_td_106" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(106,150,122);"><b><div id="b_area106">&nbsp;</div></b><input type="hidden"  id="b_stat106" name="b_stat106" value=""/><input type="hidden" id="b_xx106" name="b_xx106" value=""/><input type="hidden" id="b_yy106" name="b_yy106" value=""/></td>
								<td id="b_td_107" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(107,179,122);"><b><div id="b_area107">&nbsp;</div></b><input type="hidden"  id="b_stat107" name="b_stat107" value=""/><input type="hidden" id="b_xx107" name="b_xx107" value=""/><input type="hidden" id="b_yy107" name="b_yy107" value=""/></td>
								<td id="b_td_108" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(108,208,122);"><b><div id="b_area108">&nbsp;</div></b><input type="hidden"  id="b_stat108" name="b_stat108" value=""/><input type="hidden" id="b_xx108" name="b_xx108" value=""/><input type="hidden" id="b_yy108" name="b_yy108" value=""/></td>
								<td id="b_td_109" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(109,237,122);"><b><div id="b_area109">&nbsp;</div></b><input type="hidden"  id="b_stat109" name="b_stat109" value=""/><input type="hidden" id="b_xx109" name="b_xx109" value=""/><input type="hidden" id="b_yy109" name="b_yy109" value=""/></td>
								<td id="b_td_110" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(110,266,122);"><b><div id="b_area110">&nbsp;</div></b><input type="hidden"  id="b_stat110" name="b_stat110" value=""/><input type="hidden" id="b_xx110" name="b_xx110" value=""/><input type="hidden" id="b_yy110" name="b_yy110" value=""/></td>
								<td id="b_td_111" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(111,295,122);"><b><div id="b_area111">&nbsp;</div></b><input type="hidden"  id="b_stat111" name="b_stat111" value=""/><input type="hidden" id="b_xx111" name="b_xx111" value=""/><input type="hidden" id="b_yy111" name="b_yy111" value=""/></td>
								<td id="b_td_112" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(112,324,122);"><b><div id="b_area112">&nbsp;</div></b><input type="hidden"  id="b_stat112" name="b_stat112" value=""/><input type="hidden" id="b_xx112" name="b_xx112" value=""/><input type="hidden" id="b_yy112" name="b_yy112" value=""/></td>
								<td id="b_td_113" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(113,353,122);"><b><div id="b_area113">&nbsp;</div></b><input type="hidden"  id="b_stat113" name="b_stat113" value=""/><input type="hidden" id="b_xx113" name="b_xx113" value=""/><input type="hidden" id="b_yy113" name="b_yy113" value=""/></td>
								<td id="b_td_114" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(114,382,122);"><b><div id="b_area114">&nbsp;</div></b><input type="hidden"  id="b_stat114" name="b_stat114" value=""/><input type="hidden" id="b_xx114" name="b_xx114" value=""/><input type="hidden" id="b_yy114" name="b_yy114" value=""/></td>
								<td id="b_td_115" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(115,411,122);"><b><div id="b_area115">&nbsp;</div></b><input type="hidden"  id="b_stat115" name="b_stat115" value=""/><input type="hidden" id="b_xx115" name="b_xx115" value=""/><input type="hidden" id="b_yy115" name="b_yy115" value=""/></td>
								<td id="b_td_116" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(116,440,122);"><b><div id="b_area116">&nbsp;</div></b><input type="hidden"  id="b_stat116" name="b_stat116" value=""/><input type="hidden" id="b_xx116" name="b_xx116" value=""/><input type="hidden" id="b_yy116" name="b_yy116" value=""/></td>
								<td id="b_td_117" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(117,469,122);"><b><div id="b_area117">&nbsp;</div></b><input type="hidden"  id="b_stat117" name="b_stat117" value=""/><input type="hidden" id="b_xx117" name="b_xx117" value=""/><input type="hidden" id="b_yy117" name="b_yy117" value=""/></td>
								<td id="b_td_118" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(118,498,122);"><b><div id="b_area118">&nbsp;</div></b><input type="hidden"  id="b_stat118" name="b_stat118" value=""/><input type="hidden" id="b_xx118" name="b_xx118" value=""/><input type="hidden" id="b_yy118" name="b_yy118" value=""/></td>
								<td id="b_td_119" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(119,527,122);"><b><div id="b_area119">&nbsp;</div></b><input type="hidden"  id="b_stat119" name="b_stat119" value=""/><input type="hidden" id="b_xx119" name="b_xx119" value=""/><input type="hidden" id="b_yy119" name="b_yy119" value=""/></td>
								<td id="b_td_120" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(120,556,122);"><b><div id="b_area120">&nbsp;</div></b><input type="hidden"  id="b_stat120" name="b_stat120" value=""/><input type="hidden" id="b_xx120" name="b_xx120" value=""/><input type="hidden" id="b_yy120" name="b_yy120" value=""/></td>
							</tr>
							<tr>
								<td id="b_td_121" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(121,5,145);"><b><div id="b_area121">&nbsp;</div></b><input type="hidden"  id="b_stat121" name="b_stat121" value=""/><input type="hidden" id="b_xx121" name="b_xx121" value=""/><input type="hidden" id="b_yy121" name="b_yy121" value=""/></td>
								<td id="b_td_122" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(122,34,145);"><b><div id="b_area122">&nbsp;</div></b><input type="hidden"  id="b_stat122" name="b_stat122" value=""/><input type="hidden" id="b_xx122" name="b_xx122" value=""/><input type="hidden" id="b_yy122" name="b_yy122" value=""/></td>
								<td id="b_td_123" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(123,63,145);"><b><div id="b_area123">&nbsp;</div></b><input type="hidden"  id="b_stat123" name="b_stat123" value=""/><input type="hidden" id="b_xx123" name="b_xx123" value=""/><input type="hidden" id="b_yy123" name="b_yy123" value=""/></td>
								<td id="b_td_124" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(124,92,145);"><b><div id="b_area124">&nbsp;</div></b><input type="hidden"  id="b_stat124" name="b_stat124" value=""/><input type="hidden" id="b_xx124" name="b_xx124" value=""/><input type="hidden" id="b_yy124" name="b_yy124" value=""/></td>
								<td id="b_td_125" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(125,121,145);"><b><div id="b_area125">&nbsp;</div></b><input type="hidden"  id="b_stat125" name="b_stat125" value=""/><input type="hidden" id="b_xx125" name="b_xx125" value=""/><input type="hidden" id="b_yy125" name="b_yy125" value=""/></td>
								<td id="b_td_126" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(126,150,145);"><b><div id="b_area126">&nbsp;</div></b><input type="hidden"  id="b_stat126" name="b_stat126" value=""/><input type="hidden" id="b_xx126" name="b_xx126" value=""/><input type="hidden" id="b_yy126" name="b_yy126" value=""/></td>
								<td id="b_td_127" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(127,179,145);"><b><div id="b_area127">&nbsp;</div></b><input type="hidden"  id="b_stat127" name="b_stat127" value=""/><input type="hidden" id="b_xx127" name="b_xx127" value=""/><input type="hidden" id="b_yy127" name="b_yy127" value=""/></td>
								<td id="b_td_128" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(128,208,145);"><b><div id="b_area128">&nbsp;</div></b><input type="hidden"  id="b_stat128" name="b_stat128" value=""/><input type="hidden" id="b_xx128" name="b_xx128" value=""/><input type="hidden" id="b_yy128" name="b_yy128" value=""/></td>
								<td id="b_td_129" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(129,237,145);"><b><div id="b_area129">&nbsp;</div></b><input type="hidden"  id="b_stat129" name="b_stat129" value=""/><input type="hidden" id="b_xx129" name="b_xx129" value=""/><input type="hidden" id="b_yy129" name="b_yy129" value=""/></td>
								<td id="b_td_130" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(130,266,145);"><b><div id="b_area130">&nbsp;</div></b><input type="hidden"  id="b_stat130" name="b_stat130" value=""/><input type="hidden" id="b_xx130" name="b_xx130" value=""/><input type="hidden" id="b_yy130" name="b_yy130" value=""/></td>
								<td id="b_td_131" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(131,295,145);"><b><div id="b_area131">&nbsp;</div></b><input type="hidden"  id="b_stat131" name="b_stat131" value=""/><input type="hidden" id="b_xx131" name="b_xx131" value=""/><input type="hidden" id="b_yy131" name="b_yy131" value=""/></td>
								<td id="b_td_132" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(132,324,145);"><b><div id="b_area132">&nbsp;</div></b><input type="hidden"  id="b_stat132" name="b_stat132" value=""/><input type="hidden" id="b_xx132" name="b_xx132" value=""/><input type="hidden" id="b_yy132" name="b_yy132" value=""/></td>
								<td id="b_td_133" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(133,353,145);"><b><div id="b_area133">&nbsp;</div></b><input type="hidden"  id="b_stat133" name="b_stat133" value=""/><input type="hidden" id="b_xx133" name="b_xx133" value=""/><input type="hidden" id="b_yy133" name="b_yy133" value=""/></td>
								<td id="b_td_134" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(134,382,145);"><b><div id="b_area134">&nbsp;</div></b><input type="hidden"  id="b_stat134" name="b_stat134" value=""/><input type="hidden" id="b_xx134" name="b_xx134" value=""/><input type="hidden" id="b_yy134" name="b_yy134" value=""/></td>
								<td id="b_td_135" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(135,411,145);"><b><div id="b_area135">&nbsp;</div></b><input type="hidden"  id="b_stat135" name="b_stat135" value=""/><input type="hidden" id="b_xx135" name="b_xx135" value=""/><input type="hidden" id="b_yy135" name="b_yy135" value=""/></td>
								<td id="b_td_136" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(136,440,145);"><b><div id="b_area136">&nbsp;</div></b><input type="hidden"  id="b_stat136" name="b_stat136" value=""/><input type="hidden" id="b_xx136" name="b_xx136" value=""/><input type="hidden" id="b_yy136" name="b_yy136" value=""/></td>
								<td id="b_td_137" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(137,469,145);"><b><div id="b_area137">&nbsp;</div></b><input type="hidden"  id="b_stat137" name="b_stat137" value=""/><input type="hidden" id="b_xx137" name="b_xx137" value=""/><input type="hidden" id="b_yy137" name="b_yy137" value=""/></td>
								<td id="b_td_138" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(138,498,145);"><b><div id="b_area138">&nbsp;</div></b><input type="hidden"  id="b_stat138" name="b_stat138" value=""/><input type="hidden" id="b_xx138" name="b_xx138" value=""/><input type="hidden" id="b_yy138" name="b_yy138" value=""/></td>
								<td id="b_td_139" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(139,527,145);"><b><div id="b_area139">&nbsp;</div></b><input type="hidden"  id="b_stat139" name="b_stat139" value=""/><input type="hidden" id="b_xx139" name="b_xx139" value=""/><input type="hidden" id="b_yy139" name="b_yy139" value=""/></td>
								<td id="b_td_140" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(140,556,145);"><b><div id="b_area140">&nbsp;</div></b><input type="hidden"  id="b_stat140" name="b_stat140" value=""/><input type="hidden" id="b_xx140" name="b_xx140" value=""/><input type="hidden" id="b_yy140" name="b_yy140" value=""/></td>
							</tr>
							<tr>
								<td id="b_td_141" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(141,5,168);"><b><div id="b_area141">&nbsp;</div></b><input type="hidden"  id="b_stat141" name="b_stat141" value=""/><input type="hidden" id="b_xx141" name="b_xx141" value=""/><input type="hidden" id="b_yy141" name="b_yy141" value=""/></td>
								<td id="b_td_142" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(142,34,168);"><b><div id="b_area142">&nbsp;</div></b><input type="hidden"  id="b_stat142" name="b_stat142" value=""/><input type="hidden" id="b_xx142" name="b_xx142" value=""/><input type="hidden" id="b_yy142" name="b_yy142" value=""/></td>
								<td id="b_td_143" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(143,63,168);"><b><div id="b_area143">&nbsp;</div></b><input type="hidden"  id="b_stat143" name="b_stat143" value=""/><input type="hidden" id="b_xx143" name="b_xx143" value=""/><input type="hidden" id="b_yy143" name="b_yy143" value=""/></td>
								<td id="b_td_144" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(144,92,168);"><b><div id="b_area144">&nbsp;</div></b><input type="hidden"  id="b_stat144" name="b_stat144" value=""/><input type="hidden" id="b_xx144" name="b_xx144" value=""/><input type="hidden" id="b_yy144" name="b_yy144" value=""/></td>
								<td id="b_td_145" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(145,121,168);"><b><div id="b_area145">&nbsp;</div></b><input type="hidden"  id="b_stat145" name="b_stat145" value=""/><input type="hidden" id="b_xx145" name="b_xx145" value=""/><input type="hidden" id="b_yy145" name="b_yy145" value=""/></td>
								<td id="b_td_146" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(146,150,168);"><b><div id="b_area146">&nbsp;</div></b><input type="hidden"  id="b_stat146" name="b_stat146" value=""/><input type="hidden" id="b_xx146" name="b_xx146" value=""/><input type="hidden" id="b_yy146" name="b_yy146" value=""/></td>
								<td id="b_td_147" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(147,179,168);"><b><div id="b_area147">&nbsp;</div></b><input type="hidden"  id="b_stat147" name="b_stat147" value=""/><input type="hidden" id="b_xx147" name="b_xx147" value=""/><input type="hidden" id="b_yy147" name="b_yy147" value=""/></td>
								<td id="b_td_148" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(148,208,168);"><b><div id="b_area148">&nbsp;</div></b><input type="hidden"  id="b_stat148" name="b_stat148" value=""/><input type="hidden" id="b_xx148" name="b_xx148" value=""/><input type="hidden" id="b_yy148" name="b_yy148" value=""/></td>
								<td id="b_td_149" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(149,237,168);"><b><div id="b_area149">&nbsp;</div></b><input type="hidden"  id="b_stat149" name="b_stat149" value=""/><input type="hidden" id="b_xx149" name="b_xx149" value=""/><input type="hidden" id="b_yy149" name="b_yy149" value=""/></td>
								<td id="b_td_150" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(150,266,168);"><b><div id="b_area150">&nbsp;</div></b><input type="hidden"  id="b_stat150" name="b_stat150" value=""/><input type="hidden" id="b_xx150" name="b_xx150" value=""/><input type="hidden" id="b_yy150" name="b_yy150" value=""/></td>
								<td id="b_td_151" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(151,295,168);"><b><div id="b_area151">&nbsp;</div></b><input type="hidden"  id="b_stat151" name="b_stat151" value=""/><input type="hidden" id="b_xx151" name="b_xx151" value=""/><input type="hidden" id="b_yy151" name="b_yy151" value=""/></td>
								<td id="b_td_152" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(152,324,168);"><b><div id="b_area152">&nbsp;</div></b><input type="hidden"  id="b_stat152" name="b_stat152" value=""/><input type="hidden" id="b_xx152" name="b_xx152" value=""/><input type="hidden" id="b_yy152" name="b_yy152" value=""/></td>
								<td id="b_td_153" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(153,353,168);"><b><div id="b_area153">&nbsp;</div></b><input type="hidden"  id="b_stat153" name="b_stat153" value=""/><input type="hidden" id="b_xx153" name="b_xx153" value=""/><input type="hidden" id="b_yy153" name="b_yy153" value=""/></td>
								<td id="b_td_154" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(154,382,168);"><b><div id="b_area154">&nbsp;</div></b><input type="hidden"  id="b_stat154" name="b_stat154" value=""/><input type="hidden" id="b_xx154" name="b_xx154" value=""/><input type="hidden" id="b_yy154" name="b_yy154" value=""/></td>
								<td id="b_td_155" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(155,411,168);"><b><div id="b_area155">&nbsp;</div></b><input type="hidden"  id="b_stat155" name="b_stat155" value=""/><input type="hidden" id="b_xx155" name="b_xx155" value=""/><input type="hidden" id="b_yy155" name="b_yy155" value=""/></td>
								<td id="b_td_156" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(156,440,168);"><b><div id="b_area156">&nbsp;</div></b><input type="hidden"  id="b_stat156" name="b_stat156" value=""/><input type="hidden" id="b_xx156" name="b_xx156" value=""/><input type="hidden" id="b_yy156" name="b_yy156" value=""/></td>
								<td id="b_td_157" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(157,469,168);"><b><div id="b_area157">&nbsp;</div></b><input type="hidden"  id="b_stat157" name="b_stat157" value=""/><input type="hidden" id="b_xx157" name="b_xx157" value=""/><input type="hidden" id="b_yy157" name="b_yy157" value=""/></td>
								<td id="b_td_158" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(158,498,168);"><b><div id="b_area158">&nbsp;</div></b><input type="hidden"  id="b_stat158" name="b_stat158" value=""/><input type="hidden" id="b_xx158" name="b_xx158" value=""/><input type="hidden" id="b_yy158" name="b_yy158" value=""/></td>
								<td id="b_td_159" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(159,527,168);"><b><div id="b_area159">&nbsp;</div></b><input type="hidden"  id="b_stat159" name="b_stat159" value=""/><input type="hidden" id="b_xx159" name="b_xx159" value=""/><input type="hidden" id="b_yy159" name="b_yy159" value=""/></td>
								<td id="b_td_160" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(160,556,168);"><b><div id="b_area160">&nbsp;</div></b><input type="hidden"  id="b_stat160" name="b_stat160" value=""/><input type="hidden" id="b_xx160" name="b_xx160" value=""/><input type="hidden" id="b_yy160" name="b_yy160" value=""/></td>
							</tr>
							<tr>
								<td id="b_td_161" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(161,5,191);"><b><div id="b_area161">&nbsp;</div></b><input type="hidden"  id="b_stat161" name="b_stat161" value=""/><input type="hidden" id="b_xx161" name="b_xx161" value=""/><input type="hidden" id="b_yy161" name="b_yy161" value=""/></td>
								<td id="b_td_162" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(162,34,191);"><b><div id="b_area162">&nbsp;</div></b><input type="hidden"  id="b_stat162" name="b_stat162" value=""/><input type="hidden" id="b_xx162" name="b_xx162" value=""/><input type="hidden" id="b_yy162" name="b_yy162" value=""/></td>
								<td id="b_td_163" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(163,63,191);"><b><div id="b_area163">&nbsp;</div></b><input type="hidden"  id="b_stat163" name="b_stat163" value=""/><input type="hidden" id="b_xx163" name="b_xx163" value=""/><input type="hidden" id="b_yy163" name="b_yy163" value=""/></td>
								<td id="b_td_164" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(164,92,191);"><b><div id="b_area164">&nbsp;</div></b><input type="hidden"  id="b_stat164" name="b_stat164" value=""/><input type="hidden" id="b_xx164" name="b_xx164" value=""/><input type="hidden" id="b_yy164" name="b_yy164" value=""/></td>
								<td id="b_td_165" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(165,121,191);"><b><div id="b_area165">&nbsp;</div></b><input type="hidden"  id="b_stat165" name="b_stat165" value=""/><input type="hidden" id="b_xx165" name="b_xx165" value=""/><input type="hidden" id="b_yy165" name="b_yy165" value=""/></td>
								<td id="b_td_166" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(166,150,191);"><b><div id="b_area166">&nbsp;</div></b><input type="hidden"  id="b_stat166" name="b_stat166" value=""/><input type="hidden" id="b_xx166" name="b_xx166" value=""/><input type="hidden" id="b_yy166" name="b_yy166" value=""/></td>
								<td id="b_td_167" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(167,179,191);"><b><div id="b_area167">&nbsp;</div></b><input type="hidden"  id="b_stat167" name="b_stat167" value=""/><input type="hidden" id="b_xx167" name="b_xx167" value=""/><input type="hidden" id="b_yy167" name="b_yy167" value=""/></td>
								<td id="b_td_168" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(168,208,191);"><b><div id="b_area168">&nbsp;</div></b><input type="hidden"  id="b_stat168" name="b_stat168" value=""/><input type="hidden" id="b_xx168" name="b_xx168" value=""/><input type="hidden" id="b_yy168" name="b_yy168" value=""/></td>
								<td id="b_td_169" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(169,237,191);"><b><div id="b_area169">&nbsp;</div></b><input type="hidden"  id="b_stat169" name="b_stat169" value=""/><input type="hidden" id="b_xx169" name="b_xx169" value=""/><input type="hidden" id="b_yy169" name="b_yy169" value=""/></td>
								<td id="b_td_170" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(170,266,191);"><b><div id="b_area170">&nbsp;</div></b><input type="hidden"  id="b_stat170" name="b_stat170" value=""/><input type="hidden" id="b_xx170" name="b_xx170" value=""/><input type="hidden" id="b_yy170" name="b_yy170" value=""/></td>
								<td id="b_td_171" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(171,295,191);"><b><div id="b_area171">&nbsp;</div></b><input type="hidden"  id="b_stat171" name="b_stat171" value=""/><input type="hidden" id="b_xx171" name="b_xx171" value=""/><input type="hidden" id="b_yy171" name="b_yy171" value=""/></td>
								<td id="b_td_172" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(172,324,191);"><b><div id="b_area172">&nbsp;</div></b><input type="hidden"  id="b_stat172" name="b_stat172" value=""/><input type="hidden" id="b_xx172" name="b_xx172" value=""/><input type="hidden" id="b_yy172" name="b_yy172" value=""/></td>
								<td id="b_td_173" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(173,353,191);"><b><div id="b_area173">&nbsp;</div></b><input type="hidden"  id="b_stat173" name="b_stat173" value=""/><input type="hidden" id="b_xx173" name="b_xx173" value=""/><input type="hidden" id="b_yy173" name="b_yy173" value=""/></td>
								<td id="b_td_174" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(174,382,191);"><b><div id="b_area174">&nbsp;</div></b><input type="hidden"  id="b_stat174" name="b_stat174" value=""/><input type="hidden" id="b_xx174" name="b_xx174" value=""/><input type="hidden" id="b_yy174" name="b_yy174" value=""/></td>
								<td id="b_td_175" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(175,402,191);"><b><div id="b_area175">&nbsp;</div></b><input type="hidden"  id="b_stat175" name="b_stat175" value=""/><input type="hidden" id="b_xx175" name="b_xx175" value=""/><input type="hidden" id="b_yy175" name="b_yy175" value=""/></td>
								<td id="b_td_176" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(176,452,191);"><b><div id="b_area176">&nbsp;</div></b><input type="hidden"  id="b_stat176" name="b_stat176" value=""/><input type="hidden" id="b_xx176" name="b_xx176" value=""/><input type="hidden" id="b_yy176" name="b_yy176" value=""/></td>
								<td id="b_td_177" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(177,469,191);"><b><div id="b_area177">&nbsp;</div></b><input type="hidden"  id="b_stat177" name="b_stat177" value=""/><input type="hidden" id="b_xx177" name="b_xx177" value=""/><input type="hidden" id="b_yy177" name="b_yy177" value=""/></td>
								<td id="b_td_178" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(178,498,191);"><b><div id="b_area178">&nbsp;</div></b><input type="hidden"  id="b_stat178" name="b_stat178" value=""/><input type="hidden" id="b_xx178" name="b_xx178" value=""/><input type="hidden" id="b_yy178" name="b_yy178" value=""/></td>
								<td id="b_td_179" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(179,527,191);"><b><div id="b_area179">&nbsp;</div></b><input type="hidden"  id="b_stat179" name="b_stat179" value=""/><input type="hidden" id="b_xx179" name="b_xx179" value=""/><input type="hidden" id="b_yy179" name="b_yy179" value=""/></td>
								<td id="b_td_180" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(180,556,191);"><b><div id="b_area180">&nbsp;</div></b><input type="hidden"  id="b_stat180" name="b_stat180" value=""/><input type="hidden" id="b_xx180" name="b_xx180" value=""/><input type="hidden" id="b_yy180" name="b_yy180" value=""/></td>
							</tr>
							<tr>
								<td id="b_td_181" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(181,5,214);"><b><div id="b_area181">&nbsp;</div></b><input type="hidden"  id="b_stat181" name="b_stat181" value=""/><input type="hidden" id="b_xx181" name="b_xx181" value=""/><input type="hidden" id="b_yy181" name="b_yy181" value=""/></td>
								<td id="b_td_182" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(182,34,214);"><b><div id="b_area182">&nbsp;</div></b><input type="hidden"  id="b_stat182" name="b_stat182" value=""/><input type="hidden" id="b_xx182" name="b_xx182" value=""/><input type="hidden" id="b_yy182" name="b_yy182" value=""/></td>
								<td id="b_td_183" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(183,63,214);"><b><div id="b_area183">&nbsp;</div></b><input type="hidden"  id="b_stat183" name="b_stat183" value=""/><input type="hidden" id="b_xx183" name="b_xx183" value=""/><input type="hidden" id="b_yy183" name="b_yy183" value=""/></td>
								<td id="b_td_184" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(184,92,214);"><b><div id="b_area184">&nbsp;</div></b><input type="hidden"  id="b_stat184" name="b_stat184" value=""/><input type="hidden" id="b_xx184" name="b_xx184" value=""/><input type="hidden" id="b_yy184" name="b_yy184" value=""/></td>
								<td id="b_td_185" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(185,121,214);"><b><div id="b_area185">&nbsp;</div></b><input type="hidden"  id="b_stat185" name="b_stat185" value=""/><input type="hidden" id="b_xx185" name="b_xx185" value=""/><input type="hidden" id="b_yy185" name="b_yy185" value=""/></td>
								<td id="b_td_186" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(186,150,214);"><b><div id="b_area186">&nbsp;</div></b><input type="hidden"  id="b_stat186" name="b_stat186" value=""/><input type="hidden" id="b_xx186" name="b_xx186" value=""/><input type="hidden" id="b_yy186" name="b_yy186" value=""/></td>
								<td id="b_td_187" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(187,179,214);"><b><div id="b_area187">&nbsp;</div></b><input type="hidden"  id="b_stat187" name="b_stat187" value=""/><input type="hidden" id="b_xx187" name="b_xx187" value=""/><input type="hidden" id="b_yy187" name="b_yy187" value=""/></td>
								<td id="b_td_188" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(188,208,214);"><b><div id="b_area188">&nbsp;</div></b><input type="hidden"  id="b_stat188" name="b_stat188" value=""/><input type="hidden" id="b_xx188" name="b_xx188" value=""/><input type="hidden" id="b_yy188" name="b_yy188" value=""/></td>
								<td id="b_td_189" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(189,237,214);"><b><div id="b_area189">&nbsp;</div></b><input type="hidden"  id="b_stat189" name="b_stat189" value=""/><input type="hidden" id="b_xx189" name="b_xx189" value=""/><input type="hidden" id="b_yy189" name="b_yy189" value=""/></td>
								<td id="b_td_190" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(190,266,214);"><b><div id="b_area190">&nbsp;</div></b><input type="hidden"  id="b_stat190" name="b_stat190" value=""/><input type="hidden" id="b_xx190" name="b_xx190" value=""/><input type="hidden" id="b_yy190" name="b_yy190" value=""/></td>
								<td id="b_td_191" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(191,295,214);"><b><div id="b_area191">&nbsp;</div></b><input type="hidden"  id="b_stat191" name="b_stat191" value=""/><input type="hidden" id="b_xx191" name="b_xx191" value=""/><input type="hidden" id="b_yy191" name="b_yy191" value=""/></td>
								<td id="b_td_192" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(192,324,214);"><b><div id="b_area192">&nbsp;</div></b><input type="hidden"  id="b_stat192" name="b_stat192" value=""/><input type="hidden" id="b_xx192" name="b_xx192" value=""/><input type="hidden" id="b_yy192" name="b_yy192" value=""/></td>
								<td id="b_td_193" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(193,353,214);"><b><div id="b_area193">&nbsp;</div></b><input type="hidden"  id="b_stat193" name="b_stat193" value=""/><input type="hidden" id="b_xx193" name="b_xx193" value=""/><input type="hidden" id="b_yy193" name="b_yy193" value=""/></td>
								<td id="b_td_194" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(194,382,214);"><b><div id="b_area194">&nbsp;</div></b><input type="hidden"  id="b_stat194" name="b_stat194" value=""/><input type="hidden" id="b_xx194" name="b_xx194" value=""/><input type="hidden" id="b_yy194" name="b_yy194" value=""/></td>
								<td id="b_td_195" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(195,411,214);"><b><div id="b_area195">&nbsp;</div></b><input type="hidden"  id="b_stat195" name="b_stat195" value=""/><input type="hidden" id="b_xx195" name="b_xx195" value=""/><input type="hidden" id="b_yy195" name="b_yy195" value=""/></td>
								<td id="b_td_196" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(196,440,214);"><b><div id="b_area196">&nbsp;</div></b><input type="hidden"  id="b_stat196" name="b_stat196" value=""/><input type="hidden" id="b_xx196" name="b_xx196" value=""/><input type="hidden" id="b_yy196" name="b_yy196" value=""/></td>
								<td id="b_td_197" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(197,469,214);"><b><div id="b_area197">&nbsp;</div></b><input type="hidden"  id="b_stat197" name="b_stat197" value=""/><input type="hidden" id="b_xx197" name="b_xx197" value=""/><input type="hidden" id="b_yy197" name="b_yy197" value=""/></td>
								<td id="b_td_198" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(198,498,214);"><b><div id="b_area198">&nbsp;</div></b><input type="hidden"  id="b_stat198" name="b_stat198" value=""/><input type="hidden" id="b_xx198" name="b_xx198" value=""/><input type="hidden" id="b_yy198" name="b_yy198" value=""/></td>
								<td id="b_td_199" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(199,527,214);"><b><div id="b_area199">&nbsp;</div></b><input type="hidden"  id="b_stat199" name="b_stat199" value=""/><input type="hidden" id="b_xx199" name="b_xx199" value=""/><input type="hidden" id="b_yy199" name="b_yy199" value=""/></td>
								<td id="b_td_200" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(200,556,214);"><b><div id="b_area200">&nbsp;</div></b><input type="hidden"  id="b_stat200" name="b_stat200" value=""/><input type="hidden" id="b_xx200" name="b_xx200" value=""/><input type="hidden" id="b_yy200" name="b_yy200" value=""/></td>
							</tr>
						</table>
					</div>
				</div>
			</div><!-- //tab_content04 -->

			
			<div id="b_uscasttus_tab_2" style="display:none;">
				<div class="New_agbox">
	                <h2 class="tit"><span></span>외부부위 상태표시</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	                <table>
	                    <colgroup>
	                        <col width="20%" />
                            <col width="30%" />
                            <col width="20%" />
                            <col width="30%" />
	                    </colgroup>	                    
						<tr>
                            <th scope="row">후드</th>
                            <td>
                                <div id="b_s037">해당없음</div>
                            </td>
                            <th scope="row">프론드휀더</th>
                            <td class="last">
                                <div  id="b_s038">해당없음</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">도어</th>
                            <td>
                                <div id="b_s039">해당없음</div>
                            </td>
                            <th scope="row">트렁크리드</th>
                            <td class="last">
                                <div  id="b_s040">해당없음</div>
                            </td>
                        </tr>
	                </table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>주요골격 부위 상태표시</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	                <table>
	                    <colgroup>
	                        <col width="20%" />
                            <col width="30%" />
                            <col width="20%" />
                            <col width="30%" />
	                    </colgroup>	                    
						<tr>
                            <th scope="row">프론트패널</th>
                            <td>
                                <div  id="b_s045">해당없음</div>
                            </td>
                            <th scope="row">인사이드패널</th>
                            <td class="last">
                                <div  id="b_s047">해당없음</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">휠하우스</th>
                            <td>
                                <div  id="b_s049">해당없음</div>
                            </td>
                            <th scope="row">루프패널</th>
                            <td class="last">
                                <div  id="b_s042">해당없음</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">쿼터패널</th>
                            <td>
                                <div  id="b_s043">해당없음</div>
                            </td>
                            <th scope="row">플로어패널</th>
                            <td class="last">
                                <div  id="b_s051">해당없음</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">리어패널</th>
                            <td>
                                <div  id="b_s053">해당없음</div>
                            </td>
                            <th scope="row">사이드멤버</th>
                            <td class="last">
                                <div  id="b_s048">해당없음</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">크로스멤버</th>
                            <td>
                                <div  id="b_s046">해당없음</div>
                            </td>
                            <th scope="row">필러패널</th>
                            <td class="last">
                                <div  id="b_s052">해당없음</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">대쉬패널</th>
                            <td>
                                <div  id="b_s050">해당없음</div>
                            </td>
                            <th scope="row">트렁크플로어</th>
                            <td class="last">
                                <div  id="b_s054">해당없음</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">사이드실패널</th>
                            <td class="row">
                                <div  id="b_s044">해당없음</div>
                            </td>
                            <th scope="row">라디에이터 서포트 </th>
                            <td class="last">
                                <div  id="b_s041">해당없음</div>
                            </td>                                  
                        </tr>
                        <tr>
                            <th scope="row">패키지트레이</th>
                            <td colspan=3 class="last">
                                <div  id="b_s056">해당없음</div>
                            </td>               
                        </tr>
	                </table>
	            </div>
	        </div>    
	        
			<div id="b_uscasttus_tab_3">
				<div class="New_agbox">
	                <h2 class="tit"><span></span>원동기 점검결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	                    <colgroup>
	                        <col style="width: 30%;">
	                        <col style="width: 20%;">
	                        <col style="width: 30%;">
	                        <col style="width: 20%;">
	                    </colgroup>
	                    <tr>
							<th scope="row">작동상태(공회전)</th>
							<td style="padding:5px">
								<div id="b_s001" name="b_s001">양호</div>
							</td>
							<th scope="row">오일누유 - 실린더 헤드</th>
							<td style="padding:5px">
								<div id="b_s003">없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">오일누유-실린더블럭</th>
                            <td class="row" style="padding:5px">
                                <div id="b_s004">없음</div>
                            </td>
                            <th scope="row">오일유량 및 오염</th>
                            <td class="last" style="padding:5px">
                                <div id="b_s005">적정</div>
                            </td> 
						</tr>
						<tr> 
                            <th scope="row">냉각수누수-실린더 블럭</th>
                            <td class="row" style="padding:5px">
                                <div id="b_s006">없음</div>
                            </td>
                            <th scope="row">냉각수누수-시린더 해드/가스켓</th>
                            <td class="last" style="padding:5px">
                                <div id="b_s007">없음</div>
                            </td>
                        </tr>
						<tr>
                            <th scope="row">냉각수누수-워터펌프</th>
                            <td style="padding:5px">
                                <div id="b_s008">없음</div>
                            </td>
                            <th scope="row">냉각수누수-냉각쿨러(라디에이터)</th>
                            <td class="last" style="padding:5px">
                                <div id="b_s009">없음</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">냉각수 누수-냉각수량 및 오염</th>
                            <td style="padding:5px">
                                <div id="b_s010">적정</div>
                            </td>
                            <th scope="row">고압펌프(커먼레일)</th>
                            <td class="last" style="padding:5px">
                                <div id="b_s011">양호</div>
                            </td>
                        </tr>
	                </table>    
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>동력전달장치 점검결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	                    <colgroup>
							<col width="30%"/>
							<col width="20%"/>
							<col width="30%"/>
							<col width="20%"/>
						</colgroup>
						<tr>
                            <th scope="row">자동변속기(A/T)-오일누유</th>
                            <td style="padding:5px">
                                <div  id="b_s012">없음</div>
                            </td>
                            <th scope="row">자동변속기(A/T)-오일유량및상태</th>
                            <td class="last" style="padding:5px">
                                <div  id="b_s013">적정</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">자동변속기(A/T)-작동상태(공회전)</th>
                            <td colspan=3 class="last" style="padding:5px">
                                <div  id="b_s016">양호</div>
                            </td>
                        </tr>                            
                        
                        <tr>
                            <th scope="row">수동변속기(M/T)-오일누유</th>
                            <td colspan=3 class="last" style="padding:5px">
                                <div  id="b_s017" name="s017">없음</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">수동변속기(M/T)-기어변속장치</th>
                            <td colspan=3 class="last" style="padding:5px">
                                <div  id="b_s018">양호</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">수동변속기(M/T)-오일유량및상태</th>
                            <td style="padding:5px">
                                <div  id="b_s019">적정</div>
                            </td>
                            <th scope="row">수동변속기(M/T)-작동상태(공회전)</th>
                            <td class="last" style="padding:5px">
                                <div  id="b_s020">양호</div>
                            </td>
                        </tr>
                        <!--  동력전달  -->
                        <tr>
                            <th scope="row">동력전달-클러치 어셈블러</th>
                            <td class="last" colspan="3" style="padding:5px">
                                <div  id="b_s021">양호</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">동력전달-등속죠인트</th>
                            <td class="last" colspan="3" style="padding:5px">
                                <div  id="b_s022">양호</div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">동력전달-추진축 및 베어링</th>
                            <td class="last" colspan=3 style="padding:5px">
                                <div  id="b_s023">양호</div>
                            </td>
                        </tr>                      
						
	                </table> 
	            </div>
	        </div>   
	        
	        <div id="b_uscasttus_tab_4" style="display:none;">
				<div class="New_agbox">
	                <h2 class="tit"><span></span>조향장치 점걸결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="30%"/>
						<col width="70%"/>
					</colgroup>
					<tr>
                        <th scope="row">동력조향 작동 오일 누유</th>
                        <td class="last" style="padding:5px">
                            <div  id="b_s024" name="b_s024">없음</div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">작동상태 - 스티어링 기어</th>
                        <td class="last" style="padding:5px">
                            <div  id="b_s025" name="b_s025">양호</div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">작동상태 - 스티어링 펌프</th>
                        <td class="last" style="padding:5px">
                            <div  id="b_s026" name="b_s026">양호</div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">타이로드앤드 및 볼 죠인트</th>
                        <td class="last" style="padding:5px">
                            <div  id="b_s027" name="b_s027">양호</div>
                        </td>
                    </tr>
					</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>제동장치 점검결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="30%"/>
						<col width="20%"/>
						<col width="30%"/>
						<col width="20%"/>
					</colgroup>
					<tr>
                        <th scope="row">브레이크 오일 유량</th>
                            <td style="padding:5px">
                            <div id="b_s028" >적정</div>
                        </td>
                        <th scope="row">브레이크 오일 누유</th>
                        <td class="last" style="padding:5px">
                            <div id="b_s029" >없음</div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">배력장치 작동상태</th>
                        <td class="last" colspan="3" style="padding:5px">
                            <div id="b_s030">양호</div>
                        </td>
                    </tr>
					</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>전기장치 점검결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
                        <col width="30%"/>
                        <col width="20%"/>
                        <col width="30%"/>
                        <col width="20%"/>
                    </colgroup>                    
                    <tr>
                        <th scope="row">발전기 출력</th>
                        <td style="padding:5px">
                            <div id="b_s031">양호</div>
                        </td>
                        <th scope="row">시동 모터</th>
                        <td class="last" style="padding:5px">
                            <div id="b_s055">양호</div>
                        </td>
                                                    </tr>
                    <tr>
                        <th scope="row">와이퍼모터기능</th>
                        <td class="row" style="padding:5px">
                            <div id="b_s032">양호</div>
                        </td>

                        <th scope="row">실내송풍모터</th>
                        <td class="last" style="padding:5px">
                            <div id="b_s033">양호</div>
                        </td>  
                                                    </tr>
                    <tr>                          
                        <th scope="row">라디에이터 팬 모터</th>
                        <td colspan=3 class="last" style="padding:5px" >
                            <div id="b_s034">양호</div>
                        </td>
                    </tr>
                    </table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>기타장치 점검결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
                        <col width="30%"/>
                        <col width="20%"/>
                        <col width="30%"/>
                        <col width="20%"/>
                    </colgroup>                    
                    <tr>
                        <th scope="row">연료누출(LP가스포함)</th>
                        <td style="padding:5px">
                            <div id="b_s035" name="b_s035">없음</div>
                        </td>
                        <th scope="row">원도우모터작동</th>
                        <td class="last">
                            <div id="b_s036">양호</div>
                        </td>
                    </tr>                    
                    </table>
	            </div>
	        </div> 
	        
	        <div id="b_uscasttus_tab_5" style="display:none;">
				<div class="New_agbox">
	                <h2 class="tit"><span></span>고지정보</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="19%" />
						<col width="31%" />
						<col width="19%" />
						<col width="31%" />
					</colgroup>
					<tbody>
					<tr>
						<th scope="row">접수자(명칭)</th>
						<td><em id="b_usca_register_nm_txt" name="b_usca_register_nm_txt"></em></td>
						<th scope="row">접수일</th>
						<td><em id="b_usca_r_rcept_de_txt" name="b_usca_r_rcept_de_txt"></em></td>
					</tr>
					<tr>
						<th scope="row">고지업체명</th>
						<td><em id="b_usca_ntic_entrps_nm" name="b_usca_ntic_entrps_nm"></em></td>
						<th scope="row">고지자명</th>
						<td><em id="b_usca_ntic_person_nm_txt" name="b_usca_ntic_person_nm_txt"></em></td>
					</tr>
	            	</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>점검정보</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="19%" />
						<col width="31%" />
						<col width="19%" />
						<col width="31%" />
					</colgroup>
					<tbody>
					<tr>
						<th scope="row">등록번호</th>
					  	<td>
					  		<em id="b_usca_chck_imprmn_entrps_id"></em>
					  	</td>
						<th scope="row">등록업체명</th>
						<td class="last">
							<em id="b_usca_chck_entrps_nm"></em>
						</td>
					</tr>
					<tr>
						<th scope="row">점검일</th>
						<td>
							<em id="b_usca_chck_de"></em>
						</td>
						<th scope="row">점검자명</th>
						<td class="last">
							<em id="b_usca_insctr_nm"></em>
						</td>
					</tr>
	            	</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>매수정보</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="19%" />
						<col width="31%" />
						<col width="19%" />
						<col width="31%" />
					</colgroup>
					<tbody>
					<tr>
						<th scope="row">매수일</th>
						<td>
							<em id="b_usca_buyer_de"></em>
						</td>
						<th scope="row">매수인명</th>
						<td>
							<em id="b_usca_buyer_nm"></em>
						</td>
					</tr>
	            	</table>
	            </div>
	            
	             <div class="New_agbox">
	                <h2 class="tit"><span></span>특기사항 및 점검자의 의견</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<tr>
                        <td class="last">
                            <em id="b_usca_etc_matter"></em>
                        </td>
                    </tr>
	            	</table>
	            </div>
	        </div>
        </div>
        
    </div>
    <div class="popup_add_btn" id="b_uscaSttus_close_btn"><a href="#none">확인</a></div>
    </div>
</div><script>

$(document).on('click','#c_item1',function(){
	$('#c_uscasttus_tab_1').show();
	$('#c_uscasttus_tab_2').hide();
	$('#c_uscasttus_tab_3').hide();
	$('#c_uscasttus_tab_4').hide();
	$('#c_uscasttus_tab_5').hide();
});
$(document).on('click','#c_item2',function(){
	$('#c_uscasttus_tab_1').hide();
	$('#c_uscasttus_tab_2').show();
	$('#c_uscasttus_tab_3').hide();
	$('#c_uscasttus_tab_4').hide();
	$('#c_uscasttus_tab_5').hide();
});
$(document).on('click','#c_item3',function(){
	$('#c_uscasttus_tab_1').hide();
	$('#c_uscasttus_tab_2').hide();
	$('#c_uscasttus_tab_3').show();
	$('#c_uscasttus_tab_4').hide();
	$('#c_uscasttus_tab_5').hide();
});
$(document).on('click','#c_item4',function(){
	$('#c_uscasttus_tab_1').hide();
	$('#c_uscasttus_tab_2').hide();
	$('#c_uscasttus_tab_3').hide();
	$('#c_uscasttus_tab_4').show();
	$('#c_uscasttus_tab_5').hide();
});
$(document).on('click','#c_item5',function(){
	$('#c_uscasttus_tab_1').hide();
	$('#c_uscasttus_tab_2').hide();
	$('#c_uscasttus_tab_3').hide();
	$('#c_uscasttus_tab_4').hide();
	$('#c_uscasttus_tab_5').show();
});

$(function(){
	$("#c_uscaSttus_close").click(function() {
	    $("#c_popup_uscaSttus").hide();
	});
	
	$("#c_uscaSttus_close_btn").click(function() {
	    $("#c_popup_uscaSttus").hide();
	});
});

var c_M01_  = ''; var c_M01_1 = '승용'; var c_M01_2 = '승합'; var c_M01_3 = '화물'; var c_M01_4 = '특수'; var c_M01_5 = '이륜'; var c_M01_6 = '피견인'; var c_M01_9 = '기타';
var c_M02_ = ''; var c_M02_0 = '양호'; var c_M02_1 = '불량'; 
var c_M03_ = ''; var c_M03_A = '자동'; var c_M03_C = '무단변속기'; var c_M03_M = '수동'; var c_M03_S = '세미오토'; var c_M03_X = '기타';
var c_M04_ = ''; var c_M04_1 = '자가 보증'; var c_M04_2 = '보험사 보증';
var c_M05_ = ''; var c_M05_1 = '양호'; var c_M05_2 = '상이'; var c_M05_3 = '부식'; var c_M05_4 = '훼손(오손)'; var c_M05_5 = '변조(변타)'; var c_M05_6 = '도말';
var c_M06_ = ''; var c_M06_0 = '없음'; var c_M06_1 = '있음'; var c_M06_2 = '불법';
var c_M07_ = ''; var c_M07_0 = '없음'; var c_M07_1 = '침수'; var c_M07_2 = '화재';
var c_M08_ = ''; var c_M08_1 = '양호'; var c_M08_2 = '정비요';
var c_M09_ = ''; var c_M09_1 = '양호'; var c_M09_2 = '정비요';
var c_M10_ = ''; var c_M10_a = '가솔린'; var c_M10_b = '디젤'; var c_M10_c = 'LPG'; var c_M10_d = '전기'; var c_M10_e = '수소전기'; var c_M10_x = '하이브리드'; var c_M10_z = '기타';
var c_M11_ = ''; var c_M11_0 = '무'; var c_M11_1 = '유';
//if("2"==refoam_at){//신규
	
	var c_M20_ = "";   var c_M20_1 = '적음'; var c_M20_2 = '보통'; var c_M20_3 = '많음'; //주행거리상태
	var c_M21_ = '없음'; var c_M21_0 = '없음'; var c_M21_1 = '렌트'; var c_M21_2 = '리스'; var c_M21_3 = '영업용'; //용도변경
	var c_M22_ = '없음'; var c_M22_0 = '없음'; var c_M22_1 = '무채색'; var c_M22_2 = '유채색'; //색상여부
	var c_M23_ = '없음'; var c_M23_0 = '없음'; var c_M23_1 = '전체도색'; var c_M23_2 = '색상변경'; //색상변경여부
	var c_M24_ = '없음'; var c_M24_0 = '없음'; var c_M24_1 = '있음'; //주요옵션_썬루프
	var c_M25_ = '없음'; var c_M25_0 = '없음'; var c_M25_1 = '있음'; //주요옵션_네비게이션
	var c_M26_ = '없음'; var c_M26_0 = '없음'; var c_M26_1 = '있음'; //주요옵션_기타
	var c_M27_ = '없음'; var c_M27_0 = '없음'; var c_M27_1 = '있음'; //단순수리
	var c_M28_0 = '기술사회'; var c_M28_1 = '한국자동차진단보증협회'; //가격산정기준협회
      
	var c_M29_ = '양호'; var c_M29_0 = '양호'; var c_M29_1 = '불량'; //기타_외장
	var c_M30_ = '양호'; var c_M30_0 = '양호'; var c_M30_1 = '불량'; //기타_내장
	var c_M31_ = '양호'; var c_M31_0 = '양호'; var c_M31_1 = '불량'; //기타_광택
	var c_M32_ = '양호'; var c_M32_0 = '양호'; var c_M32_1 = '불량'; //기타_룸크리닝
	var c_M33_ = '양호'; var c_M33_0 = '양호'; var c_M33_1 = '불량'; //기타_유리
	
	var c_M62_ = '없음';   var c_M62_0 = '없음';   var c_M62_1 = '구조'; var c_M62_2 = '장치'; //불법구조변경,튜닝
	var c_M63_ = '해당없음'; var c_M63_0 = '해당없음'; var c_M63_1 = '해당'; //리콜대상여부
	var c_M64_ = '해당없음'; var c_M64_0 = '미이행';  var c_M64_1 = '이행'; var c_M64_2 = ''; //리콜이행여부
//}

var c_s001_1='양호'; var c_s001_2='지연'; var c_s001_3='소음'; var c_s001_4='정비요'; var c_s001_5='불량';
var c_s002_1='양호'; var c_s002_2='불량'; var c_s002_3='정비요'; 
var c_s003_1='없음'; var c_s003_2='미세누유'; var c_s003_3='누유'; var c_s003_4='정비요';
var c_s004_1='없음'; var c_s004_2='미세누유'; var c_s004_3='누유'; var c_s004_4='정비요';
var c_s005_1='적정'; var c_s005_2='부족'; var c_s005_3='오염'; var c_s005_4='교환요';
var c_s006_1='없음'; var c_s006_2='미세누수'; var c_s006_3='정비요';
var c_s007_1='없음'; var c_s007_2='미세누수'; var c_s007_3='누수'; var c_s007_4='정비요';
var c_s008_1='없음'; var c_s008_2='미세누수'; var c_s008_3='누수'; var c_s008_4='정비요';
var c_s009_1='없음'; var c_s009_2='미세누수'; var c_s009_3='누수'; var c_s009_4='정비요';
var c_s010_1='적정'; var c_s010_2='부족'; var c_s010_3='오염'; var c_s010_4='교환요(부식)';
var c_s011_1='양호'; var c_s011_2='정비요'; var c_s011_3='불량';
var c_s012_1='없음'; var c_s012_2='미세누유'; var c_s012_3='누유'; var c_s012_4='정비요';
var c_s013_1='적정'; var c_s013_2='부족'; var c_s013_3='과다'; var c_s013_4='오염(희석)';
var c_s014_1='양호'; var c_s014_2='슬립'; var c_s014_3='충격'; var c_s014_4='출력부족';
var c_s015_1='양호'; var c_s015_2='슬립'; var c_s015_3='충격'; var c_s015_4='출력부족';
var c_s016_1='양호'; var c_s016_2='지연'; var c_s016_3='소음'; var c_s016_4='정비요'; var c_s016_5='이상'; var c_s016_6='불량';
var c_s017_1='없음'; var c_s017_2='미세누유'; var c_s017_3='누유'; var c_s017_4='정비요';
var c_s018_1='양호'; var c_s018_2='물림/빠짐이상'; var c_s018_3='소음'; var c_s018_4='정비요'; var c_s018_5='불량';
var c_s019_1='적정'; var c_s019_2='부족'; var c_s019_3='과다'; var c_s019_4='오염(희석)';
var c_s020_1='양호'; var c_s020_2='지연'; var c_s020_3='소음'; var c_s020_4='정비요'; var c_s020_5='이상'; var c_s020_6='불량';
var c_s021_1='양호'; var c_s021_2='누유'; var c_s021_3='슬립'; var c_s021_4='소음'; var c_s021_5='정비요'; var c_s021_6='이상'; var c_s021_7='불량';
var c_s022_1='양호'; var c_s022_2='고무부트손상'; var c_s022_3='정비요'; var c_s022_4='불량';
var c_s023_1='양호'; var c_s023_2='소음'; var c_s023_3='유격'; var c_s023_4='정비요'; var c_s023_5='불량';
var c_s024_1='없음'; var c_s024_2='미세누유'; var c_s024_3='누유'; var c_s024_4='정비요'; 
var c_s025_1='양호'; var c_s025_2='소음'; var c_s025_3='유격'; var c_s025_4='정비요'; var c_s025_5='불량';
var c_s026_1='양호'; var c_s026_2='소음'; var c_s026_3='정비요'; var c_s026_4='불량';
var c_s027_1='양호'; var c_s027_2='정비요'; var c_s027_3='불량';
var c_s028_1='적정'; var c_s028_2='부족'; var c_s028_3='오염'; var c_s028_4='교환요';
var c_s029_1='없음'; var c_s029_2='정비요'; var c_s029_3='누유'; var c_s029_4='미세누유';
var c_s030_1='양호'; var c_s030_2='정비요'; var c_s030_3='불량';
var c_s031_1='양호'; var c_s031_2='정비요'; var c_s031_3='불량';
var c_s032_1='양호'; var c_s032_2='정비요'; var c_s032_3='불량';
var c_s033_1='양호'; var c_s033_2='소음'; var c_s033_3='정비요'; var c_s033_4='불량';
var c_s034_1='양호'; var c_s034_2='소음'; var c_s034_3='정비요'; var c_s034_4='불량';
var c_s035_1='없음'; var c_s035_2='있음';
var c_s036_1='양호'; var c_s036_2='소음'; var c_s036_3='정비요'; var c_s036_4='불량';
var c_s037_1='해당없음'; var c_s037_2='교환(교체)'; var c_s037_3='판금,용접'; var c_s037_4='부식'; var c_s037_5='흠집'; var c_s037_6='요철'; var c_s037_7='손상';
var c_s038_1='해당없음'; var c_s038_2='교환(교체)'; var c_s038_3='판금,용접'; var c_s038_4='부식'; var c_s038_5='흠집'; var c_s038_6='요철'; var c_s038_7='손상';
var c_s039_1='해당없음'; var c_s039_2='교환(교체)'; var c_s039_3='판금,용접'; var c_s039_4='부식'; var c_s039_5='흠집'; var c_s039_6='요철'; var c_s039_7='손상';
var c_s040_1='해당없음'; var c_s040_2='교환(교체)'; var c_s040_3='판금,용접'; var c_s040_4='부식'; var c_s040_5='흠집'; var c_s040_6='요철'; var c_s040_7='손상';
var c_s041_1='해당없음'; var c_s041_2='교환(교체)'; var c_s041_3='판금,용접'; var c_s041_4='부식'; var c_s041_5='흠집'; var c_s041_6='요철'; var c_s041_7='손상';
var c_s042_1='해당없음'; var c_s042_2='교환(교체)'; var c_s042_3='판금,용접'; var c_s042_4='부식'; var c_s042_5='흠집'; var c_s042_6='요철'; var c_s042_7='손상';
var c_s043_1='해당없음'; var c_s043_2='교환(교체)'; var c_s043_3='판금,용접'; var c_s043_4='부식'; var c_s043_5='흠집'; var c_s043_6='요철'; var c_s043_7='손상';
var c_s044_1='해당없음'; var c_s044_2='교환(교체)'; var c_s044_3='판금,용접'; var c_s044_4='부식'; var c_s044_5='흠집'; var c_s044_6='요철'; var c_s044_7='손상';
var c_s045_1='해당없음'; var c_s045_2='교환(교체)'; var c_s045_3='판금,용접'; var c_s045_4='부식'; var c_s045_5='흠집'; var c_s045_6='요철'; var c_s045_7='손상';
var c_s046_1='해당없음'; var c_s046_2='교환(교체)'; var c_s046_3='판금,용접'; var c_s046_4='부식'; var c_s046_5='흠집'; var c_s046_6='요철'; var c_s046_7='손상';
var c_s047_1='해당없음'; var c_s047_2='교환(교체)'; var c_s047_3='판금,용접'; var c_s047_4='부식'; var c_s047_5='흠집'; var c_s047_6='요철'; var c_s047_7='손상';
var c_s048_1='해당없음'; var c_s048_2='교환(교체)'; var c_s048_3='판금,용접'; var c_s048_4='부식'; var c_s048_5='흠집'; var c_s048_6='요철'; var c_s048_7='손상';
var c_s049_1='해당없음'; var c_s049_2='교환(교체)'; var c_s049_3='판금,용접'; var c_s049_4='부식'; var c_s049_5='흠집'; var c_s049_6='요철'; var c_s049_7='손상';
var c_s050_1='해당없음'; var c_s050_2='교환(교체)'; var c_s050_3='판금,용접'; var c_s050_4='부식'; var c_s050_5='흠집'; var c_s050_6='요철'; var c_s050_7='손상';
var c_s051_1='해당없음'; var c_s051_2='교환(교체)'; var c_s051_3='판금,용접'; var c_s051_4='부식'; var c_s051_5='흠집'; var c_s051_6='요철'; var c_s051_7='손상';
var c_s052_1='해당없음'; var c_s052_2='교환(교체)'; var c_s052_3='판금,용접'; var c_s052_4='부식'; var c_s052_5='흠집'; var c_s052_6='요철'; var c_s052_7='손상';
var c_s053_1='해당없음'; var c_s053_2='교환(교체)'; var c_s053_3='판금,용접'; var c_s053_4='부식'; var c_s053_5='흠집'; var c_s053_6='요철'; var c_s053_7='손상';
var c_s054_1='해당없음'; var c_s054_2='교환(교체)'; var c_s054_3='판금,용접'; var c_s054_4='부식'; var c_s054_5='흠집'; var c_s054_6='요철'; var c_s054_7='손상';
var c_s055_1='양호'; var c_s055_2='정비요'; var c_s055_3='불량'; 
var c_s056_1='해당없음'; var c_s056_2='교환(교체)'; var c_s056_3='판금,용접'; var c_s056_4='부식'; var c_s056_5='흠집'; var c_s056_6='요철'; var c_s056_7='손상';
var c_s057_1='없음'; var c_s057_2='미세누유'; var c_s057_3='누유';
var c_s058_1='없음'; var c_s058_2='미세누유'; var c_s058_3='누유';
var c_s059_1='없음'; var c_s059_2='미세누유'; var c_s059_3='누유';
var c_s060_1='양호'; var c_s060_5='불량';
var c_s061_1='양호'; var c_s061_5='불량';
var c_s062_1='양호'; var c_s062_5='불량';
var c_s063_1='양호'; var c_s063_5='불량';
var c_s064_1='양호'; var c_s064_5='불량';
var c_s065_1='양호'; var c_s065_5='불량';

</script>

<div id="c_popup_uscaSttus" style="display: none;">
 <div class="popup_contents popup_full_popup">
     <div class="popup_title popup_full_title">
         <span>중고차성능상태점검기록부 상세</span>
         <button type="button" class="close" id="c_uscaSttus_close"> <span onclick="">×</span> </button>
     </div>
     <div class="popup_full_box">
         <div class="popup_full_sub_box">
             <!--                세부내역 넣는곳-->
             <div class="New_agbox">
                 <h2 class="tit"><span></span>자동차 기본정보</h2>
             </div>
             <div class="tblwrap_basic">
                 <table>
                     <colgroup>
                         <col style="width: 15%;">
                         <col style="width: 20%;">
                         <col style="width: 15%;">
                         <col style="width: 20%;">
                         <col style="width: 10%;">
                         <col style="width: 10%;">
                     </colgroup>
                     <tr>
                         <th>접수번호</th>
                         <td colspan="5" id="c_usca_recpt_no"></td>
                     </tr>
                     <tr>
                         <th>차명</th>
                         <td id="c_usca_cnm">
                         </td>
                         <th>차량등록번호</th>
                         <td id="c_usca_vhrno"></td>
                         <th>차종</th>
                         <td id="c_usca_vhcty_asort_code"></td>
                     </tr>
                     <tr>
                         <th>연식</th>
                         <td id="c_usca_prye"></td>
                         <th>검사유효기간</th>
                         <td colspan="3" id="c_usca_inspt_valid_pd_de"></td>
                     </tr>
                      <tr>
                         <th>최초등록일</th>
                         <td id="c_usca_frst_regist_de"></td>
                         <th>차대변호</th>
                         <td colspan="3" id="c_usca_vin"></td>
                     </tr>
                      <tr>
                         <th>변속기 종류</th>
                         <td id="c_usca_grbx_knd_code"></td>
                         <th>사용연료</th>
                         <td colspan="3" id="c_usca_use_fuel_code"></td>
                     </tr>
                      <tr>
                         <th>원동기형식</th>
                         <td id="c_usca_mtrs_fom"></td>
                         <th>보증 유형</th>
                         <td colspan="3" id="c_usca_assrnc_ty_se_code"></td>
                     </tr>
                 </table>
             </div>
             
             <div class="New_agbox">
                 <h2 class="tit"><span></span>자동차 종합상태</h2>
             </div>
             
             <div class="tblwrap_basic">
                 <table>
                     <colgroup>
                         <col style="width: 33%;">
                         <col style="width: 33%;">
                         <col style="width: 33%;">
                     </colgroup>
                     <tr>
                         <th>사용이력</th>
                         <th>상태</th>
                         <th>항목 / 해당부품</th>
                     </tr>
                    <tr>
                         <th>계기상태</th>
                         <td id="c_usca_gauge_fnct_at"></td>
                         <td rowspan="2" id="c_usca_trvl_dstnc"></td>
                     </tr>
                     <tr>
                         <th>주행거리</th>
                         <td id="c_usca_trvl_dstnc_sttus_code"></td>
                     </tr>
                     <tr>
                         <th>차대번호표기</th>
                         <td colspan="2" id="c_usca_samenss_cnfirm_code"></td>
                     </tr>
                     <tr>
                         <th>튜닝</th>
                         <td id="c_usca_unlaw_stmd_at"></td>
                         <td id="c_usca_unlaw_stmd_iem_se_code"></td>
                     </tr>
                    <tr>
                         <th>특별이력</th>
                         <td colspan="2" id="c_usca_flud_at"></td>
                     </tr>
                     <tr>
                         <th>용도변경</th>
                         <td colspan="2" id="c_usca_prpos_change_se_code"></td>
                     </tr>
                     <tr>
                         <th>리콜대상여부</th>
                         <td colspan="2" id="c_usca_recall_trget_at"></td>
                     </tr>
                     <tr>
                         <th>리콜이행여부</th>
                         <td colspan="2" id="c_usca_recall_flfl_at"></td>
                     </tr>
                 </table>
             </div>
             
             <div class="New_agbox">
                 <h2 class="tit"><span></span>자기진단사항</h2>
             </div>
             
             <div class="tblwrap_basic">
                 <table>
                     <colgroup>
                         <col style="width: 30%;">
                         <col style="width: 70%;">
                     </colgroup>
                     <tr>
                         <th>원동기</th>
                         <td id="c_usca_engine_stblt_at"></td>
                     </tr>
                     <tr>
                         <th>변속기</th>
                         <td id="c_usca_grbx_stblt_at"></td>
                     </tr>
                 </table>
             </div>
              
             <div class="New_agbox">
                 <h2 class="tit"><span></span>배출가스</h2>
             </div>
                             
             <div class="tblwrap_basic">
                 <table>
                     <colgroup>
                         <col style="width: 30%;">
                         <col style="width: 70%;">
                     </colgroup>
                     <tr>
                         <th>일산화탄소(CO)</th>
                         <td id="c_usca_crmn_mesure_value"></td>
                     </tr>
                     <tr>
                         <th>탄화수소(HC)</th>
                         <td id="c_usca_hydr_mesure_value"></td>
                     </tr>
                     <tr>
                         <th>매연</th>
                         <td id="c_usca_smoke_mesure_value"></td>
                     </tr>
                 </table>
             </div>
             
             <div class="New_agbox">
                 <h2 class="tit"><span></span>사고이력</h2>
             </div>
             
             <div class="tblwrap_basic">
                 <table>
                     <colgroup>
                         <col style="width: 20%;">
                         <col style="width: 30%;">
                         <col style="width: 20%;">
                         <col style="width: 30%;">
                        </colgroup>
                        <tr>
                            <th>사고이력</th>
                            <td id="c_usca_acdnt_at"></td>
                            <th>단순수리</th>
                            <td id="c_usca_simpl_repair_at"></td>
                        </tr>
                 </table>
             </div>
             
             <div class="New_agbox">
                 <h2 class="tit"><span></span>경정사유</h2>
             </div>
             
             <div class="tblwrap_basic">
                 <table>
                     <tr>
                         <td><em id="c_usca_upd_reason_txt"></em></td>
                     </tr>
                 </table>
             </div>
             <br/><br/>
             <div class="tab_box01">
				<div class="box_layout">
					<ul class="New_tbls">
						<li class="tbl_cell">
							<label class="box-radio-input">
								<input type="radio" name="c_item1" id="c_item1" checked="checked">
								<span style="font-size: 8px;">자동차의 상태표시</span>
							</label>
						</li>
						<li class="tbl_cell">
							<label class="box-radio-input">
								<input type="radio" name="c_item1" id="c_item2">
								<span style="font-size: 8px;">외판/주요골격</span>
							</label>
						</li>
						<li class="tbl_cell">
							<label class="box-radio-input">
								<input type="radio" name="c_item1" id="c_item3">
								<span style="font-size: 8px;">원동기/동력전달</span>
							</label>
						</li>
						<li class="tbl_cell">
							<label class="box-radio-input">
								<input type="radio" name="c_item1" id="c_item4">
								<span style="font-size: 8px;">조향/제동/전기</span>
							</label>
						</li>
						<li class="tbl_cell">
							<label class="box-radio-input">
								<input type="radio" name="c_item1" id="c_item5">
								<span style="font-size: 8px;">처리정보</span>
							</label>
						</li>
					</ul>
				</div>
			</div>
			
			<div id="c_uscasttus_tab_1">
				<h5 style="text-align:left;">상태표시부호</h5>
				<p style="text-align:left;">
				<strong style="color:blue;">X</strong> : 교환(교체), 
				<strong style="color:red;">W</strong> : 판금,용접, 
				<strong style="color:green;">C</strong> : 부식 
				<strong style="color:orange;">A</strong> : 흠집,
				<strong style="color:purple;">U</strong> : 요철,
				<strong style="color:gray;">T</strong> : 손상<br />
				※ 승용차 외에는 승용차에 준하여 표시<br />
				</p>
				<br />
										
				<div style="width:650px; height:289px; background:url('/resource/common_dz/images/ao_car_state_new.jpg'); text-align:center; padding-top:32px;">
					<div id="c_markArea" style="position:relative; width:580px; height:230px; margin:0 auto;">
						<table id="c_markAreaTable" cellpadding="0" cellspacing="0" border="0" width="580px" height="230px" bordercolor="#000000" >
							<colgroup>
								<col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" />
								<col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" />
								<col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" />
								<col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" /><col width="5%" />
							</colgroup>
			
							<tr>
								<td id="c_td_1" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(1,5,7);"><b><div id="c_area1">&nbsp;</div></b><input type="hidden"  id="c_stat1" name="c_stat1" value=""/><input type="hidden" id="c_xx1" name="c_xx1" value=""/><input type="hidden" id="c_yy1" name="c_yy1" value=""/></td>
								<td id="c_td_2" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(2,34,7);"><b><div id="c_area2">&nbsp;</div></b><input type="hidden"  id="c_stat2" name="c_stat2" value=""/><input type="hidden" id="c_xx2" name="c_xx2" value=""/><input type="hidden" id="c_yy2" name="c_yy2" value=""/></td>
								<td id="c_td_3" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(3,63,7);"><b><div id="c_area3">&nbsp;</div></b><input type="hidden"  id="c_stat3" name="c_stat3" value=""/><input type="hidden" id="c_xx3" name="c_xx3" value=""/><input type="hidden" id="c_yy3" name="c_yy3" value=""/></td>
								<td id="c_td_4" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(4,92,7);"><b><div id="c_area4">&nbsp;</div></b><input type="hidden"  id="c_stat4" name="c_stat4" value=""/><input type="hidden" id="c_xx4" name="c_xx4" value=""/><input type="hidden" id="c_yy4" name="c_yy4" value=""/></td>
								<td id="c_td_5" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(5,121,7);"><b><div id="c_area5">&nbsp;</div></b><input type="hidden"  id="c_stat5" name="c_stat5" value=""/><input type="hidden" id="c_xx5" name="c_xx5" value=""/><input type="hidden" id="c_yy5" name="c_yy5" value=""/></td>
								<td id="c_td_6" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(6,150,7);"><b><div id="c_area6">&nbsp;</div></b><input type="hidden"  id="c_stat6" name="c_stat6" value=""/><input type="hidden" id="c_xx6" name="c_xx6" value=""/><input type="hidden" id="c_yy6" name="c_yy6" value=""/></td>
								<td id="c_td_7" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(7,179,7);"><b><div id="c_area7">&nbsp;</div></b><input type="hidden"  id="c_stat7" name="c_stat7" value=""/><input type="hidden" id="c_xx7" name="c_xx7" value=""/><input type="hidden" id="c_yy7" name="c_yy7" value=""/></td>
								<td id="c_td_8" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(8,208,7);"><b><div id="c_area8">&nbsp;</div></b><input type="hidden"  id="c_stat8" name="c_stat8" value=""/><input type="hidden" id="c_xx8" name="c_xx8" value=""/><input type="hidden" id="c_yy8" name="c_yy8" value=""/></td>
								<td id="c_td_9" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(9,230,7);"><b><div id="c_area9">&nbsp;</div></b><input type="hidden"  id="c_stat9" name="c_stat9" value=""/><input type="hidden" id="c_xx9" name="c_xx9" value=""/><input type="hidden" id="c_yy9" name="c_yy9" value=""/></td>
								<td id="c_td_10" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(10,266,7);"><b><div id="c_area10">&nbsp;</div></b><input type="hidden"  id="c_stat10" name="c_stat10" value=""/><input type="hidden" id="c_xx10" name="c_xx10" value=""/><input type="hidden" id="c_yy10" name="c_yy10" value=""/></td>
								<td id="c_td_11" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(11,295,7);"><b><div id="c_area11">&nbsp;</div></b><input type="hidden"  id="c_stat11" name="c_stat11" value=""/><input type="hidden" id="c_xx11" name="c_xx11" value=""/><input type="hidden" id="c_yy11" name="c_yy11" value=""/></td>
								<td id="c_td_12" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(12,324,7);"><b><div id="c_area12">&nbsp;</div></b><input type="hidden"  id="c_stat12" name="c_stat12" value=""/><input type="hidden" id="c_xx12" name="c_xx12" value=""/><input type="hidden" id="c_yy12" name="c_yy12" value=""/></td>
								<td id="c_td_13" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(13,353,7);"><b><div id="c_area13">&nbsp;</div></b><input type="hidden"  id="c_stat13" name="c_stat13" value=""/><input type="hidden" id="c_xx13" name="c_xx13" value=""/><input type="hidden" id="c_yy13" name="c_yy13" value=""/></td>
								<td id="c_td_14" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(14,382,7);"><b><div id="c_area14">&nbsp;</div></b><input type="hidden"  id="c_stat14" name="c_stat14" value=""/><input type="hidden" id="c_xx14" name="c_xx14" value=""/><input type="hidden" id="c_yy14" name="c_yy14" value=""/></td>
								<td id="c_td_15" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(15,411,7);"><b><div id="c_area15">&nbsp;</div></b><input type="hidden"  id="c_stat15" name="c_stat15" value=""/><input type="hidden" id="c_xx15" name="c_xx15" value=""/><input type="hidden" id="c_yy15" name="c_yy15" value=""/></td>
								<td id="c_td_16" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(16,440,7);"><b><div id="c_area16">&nbsp;</div></b><input type="hidden"  id="c_stat16" name="c_stat16" value=""/><input type="hidden" id="c_xx16" name="c_xx16" value=""/><input type="hidden" id="c_yy16" name="c_yy16" value=""/></td>
								<td id="c_td_17" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(17,469,7);"><b><div id="c_area17">&nbsp;</div></b><input type="hidden"  id="c_stat17" name="c_stat17" value=""/><input type="hidden" id="c_xx17" name="c_xx17" value=""/><input type="hidden" id="c_yy17" name="c_yy17" value=""/></td>
								<td id="c_td_18" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(18,498,7);"><b><div id="c_area18">&nbsp;</div></b><input type="hidden"  id="c_stat18" name="c_stat18" value=""/><input type="hidden" id="c_xx18" name="c_xx18" value=""/><input type="hidden" id="c_yy18" name="c_yy18" value=""/></td>
								<td id="c_td_19" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(19,527,7);"><b><div id="c_area19">&nbsp;</div></b><input type="hidden"  id="c_stat19" name="c_stat19" value=""/><input type="hidden" id="c_xx19" name="c_xx19" value=""/><input type="hidden" id="c_yy19" name="c_yy19" value=""/></td>
								<td id="c_td_20" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(20,556,7);"><b><div id="c_area20">&nbsp;</div></b><input type="hidden"  id="c_stat20" name="c_stat20" value=""/><input type="hidden" id="c_xx20" name="c_xx20" value=""/><input type="hidden" id="c_yy20" name="c_yy20" value=""/></td>
							</tr>
							<tr>
								<td id="c_td_21" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(21,5,30);"><b><div id="c_area21">&nbsp;</div></b><input type="hidden"  id="c_stat21" name="c_stat21" value=""/><input type="hidden" id="c_xx21" name="c_xx21" value=""/><input type="hidden" id="c_yy21" name="c_yy21" value=""/></td>
								<td id="c_td_22" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(22,34,30);"><b><div id="c_area22">&nbsp;</div></b><input type="hidden"  id="c_stat22" name="c_stat22" value=""/><input type="hidden" id="c_xx22" name="c_xx22" value=""/><input type="hidden" id="c_yy22" name="c_yy22" value=""/></td>
								<td id="c_td_23" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(23,63,30);"><b><div id="c_area23">&nbsp;</div></b><input type="hidden"  id="c_stat23" name="c_stat23" value=""/><input type="hidden" id="c_xx23" name="c_xx23" value=""/><input type="hidden" id="c_yy23" name="c_yy23" value=""/></td>
								<td id="c_td_24" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(24,92,30);"><b><div id="c_area24">&nbsp;</div></b><input type="hidden"  id="c_stat24" name="c_stat24" value=""/><input type="hidden" id="c_xx24" name="c_xx24" value=""/><input type="hidden" id="c_yy24" name="c_yy24" value=""/></td>
								<td id="c_td_25" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(25,121,30);"><b><div id="c_area25">&nbsp;</div></b><input type="hidden"  id="c_stat25" name="c_stat25" value=""/><input type="hidden" id="c_xx25" name="c_xx25" value=""/><input type="hidden" id="c_yy25" name="c_yy25" value=""/></td>
								<td id="c_td_26" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(26,150,30);"><b><div id="c_area26">&nbsp;</div></b><input type="hidden"  id="c_stat26" name="c_stat26" value=""/><input type="hidden" id="c_xx26" name="c_xx26" value=""/><input type="hidden" id="c_yy26" name="c_yy26" value=""/></td>
								<td id="c_td_27" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(27,179,30);"><b><div id="c_area27">&nbsp;</div></b><input type="hidden"  id="c_stat27" name="c_stat27" value=""/><input type="hidden" id="c_xx27" name="c_xx27" value=""/><input type="hidden" id="c_yy27" name="c_yy27" value=""/></td>
								<td id="c_td_28" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(28,208,30);"><b><div id="c_area28">&nbsp;</div></b><input type="hidden"  id="c_stat28" name="c_stat28" value=""/><input type="hidden" id="c_xx28" name="c_xx28" value=""/><input type="hidden" id="c_yy28" name="c_yy28" value=""/></td>
								<td id="c_td_29" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(29,237,30);"><b><div id="c_area29">&nbsp;</div></b><input type="hidden"  id="c_stat29" name="c_stat29" value=""/><input type="hidden" id="c_xx29" name="c_xx29" value=""/><input type="hidden" id="c_yy29" name="c_yy29" value=""/></td>
								<td id="c_td_30" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(30,266,30);"><b><div id="c_area30">&nbsp;</div></b><input type="hidden"  id="c_stat30" name="c_stat30" value=""/><input type="hidden" id="c_xx30" name="c_xx30" value=""/><input type="hidden" id="c_yy30" name="c_yy30" value=""/></td>
								<td id="c_td_31" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(31,295,30);"><b><div id="c_area31">&nbsp;</div></b><input type="hidden"  id="c_stat31" name="c_stat31" value=""/><input type="hidden" id="c_xx31" name="c_xx31" value=""/><input type="hidden" id="c_yy31" name="c_yy31" value=""/></td>
								<td id="c_td_32" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(32,324,30);"><b><div id="c_area32">&nbsp;</div></b><input type="hidden"  id="c_stat32" name="c_stat32" value=""/><input type="hidden" id="c_xx32" name="c_xx32" value=""/><input type="hidden" id="c_yy32" name="c_yy32" value=""/></td>
								<td id="c_td_33" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(33,353,30);"><b><div id="c_area33">&nbsp;</div></b><input type="hidden"  id="c_stat33" name="c_stat33" value=""/><input type="hidden" id="c_xx33" name="c_xx33" value=""/><input type="hidden" id="c_yy33" name="c_yy33" value=""/></td>
								<td id="c_td_34" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(34,382,30);"><b><div id="c_area34">&nbsp;</div></b><input type="hidden"  id="c_stat34" name="c_stat34" value=""/><input type="hidden" id="c_xx34" name="c_xx34" value=""/><input type="hidden" id="c_yy34" name="c_yy34" value=""/></td>
								<td id="c_td_35" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(35,402,30);"><b><div id="c_area35">&nbsp;</div></b><input type="hidden"  id="c_stat35" name="c_stat35" value=""/><input type="hidden" id="c_xx35" name="c_xx35" value=""/><input type="hidden" id="c_yy35" name="c_yy35" value=""/></td>
								<td id="c_td_36" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(36,452,30);"><b><div id="c_area36">&nbsp;</div></b><input type="hidden"  id="c_stat36" name="c_stat36" value=""/><input type="hidden" id="c_xx36" name="c_xx36" value=""/><input type="hidden" id="c_yy36" name="c_yy36" value=""/></td>
								<td id="c_td_37" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(37,469,30);"><b><div id="c_area37">&nbsp;</div></b><input type="hidden"  id="c_stat37" name="c_stat37" value=""/><input type="hidden" id="c_xx37" name="c_xx37" value=""/><input type="hidden" id="c_yy37" name="c_yy37" value=""/></td>
								<td id="c_td_38" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(38,498,30);"><b><div id="c_area38">&nbsp;</div></b><input type="hidden"  id="c_stat38" name="c_stat38" value=""/><input type="hidden" id="c_xx38" name="c_xx38" value=""/><input type="hidden" id="c_yy38" name="c_yy38" value=""/></td>
								<td id="c_td_39" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(39,527,30);"><b><div id="c_area39">&nbsp;</div></b><input type="hidden"  id="c_stat39" name="c_stat39" value=""/><input type="hidden" id="c_xx39" name="c_xx39" value=""/><input type="hidden" id="c_yy39" name="c_yy39" value=""/></td>
								<td id="c_td_40" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(40,556,30);"><b><div id="c_area40">&nbsp;</div></b><input type="hidden"  id="c_stat40" name="c_stat40" value=""/><input type="hidden" id="c_xx40" name="c_xx40" value=""/><input type="hidden" id="c_yy40" name="c_yy40" value=""/></td>
							</tr>
							<tr>
								<td id="c_td_41" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(41,5,53);"><b><div id="c_area41">&nbsp;</div></b><input type="hidden"  id="c_stat41" name="c_stat41" value=""/><input type="hidden" id="c_xx41" name="c_xx41" value=""/><input type="hidden" id="c_yy41" name="c_yy41" value=""/></td>
								<td id="c_td_42" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(42,34,53);"><b><div id="c_area42">&nbsp;</div></b><input type="hidden"  id="c_stat42" name="c_stat42" value=""/><input type="hidden" id="c_xx42" name="c_xx42" value=""/><input type="hidden" id="c_yy42" name="c_yy42" value=""/></td>
								<td id="c_td_43" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(43,63,53);"><b><div id="c_area43">&nbsp;</div></b><input type="hidden"  id="c_stat43" name="c_stat43" value=""/><input type="hidden" id="c_xx43" name="c_xx43" value=""/><input type="hidden" id="c_yy43" name="c_yy43" value=""/></td>
								<td id="c_td_44" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(44,92,53);"><b><div id="c_area44">&nbsp;</div></b><input type="hidden"  id="c_stat44" name="c_stat44" value=""/><input type="hidden" id="c_xx44" name="c_xx44" value=""/><input type="hidden" id="c_yy44" name="c_yy44" value=""/></td>
								<td id="c_td_45" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(45,121,53);"><b><div id="c_area45">&nbsp;</div></b><input type="hidden"  id="c_stat45" name="c_stat45" value=""/><input type="hidden" id="c_xx45" name="c_xx45" value=""/><input type="hidden" id="c_yy45" name="c_yy45" value=""/></td>
								<td id="c_td_46" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(46,150,53);"><b><div id="c_area46">&nbsp;</div></b><input type="hidden"  id="c_stat46" name="c_stat46" value=""/><input type="hidden" id="c_xx46" name="c_xx46" value=""/><input type="hidden" id="c_yy46" name="c_yy46" value=""/></td>
								<td id="c_td_47" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(47,179,53);"><b><div id="c_area47">&nbsp;</div></b><input type="hidden"  id="c_stat47" name="c_stat47" value=""/><input type="hidden" id="c_xx47" name="c_xx47" value=""/><input type="hidden" id="c_yy47" name="c_yy47" value=""/></td>
								<td id="c_td_48" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(48,208,53);"><b><div id="c_area48">&nbsp;</div></b><input type="hidden"  id="c_stat48" name="c_stat48" value=""/><input type="hidden" id="c_xx48" name="c_xx48" value=""/><input type="hidden" id="c_yy48" name="c_yy48" value=""/></td>
								<td id="c_td_49" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(49,237,53);"><b><div id="c_area49">&nbsp;</div></b><input type="hidden"  id="c_stat49" name="c_stat49" value=""/><input type="hidden" id="c_xx49" name="c_xx49" value=""/><input type="hidden" id="c_yy49" name="c_yy49" value=""/></td>
								<td id="c_td_50" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(50,266,53);"><b><div id="c_area50">&nbsp;</div></b><input type="hidden"  id="c_stat50" name="c_stat50" value=""/><input type="hidden" id="c_xx50" name="c_xx50" value=""/><input type="hidden" id="c_yy50" name="c_yy50" value=""/></td>
								<td id="c_td_51" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(51,295,53);"><b><div id="c_area51">&nbsp;</div></b><input type="hidden"  id="c_stat51" name="c_stat51" value=""/><input type="hidden" id="c_xx51" name="c_xx51" value=""/><input type="hidden" id="c_yy51" name="c_yy51" value=""/></td>
								<td id="c_td_52" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(52,324,53);"><b><div id="c_area52">&nbsp;</div></b><input type="hidden"  id="c_stat52" name="c_stat52" value=""/><input type="hidden" id="c_xx52" name="c_xx52" value=""/><input type="hidden" id="c_yy52" name="c_yy52" value=""/></td>
								<td id="c_td_53" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(53,353,53);"><b><div id="c_area53">&nbsp;</div></b><input type="hidden"  id="c_stat53" name="c_stat53" value=""/><input type="hidden" id="c_xx53" name="c_xx53" value=""/><input type="hidden" id="c_yy53" name="c_yy53" value=""/></td>
								<td id="c_td_54" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(54,382,53);"><b><div id="c_area54">&nbsp;</div></b><input type="hidden"  id="c_stat54" name="c_stat54" value=""/><input type="hidden" id="c_xx54" name="c_xx54" value=""/><input type="hidden" id="c_yy54" name="c_yy54" value=""/></td>
								<td id="c_td_55" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(55,402,53);"><b><div id="c_area55">&nbsp;</div></b><input type="hidden"  id="c_stat55" name="c_stat55" value=""/><input type="hidden" id="c_xx55" name="c_xx55" value=""/><input type="hidden" id="c_yy55" name="c_yy55" value=""/></td>
								<td id="c_td_56" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(56,452,53);"><b><div id="c_area56">&nbsp;</div></b><input type="hidden"  id="c_stat56" name="c_stat56" value=""/><input type="hidden" id="c_xx56" name="c_xx56" value=""/><input type="hidden" id="c_yy56" name="c_yy56" value=""/></td>
								<td id="c_td_57" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(57,469,53);"><b><div id="c_area57">&nbsp;</div></b><input type="hidden"  id="c_stat57" name="c_stat57" value=""/><input type="hidden" id="c_xx57" name="c_xx57" value=""/><input type="hidden" id="c_yy57" name="c_yy57" value=""/></td>
								<td id="c_td_58" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(58,498,53);"><b><div id="c_area58">&nbsp;</div></b><input type="hidden"  id="c_stat58" name="c_stat58" value=""/><input type="hidden" id="c_xx58" name="c_xx58" value=""/><input type="hidden" id="c_yy58" name="c_yy58" value=""/></td>
								<td id="c_td_59" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(59,527,53);"><b><div id="c_area59">&nbsp;</div></b><input type="hidden"  id="c_stat59" name="c_stat59" value=""/><input type="hidden" id="c_xx59" name="c_xx59" value=""/><input type="hidden" id="c_yy59" name="c_yy59" value=""/></td>
								<td id="c_td_60" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(60,556,53);"><b><div id="c_area60">&nbsp;</div></b><input type="hidden"  id="c_stat60" name="c_stat60" value=""/><input type="hidden" id="c_xx60" name="c_xx60" value=""/><input type="hidden" id="c_yy60" name="c_yy60" value=""/></td>
							</tr>
							<tr>
								<td id="c_td_61" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(61,5,76);"><b><div id="c_area61">&nbsp;</div></b><input type="hidden"  id="c_stat61" name="c_stat61" value=""/><input type="hidden" id="c_xx61" name="c_xx61" value=""/><input type="hidden" id="c_yy61" name="c_yy61" value=""/></td>
								<td id="c_td_62" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(62,34,76);"><b><div id="c_area62">&nbsp;</div></b><input type="hidden"  id="c_stat62" name="c_stat62" value=""/><input type="hidden" id="c_xx62" name="c_xx62" value=""/><input type="hidden" id="c_yy62" name="c_yy62" value=""/></td>
								<td id="c_td_63" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(63,63,76);"><b><div id="c_area63">&nbsp;</div></b><input type="hidden"  id="c_stat63" name="c_stat63" value=""/><input type="hidden" id="c_xx63" name="c_xx63" value=""/><input type="hidden" id="c_yy63" name="c_yy63" value=""/></td>
								<td id="c_td_64" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(64,92,76);"><b><div id="c_area64">&nbsp;</div></b><input type="hidden"  id="c_stat64" name="c_stat64" value=""/><input type="hidden" id="c_xx64" name="c_xx64" value=""/><input type="hidden" id="c_yy64" name="c_yy64" value=""/></td>
								<td id="c_td_65" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(65,121,76);"><b><div id="c_area65">&nbsp;</div></b><input type="hidden"  id="c_stat65" name="c_stat65" value=""/><input type="hidden" id="c_xx65" name="c_xx65" value=""/><input type="hidden" id="c_yy65" name="c_yy65" value=""/></td>
								<td id="c_td_66" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(66,150,76);"><b><div id="c_area66">&nbsp;</div></b><input type="hidden"  id="c_stat66" name="c_stat66" value=""/><input type="hidden" id="c_xx66" name="c_xx66" value=""/><input type="hidden" id="c_yy66" name="c_yy66" value=""/></td>
								<td id="c_td_67" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(67,179,76);"><b><div id="c_area67">&nbsp;</div></b><input type="hidden"  id="c_stat67" name="c_stat67" value=""/><input type="hidden" id="c_xx67" name="c_xx67" value=""/><input type="hidden" id="c_yy67" name="c_yy67" value=""/></td>
								<td id="c_td_68" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(68,208,76);"><b><div id="c_area68">&nbsp;</div></b><input type="hidden"  id="c_stat68" name="c_stat68" value=""/><input type="hidden" id="c_xx68" name="c_xx68" value=""/><input type="hidden" id="c_yy68" name="c_yy68" value=""/></td>
								<td id="c_td_69" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(69,237,76);"><b><div id="c_area69">&nbsp;</div></b><input type="hidden"  id="c_stat69" name="c_stat69" value=""/><input type="hidden" id="c_xx69" name="c_xx69" value=""/><input type="hidden" id="c_yy69" name="c_yy69" value=""/></td>
								<td id="c_td_70" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(70,266,76);"><b><div id="c_area70">&nbsp;</div></b><input type="hidden"  id="c_stat70" name="c_stat70" value=""/><input type="hidden" id="c_xx70" name="c_xx70" value=""/><input type="hidden" id="c_yy70" name="c_yy70" value=""/></td>
								<td id="c_td_71" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(71,295,76);"><b><div id="c_area71">&nbsp;</div></b><input type="hidden"  id="c_stat71" name="c_stat71" value=""/><input type="hidden" id="c_xx71" name="c_xx71" value=""/><input type="hidden" id="c_yy71" name="c_yy71" value=""/></td>
								<td id="c_td_72" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(72,324,76);"><b><div id="c_area72">&nbsp;</div></b><input type="hidden"  id="c_stat72" name="c_stat72" value=""/><input type="hidden" id="c_xx72" name="c_xx72" value=""/><input type="hidden" id="c_yy72" name="c_yy72" value=""/></td>
								<td id="c_td_73" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(73,353,76);"><b><div id="c_area73">&nbsp;</div></b><input type="hidden"  id="c_stat73" name="c_stat73" value=""/><input type="hidden" id="c_xx73" name="c_xx73" value=""/><input type="hidden" id="c_yy73" name="c_yy73" value=""/></td>
								<td id="c_td_74" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(74,380,76);"><b><div id="c_area74">&nbsp;</div></b><input type="hidden"  id="c_stat74" name="c_stat74" value=""/><input type="hidden" id="c_xx74" name="c_xx74" value=""/><input type="hidden" id="c_yy74" name="c_yy74" value=""/></td>
								<td id="c_td_75" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(75,411,76);"><b><div id="c_area75">&nbsp;</div></b><input type="hidden"  id="c_stat75" name="c_stat75" value=""/><input type="hidden" id="c_xx75" name="c_xx75" value=""/><input type="hidden" id="c_yy75" name="c_yy75" value=""/></td>
								<td id="c_td_76" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(76,440,76);"><b><div id="c_area76">&nbsp;</div></b><input type="hidden"  id="c_stat76" name="c_stat76" value=""/><input type="hidden" id="c_xx76" name="c_xx76" value=""/><input type="hidden" id="c_yy76" name="c_yy76" value=""/></td>
								<td id="c_td_77" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(77,469,76);"><b><div id="c_area77">&nbsp;</div></b><input type="hidden"  id="c_stat77" name="c_stat77" value=""/><input type="hidden" id="c_xx77" name="c_xx77" value=""/><input type="hidden" id="c_yy77" name="c_yy77" value=""/></td>
								<td id="c_td_78" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(78,498,76);"><b><div id="c_area78">&nbsp;</div></b><input type="hidden"  id="c_stat78" name="c_stat78" value=""/><input type="hidden" id="c_xx78" name="c_xx78" value=""/><input type="hidden" id="c_yy78" name="c_yy78" value=""/></td>
								<td id="c_td_79" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(79,527,76);"><b><div id="c_area79">&nbsp;</div></b><input type="hidden"  id="c_stat79" name="c_stat79" value=""/><input type="hidden" id="c_xx79" name="c_xx79" value=""/><input type="hidden" id="c_yy79" name="c_yy79" value=""/></td>
								<td id="c_td_80" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(80,556,76);"><b><div id="c_area80">&nbsp;</div></b><input type="hidden"  id="c_stat80" name="c_stat80" value=""/><input type="hidden" id="c_xx80" name="c_xx80" value=""/><input type="hidden" id="c_yy80" name="c_yy80" value=""/></td>
							</tr>
							<tr>
								<td id="c_td_81" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(81,5,99);"><b><div id="c_area81">&nbsp;</div></b><input type="hidden"  id="c_stat81" name="c_stat81" value=""/><input type="hidden" id="c_xx81" name="c_xx81" value=""/><input type="hidden" id="c_yy81" name="c_yy81" value=""/></td>
								<td id="c_td_82" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(82,34,99);"><b><div id="c_area82">&nbsp;</div></b><input type="hidden"  id="c_stat82" name="c_stat82" value=""/><input type="hidden" id="c_xx82" name="c_xx82" value=""/><input type="hidden" id="c_yy82" name="c_yy82" value=""/></td>
								<td id="c_td_83" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(83,63,99);"><b><div id="c_area83">&nbsp;</div></b><input type="hidden"  id="c_stat83" name="c_stat83" value=""/><input type="hidden" id="c_xx83" name="c_xx83" value=""/><input type="hidden" id="c_yy83" name="c_yy83" value=""/></td>
								<td id="c_td_84" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(84,92,99);"><b><div id="c_area84">&nbsp;</div></b><input type="hidden"  id="c_stat84" name="c_stat84" value=""/><input type="hidden" id="c_xx84" name="c_xx84" value=""/><input type="hidden" id="c_yy84" name="c_yy84" value=""/></td>
								<td id="c_td_85" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(85,121,99);"><b><div id="c_area85">&nbsp;</div></b><input type="hidden"  id="c_stat85" name="c_stat85" value=""/><input type="hidden" id="c_xx85" name="c_xx85" value=""/><input type="hidden" id="c_yy85" name="c_yy85" value=""/></td>
								<td id="c_td_86" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(86,150,99);"><b><div id="c_area86">&nbsp;</div></b><input type="hidden"  id="c_stat86" name="c_stat86" value=""/><input type="hidden" id="c_xx86" name="c_xx86" value=""/><input type="hidden" id="c_yy86" name="c_yy86" value=""/></td>
								<td id="c_td_87" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(87,179,99);"><b><div id="c_area87">&nbsp;</div></b><input type="hidden"  id="c_stat87" name="c_stat87" value=""/><input type="hidden" id="c_xx87" name="c_xx87" value=""/><input type="hidden" id="c_yy87" name="c_yy87" value=""/></td>
								<td id="c_td_88" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(88,208,99);"><b><div id="c_area88">&nbsp;</div></b><input type="hidden"  id="c_stat88" name="c_stat88" value=""/><input type="hidden" id="c_xx88" name="c_xx88" value=""/><input type="hidden" id="c_yy88" name="c_yy88" value=""/></td>
								<td id="c_td_89" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(89,237,99);"><b><div id="c_area89">&nbsp;</div></b><input type="hidden"  id="c_stat89" name="c_stat89" value=""/><input type="hidden" id="c_xx89" name="c_xx89" value=""/><input type="hidden" id="c_yy89" name="c_yy89" value=""/></td>
								<td id="c_td_90" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(90,266,99);"><b><div id="c_area90">&nbsp;</div></b><input type="hidden"  id="c_stat90" name="c_stat90" value=""/><input type="hidden" id="c_xx90" name="c_xx90" value=""/><input type="hidden" id="c_yy90" name="c_yy90" value=""/></td>
								<td id="c_td_91" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(91,295,99);"><b><div id="c_area91">&nbsp;</div></b><input type="hidden"  id="c_stat91" name="c_stat91" value=""/><input type="hidden" id="c_xx91" name="c_xx91" value=""/><input type="hidden" id="c_yy91" name="c_yy91" value=""/></td>
								<td id="c_td_92" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(92,324,99);"><b><div id="c_area92">&nbsp;</div></b><input type="hidden"  id="c_stat92" name="c_stat92" value=""/><input type="hidden" id="c_xx92" name="c_xx92" value=""/><input type="hidden" id="c_yy92" name="c_yy92" value=""/></td>
								<td id="c_td_93" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(93,353,99);"><b><div id="c_area93">&nbsp;</div></b><input type="hidden"  id="c_stat93" name="c_stat93" value=""/><input type="hidden" id="c_xx93" name="c_xx93" value=""/><input type="hidden" id="c_yy93" name="c_yy93" value=""/></td>
								<td id="c_td_94" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(94,382,99);"><b><div id="c_area94">&nbsp;</div></b><input type="hidden"  id="c_stat94" name="c_stat94" value=""/><input type="hidden" id="c_xx94" name="c_xx94" value=""/><input type="hidden" id="c_yy94" name="c_yy94" value=""/></td>
								<td id="c_td_95" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(95,411,99);"><b><div id="c_area95">&nbsp;</div></b><input type="hidden"  id="c_stat95" name="c_stat95" value=""/><input type="hidden" id="c_xx95" name="c_xx95" value=""/><input type="hidden" id="c_yy95" name="c_yy95" value=""/></td>
								<td id="c_td_96" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(96,440,99);"><b><div id="c_area96">&nbsp;</div></b><input type="hidden"  id="c_stat96" name="c_stat96" value=""/><input type="hidden" id="c_xx96" name="c_xx96" value=""/><input type="hidden" id="c_yy96" name="c_yy96" value=""/></td>
								<td id="c_td_97" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(97,469,99);"><b><div id="c_area97">&nbsp;</div></b><input type="hidden"  id="c_stat97" name="c_stat97" value=""/><input type="hidden" id="c_xx97" name="c_xx97" value=""/><input type="hidden" id="c_yy97" name="c_yy97" value=""/></td>
								<td id="c_td_98" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(98,498,99);"><b><div id="c_area98">&nbsp;</div></b><input type="hidden"  id="c_stat98" name="c_stat98" value=""/><input type="hidden" id="c_xx98" name="c_xx98" value=""/><input type="hidden" id="c_yy98" name="c_yy98" value=""/></td>
								<td id="c_td_99" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(99,527,99);"><b><div id="c_area99">&nbsp;</div></b><input type="hidden"  id="c_stat99" name="c_stat99" value=""/><input type="hidden" id="c_xx99" name="c_xx99" value=""/><input type="hidden" id="c_yy99" name="c_yy99" value=""/></td>
								<td id="c_td_100" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(100,556,99);"><b><div id="c_area100">&nbsp;</div></b><input type="hidden"  id="c_stat100" name="c_stat100" value=""/><input type="hidden" id="c_xx100" name="c_xx100" value=""/><input type="hidden" id="c_yy100" name="c_yy100" value=""/></td>
							</tr>
							<tr>
								<td id="c_td_101" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(101,5,122);"><b><div id="c_area101">&nbsp;</div></b><input type="hidden"  id="c_stat101" name="c_stat101" value=""/><input type="hidden" id="c_xx101" name="c_xx101" value=""/><input type="hidden" id="c_yy101" name="c_yy101" value=""/></td>
								<td id="c_td_102" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(102,34,122);"><b><div id="c_area102">&nbsp;</div></b><input type="hidden"  id="c_stat102" name="c_stat102" value=""/><input type="hidden" id="c_xx102" name="c_xx102" value=""/><input type="hidden" id="c_yy102" name="c_yy102" value=""/></td>
								<td id="c_td_103" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(103,63,122);"><b><div id="c_area103">&nbsp;</div></b><input type="hidden"  id="c_stat103" name="c_stat103" value=""/><input type="hidden" id="c_xx103" name="c_xx103" value=""/><input type="hidden" id="c_yy103" name="c_yy103" value=""/></td>
								<td id="c_td_104" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(104,92,122);"><b><div id="c_area104">&nbsp;</div></b><input type="hidden"  id="c_stat104" name="c_stat104" value=""/><input type="hidden" id="c_xx104" name="c_xx104" value=""/><input type="hidden" id="c_yy104" name="c_yy104" value=""/></td>
								<td id="c_td_105" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(105,121,122);"><b><div id="c_area105">&nbsp;</div></b><input type="hidden"  id="c_stat105" name="c_stat105" value=""/><input type="hidden" id="c_xx105" name="c_xx105" value=""/><input type="hidden" id="c_yy105" name="c_yy105" value=""/></td>
								<td id="c_td_106" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(106,150,122);"><b><div id="c_area106">&nbsp;</div></b><input type="hidden"  id="c_stat106" name="c_stat106" value=""/><input type="hidden" id="c_xx106" name="c_xx106" value=""/><input type="hidden" id="c_yy106" name="c_yy106" value=""/></td>
								<td id="c_td_107" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(107,179,122);"><b><div id="c_area107">&nbsp;</div></b><input type="hidden"  id="c_stat107" name="c_stat107" value=""/><input type="hidden" id="c_xx107" name="c_xx107" value=""/><input type="hidden" id="c_yy107" name="c_yy107" value=""/></td>
								<td id="c_td_108" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(108,208,122);"><b><div id="c_area108">&nbsp;</div></b><input type="hidden"  id="c_stat108" name="c_stat108" value=""/><input type="hidden" id="c_xx108" name="c_xx108" value=""/><input type="hidden" id="c_yy108" name="c_yy108" value=""/></td>
								<td id="c_td_109" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(109,237,122);"><b><div id="c_area109">&nbsp;</div></b><input type="hidden"  id="c_stat109" name="c_stat109" value=""/><input type="hidden" id="c_xx109" name="c_xx109" value=""/><input type="hidden" id="c_yy109" name="c_yy109" value=""/></td>
								<td id="c_td_110" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(110,266,122);"><b><div id="c_area110">&nbsp;</div></b><input type="hidden"  id="c_stat110" name="c_stat110" value=""/><input type="hidden" id="c_xx110" name="c_xx110" value=""/><input type="hidden" id="c_yy110" name="c_yy110" value=""/></td>
								<td id="c_td_111" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(111,295,122);"><b><div id="c_area111">&nbsp;</div></b><input type="hidden"  id="c_stat111" name="c_stat111" value=""/><input type="hidden" id="c_xx111" name="c_xx111" value=""/><input type="hidden" id="c_yy111" name="c_yy111" value=""/></td>
								<td id="c_td_112" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(112,324,122);"><b><div id="c_area112">&nbsp;</div></b><input type="hidden"  id="c_stat112" name="c_stat112" value=""/><input type="hidden" id="c_xx112" name="c_xx112" value=""/><input type="hidden" id="c_yy112" name="c_yy112" value=""/></td>
								<td id="c_td_113" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(113,353,122);"><b><div id="c_area113">&nbsp;</div></b><input type="hidden"  id="c_stat113" name="c_stat113" value=""/><input type="hidden" id="c_xx113" name="c_xx113" value=""/><input type="hidden" id="c_yy113" name="c_yy113" value=""/></td>
								<td id="c_td_114" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(114,382,122);"><b><div id="c_area114">&nbsp;</div></b><input type="hidden"  id="c_stat114" name="c_stat114" value=""/><input type="hidden" id="c_xx114" name="c_xx114" value=""/><input type="hidden" id="c_yy114" name="c_yy114" value=""/></td>
								<td id="c_td_115" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(115,411,122);"><b><div id="c_area115">&nbsp;</div></b><input type="hidden"  id="c_stat115" name="c_stat115" value=""/><input type="hidden" id="c_xx115" name="c_xx115" value=""/><input type="hidden" id="c_yy115" name="c_yy115" value=""/></td>
								<td id="c_td_116" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(116,440,122);"><b><div id="c_area116">&nbsp;</div></b><input type="hidden"  id="c_stat116" name="c_stat116" value=""/><input type="hidden" id="c_xx116" name="c_xx116" value=""/><input type="hidden" id="c_yy116" name="c_yy116" value=""/></td>
								<td id="c_td_117" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(117,469,122);"><b><div id="c_area117">&nbsp;</div></b><input type="hidden"  id="c_stat117" name="c_stat117" value=""/><input type="hidden" id="c_xx117" name="c_xx117" value=""/><input type="hidden" id="c_yy117" name="c_yy117" value=""/></td>
								<td id="c_td_118" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(118,498,122);"><b><div id="c_area118">&nbsp;</div></b><input type="hidden"  id="c_stat118" name="c_stat118" value=""/><input type="hidden" id="c_xx118" name="c_xx118" value=""/><input type="hidden" id="c_yy118" name="c_yy118" value=""/></td>
								<td id="c_td_119" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(119,527,122);"><b><div id="c_area119">&nbsp;</div></b><input type="hidden"  id="c_stat119" name="c_stat119" value=""/><input type="hidden" id="c_xx119" name="c_xx119" value=""/><input type="hidden" id="c_yy119" name="c_yy119" value=""/></td>
								<td id="c_td_120" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(120,556,122);"><b><div id="c_area120">&nbsp;</div></b><input type="hidden"  id="c_stat120" name="c_stat120" value=""/><input type="hidden" id="c_xx120" name="c_xx120" value=""/><input type="hidden" id="c_yy120" name="c_yy120" value=""/></td>
							</tr>
							<tr>
								<td id="c_td_121" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(121,5,145);"><b><div id="c_area121">&nbsp;</div></b><input type="hidden"  id="c_stat121" name="c_stat121" value=""/><input type="hidden" id="c_xx121" name="c_xx121" value=""/><input type="hidden" id="c_yy121" name="c_yy121" value=""/></td>
								<td id="c_td_122" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(122,34,145);"><b><div id="c_area122">&nbsp;</div></b><input type="hidden"  id="c_stat122" name="c_stat122" value=""/><input type="hidden" id="c_xx122" name="c_xx122" value=""/><input type="hidden" id="c_yy122" name="c_yy122" value=""/></td>
								<td id="c_td_123" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(123,63,145);"><b><div id="c_area123">&nbsp;</div></b><input type="hidden"  id="c_stat123" name="c_stat123" value=""/><input type="hidden" id="c_xx123" name="c_xx123" value=""/><input type="hidden" id="c_yy123" name="c_yy123" value=""/></td>
								<td id="c_td_124" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(124,92,145);"><b><div id="c_area124">&nbsp;</div></b><input type="hidden"  id="c_stat124" name="c_stat124" value=""/><input type="hidden" id="c_xx124" name="c_xx124" value=""/><input type="hidden" id="c_yy124" name="c_yy124" value=""/></td>
								<td id="c_td_125" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(125,121,145);"><b><div id="c_area125">&nbsp;</div></b><input type="hidden"  id="c_stat125" name="c_stat125" value=""/><input type="hidden" id="c_xx125" name="c_xx125" value=""/><input type="hidden" id="c_yy125" name="c_yy125" value=""/></td>
								<td id="c_td_126" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(126,150,145);"><b><div id="c_area126">&nbsp;</div></b><input type="hidden"  id="c_stat126" name="c_stat126" value=""/><input type="hidden" id="c_xx126" name="c_xx126" value=""/><input type="hidden" id="c_yy126" name="c_yy126" value=""/></td>
								<td id="c_td_127" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(127,179,145);"><b><div id="c_area127">&nbsp;</div></b><input type="hidden"  id="c_stat127" name="c_stat127" value=""/><input type="hidden" id="c_xx127" name="c_xx127" value=""/><input type="hidden" id="c_yy127" name="c_yy127" value=""/></td>
								<td id="c_td_128" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(128,208,145);"><b><div id="c_area128">&nbsp;</div></b><input type="hidden"  id="c_stat128" name="c_stat128" value=""/><input type="hidden" id="c_xx128" name="c_xx128" value=""/><input type="hidden" id="c_yy128" name="c_yy128" value=""/></td>
								<td id="c_td_129" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(129,237,145);"><b><div id="c_area129">&nbsp;</div></b><input type="hidden"  id="c_stat129" name="c_stat129" value=""/><input type="hidden" id="c_xx129" name="c_xx129" value=""/><input type="hidden" id="c_yy129" name="c_yy129" value=""/></td>
								<td id="c_td_130" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(130,266,145);"><b><div id="c_area130">&nbsp;</div></b><input type="hidden"  id="c_stat130" name="c_stat130" value=""/><input type="hidden" id="c_xx130" name="c_xx130" value=""/><input type="hidden" id="c_yy130" name="c_yy130" value=""/></td>
								<td id="c_td_131" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(131,295,145);"><b><div id="c_area131">&nbsp;</div></b><input type="hidden"  id="c_stat131" name="c_stat131" value=""/><input type="hidden" id="c_xx131" name="c_xx131" value=""/><input type="hidden" id="c_yy131" name="c_yy131" value=""/></td>
								<td id="c_td_132" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(132,324,145);"><b><div id="c_area132">&nbsp;</div></b><input type="hidden"  id="c_stat132" name="c_stat132" value=""/><input type="hidden" id="c_xx132" name="c_xx132" value=""/><input type="hidden" id="c_yy132" name="c_yy132" value=""/></td>
								<td id="c_td_133" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(133,353,145);"><b><div id="c_area133">&nbsp;</div></b><input type="hidden"  id="c_stat133" name="c_stat133" value=""/><input type="hidden" id="c_xx133" name="c_xx133" value=""/><input type="hidden" id="c_yy133" name="c_yy133" value=""/></td>
								<td id="c_td_134" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(134,382,145);"><b><div id="c_area134">&nbsp;</div></b><input type="hidden"  id="c_stat134" name="c_stat134" value=""/><input type="hidden" id="c_xx134" name="c_xx134" value=""/><input type="hidden" id="c_yy134" name="c_yy134" value=""/></td>
								<td id="c_td_135" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(135,411,145);"><b><div id="c_area135">&nbsp;</div></b><input type="hidden"  id="c_stat135" name="c_stat135" value=""/><input type="hidden" id="c_xx135" name="c_xx135" value=""/><input type="hidden" id="c_yy135" name="c_yy135" value=""/></td>
								<td id="c_td_136" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(136,440,145);"><b><div id="c_area136">&nbsp;</div></b><input type="hidden"  id="c_stat136" name="c_stat136" value=""/><input type="hidden" id="c_xx136" name="c_xx136" value=""/><input type="hidden" id="c_yy136" name="c_yy136" value=""/></td>
								<td id="c_td_137" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(137,469,145);"><b><div id="c_area137">&nbsp;</div></b><input type="hidden"  id="c_stat137" name="c_stat137" value=""/><input type="hidden" id="c_xx137" name="c_xx137" value=""/><input type="hidden" id="c_yy137" name="c_yy137" value=""/></td>
								<td id="c_td_138" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(138,498,145);"><b><div id="c_area138">&nbsp;</div></b><input type="hidden"  id="c_stat138" name="c_stat138" value=""/><input type="hidden" id="c_xx138" name="c_xx138" value=""/><input type="hidden" id="c_yy138" name="c_yy138" value=""/></td>
								<td id="c_td_139" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(139,527,145);"><b><div id="c_area139">&nbsp;</div></b><input type="hidden"  id="c_stat139" name="c_stat139" value=""/><input type="hidden" id="c_xx139" name="c_xx139" value=""/><input type="hidden" id="c_yy139" name="c_yy139" value=""/></td>
								<td id="c_td_140" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(140,556,145);"><b><div id="c_area140">&nbsp;</div></b><input type="hidden"  id="c_stat140" name="c_stat140" value=""/><input type="hidden" id="c_xx140" name="c_xx140" value=""/><input type="hidden" id="c_yy140" name="c_yy140" value=""/></td>
							</tr>
							<tr>
								<td id="c_td_141" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(141,5,168);"><b><div id="c_area141">&nbsp;</div></b><input type="hidden"  id="c_stat141" name="c_stat141" value=""/><input type="hidden" id="c_xx141" name="c_xx141" value=""/><input type="hidden" id="c_yy141" name="c_yy141" value=""/></td>
								<td id="c_td_142" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(142,34,168);"><b><div id="c_area142">&nbsp;</div></b><input type="hidden"  id="c_stat142" name="c_stat142" value=""/><input type="hidden" id="c_xx142" name="c_xx142" value=""/><input type="hidden" id="c_yy142" name="c_yy142" value=""/></td>
								<td id="c_td_143" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(143,63,168);"><b><div id="c_area143">&nbsp;</div></b><input type="hidden"  id="c_stat143" name="c_stat143" value=""/><input type="hidden" id="c_xx143" name="c_xx143" value=""/><input type="hidden" id="c_yy143" name="c_yy143" value=""/></td>
								<td id="c_td_144" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(144,92,168);"><b><div id="c_area144">&nbsp;</div></b><input type="hidden"  id="c_stat144" name="c_stat144" value=""/><input type="hidden" id="c_xx144" name="c_xx144" value=""/><input type="hidden" id="c_yy144" name="c_yy144" value=""/></td>
								<td id="c_td_145" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(145,121,168);"><b><div id="c_area145">&nbsp;</div></b><input type="hidden"  id="c_stat145" name="c_stat145" value=""/><input type="hidden" id="c_xx145" name="c_xx145" value=""/><input type="hidden" id="c_yy145" name="c_yy145" value=""/></td>
								<td id="c_td_146" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(146,150,168);"><b><div id="c_area146">&nbsp;</div></b><input type="hidden"  id="c_stat146" name="c_stat146" value=""/><input type="hidden" id="c_xx146" name="c_xx146" value=""/><input type="hidden" id="c_yy146" name="c_yy146" value=""/></td>
								<td id="c_td_147" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(147,179,168);"><b><div id="c_area147">&nbsp;</div></b><input type="hidden"  id="c_stat147" name="c_stat147" value=""/><input type="hidden" id="c_xx147" name="c_xx147" value=""/><input type="hidden" id="c_yy147" name="c_yy147" value=""/></td>
								<td id="c_td_148" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(148,208,168);"><b><div id="c_area148">&nbsp;</div></b><input type="hidden"  id="c_stat148" name="c_stat148" value=""/><input type="hidden" id="c_xx148" name="c_xx148" value=""/><input type="hidden" id="c_yy148" name="c_yy148" value=""/></td>
								<td id="c_td_149" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(149,237,168);"><b><div id="c_area149">&nbsp;</div></b><input type="hidden"  id="c_stat149" name="c_stat149" value=""/><input type="hidden" id="c_xx149" name="c_xx149" value=""/><input type="hidden" id="c_yy149" name="c_yy149" value=""/></td>
								<td id="c_td_150" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(150,266,168);"><b><div id="c_area150">&nbsp;</div></b><input type="hidden"  id="c_stat150" name="c_stat150" value=""/><input type="hidden" id="c_xx150" name="c_xx150" value=""/><input type="hidden" id="c_yy150" name="c_yy150" value=""/></td>
								<td id="c_td_151" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(151,295,168);"><b><div id="c_area151">&nbsp;</div></b><input type="hidden"  id="c_stat151" name="c_stat151" value=""/><input type="hidden" id="c_xx151" name="c_xx151" value=""/><input type="hidden" id="c_yy151" name="c_yy151" value=""/></td>
								<td id="c_td_152" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(152,324,168);"><b><div id="c_area152">&nbsp;</div></b><input type="hidden"  id="c_stat152" name="c_stat152" value=""/><input type="hidden" id="c_xx152" name="c_xx152" value=""/><input type="hidden" id="c_yy152" name="c_yy152" value=""/></td>
								<td id="c_td_153" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(153,353,168);"><b><div id="c_area153">&nbsp;</div></b><input type="hidden"  id="c_stat153" name="c_stat153" value=""/><input type="hidden" id="c_xx153" name="c_xx153" value=""/><input type="hidden" id="c_yy153" name="c_yy153" value=""/></td>
								<td id="c_td_154" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(154,382,168);"><b><div id="c_area154">&nbsp;</div></b><input type="hidden"  id="c_stat154" name="c_stat154" value=""/><input type="hidden" id="c_xx154" name="c_xx154" value=""/><input type="hidden" id="c_yy154" name="c_yy154" value=""/></td>
								<td id="c_td_155" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(155,411,168);"><b><div id="c_area155">&nbsp;</div></b><input type="hidden"  id="c_stat155" name="c_stat155" value=""/><input type="hidden" id="c_xx155" name="c_xx155" value=""/><input type="hidden" id="c_yy155" name="c_yy155" value=""/></td>
								<td id="c_td_156" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(156,440,168);"><b><div id="c_area156">&nbsp;</div></b><input type="hidden"  id="c_stat156" name="c_stat156" value=""/><input type="hidden" id="c_xx156" name="c_xx156" value=""/><input type="hidden" id="c_yy156" name="c_yy156" value=""/></td>
								<td id="c_td_157" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(157,469,168);"><b><div id="c_area157">&nbsp;</div></b><input type="hidden"  id="c_stat157" name="c_stat157" value=""/><input type="hidden" id="c_xx157" name="c_xx157" value=""/><input type="hidden" id="c_yy157" name="c_yy157" value=""/></td>
								<td id="c_td_158" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(158,498,168);"><b><div id="c_area158">&nbsp;</div></b><input type="hidden"  id="c_stat158" name="c_stat158" value=""/><input type="hidden" id="c_xx158" name="c_xx158" value=""/><input type="hidden" id="c_yy158" name="c_yy158" value=""/></td>
								<td id="c_td_159" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(159,527,168);"><b><div id="c_area159">&nbsp;</div></b><input type="hidden"  id="c_stat159" name="c_stat159" value=""/><input type="hidden" id="c_xx159" name="c_xx159" value=""/><input type="hidden" id="c_yy159" name="c_yy159" value=""/></td>
								<td id="c_td_160" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(160,556,168);"><b><div id="c_area160">&nbsp;</div></b><input type="hidden"  id="c_stat160" name="c_stat160" value=""/><input type="hidden" id="c_xx160" name="c_xx160" value=""/><input type="hidden" id="c_yy160" name="c_yy160" value=""/></td>
							</tr>
							<tr>
								<td id="c_td_161" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(161,5,191);"><b><div id="c_area161">&nbsp;</div></b><input type="hidden"  id="c_stat161" name="c_stat161" value=""/><input type="hidden" id="c_xx161" name="c_xx161" value=""/><input type="hidden" id="c_yy161" name="c_yy161" value=""/></td>
								<td id="c_td_162" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(162,34,191);"><b><div id="c_area162">&nbsp;</div></b><input type="hidden"  id="c_stat162" name="c_stat162" value=""/><input type="hidden" id="c_xx162" name="c_xx162" value=""/><input type="hidden" id="c_yy162" name="c_yy162" value=""/></td>
								<td id="c_td_163" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(163,63,191);"><b><div id="c_area163">&nbsp;</div></b><input type="hidden"  id="c_stat163" name="c_stat163" value=""/><input type="hidden" id="c_xx163" name="c_xx163" value=""/><input type="hidden" id="c_yy163" name="c_yy163" value=""/></td>
								<td id="c_td_164" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(164,92,191);"><b><div id="c_area164">&nbsp;</div></b><input type="hidden"  id="c_stat164" name="c_stat164" value=""/><input type="hidden" id="c_xx164" name="c_xx164" value=""/><input type="hidden" id="c_yy164" name="c_yy164" value=""/></td>
								<td id="c_td_165" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(165,121,191);"><b><div id="c_area165">&nbsp;</div></b><input type="hidden"  id="c_stat165" name="c_stat165" value=""/><input type="hidden" id="c_xx165" name="c_xx165" value=""/><input type="hidden" id="c_yy165" name="c_yy165" value=""/></td>
								<td id="c_td_166" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(166,150,191);"><b><div id="c_area166">&nbsp;</div></b><input type="hidden"  id="c_stat166" name="c_stat166" value=""/><input type="hidden" id="c_xx166" name="c_xx166" value=""/><input type="hidden" id="c_yy166" name="c_yy166" value=""/></td>
								<td id="c_td_167" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(167,179,191);"><b><div id="c_area167">&nbsp;</div></b><input type="hidden"  id="c_stat167" name="c_stat167" value=""/><input type="hidden" id="c_xx167" name="c_xx167" value=""/><input type="hidden" id="c_yy167" name="c_yy167" value=""/></td>
								<td id="c_td_168" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(168,208,191);"><b><div id="c_area168">&nbsp;</div></b><input type="hidden"  id="c_stat168" name="c_stat168" value=""/><input type="hidden" id="c_xx168" name="c_xx168" value=""/><input type="hidden" id="c_yy168" name="c_yy168" value=""/></td>
								<td id="c_td_169" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(169,237,191);"><b><div id="c_area169">&nbsp;</div></b><input type="hidden"  id="c_stat169" name="c_stat169" value=""/><input type="hidden" id="c_xx169" name="c_xx169" value=""/><input type="hidden" id="c_yy169" name="c_yy169" value=""/></td>
								<td id="c_td_170" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(170,266,191);"><b><div id="c_area170">&nbsp;</div></b><input type="hidden"  id="c_stat170" name="c_stat170" value=""/><input type="hidden" id="c_xx170" name="c_xx170" value=""/><input type="hidden" id="c_yy170" name="c_yy170" value=""/></td>
								<td id="c_td_171" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(171,295,191);"><b><div id="c_area171">&nbsp;</div></b><input type="hidden"  id="c_stat171" name="c_stat171" value=""/><input type="hidden" id="c_xx171" name="c_xx171" value=""/><input type="hidden" id="c_yy171" name="c_yy171" value=""/></td>
								<td id="c_td_172" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(172,324,191);"><b><div id="c_area172">&nbsp;</div></b><input type="hidden"  id="c_stat172" name="c_stat172" value=""/><input type="hidden" id="c_xx172" name="c_xx172" value=""/><input type="hidden" id="c_yy172" name="c_yy172" value=""/></td>
								<td id="c_td_173" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(173,353,191);"><b><div id="c_area173">&nbsp;</div></b><input type="hidden"  id="c_stat173" name="c_stat173" value=""/><input type="hidden" id="c_xx173" name="c_xx173" value=""/><input type="hidden" id="c_yy173" name="c_yy173" value=""/></td>
								<td id="c_td_174" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(174,382,191);"><b><div id="c_area174">&nbsp;</div></b><input type="hidden"  id="c_stat174" name="c_stat174" value=""/><input type="hidden" id="c_xx174" name="c_xx174" value=""/><input type="hidden" id="c_yy174" name="c_yy174" value=""/></td>
								<td id="c_td_175" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(175,402,191);"><b><div id="c_area175">&nbsp;</div></b><input type="hidden"  id="c_stat175" name="c_stat175" value=""/><input type="hidden" id="c_xx175" name="c_xx175" value=""/><input type="hidden" id="c_yy175" name="c_yy175" value=""/></td>
								<td id="c_td_176" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(176,452,191);"><b><div id="c_area176">&nbsp;</div></b><input type="hidden"  id="c_stat176" name="c_stat176" value=""/><input type="hidden" id="c_xx176" name="c_xx176" value=""/><input type="hidden" id="c_yy176" name="c_yy176" value=""/></td>
								<td id="c_td_177" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(177,469,191);"><b><div id="c_area177">&nbsp;</div></b><input type="hidden"  id="c_stat177" name="c_stat177" value=""/><input type="hidden" id="c_xx177" name="c_xx177" value=""/><input type="hidden" id="c_yy177" name="c_yy177" value=""/></td>
								<td id="c_td_178" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(178,498,191);"><b><div id="c_area178">&nbsp;</div></b><input type="hidden"  id="c_stat178" name="c_stat178" value=""/><input type="hidden" id="c_xx178" name="c_xx178" value=""/><input type="hidden" id="c_yy178" name="c_yy178" value=""/></td>
								<td id="c_td_179" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(179,527,191);"><b><div id="c_area179">&nbsp;</div></b><input type="hidden"  id="c_stat179" name="c_stat179" value=""/><input type="hidden" id="c_xx179" name="c_xx179" value=""/><input type="hidden" id="c_yy179" name="c_yy179" value=""/></td>
								<td id="c_td_180" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(180,556,191);"><b><div id="c_area180">&nbsp;</div></b><input type="hidden"  id="c_stat180" name="c_stat180" value=""/><input type="hidden" id="c_xx180" name="c_xx180" value=""/><input type="hidden" id="c_yy180" name="c_yy180" value=""/></td>
							</tr>
							<tr>
								<td id="c_td_181" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(181,5,214);"><b><div id="c_area181">&nbsp;</div></b><input type="hidden"  id="c_stat181" name="c_stat181" value=""/><input type="hidden" id="c_xx181" name="c_xx181" value=""/><input type="hidden" id="c_yy181" name="c_yy181" value=""/></td>
								<td id="c_td_182" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(182,34,214);"><b><div id="c_area182">&nbsp;</div></b><input type="hidden"  id="c_stat182" name="c_stat182" value=""/><input type="hidden" id="c_xx182" name="c_xx182" value=""/><input type="hidden" id="c_yy182" name="c_yy182" value=""/></td>
								<td id="c_td_183" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(183,63,214);"><b><div id="c_area183">&nbsp;</div></b><input type="hidden"  id="c_stat183" name="c_stat183" value=""/><input type="hidden" id="c_xx183" name="c_xx183" value=""/><input type="hidden" id="c_yy183" name="c_yy183" value=""/></td>
								<td id="c_td_184" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(184,92,214);"><b><div id="c_area184">&nbsp;</div></b><input type="hidden"  id="c_stat184" name="c_stat184" value=""/><input type="hidden" id="c_xx184" name="c_xx184" value=""/><input type="hidden" id="c_yy184" name="c_yy184" value=""/></td>
								<td id="c_td_185" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(185,121,214);"><b><div id="c_area185">&nbsp;</div></b><input type="hidden"  id="c_stat185" name="c_stat185" value=""/><input type="hidden" id="c_xx185" name="c_xx185" value=""/><input type="hidden" id="c_yy185" name="c_yy185" value=""/></td>
								<td id="c_td_186" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(186,150,214);"><b><div id="c_area186">&nbsp;</div></b><input type="hidden"  id="c_stat186" name="c_stat186" value=""/><input type="hidden" id="c_xx186" name="c_xx186" value=""/><input type="hidden" id="c_yy186" name="c_yy186" value=""/></td>
								<td id="c_td_187" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(187,179,214);"><b><div id="c_area187">&nbsp;</div></b><input type="hidden"  id="c_stat187" name="c_stat187" value=""/><input type="hidden" id="c_xx187" name="c_xx187" value=""/><input type="hidden" id="c_yy187" name="c_yy187" value=""/></td>
								<td id="c_td_188" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(188,208,214);"><b><div id="c_area188">&nbsp;</div></b><input type="hidden"  id="c_stat188" name="c_stat188" value=""/><input type="hidden" id="c_xx188" name="c_xx188" value=""/><input type="hidden" id="c_yy188" name="c_yy188" value=""/></td>
								<td id="c_td_189" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(189,237,214);"><b><div id="c_area189">&nbsp;</div></b><input type="hidden"  id="c_stat189" name="c_stat189" value=""/><input type="hidden" id="c_xx189" name="c_xx189" value=""/><input type="hidden" id="c_yy189" name="c_yy189" value=""/></td>
								<td id="c_td_190" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(190,266,214);"><b><div id="c_area190">&nbsp;</div></b><input type="hidden"  id="c_stat190" name="c_stat190" value=""/><input type="hidden" id="c_xx190" name="c_xx190" value=""/><input type="hidden" id="c_yy190" name="c_yy190" value=""/></td>
								<td id="c_td_191" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(191,295,214);"><b><div id="c_area191">&nbsp;</div></b><input type="hidden"  id="c_stat191" name="c_stat191" value=""/><input type="hidden" id="c_xx191" name="c_xx191" value=""/><input type="hidden" id="c_yy191" name="c_yy191" value=""/></td>
								<td id="c_td_192" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(192,324,214);"><b><div id="c_area192">&nbsp;</div></b><input type="hidden"  id="c_stat192" name="c_stat192" value=""/><input type="hidden" id="c_xx192" name="c_xx192" value=""/><input type="hidden" id="c_yy192" name="c_yy192" value=""/></td>
								<td id="c_td_193" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(193,353,214);"><b><div id="c_area193">&nbsp;</div></b><input type="hidden"  id="c_stat193" name="c_stat193" value=""/><input type="hidden" id="c_xx193" name="c_xx193" value=""/><input type="hidden" id="c_yy193" name="c_yy193" value=""/></td>
								<td id="c_td_194" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(194,382,214);"><b><div id="c_area194">&nbsp;</div></b><input type="hidden"  id="c_stat194" name="c_stat194" value=""/><input type="hidden" id="c_xx194" name="c_xx194" value=""/><input type="hidden" id="c_yy194" name="c_yy194" value=""/></td>
								<td id="c_td_195" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(195,411,214);"><b><div id="c_area195">&nbsp;</div></b><input type="hidden"  id="c_stat195" name="c_stat195" value=""/><input type="hidden" id="c_xx195" name="c_xx195" value=""/><input type="hidden" id="c_yy195" name="c_yy195" value=""/></td>
								<td id="c_td_196" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(196,440,214);"><b><div id="c_area196">&nbsp;</div></b><input type="hidden"  id="c_stat196" name="c_stat196" value=""/><input type="hidden" id="c_xx196" name="c_xx196" value=""/><input type="hidden" id="c_yy196" name="c_yy196" value=""/></td>
								<td id="c_td_197" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(197,469,214);"><b><div id="c_area197">&nbsp;</div></b><input type="hidden"  id="c_stat197" name="c_stat197" value=""/><input type="hidden" id="c_xx197" name="c_xx197" value=""/><input type="hidden" id="c_yy197" name="c_yy197" value=""/></td>
								<td id="c_td_198" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(198,498,214);"><b><div id="c_area198">&nbsp;</div></b><input type="hidden"  id="c_stat198" name="c_stat198" value=""/><input type="hidden" id="c_xx198" name="c_xx198" value=""/><input type="hidden" id="c_yy198" name="c_yy198" value=""/></td>
								<td id="c_td_199" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(199,527,214);"><b><div id="c_area199">&nbsp;</div></b><input type="hidden"  id="c_stat199" name="c_stat199" value=""/><input type="hidden" id="c_xx199" name="c_xx199" value=""/><input type="hidden" id="c_yy199" name="c_yy199" value=""/></td>
								<td id="c_td_200" style="filter:alpha(opacity=50); opacity:0.5;" onkeypress="" onclick="carStateMark(200,556,214);"><b><div id="c_area200">&nbsp;</div></b><input type="hidden"  id="c_stat200" name="c_stat200" value=""/><input type="hidden" id="c_xx200" name="c_xx200" value=""/><input type="hidden" id="c_yy200" name="c_yy200" value=""/></td>
							</tr>
						</table>
					</div>
				</div>
			</div><!-- //tab_content04 -->

			
			<div id="c_uscasttus_tab_2" style="display:none;">
				<div class="New_agbox">
	                <h2 class="tit"><span></span>외판부위 1랭크</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	                <table>
	                    <colgroup>
	                        <col style="width: 20%;">
	                        <col style="width: 30%;">
	                        <col style="width: 25%;">
	                        <col style="width: 25%;">
	                    </colgroup>
	                    <tr>
							<th>항목/해당부품</th>
							<th>상태</th>
							<th class="amount">가격조사 산정액</th>
							<th class="amount">특기사항</th>
						</tr>
						<tr>
							<th scope="row">후드</th>
							<td>
								<div id="c_s037" name="c_s037">해당없음</div>
							</td>
							<td rowspan="5" class="amount">
								<div id="c_p078" name="c_p078"></div>
							</td>
							<td rowspan="5" class="amount">
								<div id="c_m075" name="c_m075"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">프론드휀더</th>
							<td>
								<div id="c_s038" name="c_s038">해당없음</div>
							</td>
						</tr>
						
						<tr>
							<th scope="row">도어</th>
							<td>
								<div id="c_s039" name="c_s039">해당없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">트렁크리드</th>
							<td >
								<div id="c_s040" name="c_s040">해당없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">라디에이터서포트(볼트체결부품)</th>
							<td >
								<div id="c_s041" name="c_s041">해당없음</div>
							</td>                                  
						</tr>
					</table>
	            </div>
						
				<div class="New_agbox">
	                <h2 class="tit"><span></span>외판부위 2랭크</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	                <table>
	                    <colgroup>
	                        <col style="width: 20%;">
	                        <col style="width: 30%;">
	                        <col style="width: 25%;">
	                        <col style="width: 25%;">
	                    </colgroup>		
						
						<tr>
							<th scope="row">쿼터패널(리어휀다)</th>
							<td>
								<div id="c_s043" name="c_s043">해당없음</div>
							</td>
							<td rowspan="3" class="amount">
								<div id="c_p073" name="c_p073"></div>
							</td>
							<td rowspan="3" class="amount">
								<div id="c_m073" name="c_m073"></div>
							</td>		
						</tr>
						<tr>
							<th scope="row">루프패널</th>
							<td>
								<div id="c_s042" name="c_s042">해당없음</div>                                            
							</td>
						</tr>
						<tr>
							<th scope="row">사이드실패널</th>
							<td>
								<div id="c_s044" name="c_s044">해당없음</div>
							</td>
						</tr>
					</table>
	            </div>
						
				<div class="New_agbox">
	                <h2 class="tit"><span></span>주요골격</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	                <table>
	                    <colgroup>
	                        <col style="width: 10%;">
	                        <col style="width: 30%;">
	                        <col style="width: 15%;">
	                        <col style="width: 20%;">
	                        <col style="width: 25%;">
	                    </colgroup>	
						<tr>
							<th colspan="2">항목/해당부품</th>
							<th>상태</th>
							<th class="amount">가격조사 산정액</th>
							<th class="amount">특기사항</th>
						</tr>				
						<tr>
							<th rowspan="5">A랭크</th>
							<th scope="row">프론트패널</th>
							<td>
								<div id="c_s045" name="c_s045">해당없음</div>
							</td>
							<td rowspan='11' class="amount">
								<div id="c_p074" name="c_p074"></div>
							</td>
							<td rowspan='11' class="amount">
								<div id="c_m074" name="c_m074"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">크로스멤버</th>
							<td>
								<div id="c_s046" name="c_s046">해당없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">인사이드패널</th>
							<td>
								<div id="c_s047" name="c_s047">해당없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">트렁크플로어</th>
							<td>
								<div id="c_s054" name="c_s054">해당없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">리어패널</th>
							<td>
								<div id="c_s053" name="c_s053">해당없음</div>
							</td>
						</tr>
						<tr>
							<th rowspan="4">B랭크</th>
							<th scope="row">사이드멤버</th>
							<td>
								<div id="c_s048" name="c_s048">해당없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">휠하우스</th>
							<td>
								<div id="c_s049" name="c_s049">해당없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">필러패널</th>
							<td>
								<div id="c_s052" name="c_s052">해당없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">패키지프레이</th>
							<td>
								<div id="c_s056" name="c_s056">해당없음</div>
							</td>                                  
						</tr>
						<tr>
							<th rowspan="2">C랭크</th>
							<th scope="row">대쉬패널</th>
							<td>
								<div id="c_s050" name="c_s050">해당없음</div>
							</td>
						</tr>
						<tr>
							<th scope="row">플로어패널</th>
							<td>
								<div id="c_s051" name="c_s051">해당없음</div>
							</td>
						</tr>
	                </table>
	            </div>
	        </div>    
	        
			<div id="c_uscasttus_tab_3" style="display:none;">
				<div class="New_agbox">
	                <h2 class="tit"><span></span>원동기 점검결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	                    <colgroup>
	                        <col style="width: 40%;">
	                        <col style="width: 15%;">
	                        <col style="width: 20%;">
	                        <col style="width: 25%;">
	                    </colgroup>
	                    <tr>
							<th>항목/해당부품</th>
							<th>상태</th>
							<th class="amount">가격조사 산정액</th>
							<th class="amount">특기사항</th>
						</tr>
						<tr>
							<th scope="row">작동상태(공회전)</th>
							<td style="padding:5px">
								<div id="c_s001" name="c_s001">양호</div>
							</td>
							<td rowspan='10' class="amount">
								<div id="c_p001" name="c_p001"></div>
							</td>
							<td class="amount">
								<div id="c_m001" name="c_m001"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">오일누유 - 로커암 커버</th>
							<td style="padding:5px">
								<div id="c_s057" name="c_s057">없음</div>
							</td>
							<td class="amount">
								<div id="c_m057" name="c_m057"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">오일누유 - 실린더 헤드/가스켓</th>
							<td style="padding:5px">
								<div id="c_s003">없음</div>
							</td>
							<td class="amount">
								<div id="c_m003" name="c_m003"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">오일누유 - 오일팬</th>
							<td style="padding:5px">
								<div id="c_s058" name="c_s058">없음</div>
							</td>
							<td class="amount">
								<div id="c_m058" name="c_m058"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">오일유량</th>
							<td style="padding:5px">
								<div id="c_s005" name="c_s005">적정</div>
							</td>  
							<td class="amount">
								<div id="c_m005" name="c_m005"></div>
							</td>
						</tr>                                
						<tr>
							<th scope="row">냉각수누수 - 실린더 헤드/개스킷</th>
							<td style="padding:5px">
								<div id="c_s007" name="c_s007">없음</div>
							</td>
							<td class="amount">
								<div id="c_m007" name="c_m007"></div>
							</td>
						</tr>                 
						<tr>
							<th scope="row">냉각수누수 - 워터펌프</th>
							<td style="padding:5px">
								<div id="c_s008" name="c_s008">없음</div>
							</td>
							<td class="amount">
								<div id="c_m008" name="c_m008"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">냉각수누수 - 라디에이터</th>
							<td style="padding:5px">
								<div id="c_s009" name="c_s009">없음</div>
							</td>
							<td class="amount">
								<div id="c_m009" name="c_m009"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">냉각수 누수 - 냉각수 수량</th>
							<td style="padding:5px">
								<div id="c_s010" name="c_s010">적정</div>
							</td>
							<td class="amount">
								<div id="c_m010" name="c_m010"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">고압펌프(커먼레일) - 디젤엔진</th>
							<td style="padding:5px">
								<div id="c_s011" name="c_s011"></div>
							</td>
							<td class="amount">
								<div id="c_m011" name="c_m011"></div>
							</td>
						</tr>
	                </table>    
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>동력전달장치 점검결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	                    <colgroup>
							<col width="40%"/>
							<col width="15%"/>
							<col width="20%"/>
							<col width="25%"/>
						</colgroup>
						<tr>
							<th>항목/해당부품</th>
							<th>상태</th>
							<th class="amount">가격조사 산정액</th>
							<th class="amount">특기사항</th>
						</tr>
						<tr>
							<th scope="row">자동변속기(A/T) - 오일누유</th>
							<td style="padding:5px">
								<div id="c_s012" name="c_s012">없음</div>
							</td>
							<td rowspan='7' class="amount">
								<div id="c_p012" name="c_p012"></div>
							</td>
							<td class="amount">
								<div id="c_m012" name="c_m012"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">자동변속기(A/T) - 오일유량및상태</th>
							<td style="padding:5px">
								<div id="c_s013" name="c_s013">적정</div>
							</td>
							<td class="amount">
								<div id="c_m013" name="c_m013"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">자동변속기(A/T) - 작동상태(공회전)</th>
							<td style="padding:5px">
								<div id="c_s016" name="c_s016">양호</div>
							</td>
							<td class="amount">
								<div id="c_m016" name="c_m016"></div>
							</td>
						</tr>                            
						
						<tr>
							<th scope="row">수동변속기(M/T) - 오일누유</th>
							<td style="padding:5px">
								<div id="c_s017" name="c_s017">없음</div>
							</td>
							<td class="amount">
								<div id="c_m017" name="c_m017"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">수동변속기(M/T) - 기어변속장치</th>
							<td style="padding:5px">
								<div id="c_s018" name="c_s018">양호</div>
							</td>
							<td class="amount">
								<div id="c_m018" name="c_m018"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">수동변속기(M/T) - 오일유량및상태</th>
							<td style="padding:5px">
								<div id="c_s019" name="c_s019">적정</div>
							</td>
							<td class="amount">
								<div id="c_m019" name="c_m019"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">수동변속기(M/T) - 작동상태(공회전)</th>
							<td style="padding:5px">
								<div id="c_s020" name="c_s020">양호</div>
							</td>
							<td class="amount">
								<div id="c_m020" name="c_m020"></div>
							</td>
						</tr>
						<!--  동력전달  -->
						<tr>
							<th scope="row">동력전달 - 클러치 어셈블러</th>
							<td style="padding:5px">
								<div id="c_s021" name="c_s021">양호</div>
							</td>
							<td rowspan='4' class="amount">
								<div id="c_p021" name="c_p021"></div>
							</td>
							<td class="amount">
								<div id="c_m021" name="c_m021"></div>
							</td>
						</tr>
						<tr>	
							<th scope="row">동력전달 - 등속죠인트</th>
							<td style="padding:5px">
								<div id="c_s022" name="c_s022"></div>
							</td>
							<td class="amount">
								<div id="c_m022" name="c_m022"></div>
							</td>
						</tr>
						<tr>
							<th scope="row">동력전달 - 추진축 및 베어링</th>
							<td style="padding:5px">
								<div id="c_s023" name="c_s023"></div>
							</td>
							<td class="amount">
								<div id="c_m023" name="c_m023"></div>
							</td>
						</tr>
	                </table> 
	            </div>
	        </div>   
	        
	        <div id="c_uscasttus_tab_4" style="display:none;">
				<div class="New_agbox">
	                <h2 class="tit"><span></span>조향장치 점걸결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="40%"/>
						<col width="15%"/>
						<col width="20%"/>
						<col width="25%"/>
					</colgroup>
					<tr>
						<th>항목/해당부품</th>
						<th>상태</th>
						<th class="amount">가격조사 산정액</th>
						<th class="amount">특기사항</th>
					</tr>
					<tr>
						<th scope="row">동력조향 작동 오일 누유</th>
						<td style="padding:5px">
							<div id="c_s024" name="c_s024">없음</div>
						</td>
						<td rowspan='6' class="amount">
							<div id="c_p024" name="c_p024"></div>
						</td>
						<td class="amount">
							<div id="c_m024" name="c_m024"></div>
						</td>
					</tr>
					<tr>
						<th scope="row">작동상태 - 스티어링 기어</th>
						<td style="padding:5px">
							<div id="c_s025" name="c_s025">양호</div>
						</td>
						<td class="amount">
							<div id="c_m025" name="c_m025"></div>
						</td>
					</tr>
					<tr>
						<th scope="row">작동상태 - 스티어링 펌프</th>
						<td style="padding:5px">
							<div id="c_s026" name="c_s026">양호</div>
						</td>
						<td class="amount">
							<div id="c_m026" name="c_m026"></div>
						</td>
					</tr>
					<tr>
						<th scope="row">타이로드앤드 및 볼 죠인트</th>
						<td style="padding:5px">
							<div id="c_s027" name="c_s027">양호</div>
						</td>
						<td class="amount">
							<div id="c_m027" name="c_m027"></div>
						</td>
					</tr>
					</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>제동장치 점검결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="40%"/>
						<col width="15%"/>
						<col width="20%"/>
						<col width="25%"/>
					</colgroup>
					<tr>
						<th>항목/해당부품</th>
						<th>상태</th>
						<th class="amount">가격조사 산정액</th>
						<th class="amount">특기사항</th>
					</tr>
					<tr>
						<th scope="row">브레이크 마스터 실린더오일 누유</th>
						<td style="padding:5px">
							<div id="c_s059" name="c_s059">없음</div>
						</td>
						<td rowspan='3' class="amount">
							<div id="c_p059" name="c_p059"></div>
						</td>
						<td class="amount">
							<div id="c_m059" name="c_m059"></div>
						</td>
					</tr>
					<tr>
						<th scope="row">브레이크 오일 누유</th>
						<td style="padding:5px">
							<div id="c_s029" name="c_s029">없음</div>
						</td>
						<td class="amount">
							<div id="c_m029" name="c_m029"></div>
						</td>
					</tr>
					<tr>
						<th scope="row">배력장치 상태</th>
						<td style="padding:5px">
							<div id="c_s030" name="c_s030">양호</div>
						</td>
						<td class="amount">
							<div id="c_m030" name="c_m030"></div>
						</td>
					</tr>
					</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>전기장치 점검결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
                        <col width="40%"/>
                        <col width="15%"/>
                        <col width="20%"/>
                        <col width="25%"/>
                    </colgroup>
                    <tr>
                        <th>항목/해당부품</th>
                        <th>상태</th>
                        <th class="amount">가격조사 산정액</th>
                        <th class="amount">특기사항</th>
                    </tr>
                    <tr>
                        <th scope="row">발전기 출력</th>
                        <td style="padding:5px">
                            <div id="c_s031" name="c_s031">양호</div>
                        </td>
                        <td rowspan='6' class="amount">
                            <div id="c_p031" name="c_p031"></div>
                        </td>
                        <td class="amount">
                            <div id="c_m031" name="c_m031"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">시동 모터</th>
                        <td style="padding:5px">
                            <div id="c_s055" name="c_s055">양호</div>
                        </td>
                        <td class="amount">
                            <div id="c_m055" name="c_m055"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">와이퍼 모터 기능</th>
                        <td style="padding:5px">
                            <div id="c_s032" name="c_s032">양호</div>
                        </td>
                        <td class="amount">
                            <div id="c_m032" name="c_m032"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">실내송풍 모터</th>
                        <td style="padding:5px">
                            <div id="c_s033" name="c_s033">양호</div>
                        </td>
                        <td class="amount">
                            <div id="c_m033" name="c_m033"></div>
                        </td>
                    </tr>
                    <tr>                         
                        <th scope="row">라디에이터 팬 모터</th>
                        <td style="padding:5px" >
                            <div id="c_s034" name="c_s034">양호</div>
                        </td>
                        <td class="amount">
                            <div id="c_m034" name="c_m034"></div>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">원도우모터작동</th>
                        <td style="padding:5px">
                            <div id="c_s036" name="c_s036">양호</div>
                        </td>
                        <td class="amount">
                            <div id="c_m036" name="c_m036"></div>
                        </td>
                    </tr>
                    </table>
	            </div>
	            	            	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>기타장치 점검결과</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
                        <col width="40%"/>
                        <col width="15%"/>
                        <col width="20%"/>
                        <col width="25%"/>
                    </colgroup>
                    <tr>
                        <th>항목/해당부품</th>
                        <th>상태</th>
                        <th class="amount">가격조사 산정액</th>
                    <th class="amount">특기사항</th>
                    </tr>
                    <tr>
                        <th scope="row">연료누출(LP가스포함)</th>
                        <td style="padding:5px">
                            <div id="c_s035" name="c_s035">없음</div>
                        </td>
                        <td class="amount">
                            <div id="c_p035" name="c_p035"></div>
                        </td>
                        <td class="amount">
                            <div id="c_m035" name="c_m035"></div>
                        </td>
                    </tr>                    
                    </table>
	            </div>
	        </div> 
	        
	        
	        
	        <div id="c_uscasttus_tab_5" style="display:none;">
				<div class="New_agbox">
	                <h2 class="tit"><span></span>고지정보</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="19%" />
						<col width="31%" />
						<col width="19%" />
						<col width="31%" />
					</colgroup>
					<tbody>
					<tr>
						<th scope="row">접수자(명칭)</th>
						<td><em id="c_usca_register_nm_txt" name="c_usca_register_nm_txt"></em></td>
						<th scope="row">접수일</th>
						<td><em id="c_usca_r_rcept_de_txt" name="c_usca_r_rcept_de_txt"></em></td>
					</tr>
					<tr>
						<th scope="row">고지업체명</th>
						<td><em id="c_usca_ntic_entrps_nm" name="c_usca_ntic_entrps_nm"></em></td>
						<th scope="row">고지자명</th>
						<td><em id="c_usca_ntic_person_nm_txt" name="c_usca_ntic_person_nm_txt"></em></td>
					</tr>
	            	</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>점검정보</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="19%" />
						<col width="31%" />
						<col width="19%" />
						<col width="31%" />
					</colgroup>
					<tbody>
					<tr>
						<th scope="row">등록번호</th>
					  	<td>
					  		<em id="c_usca_chck_imprmn_entrps_id"></em>
					  	</td>
						<th scope="row">등록업체명</th>
						<td class="last">
							<em id="c_usca_chck_entrps_nm"></em>
						</td>
					</tr>
					<tr>
						<th scope="row">점검일</th>
						<td>
							<em id="c_usca_chck_de"></em>
						</td>
						<th scope="row">점검자명</th>
						<td class="last">
							<em id="c_usca_insctr_nm"></em>
						</td>
					</tr>
	            	</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>매수정보</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="19%" />
						<col width="31%" />
						<col width="19%" />
						<col width="31%" />
					</colgroup>
					<tbody>
					<tr>
						<th scope="row">매수일</th>
						<td>
							<em id="c_usca_buyer_de"></em>
						</td>
						<th scope="row">매수인명</th>
						<td>
							<em id="c_usca_buyer_nm"></em>
						</td>
					</tr>
	            	</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>특기사항 및 점검자의 의견</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<tr>
                        <td class="last">
                            <em id="c_usca_etc_matter"></em>
                        </td>
                    </tr>
	            	</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>자동차 기타정보</h2>
	            </div>
	             
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="14%" />
                        <col width="14%" />
                        <col width="20%" />
                        <col width="14%" />
                        <col width="20%" />
                        <col width="18%" />
					</colgroup>
					<tbody>
					<tr>
                        <th rowspan='5'>수리필요</th>
                        <th scope="row">외장</th>
                        <td class = "etc_check">
                            <div id="c_usca_extrr_repair_need_at" name="c_usca_extrr_repair_need_at"></div>
                        </td>
                        <th scope="row">내장</th>
                        <td class = "etc_check">
                            <div id="c_usca_itrdeco_repair_need_at" name="c_usca_itrdeco_repair_need_at"></div>
                        </td>
                        <td rowspan='6' class="amount">
                            <div id="p075" name="p075"></div>
                        </td>
                    </tr>								
                    <tr>
                        <th scope="row">광택</th>
                        <td class = "etc_check">
                            <div id="c_usca_metal_surfc_clnsg_need_at" name="c_usca_metal_surfc_clnsg_need_at"></div>
                        </td>
                        <th scope="row">룸크리닝</th>
                        <td class = "etc_check">
                            <div id="c_usca_engine_room_cln_repair_need_at" name="c_usca_engine_room_cln_repair_need_at"></div>
                        </td>
                    </tr>
                    
                    <tr>
                        <th scope="row">휠</th>
                        <td colspan="3" class = "etc_check3">
                            운전석 
                            (<input type="checkbox" id="c_usca_rim_drv_seat_frnt_repair_at" name="c_usca_rim_drv_seat_frnt_repair_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;전</label>
                            <input type="checkbox" id="c_usca_rim_drv_seat_aftr_repair_at" name="c_usca_rim_drv_seat_aftr_repair_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;후</label>
                            ) / 동반석 (
                            <input type="checkbox" id="c_usca_rim_acpseat_frnt_repair_at" name="c_usca_rim_acpseat_frnt_repair_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;전</label>
                            <input type="checkbox" id="c_usca_rim_acpseat_aftr_repair_at" name="c_usca_rim_acpseat_aftr_repair_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;후</label>
                            )/
                            <input type="checkbox" id="c_usca_rim_emgncy_repair_need_at" name="c_usca_rim_emgncy_repair_need_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;응급</label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">타이어</th>
                        <td colspan="3" class = "etc_check3">
                            운전석 
                            (<input type="checkbox" id="c_usca_tire_drv_seat_frnt_repair_at" name="c_usca_tire_drv_seat_frnt_repair_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;전</label>
                            <input type="checkbox" id="c_usca_tire_drv_seat_aftr_repair_at" name="c_usca_tire_drv_seat_aftr_repair_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;후</label>
                            ) / 동반석 (
                            <input type="checkbox" id="c_usca_tire_acpseat_frnt_repair_at" name="c_usca_tire_acpseat_frnt_repair_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;전</label>
                            <input type="checkbox" id="c_usca_tire_acpseat_aftr_repair_at" name="c_usca_tire_acpseat_aftr_repair_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;후</label>
                            )/
                            <input type="checkbox" id="c_usca_tire_emgncy_repair_need_at" name="c_usca_tire_emgncy_repair_need_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;응급</label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">유리</th>
                        <td colspan="3" class = "etc_check">
                            <div id="c_usca_glass_repair_need_at" name="c_usca_glass_repair_need_at"></div>
                        </td>
                    </tr>
                    <tr>
                        <th>기본품목</th>
                        <th scope="row">보유상태</th>
                        <td colspan="3" class = "etc_check3">
                            <input type="checkbox" id="c_usca_bass_prdlst_hold_use_mnl_at" name="c_usca_bass_prdlst_hold_use_mnl_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;사용설명서</label>
                            <input type="checkbox" id="c_usca_bass_prdlst_hold_th_brakt_at" name="c_usca_bass_prdlst_hold_th_brakt_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;안전삼각대</label>
                            <input type="checkbox" id="c_usca_bass_prdlst_hold_tool_at" name="c_usca_bass_prdlst_hold_tool_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;잭</label>
                            <input type="checkbox" id="c_usca_bass_prdlst_hold_tqwrnch_at" name="c_usca_bass_prdlst_hold_tqwrnch_at" value="1" class="check2" onkeypress="main_optn_chk2(this);" onclick="main_optn_chk2(this);" disabled="disabled"/><label class="view">&nbsp;스패너</label>
                        </td>

                    </tr>
                    <tr>
                        <th colspan='5' style="font-size:30px;">최종 가격조사 산정금액</th>
                        <td class="amount">
                            <div id="p076" name="p076"></div>
                        </td>
                    </tr>
	            	</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>가격조사산정 정보</h2>
	            </div>
	            
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
						<col width="19%" />
                        <col width="31%" />
                        <col width="19%" />
                        <col width="31%" />
					</colgroup>
					<tbody>
						<tr>
                            <th scope="row">가격산정<br/> 기준협회</th>
                            <td class = "etc_check">
                                <em id="c_usca_pc_calc_stdr_asoc_code"></em>
                            </td>
                            <th scope="row">가격산정<br/> 등록업체명</th>
                            <td class="PC_EXAMIN">
                                <em id="c_usca_pc_examin_calc_entrps_nm"></em>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">가격조사산정일</th>
                            <td class = "etc_check">
                                <em id="c_usca_pc_examin_calc_de"></em>
                            </td>
                            <th scope="row">가격조사<br/>산정자명</th>
                            <td class="PC_EXAMIN">
                                <em id="c_usca_pc_examin_calc_charger_nm"></em>
                            </td>
                        </tr>
					</table>
	            </div>
	            
	            <div class="New_agbox">
	                <h2 class="tit"><span></span>가격조사산정 정보</h2>
	            </div>
	            
	            <div class="tblwrap_basic">
	            	<table>
	            	<colgroup>
                    </colgroup>
	            	<tbody>
                        <tr>
                            <td class="last">
                                <em id="c_usca_spcabl_matter_nd_calc_resn"></em>
                            </td>
                        </tr>
                    </tbody>
                    </table>
                </div>
	        </div>
        </div>
        
    </div>
    <div class="popup_add_btn" id="c_uscaSttus_close_btn"><a href="#none">확인</a></div>
    </div>
</div></div>
						<!-- //sub_inner -->
						<!-- </div> -->
					</div>

				</div>

				<!-- <div id="footer"></div> -->
			</div>
			<div id="New_web">

				<div id="main_bannerzone" class="clFix">

					<div class="sitelink">

						<div class="list_wrap clFix">
							<div class="bannerTop">
								<p class="bannerTit">관련기관</p>
								<div class="ctrl_ban_btns">
									<button type="button" class="btn prev swiper-button-disabled"
										tabindex="0" role="button" aria-label="Previous slide"
										aria-disabled="true">이전</button>
									<button type="button" class="btn pause" style="display: none;">일시정지</button>
									<button type="button" class="btn play">재생</button>
									<button type="button" class="btn next" tabindex="0"
										role="button" aria-label="Next slide" aria-disabled="false">다음</button>
								</div>
							</div>
							<div
								class="list swiper-container swiper-container-initialized swiper-container-horizontal">
								<ul class="clFix swiper-wrapper">
									<li
													class="swiper-slide swiper-slide-visible swiper-slide-active">
													<a href="http://www.molit.go.kr"
													title="국토교통부 새창열림" target="_blank"
													tabindex="-1"> <input type="hidden" name="MZ01000424"
														value="true"> <img
														src="/comm/download.do?f=ZV%2FsKXDHcoOTCtRqnVPYnNf%2BGNOH57%2BKitHx7rTPxpNXFP410COytOo3H2x0HwZlRFH6Xw20oJ8D%0AHPLdD6ZMqA%3D%3D"
														alt="국토교통부 로고">
												</a>
												</li>
											<li
													class="swiper-slide swiper-slide-visible swiper-slide-active">
													<a href="http://www.kotsa.or.kr"
													title="한국교통안전공단 새창열림" target="_blank"
													tabindex="-1"> <input type="hidden" name="MZ01000424"
														value="true"> <img
														src="/comm/download.do?f=sqxItZ7MRYlgmeBB%2FdZNz5tqAGd1FH67lkqQNiVMclbHsjc4MrrrhzoWFYd6q1cpq0ncMi3tGQ9r%0Af%2BnctMJPzg%3D%3D"
														alt="한국교통안전공단 로고">
												</a>
												</li>
											<li
													class="swiper-slide swiper-slide-visible swiper-slide-active">
													<a href="http://adr.katri.or.kr/online-main/main.do"
													title="국토교통부 자동차안전.하자심의위원회 새창열림" target="_blank"
													tabindex="-1"> <input type="hidden" name="MZ01000424"
														value="true"> <img
														src="/comm/download.do?f=WbX5RJx7sUfkEw3LLalwWIBGTr2PvQ3z3%2FpJcHmRV9UrfMHrwXCVcIsWbbrQY7Q2SaBF9GpndCIl%0ADrTYq56Ylw%3D%3D"
														alt="국토교통부 자동차안전.하자심의위원회">
												</a>
												</li>
											<li
													class="swiper-slide swiper-slide-visible swiper-slide-active">
													<a href="https://www.car.go.kr/home/main.do"
													title="자동차리콜센터 새창열림" target="_blank"
													tabindex="-1"> <input type="hidden" name="MZ01000424"
														value="true"> <img
														src="/comm/download.do?f=ZV6Sdj2kd8khnXsfDtH6GESm2o84XBs0hP8Rh5EQyEgxTFF4qxtPBkjojH2J1ARb2EmjP3sQNgAn%0AJVK6vsAEdg%3D%3D"
														alt="자동차리콜센터">
												</a>
												</li>
											<li
													class="swiper-slide swiper-slide-visible swiper-slide-active">
													<a href="http://www.ex.co.kr/"
													title="한국도로공사 새창열림" target="_blank"
													tabindex="-1"> <input type="hidden" name="MZ01000424"
														value="true"> <img
														src="/comm/download.do?f=xCJcGb02GwYMIgAguFpCsBoj6pWccbAtVYgqRQVjTlyVkkMfo4taOZq28kshVjZ01pwgLJTust13%0AxKvHEh9jnA%3D%3D"
														alt="한국도로공사 로고">
												</a>
												</li>
											<li
													class="swiper-slide swiper-slide-visible swiper-slide-active">
													<a href="http://www.opinet.co.kr"
													title="한국석유공사 새창열림" target="_blank"
													tabindex="-1"> <input type="hidden" name="MZ01000424"
														value="true"> <img
														src="/comm/download.do?f=ZEUrzrad3EIgBDI%2BnkxcWD2IHq7liEOW6LpPqk6BV1D%2FnysFy81N4Ty8qL5FpOeesS3e4I7CJona%0AwaQhX%2FASAA%3D%3D"
														alt="한국석유공사">
												</a>
												</li>
											<li
													class="swiper-slide swiper-slide-visible swiper-slide-active">
													<a href="https://www.tago.go.kr/"
													title="국가대중교통정보센터 새창열림" target="_blank"
													tabindex="-1"> <input type="hidden" name="MZ01000424"
														value="true"> <img
														src="/comm/download.do?f=c3BJWNRaLPebGcRlTxl4l%2BN9kgX3MQLdIgkoUF2lSo5jOAE5BUEXNEARttIbJlQeaYG1utRuP%2Fvv%0AYsQg3Fg6jQ%3D%3D"
														alt="국가대중교통정보센터 로고">
												</a>
												</li>
											<li
													class="swiper-slide swiper-slide-visible swiper-slide-active">
													<a href="http://www.gov.kr/portal/main#"
													title="정부24 새창열림" target="_blank"
													tabindex="-1"> <input type="hidden" name="MZ01000424"
														value="true"> <img
														src="/comm/download.do?f=gBwPiybovnOUExzMo8QIdd1tKElLsNJd%2B7qjUOCysNLP5M7h3oCDhy7ebHYvrsDV7hmzZFomw2q9%0ARD%2BOhr4OHQ%3D%3D"
														alt="정부24 로고">
												</a>
												</li>
											<li
													class="swiper-slide swiper-slide-visible swiper-slide-active">
													<a href="http://www.gparts.co.kr/main.do"
													title="자동차재사용부품전문쇼핑몰 새창열림" target="_blank"
													tabindex="-1"> <input type="hidden" name="MZ01000424"
														value="true"> <img
														src="/comm/download.do?f=x1u7CRF3ElUKXBP0ggHftyHES36o6KtaTx8IMswKFiUr6%2Fq0Ghjc6fgBXLYFbBEaHXVmMotVf0%2FA%0AZbELfaTXlA%3D%3D"
														alt="자동차재사용부품전문쇼핑몰 로고">
												</a>
												</li>
											<li
													class="swiper-slide swiper-slide-visible swiper-slide-active">
													<a href="http://www.g4b.go.kr/"
													title="기업지원플러스 새창열림" target="_blank"
													tabindex="-1"> <input type="hidden" name="MZ01000424"
														value="true"> <img
														src="/comm/download.do?f=p93%2FTeUQINEsT61O0P7irEpKginYHeBXjNXXrgvCIcjThKw4KNQalkG3htDHha%2Fh6CxLOm5qjxBS%0Au%2BchsusyQA%3D%3D"
														alt="기업지원플러스 로고">
												</a>
												</li>
											</ul>
								<span class="swiper-notification" aria-live="assertive"
									aria-atomic="true"></span>
							</div>
						</div>
					</div>
				</div>

			</div>
		</section>




		<footer>
			<div id="New_web1">
				<div class="f_t">
					<ul class="f_l">
						<li class="sitelink">
							<div class="fam_link">
								<p class="link_tit">
									<a href="Javascript:fnFamilySiteClick();"
										title="관련기관 바로가기 목록 열기">관련사이트</a>
								</p>
								<ul class="link_site" style="background-color: #ebebeb">
									<li><a href="http://www.molit.go.kr" target="_blank"
										title="국토교통부">국토교통부</a></li>
									<li><a href="http://www.kotsa.or.kr" target="_blank"
										title="한국교통안전공단">한국교통안전공단</a></li>
									<li><a href="http://www.ex.co.kr" target="_blank"
										title="한국도로공사">한국도로공사</a></li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
				<input type="hidden" style="width: 500px;" name="question_url"
					id="question_url" value="" /> <input type="hidden"
					style="width: 500px;" name="question_pagecode"
					id="question_pagecode" value="main" />
				<div class="f_w">
					<div class="info">
						<div class="f_logo">
							<a href="http://www.molit.go.kr/portal.do" target="_blank"
								title="국토교통부 새창열림"> <img
								src="/resource/common_dz/images/footer_logo_1.png"
								alt="국토교통부 로고" class="f_logo1"
								style="display: block; width: 150px;">
							</a> <a href="http://www.kotsa.or.kr/" target="_blank"
								title="한국교통안전공단 새창열림"> <img
								src="/resource/common_dz/images/footer_logo_2.png"
								alt="한국교통안전공단 로고" class="f_logo2" style="width: 190px;">
							</a>
						</div>
						<ul class="address">
							<li class="address_privacy"><a href="/policy.html"
								target="_blank">개인정보처리방침</a> | <a href="/terms.html"
								target="_blank">이용약관</a></li>
							<li>사이트 이용문의 : 1566-4682</li>
							<li>안내시간 : 09:00 ~ 18:00 (주말, 공휴일 휴무)</li>
							<!-- 23.02.08 footer 오기는 길 수정 시작 -->
							<li>오시는 길 :
								<div class="tooltip tooltip_text">
									<a href="#none">[국토교통부]</a> <span
										class="tooltiptext tooltip_top">(우)30103<br>세종특별자치시
										도움6로 11 국토교통부
									</span>
								</div>
								<div class="tooltip tooltip_text">
									<a href="#none">[한국교통안전공단]</a> <span
										class="tooltiptext tooltip_top">(우)39660<br>경상북도
										김천시 혁신6로 17(율곡동, 한국교통안전공단)
									</span>
								</div>
							</li>
							<li><a
								href="http://stat.molit.go.kr/portal/quality/qualityCenterWrite.do?system_id=S0040"
								target="_blank">품질오류신고</a> | <a
								href="http://stat.molit.go.kr/portal/quality/qualityCenterList.do?system_id=S0040"
								target="_blank">품질오류신고확인</a></li>
							<li><a href="/web/contents/relsite.do"
								style="font-weight: bold; padding-left: 5px; color: #186bac;">[관련기관
									연락처보기]</a></li>
							<!-- 23.02.08 footer 오기는 길 수정 끝 -->
							<li class="email">본 웹 사이트에 게시된 이메일 주소가 자동 수집되는것을 거부하며, 위반시
								정보통신망법에 의해 처벌됨을 유념하시기 바랍니다.<span style="color: white;">1</span>
							</li>
							<li style="width: 100%;"><b style="color: #2473b0">▶ 컨텐츠
									만족도 설문조사</b></li>
							<li>
								<div class="question">
									<dl class="survey">
										<dt>이 페이지에서 제공하는 정보에 만족하셨습니까?</dt>
										<dd>
											<label for="question5"><input type="radio"
												name="question_value" id="question5" value="5" title="매우만족">
												매우만족</label> <label for="question4"><input type="radio"
												name="question_value" id="question4" value="4" title="만족">
												만족</label> <label for="question3"><input type="radio"
												name="question_value" id="question3" value="3" title="보통">
												보통</label> <label for="question2"><input type="radio"
												name="question_value" id="question2" value="2" title="불만족">
												불만족</label> <label for="question1"><input type="radio"
												name="question_value" id="question1" value="1" title="매우불만족">
												매우불만족</label>
										</dd>
										<dd>
											<span style="cursor: pointer;"
												onclick="page_satisfaction_research()">확인</span>
										</dd>
									</dl>
								</div>
							</li>
						</ul>
						<img src="/resource/common_dz/images/logo_wa.png"
							alt="과학기술정보통신부 WEB ACCESSIBILITY 마크(웹 접근성 품질인증 마크)"
							class="logo_wa"> <img
							src="/resource/common_dz/images/logo_gc.png"
							alt="과학기술정보통신부 GOOD CONTENTS SERVICE 마크(굿 콘텐츠 서비스 마크)"
							class="logo_wa" style="width: 55px; right: 90px">
					</div>
				</div>
			</div>


			<div id="New_mob">
				<div id="footer_section" class="section fp-auto-height">
					<div id="footer">
						<div class="inwrap">
							<div class="f_logo"
								style="text-align: center; padding-bottom: 2%;">
								<a href="http://www.molit.go.kr/portal.do" target="_blank"
									title="국토교통부 새창열림"> <img
									src="/resource/common_dz/images/footer_logo_1.png"
									alt="국토교통부 로고" class="f_logo1" style="width: 100px;">
								</a> <a href="http://www.kotsa.or.kr/" target="_blank"
									title="한국교통안전공단 새창열림"> <img
									src="/resource/common_dz/images/footer_logo_2.png"
									alt="한국교통안전공단 로고" class="f_logo2" style="width: 130px;">
								</a>
							</div>
							<div class="footer_cont">
								<ul class="address">
									<li class="address_privacy"><a href="/policy.html"
										target="_blank">개인정보처리방침</a> | <a href="/terms.html"
										target="_blank">이용약관</a></li>
								</ul>
								<p>사이트 이용문의 1566-4682</p>
								<p>안내시간 09:00 ~ 18:00 [주말,공휴일 휴무]</p>
								<!-- 23.02.08 footer 오기는 길 수정 시작 -->
								<div class="footer_address">
									오시는 길 :
									<div class="tooltip tooltip_text">
										<a href="#none">[국토교통부]</a> <span
											class="tooltiptext tooltip_top">(우)30103<br>세종특별자치시
											도움6로 11 국토교통부
										</span>
									</div>
									<div class="tooltip tooltip_text">
										<a href="#none">[한국교통안전공단]</a> <span
											class="tooltiptext tooltip_top">(우)39660<br>경상북도
											김천시 혁신6로 17(율곡동, 한국교통안전공단)
										</span>
									</div>
								</div>
								<!-- 23.02.08 footer 오기는 길 수정 끝 -->
							</div>
						</div>
					</div>
				</div>
			</div>

		</footer>
		<!--//footer-->
		

		<div id="popup_login" class="popup" style="max-width: 100%;">
			<div class="popup_contents">
				<div class="popup_title">
					<span id="pop_title_txt" name="pop_title_txt">로그인</span>
					<button id="pop_close_button" type="button" class="close"
						style="background-color: white; display: none;">
						<span>×</span>
					</button>
				</div>
				<div class="popup_middle" style="background-color: white;">
					<!-- <p class="popup_sub_title">차량정보 등록안내</p> -->
					<div class="pop_box">
						<p class="pop_box_sub_title" id="pop_inner_txt"
							name="pop_inner_txt">
							본인인증 로그인이 필요한 서비스입니다.<br>로그인 페이지로 이동합니다.
						</p>
					</div>
					<div class="popup_add_btn popup_right_btn">
						<a id="pop_href" name="pop_href"
							href="/web/contents/member_login.do"
							style="left: 0%; width: 100%">확인</a>
					</div>
				</div>
			</div>
		</div>

		<!-- 
	<p class="bottom"><a href="#top">키보드 초점 페이지 상단으로 이동</a></p>
 -->
		<!-- <div class="bbg"></div> -->

		<script>
		/**
		 * <a href="#">링크</a>
		 * 위와 같은 형태로 된 링크를 '#'동작이 먹지 않게 막는다.
		 */
		$(document).delegate("a[href='#']","click",function(event){
			event.preventDefault();

		});

		 function actionAncor(url, target) {

			 if (target === "blank") {
				 var newWin = window.open(url);
				 if (newWin == null) {
					//경고창주석 20200511_pjw
					//alert("팝업이 차단되었습니다. 팝업 차단을 해제 해주세요.");
				 }
			 } else {
				 location.href=url;
			 }
		 }

		 function increaseLinkTypeMneuLog(url, code, target) {
			if(code == "reportfalsesale") {
				loginChkLinkOpen(url, code,  target);
			} else {
				var filter = "win16|win32|win64|mac|macintel";
				if( filter.indexOf(navigator.platform.toLowerCase())<0 ){
					if(url.indexOf('ecar.go.kr') > -1){
						alert("해당 메뉴는 현재 모바일에서 이용할 수 없습니다. PC에서 이용해 주세요.");
		 				return false;		
					}
				}
				/* var url = "/web/contents/"+code+".do"; */
				actionAncor(url, target);
			}
		 }
		 
		function loginChkLinkOpen(url, code, target) {
			
			var memberYN = "";
			if(memberYN == "Y") {				
				var name = encodeURIComponent(Base64.encode(""));
				var sci = encodeURIComponent(Base64.encode(""));
				var mpNum = encodeURIComponent(Base64.encode(""));
				var emailAdres = encodeURIComponent(Base64.encode(""));
				var birthDe = encodeURIComponent(Base64.encode(""));
				
				url += '?ci='+ sci +'&nm=' + name + '&bd=' + birthDe + '&email=' + emailAdres + '&hp=' + mpNum;
				//alert(url);
				
				actionAncor(url, target);
			} else {
				$("#popup_login").show();
			}
		}
	</script>

	</div>
	<!-- 	chatbot -->
	<!--    2022.01.12 jhy 챗봇 메인으로 이동 -->
	<script>
		
		function fn_Gitple(){
			
			window.GitpleConfig = { appCode: 'PQ4SZApQ00sgaFpQUH2o6jqhAeIpk2' };
			!function(){
				function e(){
					function e(){
						var e=t.contentDocument,
						a=e.createElement("script");
						a.type="text/javascript",
						a.async=!0,
						a.src=window[n]&&window[n].url?window[n].url+"/inapp-web/gitple-loader.js":"https://app.gitple.io/inapp-web/gitple-loader.js",
						a.charset="UTF-8",e.head&&e.head.appendChild(a)
						
						}
				var t=document.getElementById(a);
				t||((t=document.createElement("iframe")).id=a,
						t.title="자동차365",
						t.style.display="none",
						t.style.width="0",
						t.style.height="0",
						t.addEventListener?t.addEventListener("load",e,!1):t.attachEvent?t.attachEvent("onload",e):t.onload=e,
								document.body.appendChild(t))
								
				}
				var t=window,n="GitpleConfig",a="gitple-loader-frame";
				if(!window.Gitple){
					document;
					var i=function(){i.ex&&i.ex(arguments)};
					i.q=[],i.ex=function(e){i.processApi?i.processApi.apply(void 0,e):i.q&&i.q.push(e)},
					window.Gitple=i,
					t.attachEvent?t.attachEvent("onload",e):t.addEventListener("DOMContentLoaded",e,!1)
							
							}
				}();
			
				
			Gitple('boot');	
			
			
			setTimeout(function(){
				var launcherElmt = document.getElementById('gitple-launcher');
				if(launcherElmt){
					launcherElmt.setAttribute('title','클릭하시면 채팅상담이 가능합니다.');
					<!--
					$("#gitple-launcher").hide();
					$("#gitple-launcher-tooltip").hide();
					var first_height = ($(window).height()-4);
					if(first_height > 1000){
						document.getElementById("mainFrame1").style.height = "800px";
					}
					-->
					$("#gitple-launcher").show();
					$("#gitple-launcher-tooltip").show();
					
					
					
				}
			},1000);
		
		}
		
		//fn_Gitple();
		
		<!-- 2022.01.19 jhy 차량등록 AND 자량번호 조회(소유주)화면에서는 안나오게-->
		
			fn_Gitple();
		</script>
</body>
</html>
