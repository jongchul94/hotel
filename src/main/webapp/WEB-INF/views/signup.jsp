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
<link rel="stylesheet"	href="/hotel/resources/plugins/bootstrap/css/bootstrap.min.css">
<!-- Ionic Icon Css -->
<link rel="stylesheet"	href="/hotel/resources/plugins/Ionicons/css/ionicons.min.css">
<!-- Flaticon Css -->
<link rel="stylesheet"	href="/hotel/resources/plugins/flaticon/font/flaticon.css">
<!-- animate.css -->
<link rel="stylesheet"	href="/hotel/resources/plugins/animate-css/animate.css">
<link rel="stylesheet"	href="/hotel/resources/plugins/nice-select/nice-select.css">
<!-- DATE PICKER -->
<link href="/hotel/resources/plugins/bootstrap-datepicker-master/bootstrap-datepicker.min.css" type="text/css" rel="stylesheet" />
<!-- Magnify Popup -->
<link rel="stylesheet"	href="/hotel/resources/plugins/magnific-popup/dist/magnific-popup.css">
<!-- Owl Carousel CSS -->
<link rel="stylesheet"	href="/hotel/resources/plugins/slick-carousel/slick/slick.css">
<link rel="stylesheet"href="/hotel/resources/plugins/slick-carousel/slick/slick-theme.css">

<link rel="stylesheet"	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">

<!-- Main Stylesheet -->
<link rel="stylesheet" href="/hotel/resources/css/style.css">

<!-- font -->
 <link href="https://fonts.googleapis.com/css?family=Gothic+A1:100|Noto+Serif+KR:200&display=swap&subset=korean" rel="stylesheet">
  
<style type="text/css">
	
*:not(i){
	font-family: 'Noto Serif KR', serif!important;
	}
	
.reg-page {
    color: #555;
    padding: 30px;
    background: #fefefe;
    border: solid 1px #eee;
    box-shadow: 0 0 3px #eee;
}
</style>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<!-- Kakao 톡상담 --><!-- 부트스트랩3 -->
	<script src="/hotel/resources/plugins/jquery/jquery.js"></script>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

	<script type="text/javascript">
		function openDaumZipAddress() {
			new daum.Postcode({
				oncomplete:function(data) {
					jQuery("#address").val(data.address);
					jQuery("#address").focus();
					$("#address").addClass("form-control is-valid");
					console.log(data);
				}
			}).open();
		}
	</script>

<!-- 이메일 형식 체크 JS  -->
<script type="text/javascript">
	
//이메일 형식체크
function email_check( email ) {    
	    var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	    return (email != '' && email != 'undefined' && regex.test(email)); 
	}

// check when email input lost foucus
$(document).ready(function() {
	$("#email").blur(function(){
	  var email = $(this).val();
	  // if value is empty then exit
	  if( email == '' || email == 'undefined') return;

	  // valid check
	  if(! email_check(email) ) {
	  	$("#result-check").text('유효하지 않은 이메일 형식입니다');
	  	$("#email").removeClass("form-control is-valid");
		$("#email").addClass("form-control is-invalid");		
	    $(this).focus();
	    return false;
	  }
	  else {
	  	$("#result-check").text('이메일 형식이 일치합니다.');
	  	$("#email").removeClass("form-control is-invalid");
		$("#email").addClass("form-control is-valid");	
	  	
	  }
	});
});
</script>

<script type="text/javascript">

//UserId 중복체크를 위한 변수, 중복되지 않을경우 값이 저장됨
var checkedId= ""; 

$(document).ready(function() {
	
	//아이디
	$("#userId").focus(function() {
		$("#userId").keyup(function() {
			if(checkedId!=""){
				if(checkedId != $("#userId").val())
					$("#userId").removeClass("form-control is-valid");
					$("#userId").addClass("form-control is-invalid");
			}				
			if ($("#userId").val().length >= 4) {
				$("#idDupCheck").removeClass("disabled");
			}else {
				$("#idDupCheck").addClass("disabled");
			}
		});	
	});

	// 비밀번호
	$("#password").focus(function() {
		$("#password").keyup(function() {
			if ($("#password").val().length >= 8) {
				$("#password").removeClass("form-control is-invalid");
				$("#password").addClass("form-control is-valid");	
			} else {
				$("#password").removeClass("form-control is-valid");
				$("#password").addClass("form-control is-invalid");
			}
		});
	});

	// 비밀번호 재확인
	$("#pwCheck").focus(function() {	
		$("#pwCheck").keyup(function() {
			if ($("#pwCheck").val() == $("#password").val()) {
				$("#pwCheck").removeClass("form-control is-invalid");
				$("#pwCheck").addClass("form-control is-valid");
			} else {
				$("#pwCheck").removeClass("form-control is-valid");
				$("#pwCheck").addClass("form-control is-invalid");	
			}
		});
	});

	// 이름
	$("#userName").focus(function() {
		$("#userName").keyup(function() {
			if ($("#userName").val().length > 1) {
				$("#userName").removeClass("form-control is-invalid");
				$("#userName").addClass("form-control is-valid");
			} else {
				$("#userName").removeClass("form-control is-valid");
				$("#userName").addClass("form-control is-invalid");
			}
		});
	});

	// 생년월일
	$("#birth").focus(function() {
		$("#birth").keyup(function() {
			if ($("#birth").val().length > 0) {
				$("#birth").removeClass("form-control is-invalid");
				$("#birth").addClass("form-control is-valid");
			} else {
				$("#birth").removeClass("form-control is-valid");
				$("#birth").addClass("form-control is-invalid");
			}
		});
	});
	// 비밀번호
	$("#address").focus(function() {
		$("#address").keyup(function() {
			if ($("#address").val().length >= 1) {
				$("#address").removeClass("form-control is-invalid");
				$("#address").addClass("form-control is-valid");	
			} else {
				$("#address").removeClass("form-control is-valid");
				$("#address").addClass("form-control is-invalid");
			}
		});
	});

	// 휴대전화
	$("#tel").focus(function() {
		$("#tel").keyup(function() {
			if ($("#tel").val().length == 13 ) {
				$("#tel").removeClass("form-control is-invalid");
				$("#tel").addClass("form-control is-valid");
			} else {
				$("#tel").removeClass("form-control is-valid");
				$("#tel").addClass("form-control is-invalid");
			}
		});
	});

})

// 회원가입 버튼 클릭시 유효성 검사
function sendIt() {
		//alert("sendIt 들어옴")
	var f = document.myForm;
	if ($("#userId").val() == "") {
		alert("아이디를 입력하세요");
		$("#userId").focus();
		return;
	}
	if ($("#userId").val().length < 4) {
		alert("아이디가 4자리 이상이어야 합니다");
		$("#userId").focus();
		return;
	}
	if ($("#password").val() == "") {
		alert("비밀번호를 입력하세요");
		$("#password").focus();
		return;
	}
	if ($("#password").val().length < 8) {
		alert("비밀번호가 8자리 이상이어야 합니다");
		$("#password").val("");
		$("#password").focus();
		return;
	}
	if ($("#password").val() != $("#pwCheck").val()) {
		alert("비밀번호 재확인이 맞지않습니다");
		$("#pwCheck").val("");
		$("#pwCheck").focus();
		return;
	}
	if ($("#name").val() == "") {
		alert("이름을 입력하세요");
		$("#name").focus();
		return;
	}

	if ($("#birth").val() == "") {
		alert("생년월일을 입력하세요");
		$("#birth").focus();
		return;
	}

	if ($("#email").val() == "") {
		alert("이메일을 입력하세요");
		$("#email").focus();
		return;
	}

	if ($("#tel").val() == "") {
		alert("휴대 전화번호를 입력하세요");
		$("#tel").focus();
		return;
	}

	f.action = "<%=cp %>/signup_ok.action";
	f.submit();
}

// 아이디 중복 체크
function idDupCheck() {
	if ($("#userId").val() == "") {
		alert("아이디를 입력해주세요");
		$("#userId").focus();
		return;
	}
	if ($("#userId").val().length < 4) {
		alert("아이디가 4자리 이상이어야 합니다");
		$("#userId").focus();
		return;
	}

	if (confirm($("#userId").val() + " 아이디로 중복 확인 하시겠습니까?")) {
		// 중복확인 요청
		$.ajax({
			url : "idDupCheck.action",
			type : "GET",
			data : {
				paramId : $("#userId").val()
			},
			dataType : "text",
			success : function(data) {
				
				if(data!="" && data!=0){
				checkedId = data;
				}
				
				$("#userId").val(data);
				if ($("#userId").val().length == 0) {
					alert("중복된 아이디입니다. 다시 입력해주세요");
					$("#userId").removeClass("form-control is-valid");
					$("#userId").addClass("form-control is-invalid");
					$("#userId").focus();
					
				} else {
					alert("사용 가능한 아이디입니다. 다음 단계를 진행하세요");
					$("#userId").removeClass("form-control is-invalid");
					$("#userId").addClass("form-control is-valid");
					$("#userName").focus().setValue="";
					
				}
			}
		});

	} else {
		$("#userId").focus();
		return;
	}

}
// 이메일 인증
function emailCertify() {
	if ($("#email").val() == "") {
		alert("이메일을 입력해주세요");
		$("#email").focus();
		return;
	}

	if (confirm($("#email").val() + " 로 이메일 인증을 보내시겠습니까?")) {
		// 인증 요청
		$.ajax({
			url : "signUpForm/emailCertify",
			type : "GET",
			data : {
				paramEmail : $("#email").val()
			},
			dataType : "text",
			success : function(data) {
				$("#active_key").val(data);
			}
		});
	}
}
</script>

<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

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
	
	<div id="kakao-talk-channel-chat-button" style="position:fixed; right:10px; bottom:0px; z-index:1000;"></div>
	
	<section class="section">
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-lg-8 text-center">
				<div class="section-title">
					<p class="section-subtitle">IT WILL HOTEL</p>
					<h2 class="mb-3">회 원 가 입</h2>
					<p class="mb-4">아이티윌 호텔에 오신것을 환영합니다</p>
					<span class="section-border"></span>
				</div>
			</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-lg-7 col-sm-12">
				<form action="javascript:sendIt();" name="myForm" method="post" class="reg-page">
					<div class="row justify-content-center">
						
						<!-- 아이디 중복검사 -->
						<div class="col-lg-7">
							<p class="section-subtitle">아이디</p>
						</div>
						<div class="col-lg-7">
							<div class="form-group">
								<input name="userId" id="userId" type="text" class="form-control" placeholder="영문 4자리 이상의 아이디를 입력하세요" autocomplete="off" style="width: 340px;!important;">
							</div>
						</div>
						<div class="col-lg-3" align="right">
							<div class="form-group">
								<span id="idDupCheck" onclick="idDupCheck();" class="btn btn-main">중복확인</span>
							</div>
						</div>
						
						 <!-- 이름 -->
						<div class="col-lg-10">
							<div class="form-group">
							<p class="section-subtitle">이    름</p>
								<input name="userName" id="userName" type="text" class="form-control" autocomplete="off" placeholder="2자리 이상의  이름을 입력하세요">
							</div>
						</div>
						
						<!-- 비밀번호 -->
						<div class="col-lg-10">
							<div class="form-group" id="pwInputGroup">
							<p class="section-subtitle">비밀번호</p>
								<input type="password" id="password" name="userPwd" class="form-control" placeholder="8자리 이상의 비밀번호를 입력하세요">
							</div>
						</div>
						<!-- 비밀번호 재검사 -->
						<div class="col-lg-10">
							<div class="form-group">
							<p class="section-subtitle">비밀번호 확인</p>
								<input type="password" id="pwCheck" class="form-control" placeholder="동일한 비밀번호를 재입력하세요">
							</div>
						</div>
						
						<!-- 이메일 중복검사 -->
						<div class="col-lg-7">
							<p class="section-subtitle">이메일</p>
						</div>
						<div class="col-lg-7">
							<div class="form-group">
								<input name="email" id="email" type="text" class="form-control" placeholder="이메일을 입력하세요" autocomplete="off" style="width: 340px;!important;">
								<div id="result-check"></div>
							</div>
						</div>
						<div class="col-lg-3" align="right">
							<div class="form-group">
								<span onclick="emailCertify()" class="btn btn-main">인증확인</span>
								<input id="active_key" name="active_key" type="hidden"></input>
							</div>
						</div>
						
						<!-- 생년월일 -->
						<div class="col-lg-10">
							<div class="form-group">
							<p class="section-subtitle">생년월일</p>
								<input name="birth" id="birth" type="date" class="form-control" placeholder="YYYY-MM-DD" autocomplete="off" autocomplete="off">
							</div>
						</div>
						
						<!-- 주소검색 및 직접입력 -->
						<div class="col-lg-7">
							<p class="section-subtitle">주소</p>
						</div>
						<div class="col-lg-7">
							<div class="form-group">
								<input name="addr" id="address" type="text" class="form-control" placeholder="주소를 입력해주세요" autocomplete="off" style="width: 340px;!important;">
							</div>
						</div>
						<div class="col-lg-3" align="right">
							<div class="form-group">
								<input type="button" class="btn btn-main" value="주소찾기" onclick="openDaumZipAddress();">
							</div>
						</div>
						
						<!-- 전화번호 입력 -->
						<div class="col-lg-10">
							<div class="form-group">
							<p class="section-subtitle">휴대전화</p>
								<input type="text" name="tel" id="tel" class="form-control" placeholder="010-0000-0000" autocomplete="off">
							</div>
						</div>
						
							<input type="submit" class="btn btn-main" value="회 원 가 입" >
					
					</div>

				</form>
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


	<section class="footer-btm secondary-bg py-4">
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
	
	<!-- Bootstrap 3.1 -->
	<script src="/hotel/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
	<!-- Owl Carousel -->
	<script src="/hotel/resources/plugins/slick-carousel/slick/slick.min.js"></script>
	<script src="/hotel/resources/plugins/nice-select/nice-select.js"></script>
	<!--  -->
	<script src="/hotel/resources/plugins/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
	<!-- Form Validator -->
	<script	src="http://cdnjs.cloudflare.com/ajax/libs/jquery.form/3.32/jquery.form.js"></script>
	<script	src="http://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.11.1/jquery.validate.min.js"></script>
	<script	src="/hotel/resources/plugins/bootstrap-datepicker-master/bootstrap-datepicker.min.js"></script>

	<!-- Google Map -->
	<script src="/hotel/resources/plugins/google-map/map.js"></script>
	<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkeLMlsiwzp6b3Gnaxd86lvakimwGA6UA&callback=initMap"></script>
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
