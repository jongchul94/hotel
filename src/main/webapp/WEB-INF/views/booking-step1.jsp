<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String children2 = (String)request.getAttribute("children");
	String adult2 = (String)request.getAttribute("adult");
	
	int children = 0;
	int adult = 0;
	
	if(children2 != null){
		children = Integer.parseInt(children2);}
	if (adult2 != null ){
	 	adult = Integer.parseInt(adult2);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="description" content="Eden Travel Template">
  
  <meta name="author" content="Themefisher.com">

  <title>IT WILL | Hotel</title>

  <!-- Mobile Specific Meta-->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="/hotel/resources/plugins/bootstrap/css/bootstrap.min.css">
  <!-- Ionic Icon Css -->
  <link rel="stylesheet" href="/hotel/resources/plugins/Ionicons/css/ionicons.min.css">
  <!-- Flaticon Css -->
  <link rel="stylesheet" href="/hotel/resources/plugins/flaticon/font/flaticon.css">
  <!-- animate.css -->
  <link rel="stylesheet" href="/hotel/resources/plugins/animate-css/animate.css">
  <link rel="stylesheet" href="/hotel/resources/plugins/nice-select/nice-select.css">
  <!-- DATE PICKER -->
  <link href="/hotel/resources/plugins/bootstrap-datepicker-master/bootstrap-datepicker.min.css" type="text/css" rel="stylesheet" />
  <!-- Magnify Popup -->
  <link rel="stylesheet" href="/hotel/resources/plugins/magnific-popup/dist/magnific-popup.css">
  <!-- Owl Carousel CSS -->
  <link rel="stylesheet" href="/hotel/resources/plugins/slick-carousel/slick/slick.css">
  <link rel="stylesheet" href="/hotel/resources/plugins/slick-carousel/slick/slick-theme.css">

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
  
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="/hotel/resources/css/style.css">
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  
  <!-- font -->
  <link href="https://fonts.googleapis.com/css?family=Gothic+A1:100|Noto+Serif+KR:200&display=swap&subset=korean" rel="stylesheet">
  
	<style type="text/css">
	
	*:not(i){
		font-family: 'Noto Serif KR', serif!important;
	}
	
	</style>


<script type="text/javascript">


$(function(){
	
	listPage(1);
	
});

// 새로고침X
$(document).ready(function(){
	
	$("#btnOK").click(function(){
		
		var params = "checkin=" + $("#checkin").val()
				+ "&checkout=" + $("#checkout").val()
				+ "&adult=" + $("#adult").val()
				+ "&children=" + $("#children").val()
				+ "&room=" + $("#room").val();
		
		$.ajax({
			
			type:"POST",  
			url:"<%=cp%>/room-list.action", 
			data:params,
			success:function(args){
				
				$("#listData").html(args);
				
			},
			beforeSend:showRequest, 
			error:function(e) {
				
				alert(e.responseText); 
			}
		});
		
	});
	
});

function showRequest() {
	
	var checkin = $.trim($("#checkin").val());
	var checkout = $.trim($("#checkout").val());
	var adult = $.trim($("#adult").val());
	var children = $.trim($("#children").val());
	
	if(!checkin) {
		alert("\n체크인 날짜를 선택하세요");
		$("#checkin").focus();
		return false;
	}

	if (!checkout) {
		alert("\n체크아웃 날짜를 선택하세요");
		$("#checkout").focus();
		return false;
	}
	
	if (checkin==checkout) {
		
		alert("\n체크인 날짜와 체크아웃 날짜가 같을 수 없습니다")
		$("#checkout").focus();
		return false;
	}
	
	var chkIn =new Array();
	chkIn = checkin.split("/");
	var chkout = new Array();
	chkout = checkout.split("/");
	
	if(chkIn[2]>chkout[2]) {
		alert("\n체크인 날짜보다 이전 날짜를 선택할 수 없습니다");
		$("#checkout").focus();
		return false;
	}
	/* 
	if(chkIn[0]>chkout[0]) {
		alert("\n체크인 날짜보다 이전 날짜를 선택할 수 없습니다");
		$("#checkout").focus();
		return false;
	}
	 */
	if(chkIn[2]==chkout[2] && chkIn[0]>chkout[0]) {
		alert("\n체크인 날짜보다 이전 날짜를 선택할 수 없습니다");
		$("#checkout").focus();
		return false;
	}
	
	if(chkIn[2]<chkout[2] && chkIn[0]<chkout[0]) {
		alert("\n체크인 날짜보다 이전 날짜를 선택할 수 없습니다");
		$("#checkout").focus();
		return false;
	}
	
	if (chkIn[0]==chkout[0]) {
		
	if(!chkIn[2]<chkout[2])
		if(!chkIn[0]<chkout[0])
			if(chkIn[1]>chkout[1])  {
					alert("\n체크인 날짜보다 이전 날짜를 선택할 수 없습니다");
					$("#checkout").focus();
					return false;
			}
	}
				
	if (adult=='성인') {
		alert("\n인원 수를 선택하세요");
		$("#adult").focus();
		return false;
	}
	
    if (children=='어린이') {
		alert("\n인원 수를 선택하세요");
		$("#children").focus();
		return false;
	} 
    
	return true;
}


// 상세페이지로 넘어가기
function searchData(checkin,checkout,adult,children,roomIndex) {
	
	location.href = "<%=cp%>/room-details.action?checkin="+checkin
			+"&checkout="+checkout+"&adult="+adult+"&children="+children 
			+"&roomIndex="+roomIndex;
}

function listPage(page) {
	
	if('${checkin}'.length) {
		checkin=  '${checkin}';
		checkout= '${checkout}';
		adult='${adult}';
		children= '${children}';
		
	var url = "<%=cp%>/room-list.action";
	
	$.post(url,{checkin:checkin,checkout:checkout,
		adult:adult,children:children},function(args) {
		
		$("#listData").html(args);
		
	});
	
	}
	
} 
</script>
</head>

<body >
<!-- Header Start --> 

<header class="navigation">
<div class="top-header py-2">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-8">
				<div class="top-header-left text-muted">
					<b>IT WILL HOTEL</b>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<span id="currentDate" style="font-size:12px;"></span>
					<span style="font-size:12px;">서초구</span>
					<span id="icon"></span>
					<span id="todayTemp" style="font-size:12px;"></span>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="top-header-right float-right">
					<ul class="list-unstyled mb-0">
						<li class="top-contact">
							
							<c:choose>
								<c:when test="${empty sessionScope.login.userId }">
									<span class="text-color">
										<a href="login.action">로그인</a> / 
										<a href="signup.action">회원가입</a>
									</span>
								</c:when>
							
								<c:otherwise>
									<span class="text-color">${sessionScope.login.userName }님 안녕하세요:)
									</span>
										<a href="logout.action">&nbsp;&nbsp;로그아웃</a> / 
										
										<c:if test="${sessionScope.login.userId ne 'admin'}">
											<a href="myPage.action">마이페이지</a>
										</c:if>
										
										<c:if test="${sessionScope.login.userId eq 'admin'}">
											<a href="admin.action">관리자</a>
										</c:if>
										
								</c:otherwise>
							</c:choose>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

	<nav class="navbar navbar-expand-lg bg-white w-100 p-0" id="navbar">
		<div class="container">
		  <a class="navbar-brand" href="/hotel"><img src="/hotel/resources/images/logo.png" alt="Eden" class="img-fluid"></a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
			<span class="fa fa-bars"></span>
		  </button>
	  
		  <div class="collapse navbar-collapse" id="navbarsExample09">
			<ul class="navbar-nav ml-auto">
			  <li class="nav-item active">
				<a class="nav-link" href="/hotel">Home <span class="sr-only">(current)</span></a>
			  </li>
			  
			  <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">About Us </a>
				<ul class="dropdown-menu" aria-labelledby="dropdown02">
				  <li><a class="dropdown-item" href="about.action">About Us</a></li>
				  <li><a class="dropdown-item" href="service.action">Services</a></li>
				  <li><a class="dropdown-item" href="gallery.action">Gallery</a></li>
				</ul>
			  </li>
			  
			  <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Rooms</a>
				<ul class="dropdown-menu" aria-labelledby="dropdown02">
				  <li><a class="dropdown-item" href="pricing.action">Pricing</a></li>
				  <li><a class="dropdown-item" href="room-grid.action">Room-Grid</a></li>
				</ul>
			  </li>

			  <li class="nav-item active">
				<a class="nav-link" href="booking-step1.action">Reservation <span class="sr-only">(current)</span></a>
			  </li>
			  
			  <li class="nav-item active">
				<a class="nav-link" href="event-grid.action">Events <span class="sr-only">(current)</span></a>
			  </li>
			  
			  <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Life</a>
				<ul class="dropdown-menu" aria-labelledby="dropdown03">
				  <li><a class="dropdown-item" href="gym">Gym</a></li>
				  <li><a class="dropdown-item" href="restaurantMain.action">Restaurant</a></li>
				  <li><a class="dropdown-item" href="life-spa.action">Spa</a></li>
				</ul>
			  </li>
			  
			  <li class="nav-item active">
				<a class="nav-link" href="contact.action">Contact Us <span class="sr-only">(current)</span></a>
			  </li>
			  
			</ul>
			<form class="form-inline my-2 my-md-0 ml-lg-4">
			  <a href="booking-step1.action" class="btn btn-main">Book Online</a>
			</form>
		  </div>
		</div>
	</nav>
</header>

<!-- Header Close --> 

<div class="main-wrapper ">
<div id="kakao-talk-channel-chat-button" style="position:fixed; right:10px; bottom:0px; z-index:1000;"></div>

<section class="overly bg-2">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
          <h1 class="text-white py-100">날짜, 인원 선택</h1>
      </div>
    </div>
  </div>

  <div class="container-fluid page-border-top">
    <div class="row ">
      <div class="col-lg-12 text-center">
          <div class="page-breadcumb py-2">
            <a href="/hotel" class="text-white">Home</a>
            <span><i class="fa fa-angle-right text-white mx-1" aria-hidden="true"></i></span>
            <a href="booking-step1.action" class="text-white">Reservation</a>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Booking Step1 start -->

<!-- <section class="section">
   
</section>
 -->

 <!-- MAIN CONTENT -->
    <div class="section main-content  clearfix">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="ed-booking-tab">
                <div class="tab-control">
                  <ul class="nav nav-tabs">
                    <li role="presentation" class="active">
                      <a href="#">
                        <span class="ed-step">
                          <span class="ed-step-fill"></span>
                        </span>
                        <span class="ed-step-bar"></span>
                        <span class="ed-step-text">1. 날짜, 인원 선택</span>
                      </a>
                    </li>
                    <li role="presentation">
                  <a href="#">
                        <span class="ed-step">
                          <span class="ed-step-fill"></span>
                        </span>
                        <span class="ed-step-text">2. 고객 정보 작성</span>
                      </a>
                    </li>
                    <li role="presentation">
   				    <a href="#">
                        <span class="ed-step">
                          <span class="ed-step-fill"></span>
                        </span>
                        <span class="ed-step-bar"></span>
                        <span class="ed-step-text">3. 결제</span>
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
          </div>
        </div>

        <div class="tab-content">
          <div role="tabpanel" class="tab-pane active" id="select-room">
            <!-- CHECK AREA -->
            <section class="section-reservation2" >
	<div class="container">
		<div class="gray-bg p-5 position-relative ">
			<form action="" class="reserve-form">
				<div class="form-row justify-content-center">
	<div class="form-group col-md-2 col-sm-4">
				    	<div class="input-group tp-datepicker date" data-provide="datepicker">
						    <input type="text" class="form-control" 
						    placeholder="체크인" value="${checkin }" id="checkin" autocomplete="off">
						    <div class="input-group-addon">
						       <span class="ion-android-calendar"></span>
						    </div>
						</div>
		          	</div>
		          	
		          	<div class="form-group col-md-2 col-sm-4">
				    	<div class="input-group tp-datepicker date" data-provide="datepicker">
						    <input type="text" class="form-control" placeholder="체크아웃" value="${checkout }"
						    	 id="checkout" autocomplete="off">
						    <div class="input-group-addon">
						       <span class="ion-android-calendar"></span>
						    </div>
						</div>
		          	</div>

				    <div class="form-group col-md-2 ">
				    <c:if test="${empty adult }">
				    	<select id="adult" class="form-control custom-select" value="adult" >
					        <option selected style="color:black;">성인</option>
						        <option value="1" style="color:black;">1명</option>
				                <option value="2" style="color:black;">2명</option>
				                <option value="3" style="color:black;">3명</option>
				                <option value="4" style="color:black;">4명</option>
				                <option value="5" style="color:black;">5명</option>
					    </select>
					</c:if>
				    <c:if test="${!empty adult}">
						<select id="adult" class="form-control custom-select" value="adult">
						<% for(int j=1; j<=5; j++) { 
									if(adult==j) {
								%>
					    		  	  <option selected style="color:black;">${adult }명</option>
					    		  	<%} else {%>  
					        			<option value="<%=j %>" style="color:black;"><%=j %>명</option>
					        	<% }} %>	
					    </select>
					</c:if>
				    </div>

				    <div class="form-group col-md-2 ">
			    	<c:if test="${empty children}">
			    		<select id="children" class="form-control custom-select" value="children">
					        <option selected style="color:black;">어린이</option>
					        	<option value="0" style="color:black;">0명</option>
						        <option value="1" style="color:black;">1명</option>
				                <option value="2" style="color:black;">2명</option>
				                <option value="3" style="color:black;">3명</option>
				                <option value="4" style="color:black;">4명</option>
				                <option value="5" style="color:black;">5명</option>
					    </select>
					</c:if>
				    <c:if test="${!empty children }">
						<select id="children" class="form-control custom-select" value="children">
								<% for(int i=0; i<=5; i++) { 
									if(children==i) {
								%>
					    		  	  <option selected style="color:black;">${children }명</option>
					    		  	<%} else {%>  
					        			<option value="<%=i %>" style="color:black;"><%=i %>명</option>
					        	<% }} %>	
					        		
					        	
					    </select>
					</c:if>
				    </div>

				    <div class="form-group col-md-2">
				      <input type="button" value="검색하기" 
				      class="btn btn-main btn-block" id="btnOK">				   
				    </div>
				    
				    
				 </div>
			</form>
		</div>
	</div>
</section>	
           
       <div id="listData"></div> 
        
            </div>
            </div>
        </div>
      </div>
    </div>


<!-- footer Start -->
<footer class="footer pb-md-5 pb-sm-5 secondary-bg pb-0">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="widget footer-widget">
					<div class="footer-logo footer-title mb-4"><h3>IT Will</h3></div>
					<p>한국의 전통미와 현대적인 감각을 겸비하고 있는 세계속의 명문호텔, <br/>아이티윌 호텔은 세계 최고의 어번(urban) 라이프 스타일 호텔로 고객들에게 최고급 서비스를 제공합니다.</p>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 mb-md-4 mb-sm-4">
				<div class="widget footer-widget">
					<h3 class="mb-4">주소</h3>
					<ul class="list-inline footer-address">
						<li class="list-inline-item">
							<i class="ion-android-call"></i>
							 (+233) 123 456789
						</li>
						<li class="list-inline-item">
							<i class="ion-laptop"></i>
							  contact@itwillHotel.com
						</li>
						<li class="list-inline-item">
							<i class="ion-ios-location"></i>
							 서울특별시 테헤란로 15
						</li>
					</ul>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 mb-md-4 mb-sm-4">
				<div class="widget footer-widget">
					<h3 class="mb-4">빠른링크</h3>
					<ul class="list-unstyled footer-menu mb-0">
						<li>
							<a href="/hotel"><i class="fa fa-angle-right"></i>Home</a>
						</li>

						<li>
							<a href="service.action"><i class="fa fa-angle-right"></i>Services</a>
						</li>

						<li>
							<a href="gallery.action"><i class="fa fa-angle-right"></i>Gallery</a>
						</li>
	
						<li>
							<a href="booking-step1.action"><i class="fa fa-angle-right"></i>Reservation</a>
						</li>
						
						<li>
							<a href="contact.action"><i class="fa fa-angle-right"></i>Contact</a>
						</li>

					</ul>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="widget footer-widget">

					<h4 class="my-4">Follow US</h4>

					<ul class="list-inline footer-socials">
						<li class="list-inline-item">
							<a href="#"><i class="ion-social-facebook"></i></a>
						</li>
						<li class="list-inline-item">
							<a href="#"><i class="ion-social-twitter"></i></a>
						</li>
						<li class="list-inline-item">
							<a href="#"><i class="ion-social-pinterest"></i></a>
						</li>
						<li class="list-inline-item">
							<a href="#"><i class="ion-social-linkedin"></i></a>
						</li>
						<li class="list-inline-item">
							<a href="#"><i class="ion-social-rss"></i></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</footer>


<section class="footer-btm secondary-bg py-4" >
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="text-center">
					&copy; Copyright TravelPro Reserved to <a href="#">Themefisher</a>-2019
				</div>
			</div>
		</div>
	</div>
</section>

   
    </div>

    <!-- 
    Essential Scripts
    =====================================-->

    
    <!-- Main jQuery -->

    <script src="/hotel/resources/plugins/jquery/jquery.js"></script>
    <!-- Bootstrap 3.1 -->
    <script src="/hotel/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- Owl Carousel -->
    <script src="/hotel/resources/plugins/slick-carousel/slick/slick.min.js"></script>
    <script src="/hotel/resources/plugins/nice-select/nice-select.js"></script>
    <!--  -->
    <script src="/hotel/resources/plugins/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
    <!-- Form Validator -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery.form/3.32/jquery.form.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.11.1/jquery.validate.min.js"></script>
    <script src="/hotel/resources/plugins/bootstrap-datepicker-master/bootstrap-datepicker.min.js"></script>
    
    <!-- Google Map -->
    <script src="/hotel/resources/plugins/google-map/map.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkeLMlsiwzp6b3Gnaxd86lvakimwGA6UA&callback=initMap"></script>    

    <script src="/hotel/resources/js/script.js"></script>
    
    <!-- Kakao 톡상담 -->
	<script type='text/javascript'>
	
	//<![CDATA[
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('a876d408c7cc2ab22428d910b1de57af');
		// 카카오톡 채널 1:1채팅 버튼을 생성합니다.
		Kakao.Channel.createChatButton({
			container: '#kakao-talk-channel-chat-button',
			channelPublicId: '_rRxdxgT' // 카카오톡 채널 홈 URL에 명시된 id로 설정합니다.
		});
	//]]>
	
	</script>
	
    <script src="/hotel/resources/js/weather.js"></script>

  </body>
  </html>