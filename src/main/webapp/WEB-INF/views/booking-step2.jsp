<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	int total = (Integer)request.getAttribute("total");
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
  
  <!-- font -->
  <link href="https://fonts.googleapis.com/css?family=Gothic+A1:100|Noto+Serif+KR:200&display=swap&subset=korean" rel="stylesheet">
  
	<style type="text/css">
	
	*:not(i){
		font-family: 'Noto Serif KR', serif!important;
	}
	
	</style>
  
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
 <!-- 드롭다운 -->
 
 
 <script type="text/javascript">
 
 window.onload = function() {
 	
		loadPage();
		parseWeather();
		
} 
 
 	//날씨
 	function parseWeather(){
		loadJSON(function(response){
			
			var jsonData = JSON.parse(response);
			
			var temp = Math.round(jsonData["main"]["temp"]-273.15);
			document.getElementById("todayTemp").innerHTML = "서초구 "+temp + ' ˚C';
			
			var icon = jsonData["weather"][0]["icon"];
			document.getElementById("icon").innerHTML = "<image src='https://openweathermap.org/img/wn/"+icon+".png'>";
		});
	}

	function loadJSON(callback){
		
		var url = "https://api.openweathermap.org/data/2.5/weather?q=Seoul,KR&cnt=7&appid=4e843bd1d669f0389af7e25aa1fb2b21";
		var request = new XMLHttpRequest();
		request.overrideMimeType("application/json");
		request.open('GET',url,true);
		
		request.onreadystatechange = function(){
			if(request.readyState == 4 && request.status == "200")
				{
					callback(request.responseText);
				}
		};
		request.send(null);
			
	}
	
	
	
 
 
	function loadPage() {
	    var card="no";
		var url = "<%=cp%>/booking-step2_ok.action";
		
		//jQuery로만 ajax를 만들 때 사용
		$.post(url,
				{card:card,
			price:<%=total%>},
				function(args) {
			$("#resultDIV").html(args);
			
		});
		
	}
 
	$(function() {
		$(".list-inline-item").click(function() {						
			 card = $(this).attr('name');		
			 
			$.get("<%=cp%>/booking-step2_ok.action",{card:card,price:<%=total%>},
					function(args){
					$("#resultDIV").html(args); 
					
				});
		}); 
		
	});

	
	
	function searchData(checkin,checkout,adult,children,roomIndex,optionList,userId,total,pricePerNight) {
	
		
		var bookingMessage = $('#bookingForm [name="booking-message"]').val();
		
		//optionList 매개변수로 안넘겨줘도 ? 
		 location.href = "<%=cp%>/payment.action?checkin="+checkin
						+"&checkout=" + checkout + "&adult=" + adult + "&children="+children
						+"&roomIndex="+ roomIndex + "&options=" + optionList + "&userId=" + userId 
						+ "&total="+total +"&bookingMessage="+bookingMessage;
	}
</script>


</head>

<body>

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
          <h1 class="text-white py-100">고객 정보 작성</h1>
      </div>
    </div>
  </div>

  <div class="container-fluid page-border-top">
    <div class="row ">
      <div class="col-lg-12 text-center">
          <div class="page-breadcumb py-2">
            <a href="#" class="text-white">Home</a>
            <span><i class="fa fa-angle-right text-white mx-1" aria-hidden="true"></i></span>
            <a href="#" class="text-white">Reservation Details</a>
        </div>
      </div>
    </div>
  </div>
</section>



 <!-- MAIN CONTENT -->
    <section class="main-content section clearfix">
      <div class="container">
        <div class="ed-booking-tab">
          <div class="tab-control">
            <ul class="nav nav-tabs">
              <li role="presentation" class="ed-done">
                <a href="#">
                  <span class="ed-step">
                    <span class="ed-step-fill"></span>
                  </span>
                  <span class="ed-step-bar"></span>
                  <span class="ed-step-text">1. 날짜, 인원 선택</span>
                </a>
              </li>
              <li role="presentation" class="active">
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

        <div class="tab-content">
          <div role="tabpanel" class="tab-pane active" id="client-details">
              <div class="row">
                <div class="col-md-6 col-sm-6 col-lg-4 mb-4 mb-lg-0">
                  <div class="ed-reservation">
                    <h3 class="headline mb-4">예약정보</h3>
                    <ul class="ed-reservation-detail">
                      <li>
                        <span>객실 타입</span>
                        <span>
                          <img src="/hotel/resources/images/rooms/img${dto.roomIndex }.jpg" alt="image" class="img-fluid">
                          ${dto. roomType}
                        </span>
                      </li>
                      <li>
                        <span>체크인</span>
                        <span>${checkin }</span>
                      </li>
                      <li>
                        <span>체크아웃</span>
                        <span>${checkout }</span>
                      </li>
                      <li>
                        <span>투숙 인원</span>
                        <span>성인: ${adult},어린이: ${children}</span>
                      </li>
                       <li>
                        <span>숙박일수</span>
                        <span>${interval }박</span>
                      </li>
                       <li>
                        <span>옵션 사항</span>
                        <span>${ optionList}</span>
                      </li>
                    </ul>

                    <h4 class="headline">요금 합계</h4>
                    	<div id="resultDIV"></div>
<%--                     <div class="ed-total">
                    
                       <span class="total-offer">
                        <span>${total }</span>
                      </span>
                    
                    
                    
<!--                       <span class="total-room">
                        <span>2</span>Room
                      </span> -->
                      <span class="total-offer">
                        <span id="resultDIV"></span>off
                      </span>
                      <div class="ed-total-price">
                        <span class="offer-price">${total }</span>
                        <span class="total-price">${total }</span>
                      </div>
                      
                    </div> --%>

                    <div class="ed-pay-card">
                      <ul class="list-inline">
                        <li button name="visa"  class="list-inline-item"><img src="/hotel/resources/images/booking/card1.jpg" alt="image" class="img-fluid"></li></a>
                       <li button  name="master" class="list-inline-item"><img src="/hotel/resources/images/booking/card2.jpg" alt="image" class="img-fluid"></li></a>
                        <li button name="american" class="list-inline-item" ><img src="/hotel/resources/images/booking/card3.jpg" alt="image" class="img-fluid"></li>
                        <li button  name="maestro" class="list-inline-item"><img src="/hotel/resources/images/booking/card4.jpg" alt="image" class="img-fluid"></li>
                        <li button name="what" class="list-inline-item"><img src="/hotel/resources/images/booking/card5.jpg" alt="image" class="img-fluid"></li>
                      </ul>
                    </div>
                  </div>
                </div>

                <div class="col-md-6 col-sm-6 col-lg-8">
                  <div class="comment-form p-4">
                    <h3 class="headline mb-5 font-weight-bold">고객 정보</h3>
                    <div id="alert"></div><!--Response Holder-->
                    <form action="mail/booking-form.php" id="bookingForm" method="post">
                      <div class="row">
                      
                        <div class="col-md-6 col-lg-6">
                          <div class="form-group">
                          이름:
                            <input type="text" class="form-control" value= "${sessionScope.login.userName }" name="name" required id="bookingUserName" autocomplete="off">
                          </div>
                          <div class="form-group">
                          주소:
                            <input type="text" class="form-control" value="${sessionScope.login.addr }" name="address" required id="bookingAddr" autocomplete="off">
                          </div>
                          <div class="form-group">
                          휴대폰 번호:
                            <input type="text" class="form-control" value="${sessionScope.login.tel }" name="tel" required id="bookingTel" autocomplete="off">
                          </div>
                          <div class="form-group">
                          이메일:
                            <input type="text" class="form-control" value="${sessionScope.login.userEmail }" name="email" required id="bookingEmail" autocomplete="off">
                          </div>
                        </div>
                        
                        <div class="col-lg-12">
                          <textarea class="form-control" placeholder="추가 요청사항을 입력해주세요" rows="5"  name="booking-message" required id="bookingMessage"></textarea>
                          <div class="mt-4">
       ．전망은 체크인 당일 사정에 따라 달라질 수 있습니다.<br/>
	   ．전 객실은 금연실로 운영중입니다.
                                <input type="button" onclick="searchData('${checkin }','${checkout }','${adult }','${children }',${roomIndex },'${optionList }','${sessionScope.login.userId } ',${total });"
                                 class="btn btn-main float-right" id="booking-submit-btn" value="결제하기"/>
                          </div>
                        </div>
                      </div>
                    </form>
                    
                    
                    
                  </div>
                </div>
              </div>
          </div>
        </div>
      </div>
    </section>

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
	
	<script type="text/javascript">
	
	$(document).ready(function () {
	    $("#bookingUserName,#bookingAddr,#bookingTel,#bookingEmail,#bookingMessage").click(function () {
	        if ('${sessionScope.login.userName}'.length == 0) {
	            var answer = window.confirm("\n로그인 후 사용가능합니다. \n로그인창으로 이동하시겠습니까?")
	            if (answer) {
	                location.href = 'login.action';
	                event.preventDefault();
	            } else {
	                event.preventDefault();
	            }
	        }
	    })
	});
	
	</script>
	
    <!-- <script src="/hotel/resources/js/weather.js"></script> -->

  </body>
  </html>