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

  <title>IT WILL | Spa</title>

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
  
  <!-- Kakao 톡상담 -->
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  
  <!-- font -->
  <link href="https://fonts.googleapis.com/css?family=Gothic+A1:100|Noto+Serif+KR:200&display=swap&subset=korean" rel="stylesheet">
  
	<style type="text/css">
	
	*:not(i){
		font-family: 'Noto Serif KR', serif!important;
	}
	
	</style>

 <!-- 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
   -->

  <style type="text/css">
  
  	/*GLOBALS*/
	*{margin:0; padding:0; list-style:none;}
	/* 
	a{text-decoration:none;	color:#666;}
	a:hover{color:#1bc1a3;}
	 */
	/* body, hmtl{background: #ffffff; font-family: 'Anton', sans-serif;} */
	
	
	#wrapper{
		width:800px;
		margin:50px auto;
		height:450px;
		position:relative;
		color:#fff;
		text-shadow:rgba(0,0,0,0.1) 2px 2px 0px;	
	}
	
	#slider-wrap{
		width:800px;
		height:450px;
		position:relative;
		overflow:hidden;
	}
	
	#slider-wrap ul#slider{
		width:100%;
		height:100%;
		
		position:absolute;
		top:0;
		left:0;		
	}
	
	#slider-wrap ul#slider li{
		float:left;
		position:relative;
		width:800px;
		height:450px;	
	}
	
	#slider-wrap ul#slider li > div{
		position:absolute;
		top:20px;
		left:35px;	
	}
	
	#slider-wrap ul#slider li > div h3{
		font-size:36px;
		text-transform:uppercase;	
	}
	
	#slider-wrap ul#slider li > div span{
		font-family: Neucha, Arial, sans serif;
		font-size:21px;
	}
	
	#slider-wrap ul#slider li i{
		text-align:center;
		line-height:400px;
		display:block;
		width:100%;
		font-size:90px;	
	}
	
	/*btns*/
	.btns{
		position:absolute;
		width:50px;
		height:60px;
		top:50%;
		margin-top:-25px;
		line-height:57px;
		text-align:center;
		cursor:pointer;	
		background:rgba(0,0,0,0.1);
		z-index:100;
		
		
		-webkit-user-select: none;  
		-moz-user-select: none; 
		-khtml-user-select: none; 
		-ms-user-select: none;
		
		-webkit-transition: all 0.1s ease;
		-moz-transition: all 0.1s ease;
		-o-transition: all 0.1s ease;
		-ms-transition: all 0.1s ease;
		transition: all 0.1s ease;
	}
	
	.btns:hover{
		background:rgba(0,0,0,0.3);	
	}
	
	#next{right:-50px; border-radius:7px 0px 0px 7px; padding-top: 20px;}
	#previous{left:-50px; border-radius:0px 7px 7px 7px; padding-top: 20px;}
	#counter{
		top: 30px; 
		right:35px; 
		width:auto;
		position:absolute;
	}
	
	#slider-wrap.active #next{right:0px;}
	#slider-wrap.active #previous{left:0px;}
	
	/*bar*/
	#pagination-wrap{
		min-width:20px;
		margin-top:350px;
		margin-left: auto; 
		margin-right: auto;
		height:15px;
		position:relative;
		text-align:center;
	}
	
	#pagination-wrap ul {
		width:100%;
	}
	
	#pagination-wrap ul li{
		margin: 0 4px;
		display: inline-block;
		width:5px;
		height:5px;
		border-radius:50%;
		background:#fff;
		opacity:0.5;
		position:relative;
	  top:0;
	}
	
	#pagination-wrap ul li.active{
	  width:12px;
	  height:12px;
	  top:3px;
		opacity:1;
		box-shadow:rgba(0,0,0,0.1) 1px 1px 0px;	
	}
	
	/*Header*/
	h1, h2{text-shadow:none; text-align:center;}
	h1{	color: #666; text-transform:uppercase;	font-size:36px;}
	h2{ color: #7f8c8d; font-family: Neucha, Arial, sans serif; font-size:18px; margin-bottom:30px;} 
	
	/*ANIMATION*/
	#slider-wrap ul, #pagination-wrap ul li{
		-webkit-transition: all 0.3s cubic-bezier(1,.01,.32,1);
		-moz-transition: all 0.3s cubic-bezier(1,.01,.32,1);
		-o-transition: all 0.3s cubic-bezier(1,.01,.32,1);
		-ms-transition: all 0.3s cubic-bezier(1,.01,.32,1);
		transition: all 0.3s cubic-bezier(1,.01,.32,1);	
	}
  </style>
  
  
  <style type="text/css">
	/* The Modal (background) */
	.modal {
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		z-index: 1; /* Sit on top */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		overflow: auto; /* Enable scroll if needed */
		background-color: rgb(0, 0, 0); /* Fallback color */
		background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	}
	
	/* Modal Content/Box */
	.modal-content {
		background-color: #fefefe;
		margin: 15% auto; /* 15% from the top and centered */
		padding: 20px;
		border: 1px solid #888;
		width: 50%; /* Could be more or less, depending on screen size */
		height: 90%;
	}
	/* The Close Button */
	.close {
		color: #aaa;
		float: right;
		font-size: 28px;
		font-weight: bold;
	}
	
	.close:hover, .close:focus {
		color: black;
		text-decoration: none;
		cursor: pointer;
	}
</style>
  
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

<div class="main-wrapper " style="padding-top: 20px;">
<div id="kakao-talk-channel-chat-button" style="position:fixed; right:10px; bottom:0px; z-index:1000;"></div>

<section class="overly bg-2">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
          <h1 class="text-white py-100">EvianSpa</h1>
      </div>
    </div>
  </div>

  <div class="container-fluid page-border-top">
    <div class="row ">
      <div class="col-lg-12 text-center">
          <div class="page-breadcumb py-2">
            <a href="/hotel" class="text-white">Home</a>
            <span><i class="fa fa-angle-right text-white mx-1" aria-hidden="true"></i></span>
            <a href="life-spa.action" class="text-white">LifeStyle</a>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="about section">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8 text-center">
				<div class="section-title">
					<p class="section-subtitle">Welcome To</p>
					<h2 class="mb-3">EvianSpa</h2>
					<p class="mb-4" style="padding-top: 20px;">천상의 휴식처 에비앙 스파에서 오염된 환경으로부터 고객님의 심신치유, 혼잡한 일상에서의 탈출, </p>
					<p class="mb-4" >완벽한 힐링, 피부의 노화방지 및 재생을 약속 드립니다.</p>
					
				</div>
			</div><!-- .col-md-7 close -->
		</div>
		
<!-- 
<div class="container" align="center">
 <div id="myCarousel" class="carousel slide" data-ride="carousel" style="padding-top: 20px; width: 70%;" >
    
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
      <li data-target="#myCarousel" data-slide-to="4"></li>

    </ol>

    <div class="carousel-inner">
      <div class="item active">
        <img src="/hotel/resources/images/spa/spa1.JPG" alt="1" style="width:100%; height: 500px;">
      </div>

      <div class="item">
        <img src="/hotel/resources/images/spa/spa2.JPG" alt="2" style="width:100%; height: 500px;">
      </div>
    
      <div class="item">
        <img src="/hotel/resources/images/spa/spa3.JPG" alt="3" style="width:100%; height: 500px;">
      </div>
      
       <div class="item">
        <img src="/hotel/resources/images/spa/spa4.JPG" alt="4" style="width:100%; height: 500px;">
      </div>
      
       <div class="item">
        <img src="/hotel/resources/images/spa/spa5.JPG" alt="5" style="width:100%; height: 500px;">
      </div>
    </div>

    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
 -->


<div id="wrapper">
   
   	  <div id="slider-wrap">
      	  <ul id="slider">
          	 <li>
                <img src="/hotel/resources/images/spa/spa1.JPG" alt="1" style="width:100%; height: 500px;">
             </li>
             
             <li>
                <img src="/hotel/resources/images/spa/spa2.JPG" alt="2" style="width:100%; height: 500px;">
             </li>
             
             <li>
                <img src="/hotel/resources/images/spa/spa3.JPG" alt="3" style="width:100%; height: 500px;">
             </li>
             
             <li>
                <img src="/hotel/resources/images/spa/spa4.JPG" alt="4" style="width:100%; height: 500px;">
             </li>
             
             <li>
               <img src="/hotel/resources/images/spa/spa5.JPG" alt="5" style="width:100%; height: 500px;">
             </li>
             
          </ul>
          
          <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
          <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
          
          <div id="pagination-wrap">
            <ul>
            </ul>
          </div>
                 
      </div>
  
   </div>

					<div class="page-wrapper event-page">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-8">
                                    <div class="event-box mb-5 position-relative">
                                        <div class="event-content mt-3">
                                            <b>
                                                <h2>아이티윌 에비앙스파</h2>
                                            </b>
                                        <div class="event-post-meta mt-2 mb-3" style="padding-top: 30px;">
                                            <span>
                                                <i class="ion-clock"></i>운영시간 : 9.00 Am - 9.00 Pm</span>
                                            <span>
                                                <i class="ion-ios-location"></i>장소 : 3층 에비앙 스파</span>
                                        </div>
                                        <p style="line-height: 200%;">아이티윌 에비앙스파는 고상하고 순결한 에비앙 산의 이미지에서 영감을 얻은 자연 본연의 훼손되지 않은 휴식처입니다.
                                            고급스럽고 감각적인 소재, 자연채광과 환상적인 서울의 전망이 어우러진 에비앙스파는 심신의 재충전을 위한 기대 이상의 여행으로 고객님을 초대합니다.</p>
                                    </div>
                                    <br/><br/>
                                    <hr color="silver" width="100%">
                                    <div class="row align-items-center" style="padding-top: 50px;">
                                        <div class="col-lg-6">
                                            <img src="/hotel/resources/images/spa/spa7.JPG" alt="" class="img-fluid" style="width:100%; height: 100%;">
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="about-content mt-4 mt-lg-0">
                                                <h4 class="mb-3">
                                                    <span>바쁜 도시의 일상을 떠난 완전한 힐링</span>
                                                </h4>
                                                <p style="line-height: 200%;">오롯이 심신의 건강을 고려한 활력 있는 다중감각 공간으로서, 에비앙스파 서울은 편안하고 여유로운 환경에서 프리미엄 수분공급이라는 독특한 경험을 제공해 드립니다.
                                                    
                                                    물의 순환을 모방한 트리트먼트 코스는 모든 감각을 자극하기 위한 물의 모든 상태를 경험하실 수 있도록 해드립니다.
                                                    
                                                    에비앙스파는 에비앙 물에 투영된 4가지 경험 (Celestial, Mineral, Precious, Vitalizing)을 통해 자연의 기적을 불러 일으키는 코스로 구성이 되어 있습니다.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <br/><br/>
                                     <br/><br/>
                                    <div class="event-content mt-3">
                                    <h2>트리트먼트 코스</h2>
                                    </div>
                                    <!-- 스파타입정보  -->
                                    <div class="row align-items-center" style="padding-top: 50px;" align="left">
                                        <c:forEach items="${lists }" var="dto">
                                            <hr color="silver" width="100%">
                                            <div class="col-lg-6" style="padding-top: 10px;">
                                                <img src="/hotel/resources/images/spa/${dto.savefileName}" alt="" class="img-fluid" style="width:100%; height: 100%;">
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="about-content mt-4 mt-lg-0">
                                                    <h3>${dto.spaType }</h3>
                                                    <div class="event-post-meta mt-2 mb-3">
                                                        <span>
                                                            <i class="ion-clock"></i>${dto.time }</span>
                                                        <span>
                                                            <i class="fa fa-bullseye"></i>${dto.price }</span>
                                                    </div>
                                                    <p>${dto.content }</p>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <br/><br/>
                                    <div align="center" style="padding-top: 30px;">
                                    
                                    
                                    <!-- Trigger/Open The Modal -->
								    <button id="myBtn" class="btn btn-small">선불카드</button>
								 
								    <!-- The Modal -->
								    <div id="myModal" class="modal">
								 
								      <!-- Modal content -->
								      <div class="modal-content">
								        <span class="close">&times;</span><br/>
								        <img src="/hotel/resources/images/spa/Giftcard_KOR.jpg" width="80%" height="90%">
								      </div>
								 
								    </div>
                                    
                                        <!-- <a href="Giftcard_KOR.pdf" class="btn btn-small">선불카드</a> -->
                                        <a href="spa-booking.action"  class="btn btn-small"  >예약하기</a></div>
                                    </div>
                                    
                                    <div id="myModal" class="modal">
										<span class="close">&times;</span>
										<img class="modal-content">
										<div class="caption"></div>
									</div>
                                    
                                    
                                      <br/><br/>
                                    <hr color="silver" width="100%">
                                     
                                    <!-- 스파타입정보끝 -->
                                    <div class="row align-items-center" style="padding-top: 50px;">
                                        <div class="col-lg-6">
                                            <ul class="list-unstyled" style="padding-top: 50px;">
                                                <li>
                                                    <h4 class="mb-3">
                                                        <span>스파 시설</span>
                                                    </h4>
                                                    <p>
                                                        <i class="fa fa-bullseye" aria-hidden="true"></i>개인 라커와 샤워시설을 갖춘 6개의 트리트먼트룸</p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <i class="fa fa-bullseye" aria-hidden="true"></i>
                                                        개인 자쿠지를 갖춘 1개의 VIP커플 스위트룸</p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <i class="fa fa-bullseye" aria-hidden="true"></i>
                                                        휴게라운지와 에비앙 아쿠아 바</p>
                                                </li>
                                                <li>
                                                    <p>
                                                        <i class="fa fa-bullseye" aria-hidden="true"></i>
                                                        건식,습식 사우나,자쿠지,풀</p>
                                                </li>
                                                <li style="padding-top: 10px;">
                                                    <p>
                                                        <h6>요금과 트리트먼트는 사전 통보없이 변경될수 있으며, 모든 요금에 10%세금이 포함되어있습니다.</h6>
                                                    </p>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="col-lg-6">
                                            <img src="/hotel/resources/images/spa/spa6.JPG" alt="" class="img-fluid">
                                        </div>
                                    </div>
                                    <div style="padding-top: 20px;"></div>
                                    <br/><br/>
                                    <hr color="silver" width="100%">
                                    
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
	
	<script src="/hotel/resources/js/weather.js"></script>
	
	<script type="text/javascript">
	
	//current position
	var pos = 0;
	//number of slides
	var totalSlides = $('#slider-wrap ul li').length;
	//get the slide width
	var sliderWidth = $('#slider-wrap').width();

	$(document).ready(function(){
		
		/*****************
		 BUILD THE SLIDER
		*****************/
		//set width to be 'x' times the number of slides
		$('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
		
	    //next slide 	
		$('#next').click(function(){
			slideRight();
		});
		
		//previous slide
		$('#previous').click(function(){
			slideLeft();
		});
		
		/*************************
		 //*> OPTIONAL SETTINGS
		************************/
		//automatic slider
		var autoSlider = setInterval(slideRight, 3000);
		
		//for each slide 
		$.each($('#slider-wrap ul li'), function() { 
		   //set its color
		   var c = $(this).attr("data-color");
		   $(this).css("background",c);
		   
		   //create a pagination
		   var li = document.createElement('li');
		   $('#pagination-wrap ul').append(li);	   
		});
		
		//counter
		countSlides();
		
		//pagination
		pagination();
		
		//hide/show controls/btns when hover
		//pause automatic slide when hover
		$('#slider-wrap').hover(
		  function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
		  function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
		);
	});//DOCUMENT READY
	
	/***********
	 SLIDE LEFT
	************/
	function slideLeft(){
		pos--;
		if(pos==-1){ pos = totalSlides-1; }
		$('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 	
		
		//*> optional
		countSlides();
		pagination();
	}
	/************
	 SLIDE RIGHT
	*************/
	function slideRight(){
		pos++;
		if(pos==totalSlides){ pos = 0; }
		$('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
		
		//*> optional 
		countSlides();
		pagination();
	}
	/************************
	 //*> OPTIONAL SETTINGS
	************************/
	function countSlides(){
		$('#counter').html(pos+1 + ' / ' + totalSlides);
	}

	function pagination(){
		$('#pagination-wrap ul li').removeClass('active');
		$('#pagination-wrap ul li:eq('+pos+')').addClass('active');
	}
	</script>
	
	<script type="text/javascript">
		 // Get the modal
	    var modal = document.getElementById('myModal');
	
	    // Get the button that opens the modal
	    var btn = document.getElementById("myBtn");
	
	    // Get the <span> element that closes the modal
	    var span = document.getElementsByClassName("close")[0];                                          
	
	    // When the user clicks on the button, open the modal 
	    btn.onclick = function() {
	        modal.style.display = "block";
	    }
	
	    // When the user clicks on <span> (x), close the modal
	    span.onclick = function() {
	        modal.style.display = "none";
	    }
	
	    // When the user clicks anywhere outside of the modal, close it
	    window.onclick = function(event) {
	        if (event.target == modal) {
	            modal.style.display = "none";
	        }
	    }
	</script>
	
  </body>
  </html>