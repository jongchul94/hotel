<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="description" content="Eden Travel Template">
  
  <meta name="author" content="Themefisher.com">

  <title>IT WILL | Restaurant </title>

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
  
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  
  <style type="text/css">
  
   .img-fluid2{
 
	max-width:100%;
	height:100%;
 
 }
  </style>
  
  <style type="text/css">
      * {
          box-sizing: border-box
      }
      html, body {
          width: 100%;
         
      }
      .glider-contain {	
          width: 90%;
          max-width: none;
          margin: 0 auto;
      }
      .glider-slide {
          min-height: 150px;
      }
      .glider-slide img {
          width: 100%;
      }
  </style>
  
  <script type="text/javascript">
  
  function sendIt() {
	  
	  f = document.resBookingMainForm;
	  
	  str = f.resName.value;
		str = str.trim();
		if(str=='레스토랑'){
			alert("\n레스토랑을 선택하세요.");
			f.resName.focus();
			return;
		}
		f.resName.value = str;
	  
	 	str = f.checkin.value;
		str = str.trim();
		if(!str){
			alert("\n날짜를 선택하세요.");
			f.checkin.focus();
			return;
		}
		f.checkin.value = str;
		
		str = f.time.value;
		str = str.trim();
		if(str=='시간'){
			alert("\n시간를 선택하세요.");
			f.time.focus();
				return;
		}
		f.time.value = str;
		
		str = f.adult.value;
		str = str.trim();
		if(str=='성인'){
			alert("\n성인 인원을 선택하세요.");
			f.adult.focus();
			return;
		}
		f.adult.value = str;
		
		str = f.children.value;
		str = str.trim();
		if(str=='어린이'){
			alert("\n어린이 인원을 선택하세요.");
			f.children.focus();
			return;
		}
		f.children.value = str;
		
		f.action = "<%=cp %>/resBookingMain.action";
		f.submit();
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
				<a class="nav-link" href="restaurantMain.action">Home <span class="sr-only">(current)</span></a>
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
				<a class="nav-link dropdown-toggle" href="#" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Restaurants</a>
				<ul class="dropdown-menu" aria-labelledby="dropdown02">
				  <li><a class="dropdown-item" href="res-details.action?resName=명월관">명월관</a></li>
				  <li><a class="dropdown-item" href="res-details.action?resName=DEL VINO">DEL VINO</a></li>
				  <li><a class="dropdown-item" href="res-details.action?resName=회림">회림</a></li>
				</ul>
			  </li>

			  <!-- <li class="nav-item active">
				<a class="nav-link" href="booking-step1.action">Reservation <span class="sr-only">(current)</span></a>
			  </li> -->
			  
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
			  <a href="res-myBooking.action" class="btn btn-main">예&nbsp;약&nbsp;확&nbsp;인</a>
			</form>
		  </div>
		</div>
	</nav>
</header>

<!-- Header Close --> 

<div class="main-wrapper ">
<div id="kakao-talk-channel-chat-button" style="position:fixed;right:10px;bottom:0px;z-index:1000;"></div>

<!-- slider -->
<section>
  <div class="hero-slider">
    
    <!-- slider item -->
	<div class="hero-slider-item bg-cover hero-section" style="background: url(/hotel/resources/images/restaurant/main3.jpg); ">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8 text-center" data-duration-in=".3" data-animation-in="fadeInRight" data-delay-in=".1">
             <span class="letter-spacing text-white">We give high</span>
            <h1 class="mb-3 text-capitalize">늘 최고의 요리</h1>
            <p class="mb-5">여유있는 브런치를 즐기거나 특별한 모임을 갖거나 인테리어와 유리창 박으로 시원하게 펼쳐지는 테헤란로의 풍경은 맛있는 식사에 분위기까지 더해줍니다.</p>
          </div>
        </div>
      </div>
    </div>   
    <!-- slider item -->
    <div class="hero-slider-item bg-cover hero-section" style="background: url(/hotel/resources/images/restaurant/main4.jpg); ">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8 text-center" data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".1">
            <span class="letter-spacing text-white">We are here to</span>
            <h1 class="mb-3 text-capitalize">참 미식으로의 초대</h1>
            <p class="mb-5">정통을 뛰어넘는 하이엔드 스타일의 다이닝, 라운지에서 맛보는 스위트 트리트, 눈을 행복하게 하는 감각적인 패스트리까지</p>
          </div>
        </div>
      </div>
    </div>
    <!-- slider item -->
    <div class="hero-slider-item bg-cover hero-section" style="background: url(/hotel/resources/images/restaurant/main2.jpg); ">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8 text-center" data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".1">
             <span class="letter-spacing text-white">We provide</span>
            <h1 class="mb-3 text-capitalize">도심 속 오아시스</h1>
            <p class="mb-5">트렌디한 음악과 세계 각국의 다채로운 음식이 준비되어 있으며, 풋스파를 이용하고나 정자에 앉아 자연을 느끼며 휴식을 취하세요.				
            </p>
          </div>
        </div>
      </div>
    </div>
    <!-- slider item -->
     <div class="hero-slider-item bg-cover hero-section" style="background: url(/hotel/resources/images/restaurant/main1.jpg); ">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8 text-center" data-duration-in=".3" data-animation-in="fadeInDown" data-delay-in=".1">
            <span class="letter-spacing text-white">We are here to</span>
            <h1 class="mb-3 text-capitalize">프리미엄 라운지</h1>
            <p class="mb-5">도심 야경이 아름답게 펼쳐지는 바에서 시그니처 칵테일, 감각적 인테리어와 함께 트렌트를 이끌어 갑니다.</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- /slider -->
<section class="section-reservation" >
	<div class="container">
		<div class="secondary-bg p-5 position-relative">
			<form action="" class="reserve-form" name="resBookingMainForm" method="post">
				<div class="form-row">
				
				<div class="form-group col-md-2">
				 		<select class="form-control custom-select" name="resName">
					        <option selected>레스토랑</option>
						        <option value="명월관">명월관</option>
				                <option value="DEL VINO">DEL VINO</option>
				                <option value="회림">회림</option>
					      </select>
				    </div>
				    <div class="form-group col-md-2 col-sm-4">
				    	<div class="input-group tp-datepicker date" data-provide="datepicker">
						    <input type="text" class="form-control" placeholder="체크인" name="checkin" autocomplete="off">
						    <div class="input-group-addon">
						       <span class="ion-android-calendar"></span>
						    </div>
						</div>
		          	</div>
		          	<div class="form-group col-md-2">
				 		<select id="time" class="form-control custom-select" name="time">
					        <option selected>시간</option>
						        <option value="10">10시</option>
				                <option value="11">11시</option>
				                <option value="12">12시</option>
				                <option value="13">13시</option>
				                <option value="14">14시</option>
				                <option value="15">15시</option>
				                <option value="16">16시</option>
				                <option value="17">17시</option>
				                <option value="18">18시</option>
				                <option value="19">19시</option>
				                <option value="20">20시</option>
				                <option value="21">21시</option>
					      </select>
				    </div>
				    <div class="form-group col-md-2 ">
			    		<select id="adult" class="form-control custom-select" name="adult">
					        <option selected>성인</option>
						        <option value="1">1명</option>
				                <option value="2">2명</option>
				                <option value="3">3명</option>
				                <option value="4">4명</option>
				                <option value="5">5명</option>
					      </select>
				    </div>
				    <div class="form-group col-md-2 ">
			    		<select id="children" class="form-control custom-select" name="children">
					        <option selected>어린이</option>
					        	<option value="0">0명</option>
						        <option value="1">1명</option>
				                <option value="2">2명</option>
				                <option value="3">3명</option>
				                <option value="4">4명</option>
				                <option value="5">5명</option>
					      </select>
				    </div>
				    <div class="form-group col-md-2">
				      <input type="button" value="예&nbsp;&nbsp;&nbsp;&nbsp;약" class="btn btn-main btn-block" onclick="sendIt();">
				    </div>
				 </div>
			</form>
		</div>
	</div>
</section>	

<!-- Wrapper Start -->

<section class="section secondary-bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8 text-center">
				<div class="section-title">
				
				<!-- 레스토랑 리스트 뿌려줄 자리  -->
				
					<p class="section-subtitle">Luxurious</p>
					<h2 class="mb-3">SAVOR THE FLAVOR</h2>
					<p class="mb-4">서울 시내에서 가장 전망이 아름다운 IT WILL 서울의 레스토랑에서<br/> 월드 클래스 셰프들이 선사하는 다양한 고멧 푸드를 맛보세요</p>
					<span class="section-border"></span>
				</div>
			</div><!-- .col-md-8 close -->
		</div>

		<div class="row">
		
		
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="card text-center border-0 rounded-0 mb-4 mb-lg-0">
					<img src="/hotel/resources/images/restaurant/mMain.jpg" alt="" class="img-fluid2 card-img-top rounded-0">
					<div class="card-body px-4 py-5">
						<a href="myeong-details.action" class="text-dark"></a>
						<h2>명월관</h2>
						<p class="py-3">한옥의 멋과 야외가든을 갖춘 명월관은 최상의 한우와 전통 참숯만을 사용하는 숯불갈비 전문점입니다.</p>
						<a href="res-details.action?resName=명월관" class="btn btn-solid-border btn-small">자세히</a>
					</div>
				</div>
			</div>
			
			
			
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="card text-center border-0 rounded-0 mb-4 mb-lg-0">
					<img src="/hotel/resources/images/restaurant/dMain.jpg" alt="" class="img-fluid card-img-top rounded-0">
					<div class="card-body px-4 py-5">
						<a href="" class="text-dark"></a>
						<h2>DEL VINO</h2>
						<p class="py-3">캐주얼하고 편안한 분위기가 돋보이는 델비노에서 최고의 셰프들이 델비노만의 감각을 담은 모던 이탈리안 퀴진을 선보입니다.</p>
						<a href="res-details.action?resName=DEL VINO" class="btn btn-solid-border btn-small">자세히</a>
					</div>
				</div>
			</div>
			
		
			
			
			
			
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="card text-center border-0 rounded-0 mb-4 mb-lg-0">
					<img src="/hotel/resources/images/restaurant/hMain.jpg" alt="" class="img-fluid card-img-top rounded-0">
					<div class="card-body px-4 py-5">
						<a href="" class="text-dark"></a>
						<h2>회림</h2>
						<p class="py-3">중국의 전통미와 현대적 감각이 훌륭한 조화를 이루고 스타셰프 'Charlie Jung'조리장이 선보이는 특별한 요리의 세계를 경험해 보세요.</p>
						<a href="res-details.action?resName=회림" class="btn btn-solid-border btn-small">자세히</a>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>	

 


				<!-- end single blog post -->
			</div>
			 <!-- end row -->
		</div>
		<!-- end container -->
	</section>
	<!-- end section -->
	


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
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkeLMlsiwzp6b3Gnaxd86lvakimwGA6UA&amp;callback=initMap"></script>    

    <script src="/hotel/resources/js/script.js"></script>
    
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
   