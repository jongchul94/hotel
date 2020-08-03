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

  <!-- Kakao 톡상담 -->
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  
  <!-- 이미지 슬라이드 -->
  <link rel="stylesheet" type="text/css" href="/hotel/resources/css/glider.css" />
  <link rel="stylesheet" type="text/css" href="/hotel/resources/css/glider.min.css" />
  

  <link href="https://fonts.googleapis.com/css?family=Gothic+A1:100|Noto+Serif+KR:200&display=swap&subset=korean" rel="stylesheet">
  <style type="text/css">
      *:not(i) {
          box-sizing: border-box;
          font-family: 'Noto Serif KR', serif!important;
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
	
	function sendIt(){
			
		f = document.hotelSearchForm;
		
		str = f.checkin.value;
		str = str.trim();
		if(!str){
			alert("\n체크인 날짜를 입력하세요.");
			f.checkin.focus();
			return;
		}
		f.checkin.value = str;
		
		str = f.checkout.value;
		str = str.trim();
		if(!str){
			alert("\n체크아웃 날짜를 입력하세요.");
			f.checkout.focus();
				return;
		}
		f.checkout.value = str;
		
		str = f.adult.value;
		str = str.trim();
		if(str=='성인'){
			alert("\n인원을 선택하세요.");
			f.adult.focus();
			return;
		}
		f.adult.value = str;
		
		str = f.children.value;
		str = str.trim();
		if(str=='어린이'){
			alert("\n인원을 선택하세요.");
			f.children.focus();
			return;
		}
		f.children.value = str;
		
		f.action = "<%=cp %>/hotelSearch.action";
		f.submit();
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

<div id="image_container" style="display: none;">
<!-- TEST -->
<p>테스트</p>
</div>


	<nav class="navbar navbar-expand-lg bg-white w-100 p-0" id="navbar">
		<div class="container">
		  <a class="navbar-brand" href="/hotel" ><img src="/hotel/resources/images/logo.png" alt="Eden" class="img-fluid" ></a>
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

<!-- slider -->
<section>

  <div class="hero-slider">
    
    <!-- slider item -->
    <div class="hero-slider-item bg-cover hero-section" style="background: url(/hotel/resources/images/slider/banner.jpg); ">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8 text-center" data-duration-in=".3" data-animation-in="fadeInDown" data-delay-in=".1">
            <span class="letter-spacing text-white">IT Will Hotel</span>
            <h1 class="mb-3 text-capitalize">최고의 품격</h1>
            <p class="mb-5">IT Will Hotel은 고객님의 품격을 높여드립니다.</p>
            <a href="room-grid.action" class="btn btn-main" data-duration-in=".3" data-animation-in="zoomIn" data-delay-in=".4">more details</a>
          </div>
        </div>
      </div>
    </div>
    <!-- slider item -->
    <div class="hero-slider-item bg-cover hero-section" style="background: url(/hotel/resources/images/slider/slider-img2.jpg); ">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8 text-center" data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".1">
            <span class="letter-spacing text-white">IT Will Hotel</span>
            <h1 class="mb-3 text-capitalize">낭만적인 여행</h1>
            <p class="mb-5">IT Will 호텔에서 잊지 못 할 추억을 만드세요.</p>
            <a href="room-grid.action" class="btn btn-main" data-duration-in=".3" data-animation-in="zoomIn" data-delay-in=".4">more details</a>
          </div>
        </div>
      </div>
    </div>
    <!-- slider item -->
    <div class="hero-slider-item bg-cover hero-section" style="background: url(/hotel/resources/images/slider/banner2.jpg); ">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8 text-center" data-duration-in=".3" data-animation-in="fadeInLeft" data-delay-in=".1">
             <span class="letter-spacing text-white">IT Will Hotel</span>
            <h1 class="mb-3 text-capitalize">최고의 서비스</h1>
            <p class="mb-5">최고의 음식과 서비스를 제공해드립니다.</p>
            <a href="room-grid.action" class="btn btn-main" data-duration-in=".3" data-animation-in="zoomIn" data-delay-in=".4">more details</a>
          </div>
        </div>
      </div>
    </div>
    <!-- slider item -->
    <div class="hero-slider-item bg-cover hero-section" style="background: url(/hotel/resources/images/slider/banner3.jpg); ">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8 text-center" data-duration-in=".3" data-animation-in="fadeInRight" data-delay-in=".1">
             <span class="letter-spacing text-white">IT Will Hotel</span>
            <h1 class="mb-3 text-capitalize">다양한 이벤트</h1>
            <p class="mb-5">IT Will Hotel은 다양한 이벤트를 제공해드립니다. </p>
            <a href="room-grid.action" class="btn btn-main" data-duration-in=".3" data-animation-in="zoomIn" data-delay-in=".4">more details</a>
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
			<form name="hotelSearchForm" action="" class="reserve-form" method="post">
				<div class="form-row justify-content-center">
					
				    <div class="form-group col-md-2 col-sm-4">
				    	<div class="input-group tp-datepicker date" data-provide="datepicker">
						    <input type="text" class="form-control" placeholder="체크인" name="checkin" autocomplete="off">
						    <div class="input-group-addon">
						       <span class="ion-android-calendar"></span>
						    </div>
						</div>
		          	</div>
		          	
		          	<div class="form-group col-md-2 col-sm-4">
				    	<div class="input-group tp-datepicker date" data-provide="datepicker">
						    <input type="text" class="form-control" placeholder="체크아웃" name="checkout" autocomplete="off">
						    <div class="input-group-addon">
						       <span class="ion-android-calendar"></span>
						    </div>
						</div>
		          	</div>

				    <div class="form-group col-md-2 ">
			    		<select id="person" class="form-control custom-select" name="adult">
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
				    
					<!-- 
				     <div class="form-group col-md-2 ">
			     		<select id="night" class="form-control custom-select" >
					        <option selected>Nights</option>
						        <option value="1">1 Night</option>
				                <option value="2">2 Nights</option>
				                <option value="3">3 Nights</option>
				                <option value="4">4 Nights</option>
				                <option value="5">5 Nights</option>
				                <option value="6">6 Nights</option>
				                <option value="7">7 Nights</option>
				                <option value="7+">7+ Nights</option>
					      </select>
				    </div>
				     -->
				    
				    <div class="form-group col-md-2">
				      <input type="button" value="검색" class="btn btn-main btn-block" onclick="sendIt();">
				    </div>
				 </div>
			</form>
		</div>
	</div>
</section>	


<section id="about" class="section secondary-bg">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8 text-center">
                <div class="section-title">
                    <p class="section-subtitle">SPECIAL OFFERS</p>
                    <h2 class="mb-3">스페셜 오퍼 </h2>
                    <span class="section-border"></span>
                </div>
            </div><!-- .col-md-7 close -->
        </div>


        <div class="row align-items-center">
            <div class="col-lg-6">
            	<div class="event-box mb-5 position-relative">
            	<div id="testSlide"></div>
					<img src="/hotel/resources/images/gym/gym3.jpg" alt="" class="img-fluid" onclick="location.href='gym';">
					
					<div class="event-content mt-3">
						<div class="event-date p-3 text-white">
							<span class="date font-weight-bold d-block">Members</span> <span>O n l y</span>
						</div>
						
					</div>
					<div class="event-post-meta mt-2 mb-3">
						<a href="gym"><h3>호텔 헬스시설</h3></a>
						<span><i class="ion-ios-location"></i>4F 헬스장</span>
						<span><i class="ion-clock"></i>09:00 ~ 18:00 (주말 제외)</span>
					</div>
					
				</div>
                
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
            	<div class="event-box mb-5 position-relative">
					<img src="/hotel/resources/images/about/about1.jpg" alt="" class="img-fluid w-100" onclick="location.href='restaurantMain.action';">
					<div class="event-content mt-3">
						<div class="event-date p-3 text-white">
							<span class="date font-weight-bold d-block">Members</span> <span>O n l y</span>
						</div>
					</div>
					<div class="event-post-meta mt-2 mb-3">
						<a href="restaurantMain.action"><h3>호텔 레스토랑</h3></a>
						<span><i class="ion-ios-location"></i>B3F 레스토랑</span>
						<span><i class="ion-clock"></i>09:00 ~ 20:00 (주말 제외)</span>
					</div>
				</div>
                
            </div>
            <div class="col-lg-3 col-md-6 col-sm-6">
            	<div class="event-box mb-5 position-relative">
					<img src="/hotel/resources/images/indexSpa.jpg" alt="" class="img-fluid w-100" onclick="location.href='life-spa.action';">
					<div class="event-content mt-3">
						<div class="event-date p-3 text-white">
							<span class="date font-weight-bold d-block">Members</span> <span>O n l y</span>
						</div>
					</div>
					<div class="event-post-meta mt-2 mb-3">
						<a href="life-spa.action"><h3>호텔 SPA</h3></a>
						<span><i class="ion-ios-location"></i>5F SPA시설</span>
						<span><i class="ion-clock"></i>09:00 ~ 24:00</span>
					</div>
				</div>
                
            </div>
            </div>
        </div>

     
    </div>
</section>


<!-- Wrapper Start -->
<section class="about section">
	<div class="container">
	
		<div class="row justify-content-center">
			<div class="col-lg-8 text-center">
				<div class="section-title">
					<p class="section-subtitle">Welcome To</p>
					<h2 class="mb-3">IT WILL HOTEL</h2>
					<p class="mb-4">한국의 전통미와 현대적인 감각을 겸비하고 있는 세계속의 명문호텔, 아이티윌 호텔은 세계 최고의 어번(urban) 라이프 스타일 호텔로 고객들에게 최고급 서비스를 제공합니다.</p>
					<span class="section-border"></span>
				</div>
			</div><!-- .col-md-7 close -->
		</div>

		<div class="row">
			<div class="col-lg-8 col-md-6">
				<div class="about-block">
					<img src="/hotel/resources/images/rooms/img4.jpg" alt="" class="img-fluid shadow-sm">
					<div class="about-img">
						<img src="/hotel/resources/images/rooms/img1.jpg" alt="" class="img-fluid">
					</div>
				</div>
			</div>

			<div class="col-lg-4 col-md-6">
				<div class="about-features">
					<h2>최고의 & <br>전문적인 서비스</h2>
					<hr>
					
					<ul class="list-unstyled">
						<li><i class="flaticon-menu"></i>전문가의 서비스</li>
						<li><i class="flaticon-dishwasher"></i>최상의 서비스</li>
						<li><i class="flaticon-credit-card"></i>쉬운 예약 & 결제</li>
						<li><i class="flaticon-restaurant"></i>현대적인 시설</li>
						<li><i class="flaticon-chef"></i>세계 최고의 요리사</li>
						<li><i class="flaticon-location-pin"></i>흥미로운 활동</li>
					</ul>
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
					<p class="section-subtitle">Luxurious</p>
					<h2 class="mb-3">특색있는 객실들</h2>
					<p class="mb-4">한국을 대표하는 럭셔리 호텔로서 '일상이 최고의 순간이 되는 곳' 이라는 컨셉을
									새롭게 선보이며 휴식은 물론 고급 식문화, 엔터테이먼트 등 고객의 고품격 라이프스타일을 
									제안하는 공간으로 거듭나고 있습니다</p>
					<span class="section-border"></span>
				</div>
			</div><!-- .col-md-8 close -->
		</div>

		<div class="row">
		
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="card text-center border-0 rounded-0 mb-4 mb-lg-0">
					<a href="room-details.action?roomIndex=1"><img src="/hotel/resources/images/rooms/img1.jpg" alt="" class="img-fluid card-img-top rounded-0"></a>

					<div class="card-body px-4 py-5">
						<a href="room-details.action?roomIndex=1" class="text-dark"><h3>스탠다드룸</h3></a>
						<h2>15만원 <small>/ 박</small></h2>
						<p class="py-3">스탠다드는 가장 일반적이고 저렴하게 이용가능한 객실입니다.</p>
						<a href="room-details.action?roomIndex=1" class="btn btn-solid-border btn-small">상세정보</a>
						<a href="booking-step1.action" class="btn btn-main btn-small">예약하기</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="card text-center border-0 rounded-0 mb-4 mb-lg-0">
					<a href="room-details.action?roomIndex=2"><img src="/hotel/resources/images/rooms/img2.jpg" alt="" class="img-fluid card-img-top rounded-0"></a>

					<div class="card-body px-4 py-5">
						<a href="room-details.action?roomIndex=2" class="text-dark"><h3>슈페리어룸</h3></a>
						<h2>20만원 <small>/ 박</small></h2>
						<p class="py-3">생각보다 넓은 조금 더 넓은 공간과 어메니티를 제공합니다.</p>
						<a href="room-details.action?roomIndex=2" class="btn btn-solid-border btn-small">상세정보</a>
						<a href="booking-step1.action" class="btn btn-main btn-small">예약하기</a>
					</div>
				</div>
			</div>


			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="card text-center border-0 rounded-0 mb-4 mb-lg-0">
					<a href="room-details.action?roomIndex=3"><img src="/hotel/resources/images/rooms/img3.jpg" alt="" class="img-fluid card-img-top rounded-0"></a>

					<div class="card-body px-4 py-5">
						<a href="room-details.action?roomIndex=3" class="text-dark"><h3>디럭스룸</h3></a>
						<h2>25만원 <small>/ 박</small></h2>
						<p class="py-3">디럭스 룸에는 발코니가 있어 야경을 즐길 수 있습니다.</p>
						<a href="room-details.action?roomIndex=3" class="btn btn-solid-border btn-small">상세정보</a>
						<a href="booking-step1.action" class="btn btn-main btn-small">예약하기</a>
					</div>
				</div>
			</div>

		</div>
		
		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="card text-center border-0 rounded-0 mb-4 mb-lg-0">
					<a href="room-details.action?roomIndex=1"><img src="/hotel/resources/images/rooms/img4.jpg" alt="" class="img-fluid card-img-top rounded-0"></a>

					<div class="card-body px-4 py-5">
						<a href="room-details.action?roomIndex=4" class="text-dark"><h3>이그제큐티브룸</h3></a>
						<h2>50만원 <small>/ 박</small></h2>
						<p class="py-3">시원한 전망과 색다론 조식 서비를 제공해드립니다.</p>
						<a href="room-details.action?roomIndex=4" class="btn btn-solid-border btn-small">상세정보</a>
						<a href="booking-step1.action" class="btn btn-main btn-small">예약하기</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="card text-center border-0 rounded-0 mb-4 mb-lg-0">
					<a href="room-details.action?roomIndex=5"><img src="/hotel/resources/images/rooms/img5.jpg" alt="" class="img-fluid card-img-top rounded-0"></a>

					<div class="card-body px-4 py-5">
						<a href="room-details.action?roomIndex=5" class="text-dark"><h3>스위트룸</h3></a>
						<h2>100만원 <small>/ 박</small></h2>
						<p class="py-3">아이티윌 호텔만의 최고급 시설과 서비스를 경험하실 수 있습니다.</p>
						<a href="room-details.action?roomIndex=5" class="btn btn-solid-border btn-small">상세정보</a>
						<a href="booking-step1.action" class="btn btn-main btn-small">예약하기</a>
					</div>
				</div>
			</div>


			<div class="col-lg-4 col-md-4 col-sm-6">
				<div class="card text-center border-0 rounded-0 mb-4 mb-lg-0">
					<a href="room-details.action?roomIndex=6"><img src="/hotel/resources/images/rooms/img6.jpg" alt="" class="img-fluid card-img-top rounded-0"></a>

					<div class="card-body px-4 py-5">
						<a href="room-details.action?roomIndex=6" class="text-dark"><h3>패밀리룸</h3></a>
						<h2>120만원 <small>/ 박</small></h2>
						<p class="py-3">주방실과 넉넉한 쇼파가 있어 단체 가족여행에 적합합니다.</p>
						<a href="room-details.action?roomIndex=6" class="btn btn-solid-border btn-small">상세정보</a>
						<a href="booking-step1.action" class="btn btn-main btn-small">예약하기</a>
					</div>
				</div>
			</div>

		</div>
	</div>
</section>	
<!-- Content Start -->
<!-- 
<section class="testimonial position-relative section">
  <div class="container">
    <div class="row align-items-center">
      <div class="col-lg-5">
        <div class="section-title ">
            <p class="section-subtitle text-left">Testimonial</p>
            <h2 class="mb-4 text-left">Customers Satisfaction</h2>
            <span class="section-border m-0 mt-4"></span>
          </div>
        </div>

      <div class="col-lg-7">
        <div class="testimonial-carousel p-4">
            <div>
              <i class="ion-quote text-color mb-3 d-block"></i>
              <p class="mb-4">"This Company created an e-commerce site with the tools to make our business a success, with innovative ideas we feel that our site has unique elements that make us stand out from the crowd."</p>
              <div class="user d-flex">
                <img src="/hotel/resources/images/avater.jpg" alt="" class="img-fluid  rounded-circle mr-3">
                <p class="pb-0 mt-2">Rose Ray <span class="d-block">CEO-Themefisher</span></p>
              </div>
            </div>

            <div>
              <i class="ion-quote text-color mb-3 d-block"></i>
              <p class="mb-4">"This Company created an e-commerce site with the tools to make our business a success, with innovative ideas we feel that our site has unique elements that make us stand out from the crowd."</p>
             <div class="user d-flex">
                <img src="/hotel/resources/images/avater.jpg" alt="" class="img-fluid  rounded-circle mr-3">
                <p class="pb-0 mt-2">Rose Ray <span class="d-block">CEO-Themefisher</span></p>
              </div>
            </div>

            <div>
              <i class="ion-quote text-color mb-3 d-block"></i>
              <p class="mb-4">"This Company created an e-commerce site with the tools to make our business a success, with innovative ideas we feel that our site has unique elements that make us stand out from the crowd."</p>
              <div class="user d-flex">
                <img src="/hotel/resources/images/avater.jpg" alt="" class="img-fluid  rounded-circle mr-3">
                <p class="pb-0 mt-2">Rose Ray <span class="d-block">CEO-Themefisher</span></p>
              </div>
            </div>

            <div>
              <i class="ion-quote text-color mb-3 d-block"></i>
              <p class="mb-4">"This Company created an e-commerce site with the tools to make our business a success, with innovative ideas we feel that our site has unique elements that make us stand out from the crowd."</p>
              <div class="user d-flex">
                <img src="/hotel/resources/images/avater.jpg" alt="" class="img-fluid rounded-circle mr-3">
                <p class="pb-0 mt-2">Rose Ray <span class="d-block">CEO-Themefisher</span></p>
              </div>
            </div>
        </div>
      </div>
    </div>
  </div>
</section>
 -->
 
<!--
		Start Blog Section
		=========================================== -->
		
	<!-- 			
	<section class="blog section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-8 text-center">
					<div class="section-title">
						<p class="section-subtitle">Blog news</p>
						<h2 class="mb-3">Latest Posts From Blog</h2>
						<p class="mb-4">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics</p>
						<span class="section-border"></span>
					</div>
				</div>.col-md-7 close
			</div>

			<div class="row">
				single blog post
				<article class="col-lg-4 col-md-4 col-sm-6 col-xs-12 clearfix " >
					<div class="card rounded-0 pb-2 mb-4 mb-lg-0">
						<div class="media-wrapper">
							<img src="/hotel/resources/images/blog/img.jpg" alt="amazing caves coverimage" class="img-fluid w-100">
						</div>
						
						<div class="card-body px-4 ">
							<span class='post-meta'><i class="ion-android-calendar"></i> 17 May 2019 by admin</span>
							<a href="single-post" class="mt-3 d-block mb-4 pb-2"><h3>Why choose Sparta Plaza Hotel to travel this summer</h3></a>
							<span class="text-muted"><i class="fa fa-clock"></i> 2 min Read</span>
						</div>
					</div>						
				</article>
				/single blog post

				single blog post
				<article class="col-lg-4 col-md-4 col-sm-6 col-xs-12 clearfix " >
					<div class="card rounded-0 pb-2 mb-4 mb-lg-0">
						<div class="media-wrapper">
							<img src="/hotel/resources/images/blog/img1.jpg" alt="amazing caves coverimage" class="img-fluid w-100">
						</div>
						
						<div class="card-body px-4">
							<span class='post-meta'><i class="ion-android-calendar"></i> 10 June 2019 by admin</span>
							<a href="single-post" class="mt-3 d-block mb-4 pb-2"><h3>Top best rooms in the hotel to stay long with family</h3></a>
							<span class="text-muted"><i class="fa fa-clock"></i> 3 min Read</span>
						</div>
					</div>						
				</article>
				/single blog post

				single blog post
				<article class="col-lg-4 col-md-4 col-sm-6 col-xs-12 clearfix " >
					<div class="card rounded-0 pb-2 mb-4 mb-lg-0">
						<div class="media-wrapper">
							<img src="/hotel/resources/images/blog/img2.jpg" alt="amazing caves coverimage" class="img-fluid w-100">
						</div>
						
						<div class="card-body px-4">
							<span class='post-meta'><i class="ion-android-calendar"></i> 5 Jan 2019 by admin</span>
							<a href="single-post" class="mt-3 d-block mb-4 pb-2"><h3>Best Marketing Tips for business growth rapidly</h3></a>
							<span class="text-muted"><i class="fa fa-clock"></i> 5 min Read</span>
						</div>
					</div>						
				</article>
				/single blog post

				< ! - - end single blog post - - >
			</div> < ! - - end row - - >
		</div> < ! - - end container - - >
	</section> < ! - - end section - - >
 -->
	
<!-- 이미지 슬라이드 -->
	
<section class="gallery-feed">
	<div class="container-fluid p-0">
		<div class="row">
			<div class="gallery-title">
				<a href="gallery.action" class="btn btn-main">Gallery</a>
			</div>
		</div>
		
	<div class="glider-contain" style="padding-top: 30px;">
	
	
        <div class="glider">
      
         <c:forEach items="${lists }" var="dto"> 
         
             <div class="event-box mb-5 position-relative">
           
            		<div>
            			<img alt="Test" src="/hotel/resources/images/gallery/${dto.imageName}" style="width: 300px; height: 250px;">
            			<div class="event-content mt-3">
						</div>
					</div>
            	 
            	</div>
            </c:forEach> 
            
        </div>
        
        <button class="glider-prev">&laquo;</button>
        <button class="glider-next">&raquo;</button>
        <div id="dots"></div>
  </div>
  </div>
</section>
  
<!-- 이미지 슬라이드 끝 -->





<!-- footer Start -->
<footer class="footer pb-md-5 pb-sm-5 secondary-bg pb-0">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="widget footer-widget">
					<div class="footer-logo footer-title mb-4"><h3>IT Will</h3></div>
					<p>한국의 전통미와 현대적인 감각을 겸비하고 있는 세계속의 명문호텔, 
					<br/>아이티윌 호텔은 세계 최고의 어번(urban) 라이프 스타일 호텔로 고객들에게 최고급 서비스를 제공합니다.</p>
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
	
	<!-- 이미지 슬라이드 --> 
    <script src="/hotel/resources/js/glider.js"></script>
    <script src="/hotel/resources/js/glider.min.js"></script>
    <script src="/hotel/resources/js/glider-compat.min.js"></script>
    <script>
      window.addEventListener('load',function(){
        document.querySelector('.glider').addEventListener('glider-slide-visible', function(event){
            var glider = Glider(this);
            console.log('Slide Visible %s', event.detail.slide)
        });
        document.querySelector('.glider').addEventListener('glider-slide-hidden', function(event){
            console.log('Slide Hidden %s', event.detail.slide)
        });
        document.querySelector('.glider').addEventListener('glider-refresh', function(event){
            console.log('Refresh')
        });
        document.querySelector('.glider').addEventListener('glider-loaded', function(event){
            console.log('Loaded')
        });

        window._ = new Glider(document.querySelector('.glider'), {
            slidesToShow: 1, //'auto',
            slidesToScroll: 1,
            itemWidth: 150,
            draggable: true,
            scrollLock: false,
            dots: '#dots',
            rewind: true,
            arrows: {
                prev: '.glider-prev',
                next: '.glider-next'
            },
            responsive: [
                {
                    breakpoint: 800,
                    settings: {
                        slidesToScroll: 'auto',
                        itemWidth: 300,
                        slidesToShow: 'auto',
                        exactWidth: true
                    }
                },
                {
                    breakpoint: 700,
                    settings: {
                        slidesToScroll: 4,
                        slidesToShow: 4,
                        dots: false,
                        arrows: false,
                    }
                },
                {
                    breakpoint: 600,
                    settings: {
                        slidesToScroll: 3,
                        slidesToShow: 3
                    }
                },
                {
                    breakpoint: 500,
                    settings: {
                        slidesToScroll: 2,
                        slidesToShow: 2,
                        dots: false,
                        arrows: false,
                        scrollLock: true
                    }
                }
            ]
        });
      });
    </script>
    
    <script src="/hotel/resources/js/weather.js"></script>

   <!--  <script type="text/javascript">
    window.onload = function () { 
    	startLoadFile(); 
   	}; 
    	
    	function startLoadFile(){ 
    		$.ajax({ 
    			url: 'indexImage', 
    			type: 'GET', 
    			dataType : 'json', 
    			success : function (data) { 
    				createImages(data) 
    				} 
    		}); 
   		} 
    	// JSON 포멧 데이터 처리 
    	function createImages(objImageInfo) { 
    		var images = objImageInfo.images; 
    		var strDOM = "";
    		
    		for (var i = 0; i < images.length; i++) { 
    			// N번째 이미지 정보를 구하기 
    			var image = images[i]; 
    			// N번째 이미지 패널을 생성 
    			strDOM += '<div class="image_panel">';
    			strDOM += '<img src="' + image.url + '" class="img-fluid" onclick="'+'location.href="gym"'+';">'; 
    			strDOM += '</div>';
    			
   			} 
    		 
    		// 이미지 컨테이너에 생성한 이미지 패널들을 추가하기 
    		var $imageContainer = $("#image_container"); 
    		$imageContainer.append(strDOM); 
   		}
    	$(document).ready(function(){
    		setInterval(function(){
    			$("#testSlide").append($('.image_panel').first());
    			$('.image_panel').last().hide();
    			$('.image_panel').first().show();
    		}, 2000);
    	});
    	

    </script> -->
	<script src="/hotel/resources/js/weather.js"></script>
	
  </body>
  </html>
   