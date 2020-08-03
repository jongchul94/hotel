<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String adult2 = (String)request.getAttribute("adult");
	
	int children = 0;
	int adult = 0;
	
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

  <title>IT WILL | Spa </title>
  
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
  
	<style type="text/css">
	
	*:not(i){
		font-family: 'Noto Serif KR', serif!important;
	}
	
	</style>
  
  <!-- 
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
   
  <style type="text/css">
	  .section-subtitle413 {
	  font-size: 14px;
	  font-weight: 700;
	  line-height: 2.14;
	  letter-spacing: 2.8px;
	  text-align: left;
	  color: #b0914f;
	  text-transform: uppercase;
		}
  </style>
   -->
  <script type="text/javascript">
  
/*   function showData() {
	  
	  //사용자가 입력한 스파 예약내용 가져오기
	  
	  var spaDate = $("#spaDate").val();
	  var time = $("#time").val();
	  var adult = $("#adult").val();
	  var spaType = $("#spaType").val();
	  var spaUserName = $("#spaUserName").val();
	  var phone = $("#phone").val();
	  var email = $("#email").val();
	  var spaUserRequest = $("#spaUserRequest").val();
	  
	  
	  return true;
  }
   */
  
  function sendIt() {
	  
	 // f = document.spaBookingForm;
	
	  var spaDate = $.trim($("#spaDate").val());
	  var time = $.trim($("#time").val());
	  var adult = $.trim($("#adult").val());
	  var spaUserName = $.trim($("#spaUserName").val());
	  var phone = $.trim($("#phone").val());
	  var email= $.trim($("#email").val());
	  var spaType = $.trim($("#spaType").val());
	  var spaUserRequest = $.trim($("#spaUserRequest").val());
	  
	  
 	  if ('${sessionScope.login.userName}'.length == 0) {
          alert("로그인 후 사용가능합니다")
          return false;
      }
	  if(!spaDate) {
			alert("\n날짜를 선택하세요!");
			$("#spaDate").focus();
			return false;
	  }
	  if(spaType=='트리트먼트 타입') {
			alert("\n트리트먼트 타입을 선택하세요!");
			$("#spaType").focus();
			return false;
	  }
	  if(time=='시간') {
			alert("\n시간를 선택하세요!");
			$("#time").focus();
			return false;
	  }
	  if(adult=='인원') {
			alert("\n 인원을 선택하세요!");
			$("#adult").focus();
			return false;
	  }
	  /* 
	  if(!spaUserName) {
			alert("\n이름을 입력하세요!");
			$("#spaUserName").focus();
			return false;
	  } 
	  if(!phone) {
			alert("\n핸드폰번호를 입력하세요!");
			$("#phone").focus();
			return false;
	  }
	  if(!email) {
			alert("\n이메일을 선택하세요!");
			$("#email").focus();
			return false;
	  }
	   */
	  <%-- 
	  location.href = "<%=cp%>/spa-request.action?spaDate="
			  +spaDate+"&spaType="+spaType+"&time="+time+"&adult="+adult+"&phone="
			  +phone+"&email="+email+"&spaUserName="+spaUserName + "&spaUserRequest=" + spaUserRequest;
	   --%>
	  location.href = "<%=cp%>/spa-request.action?spaDate="
		  +spaDate+"&spaType="+spaType+"&time="+time+"&adult="+adult+"&spaUserRequest=" + spaUserRequest;
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
          <h1 class="text-white py-100">에비앙스파 예약</h1>
      </div>
    </div>
  </div>
  <div class="container-fluid page-border-top">
    <div class="row ">
      <div class="col-lg-12 text-center">
          <div class="page-breadcumb py-2">
            <a href="life-spa.action" class="text-white">Home</a>
            <span><i class="fa fa-angle-right text-white mx-1" aria-hidden="true"></i></span>
            <a href="spa-booking.action" class="text-white">Spa Reservation</a>
        </div>
      </div>
    </div>
  </div>
</section>


<div class="page-wrapper event-page">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8">
	<div class="single-event">

		<div class="event-content mt-4">
		<form method="post" class="reserve-form" action="" name="spaBookingForm">
		
			<a><h2>${dto.spaUserName }&nbsp;온라인예약</h2></a>
			<input type="hidden" id="spaBookingNum" value="${dto.spaBookingNum }">
			<br/><br/>
			<div class="border-top"></div><br/><br/>
			<div class="event-post-meta mb-4">
				<div>
					<section>
					
					<div class="container">
						<div class="secondary-bg p-5 position-relative">
							
								<div class="form-row">
								    <div class="form-group col-md-3 col-sm-4">
								    	<div class="input-group tp-datepicker date" data-provide="datepicker">
										    <input type="text" class="form-control" placeholder="체크인" id="spaDate" 
										    value="${dto.spaDate }" name="spaDate" autocomplete="off">
										    <div class="input-group-addon">
										       <span class="ion-android-calendar"></span>
										    </div>
										</div>
						          	</div>
						          		    <div class="form-group col-md-3 ">
								    <c:if test="${empty dto.spaType }">
							    		<select id="spaType" class="form-control custom-select" name="spaType">
									        <option selected>트리트먼트 코스</option>
										        <option value="아흐모니 수브리머">아흐모니 수브리머	</option>
								                <option value="르 미네할르">르 미네할르</option>
								                <option value="르 프헤슈">르 프헤슈</option>
								                <option value="프레스티지어스 저니">프레스티지어스 저니</option>
								                <option value="에비앙 센서리 저니">에비앙 센서리 저니</option>
									      </select>
									</c:if>
									<c:if test="${!empty dto.spaType }">
							    		<select id="spaType" class="form-control custom-select" name="spaType">
									        <option selected>${dto.spaType }</option>
										        <option value="아흐모니 수브리머">아흐모니 수브리머	</option>
								                <option value="르 미네할르">르 미네할르</option>
								                <option value="르 프헤슈">르 프헤슈</option>
								                <option value="프레스티지어스 저니">프레스티지어스 저니</option>
								                <option value="에비앙 센서리 저니">에비앙 센서리 저니</option>
									      </select>
									</c:if>
								    </div>
						          	<div class="form-group col-md-3">
						          	<c:if test="${empty dto.time }">
								 		<select id="time" class="form-control custom-select" name="time" >
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
									  </c:if>
									  <c:if test="${!empty dto.time }">
								 		<select id="time" class="form-control custom-select" name="time" >
									        <option selected>${dto.time } 시</option>
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
									  </c:if>
								    </div>
								    <div class="form-group col-md-3 ">
								    <c:if test="${empty dto.adult }">
							    		<select id="adult" class="form-control custom-select" name="adult">
									        <option selected>인원</option>
										        <option value="1">1명</option>
								                <option value="2">2명</option>
								                <option value="3">3명</option>
								                <option value="4">4명</option>
								                <option value="5">5명</option>
									      </select>
									</c:if>
									
									
									<c:if test="${!empty dto.adult }">
							    		<select id="adult" class="form-control custom-select" name="adult">
									        <option selected>${dto.adult }명</option>
										        <option value="1">1명</option>
								                <option value="2">2명</option>
								                <option value="3">3명</option>
								                <option value="4">4명</option>
								                <option value="5">5명</option>
									      </select>
									</c:if>
								    </div>
								   
								 </div>
						</div>
					</div>
				</section>
				</div>
			</div>

		<div class="event-comment-form mt-5">
		<div class="border-top"></div><br/><br/>
		<h3 class="mb-4">예약자 정보</h3>
			
				<div class="row">
					<div class="form-group col-lg-12">
						<label for="inputname" class="col-sm-4 col-form-label">이름: </label>
						<div name="spaUserName" id="spaUserName" class=" form-control" maxlength="20" >
						${sessionScope.login.userName }</div>
					</div>
					<div class="form-group col-lg-12">
						<label for="inputname" class="col-sm-4 col-form-label">연락처: </label>
						<div name="phone" id="phone" class=" form-control"  maxlength="30" >
						${sessionScope.login.tel }</div>
					</div>
					<div class="form-group col-lg-12">
						<label for="inputname" class="col-sm-4 col-form-label">이메일:  </label>
						<div name="email" id="email" class=" form-control" maxlength="50">
						${sessionScope.login.userEmail }</div>
					</div>
					<div class="form-group col-lg-12">
						<label for="inputname" class="col-sm-4 col-form-label">요청사항: </label>
						<textarea name="spaUserRequest" id="spaUserRequest" class=" form-control" rows="3" placeholder="Comment" maxlength="500"></textarea>
					</div>
					<br/><br/><br/><br/>
					
					<div>
					<br/>
						<h3 class="mb-4" align="center">고객님께 드리는 안내 말씀</h3>
						<p>16세 미만의 고객의 경우 보호자가 동반한 경우에 한해 스파 이용이 가능합니다. 궁금하신점은 스파 컨시어지에 문의하시기 바랍니다.
						임산부 또는 수술 이력이나 질환이 있는 고객께서는 스파 서비스 예약 전 의료진에게 먼저 상담받으시길 바라며, 임신 초기 3개월까지는
						트리트먼트를 권장하지 않습니다.  
						</p>
						<p>저희 스파 시설을 충분히 즐기며 긴장을 완화 시키실 수 있도록 트리트먼트 예약 30분 전에 미리 방문 바랍니다.
						혹여 늦으실 경우 다음 고객 예약으로 고객님의 트리트먼트 시간이 단축되므로 양해 부탁드립니다.
						부득이한 사정으로 스파 예약 취소 및 변경을 원하는 경우 이용일 기준 24시간 전에 알려주시기 바라며 사전에 취소하지 
						않는 경우 100%의 취소 수수료가 발생합니다.</p>
						
						<div class="form-group col-lg-12">
	                      <!--    <input type="checkbox" name="term">
	                       <span class="policy">「고객님께 드리는 안내 말씀」을 읽고 확인하셨습니다.<br/><br/></span> -->
								<div class="gallery-title" align="center">
									<input type="button" value="예&nbsp;&nbsp;약&nbsp;&nbsp;하&nbsp;&nbsp;기" class="btn btn-main btn-block" onclick="sendIt();">
									<br/><br/>
								</div>
							</div>
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