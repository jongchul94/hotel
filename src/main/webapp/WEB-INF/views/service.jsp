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
<div id="kakao-talk-channel-chat-button" style="position:fixed; right:10px; bottom:0px; z-index:1000;"></div>

<section class="overly bg-2">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
          <h1 class="text-white py-100">서비스</h1>
      </div>
    </div>
  </div>

  <div class="container-fluid page-border-top">
    <div class="row ">
      <div class="col-lg-12 text-center">
          <div class="page-breadcumb py-2">
            <a href="/hotel" class="text-white">Home</a>
            <span><i class="fa fa-angle-right text-white mx-1" aria-hidden="true"></i></span>
            <a href="service.action" class="text-white">Services</a>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- contact form start -->
<section class="service-section section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 text-center">
                <div class="block">
                    <div class="section-title">
                        <p class="section-subtitle">서비스</p>
                        <h2 class="mb-3">정직한 서비스 & 전문적 시스템</h2>
                        <p class="mb-4">한국의 전통미와 현대적인 감각을 겸비하고 있는 세계 속의 명문 호텔, 아이티윌 호텔은 세계 최고의 어번(urban) 라이프 스타일 호텔로 고객들에게 최고급 서비스를 제공합니다.</p>
                        <span class="section-border"></span>
                    </div>
                </div>
            </div><!-- .col-md-7 close -->
        </div>


        <div class="row no-gutters">
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="service-box text-center border px-4 py-5">
                    <i class="flaticon-menu text-color"></i>
                    <h3 class="my-3">전문적인 서빙</h3>
                    <p>숙련된 웨이터의 서비스를 제공</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="service-box text-center border px-4 py-5">
                    <i class="flaticon-dishwasher text-color"></i>
                    <h3 class="my-3">최고 품질의 어메니티</h3>
                    <p>최고의 품질과 청결한 에머니트를 제공</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="service-box text-center border px-4 py-5">
                    <i class="flaticon-credit-card text-color"></i>
                    <h3 class="my-3">편리한 예약&결제</h3>
                    <p>원터치 간편 결제로 쉽고 빠른 예약을 지원</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="service-box text-center border px-4 py-5">
                    <i class="flaticon-chef"></i>
                    <h3 class="my-3">강남최고의 셰프</h3>
                    <p>미슐랭 투스타 셰프 조지씨의 만찬제공</p>
                </div>
            </div>


            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="service-box text-center border px-4 py-5">
                    <i class="flaticon-dishwasher text-color"></i>
                    <h3 class="my-3">24시간 룸&인포메이션 서비스</h3>
                    <p>언제든지 최고로 준비된 서비스를 제공</p>
                </div>
            </div>

            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="service-box text-center border px-4 py-5">
                    <i class="flaticon-menu text-color"></i>
                    <h3 class="my-3">다양한 언어 지원</h3>
                    <p>영어,스페인어,중국어 총10가지 언어 제공</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Content Start -->
<section class="testimonial position-relative section">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-lg-5">
        <div class="section-title ">
            <p class="section-subtitle text-left">후기</p>
            <h2 class="mb-4 text-left">고객 만족</h2>
            <span class="section-border m-0 mt-4"></span>
          </div>
        </div>

      <div class="col-lg-7">
        <div class="testimonial-carousel p-4">
            <div>
              <i class="ion-quote text-color mb-3 d-block"></i>
              <p class="mb-4">사업차 방문하였는데, 집처럼 편하게 쉬다갑니다</p>
              <div class="user d-flex">
                <img src="/hotel/resources/images/avater.jpg" alt="" class="img-fluid  rounded-circle mr-3">
                <p class="pb-0 mt-2">크리스 <span class="d-block">사업가</span></p>
              </div>
            </div>

            <div>
              <i class="ion-quote text-color mb-3 d-block"></i>
              <p class="mb-4">공연을 위해서 예약을 했는데, 너무 편하고 즐거웠어요. 덕분에 순회 공연도 무사히 마칠 수 있었습니다.</p>
             <div class="user d-flex">
                <img src="/hotel/resources/images/avater.jpg" alt="" class="img-fluid  rounded-circle mr-3">
                <p class="pb-0 mt-2">제인 <span class="d-block">음악가</span></p>
              </div>
            </div>

            <div>
              <i class="ion-quote text-color mb-3 d-block"></i>
              <p class="mb-4">가족과 함께 휴가를 즐기러 왔는데, 친절하게 대해주시고 맛있는 음식 덕분에 즐거운 시간 보내다 갑니다.</p>
              <div class="user d-flex">
                <img src="/hotel/resources/images/avater.jpg" alt="" class="img-fluid  rounded-circle mr-3">
                <p class="pb-0 mt-2">오훈 <span class="d-block">자영업자</span></p>
              </div>
            </div>
          
        </div>
      </div>
    </div>
  </div>
</section>                     
<section id="section-cta-2" class="section">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="p-5 bg-light border mb-5 mb-lg-0">
					<h2>지금 방문하시면 가격대비 최고의 서비스를 즐기실 수 있습니다</h2>
					<p class="my-4">아이티윌 호텔은 '최고의 호스피탈리티 기업'을 목표로 오랜 세월 동안 품위와 전통을 유지하며 고객들의 마음을 사로잡아왔습니다. LHW 가입을 통해 세계 최고의 럭셔리 호텔들과 어깨를 나란히 하고 있습니다.	</p>

					<a href="booking-step1.action" class="btn btn-main">지금 예약하기</a>
				</div>
			</div>

			<div class="col-lg-6 col-md-6  ">
				<div class="service-cta-text pl-4">
					<h2 class="mb-4">아이티윌을 선택해야만 하는 이유는?</h2>

					<ul class="list-unstyled">
						<li><span>-</span>1박당 2.5만원으로 모든 부가 서비스 제공</li>
						<li><span>-</span>매일 대륙별 조식 뷔페 제공</li>
						<li><span>-</span>독서실에서 24시간 다과 이용 가능</li>
						<li><span>-</span>매일 저녁 '3시간동안 와인과 치즈'서비스 제공</li>
						<li><span>-</span>지하1층의 싸다 휘트니스 무제한 이용권</li>
						<li><span>-</span>무료 팩스와 짐보관 서비스</li>
						<li><span>-</span>국내 및 국외 무료 전화 서비스</li>
						<li><span>-</span>베스트셀러 항시 최신 업데이트 및 제공</li>
					</ul>

					<a href="room-grid.action" class="btn btn-solid-border mt-4">둘러보기</a>
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
	
	<script src="/hotel/resources/js/weather.js"></script>

  </body>
  </html>