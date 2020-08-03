<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.springframework.web.servlet.support.RequestContextUtils"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	
	Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
	
	Map<String, Object> res = new HashMap<String,Object>();
	
	 
    if(flashMap !=null) {  
        // flashMap.get("params") 으로 값 받아서 사용
        res= (Map<String, Object>)flashMap.get("res");  
       
    } 
    
    String time2 = (String)res.get("time");
    String adult2 = (String)res.get("adult");
    String children2 = (String)res.get("children");
    
    int time=0, children=0, adult=0;
	if(time2!=null)
  	  time = Integer.parseInt(time2);
	if(children2!=null)
    	children = Integer.parseInt(children2);
	if(adult2!=null)
   	 adult = Integer.parseInt(adult2);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="description" content="Eden Travel Template">
  
  <meta name="author" content="Themefisher.com">

  <title>IT WILL | Restaurant </title>
  
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
  
  <script type="text/javascript">
  
  
function sendIt() {
	
var f = document.resBookingForm;
	
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
	
	str = f.name.value;
	str = str.trim();
	if(!str){
		alert("\n이름을 입력하세요.");
		f.name.focus();
		return;
	}
	f.name.value = str;
	
	str = f.phone.value;
	str = str.trim();
	if(!str){
		alert("\n핸드폰번호를 입력하세요.");
		f.phone.focus();
		return;
	}
	f.phone.value = str;
	
	str = f.email.value;
	str = str.trim();
	if(!str){
		alert("\n이메일을 입력하세요.");
		f.email.focus();
		return;
	}
	f.email.value = str;
	
	f.action = "<%=cp %>/res-BookOk2.action";
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
<div id="kakao-talk-channel-chat-button" style="position:fixed; right:10px; bottom:0px; z-index:1000;"></div>

<section class="overly bg-2">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
          <h1 class="text-white py-100">레스토랑 예약</h1>
      </div>
    </div>
  </div>
  <div class="container-fluid page-border-top">
    <div class="row ">
      <div class="col-lg-12 text-center">
          <div class="page-breadcumb py-2">
            <a href="#" class="text-white">Home</a>
            <span><i class="fa fa-angle-right text-white mx-1" aria-hidden="true"></i></span>
            <a href="#" class="text-white">Restaurant Reservation</a>
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
		<form method="post" action="" name="resBookingForm" onsubmit="return false;" class="reserve-form">
			<c:if test="${empty dto.resName }">
				<a><h2>${res.resName } 온라인 예약</h2></a>
				<input type="hidden" id="resName" name="resName" value="${res.resName }">
			</c:if>
			<c:if test="${empty res.resName }">
				<a><h2>${dto.resName } 온라인 예약</h2></a>
				<input type="hidden" id="resName" name="resName" value="${dto.resName }">
			</c:if>
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
										    <input type="text" class="form-control" placeholder="체크인" id="checkin" name="checkin" value="${res.checkin }" autocomplete="off">
										    <div class="input-group-addon">
										       <span class="ion-android-calendar"></span>
										    </div>
										</div>
						          	</div>
						          	
						          	
						          	<div class="form-group col-md-3">
						          	<c:if test="${empty res.time }">
								 		<select id="time" class="form-control custom-select" name="time" >
									        <option selected>시간</option>
										        <option value="10시">10시</option>
								                <option value="11시">11시</option>
								                <option value="12시">12시</option>
								                <option value="13시">13시</option>
								                <option value="14시">14시</option>
								                <option value="15시">15시</option>
								                <option value="16시">16시</option>
								                <option value="17시">17시</option>
								                <option value="18시">18시</option>
								                <option value="19시">19시</option>
								                <option value="20시">20시</option>
								                <option value="21시">21시</option>
									      </select>
									  </c:if>
									  <c:if test="${!empty res.time }">
								 		<select id="time" class="form-control custom-select" name="time" >
								 			<% for(int i=10; i<=21; i++) { 
													if(time==i) {
											%>
					    		  			  <option selected style="color:black;"><%=time %>시</option>
					    		  	  
					    		  			<%} else {%>  
					    		  			  <option value="<%=i %>" style="color:black;"><%=i %>시</option>
					        			
					        				<% }} %>	
									      </select>
									  </c:if>
								    </div>
								    
								    
								    <div class="form-group col-md-3 ">
								    <c:if test="${empty res.adult }">
							    		<select id="adult" class="form-control custom-select" name="adult">
									        <option selected>성인</option>
										        <option value="1명">1명</option>
								                <option value="2명">2명</option>
								                <option value="3명">3명</option>
								                <option value="4명">4명</option>
								                <option value="5명">5명</option>
									      </select>
									</c:if>
									<c:if test="${!empty res.adult }">
							    		<select id="adult" class="form-control custom-select" name="adult">
												<% for(int j=1; j<=5; j++) { 
												if(adult==j) {
													%>
					    					  	  <option selected style="color:black;"><%=adult %>명</option>
					    						  	<%} else {%>  
					        					<option value="<%=j %>" style="color:black;"><%=j %>명</option>
					        					<% }} %>	
									      </select>
									</c:if>
								    </div>
								    
								    
								    
								    <div class="form-group col-md-3 ">
								    <c:if test="${empty res.children }">
							    		<select id="children" class="form-control custom-select" name="children">
									        <option selected>어린이</option>
									       		<option value="1명">0명</option>
										        <option value="1명">1명</option>
								                <option value="2명">2명</option>
								                <option value="3명">3명</option>
								                <option value="4명">4명</option>
								                <option value="5명">5명</option>
									      </select>
									 </c:if>
									 <c:if test="${!empty res.children }">
							    		<select id="children" class="form-control custom-select" name="children">
												<% for(int i=0; i<=5; i++) { 
												if(children==i) {
												%>
					    		 		 	  <option selected style="color:black;"><%=children %>명</option>
					    		  	  
					    		 		 	<%} else {%>  
					    		 	 	
					        					<option value="<%=i %>" style="color:black;"><%=i %>명</option>
					        			
					        				<% }} %>
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
			<input type="hidden" id="userId" name="userId" value="${sessionScope.login.userId }"/>
				<div class="row">
					<div class="form-group col-lg-12">
						 <label for="inputname" class="col-sm-4 col-form-label">이름: <a style="color: red;"> *필수</a></label>
						<input type="text" name="name" id="name" class=" form-control" placeholder="이름" maxlength="20" value="${sessionScope.login.userName }"/>
					</div>
					<div class="form-group col-lg-12">
						 <label for="inputname" class="col-sm-4 col-form-label">핸드폰: <a style="color: red;"> *필수</a></label>
						<input type="text" name="phone" id="phone" class=" form-control" placeholder="010-0000-0000" maxlength="30" value="${sessionScope.login.tel }"/>
					</div>
					<div class="form-group col-lg-12">
						 <label for="inputname" class="col-sm-4 col-form-label">이메일:  <a style="color: red;"> *필수</a></label>
						<input type="text" name="email" id="email" class=" form-control" placeholder="이메일" maxlength="50" value="${sessionScope.login.userEmail }"/>
					</div>
					<div class="form-group col-lg-12">
					<label for="inputname" class="col-sm-4 col-form-label">요 청 사 항: </label>
						<textarea name="comments" id="comments" class=" form-control" rows="6" placeholder="Comment" maxlength="500"></textarea>
					</div>
					<br/><br/>
					
					<div class="border-top"></div><br/><br/>
					<div class="border-top"></div><br/><br/>
					
					<h3 class="mb-4" align="center"><br/><br/>고객님께 드리는 안내 말씀</h3>
					<p>좌석 배치는 사전 예약순으로 마감되며 특정 자리 지정은 불가합니다.<br/>
					특정 음식에 대한 알레르기가 있다면 사전에 알려주시기 바랍니다.<br/>
					메뉴에서 보시는 연출용 이미지와 실제로 제공되는 음식의 모양은 차이가 있을 수 있습니다.<br/>
					메뉴는 레스토랑 상황에 따라 사전 예고 없이 변경 될 수 있는 점 양해 바랍니다.<br/>
					최종 예약확인을 위해 입력해주신 연락처(전화/문자/이메일)로 연락드리겠습니다.<br/>
					연락이 되지 않으면 예약이 어려울 수 있습니다.<br/>
					예약 변경 및 취소 시 레스토랑으로 연락하여주시기 바랍니다.
					<br/><br/>
					</p>
				<div class="border-top"></div><br/><br/>
					<div class="form-group col-lg-12">
                        
							<div class="gallery-title" align="center">
								<input type="submit" value="예&nbsp;&nbsp;약&nbsp;&nbsp;하&nbsp;&nbsp;기" class="btn btn-main btn-block" onclick="sendIt();">
								<br/><br/>
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