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

  <title>IT WILL | Gym</title>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

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
	
  <!-- Kakao 톡상담 -->
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

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
<div id="kakao-talk-channel-chat-button" style="position:fixed;right:10px;bottom:0px;z-index:1000;"></div>
<!-- slider -->
<section>
  <div class="hero-slider">
    
    <!-- slider item -->
    <div class="hero-slider-item bg-cover hero-section" style="background: url(/hotel/resources/images/gym/gym1.jpg); ">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8 text-center" data-duration-in=".3" data-animation-in="fadeInDown" data-delay-in=".1">
            <span class="letter-spacing text-white">IT Will Hotel</span>
            <h1 class="mb-3 text-capitalize">호텔 헬스장</h1>
            <p class="mb-5">IT Will Hotel은 고객님의 건강을 책임집니다.</p>
          </div>
        </div>
      </div>
    </div>
    <!-- slider item -->
    <div class="hero-slider-item bg-cover hero-section" style="background: url(/hotel/resources/images/gym/gym2.jpg); ">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8 text-center" data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".1">
            <span class="letter-spacing text-white">IT Will Hotel</span>
            <h1 class="mb-3 text-capitalize">호텔 헬스장</h1>
            <p class="mb-5">IT Will Hotel은 고객님의 건강을 책임집니다.</p>
          </div>
        </div>
      </div>
    </div>
    <!-- slider item -->
    <div class="hero-slider-item bg-cover hero-section" style="background: url(/hotel/resources/images/gym/gym3.jpg); ">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8 text-center" data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".1">
             <span class="letter-spacing text-white">IT Will Hotel</span>
            <h1 class="mb-3 text-capitalize">호텔 헬스장</h1>
            <p class="mb-5">IT Will Hotel은 고객님의 건강을 책임집니다.</p>
          </div>
        </div>
      </div>
    </div>
    <!-- slider item -->
    <div class="hero-slider-item bg-cover hero-section" style="background: url(/hotel/resources/images/gym/gym4.jpg); ">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8 text-center" data-duration-in=".3" data-animation-in="fadeInRight" data-delay-in=".1">
             <span class="letter-spacing text-white">IT Will Hotel</span>
            <h1 class="mb-3 text-capitalize">호텔 헬스장</h1>
            <p class="mb-5">IT Will Hotel은 고객님의 건강을 책임집니다. </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- /slider -->


<!-- Wrapper Start -->
<section class="about section">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8 text-center">
				<div class="section-title">
					<p class="section-subtitle">Welcome To</p>
					<h2 class="mb-3">IT WILL HOTEL</h2>
					<h2 class="mb-3">GYM</h2>
					<p class="mb-4">체계적인 체력 관리를 위한 기능별 공간과 최상의 휴식을위한
					공간으로 조성되어 운동과 휴식을 조화롭게 즐기실 수 있는 실내 체육관입니다.</p>
					<span class="section-border"></span>
				</div>
			</div><!-- .col-md-7 close -->
		</div>

		<div class="row">
			<div class="col-lg-8 col-md-6">
				<div class="about-block">
					<img src="/hotel/resources/images/gym/gym-menu2.jpg" alt="" class="img-fluid shadow-sm">
					<div class="about-img">
						<img src="/hotel/resources/images/gym/gym-menu1.jpg" alt="" class="img-fluid">
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-md-6">
				<div class="about-features">
					<h3>'글로벌 리더들이 선택한 운동시스템'</h3>
					<hr>
					<br>
					<p>체계적인 체력 관리를 위해 건강 삼당 및 체력 측정결과에 따라 운동프로그램을 제공합니다.<p>
					<p>국내 유일의 디지털 측정실을 갖추고있으며, 스마트 코칭 시스템을 이용해 차별화된 운동지도 서비스를 제공합니다.</p>
					<p class="section-subtitle">문의전화 02-123-4567</p>
				</div>
			</div>
		</div>
	</div>
</section>
<section class="section secondary-bg">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8 text-center">
				<div class="section-title">
					<p class="section-subtitle">Trainer</p>
					<h2 class="mb-3">트레이너 소개</h2>
					<p class="mb-4">최고의 트레이너들과 함께 건강과 미용을 챙기세요.
					</p>
					<span class="section-border"></span>
				</div>
			</div><!-- .col-md-8 close -->
		</div>

		<div class="row">
		
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="card text-center border-0 rounded-0 mb-4 mb-lg-0" style="width: 350px; height: 550px;">
					<img src="/hotel/resources/images/gym/trainer1.jpg" alt="" class="rounded-circle mr-1">

					<div class="card-body px-5 py-5">
						<h3>Aiden</h3>
						<p class="py-3">트레이너 경력 15년 트레이너 Aiden입니다.</p>
					</div>
				</div>
			</div>
			
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="card text-center border-0 rounded-0 mb-4 mb-lg-0" style="width: 350px; height: 550px;">
					<img src="/hotel/resources/images/gym/trainer2.jpg" alt="" class="rounded-circle mr-1">

					<div class="card-body px-5 py-5">
						<h3>Ayaan</h3>
						<p class="py-3">체조선수출신 트레이너 Ayaan 입니다.</p>
					</div>
				</div>
			</div>


			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="card text-center border-0 rounded-1 mb-4 mb-lg-0" style="width: 350px; height: 550px;">
					<img src="/hotel/resources/images/gym/trainer3.jpg" alt="" class="rounded-circle mr-1">

					<div class="card-body px-5 py-5">
						<h3>Benjamin</h3>
						<p class="py-3">요가강사 출신 트레이너 Benjamin 입니다.</p>
	
					</div>
				</div>
			</div>

		</div>
	</div>
</section>	
<section class="blog section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8 text-center">
					<div class="section-title">
						<p class="section-subtitle">Lesson</p>
						<h2 class="mb-3">강좌소개</h2>
						<p class="mb-4">개인의 취향과 운동 적성을 고려한 다양한 프로그램을 운영합니다.<br/> 
						웰빙 라이프를 위한 그룹 엑서사이즈와 힐링을 위한 스페셜 운동 프로그램으로 구성되어있습니다.</p>
						<span class="section-border"></span>
					</div>
				</div><!-- .col-md-7 close -->
			</div>

			<div class="row">
			
			<c:forEach items="${lists }" var="dto">
				<!-- single blog post -->
				<article class="col-lg-4 col-md-4 col-sm-6 col-xs-12 clearfix " >
					<div class="card rounded-0 pb-2 mb-4 mb-lg-0">
						<div class="media-wrapper">
							<img src="/hotel/resources/images/gym/${dto.image }.jpg" alt="amazing caves coverimage" class="img-fluid w-100">
						</div>
						
						<div class="card-body px-4 ">
							<span class='post-meta'><i class="ion-ios-location"></i> ${dto.addr }</span>
							<a href="gymList.action" class="mt-3 d-block mb-4 pb-2"><h3> ${dto.title }</h3></a>
							<span class="text-muted"><i class="fa fa-clock"></i> ${dto.time }</span>
						</div>
					</div>						
				</article>
				<!-- /single blog post -->
			</c:forEach>
				
				
			</div> <!-- end row -->
			
			<a href="gymList.action" class="btn btn-main">강좌등록</a>
			
		</div> <!-- end container -->
</section> <!-- end section -->




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
   