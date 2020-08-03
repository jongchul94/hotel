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
	int total = 0;
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

    var optionList2 = new Array(); // option들 담을 배열변수

 	window.onload = function() {
    	
    	parseWeather();
		loadPage();
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
 	
 	
	
    
 	$(document).ready(function(){
 		
 		$('input[id="form-check-input"]').change(function() {

 	        var arrList = new Array(); // 체크박스 가격들 담음
 	        var optionList = new Array();  // 체크박스 옵션들 담음
 	        var pricePerNight = ${dto.pricePerNight }; // 1박당 가격
 	        
 	    	optionList2.splice(0,optionList2.length);
 			//delete optionList2[j];
 	            
 	        $('input[id="form-check-input"]:checked').each(function(i){ 	   
 	        	
 	        		arrList.push($(this).val());
 	        		optionList.push($(this).attr("name"));
 	        	
 	        });
 	        
 	        if (arrList=="")
 	        	arrList.push(0);        
 	        
 			$.ajax({
 				// 입력창 보내는거니깐 post형태로
 				type:"POST",  
 				url:"<%=cp%>/room-details_ok.action", 
 				data:{arrList:arrList, pricePerNight:pricePerNight},
 				success:function(args){
 					
 					$("#listData").html(args);
 					 // 초기화된 배열에 다시 담기
 					 
 					for(var i=0;i<optionList.length;i++){
 					    optionList2[i]=optionList[i];
 					}
 				},
 				beforeSend:showRequest, 
 				error:function(e) {
 					
 					alert(e.responseText); 
 				}
 			}); // ...end $.ajax
 			
 			
 			
 		});
 		
 	});

	function loadPage() {
		
	    var arrList = new Array(); 
	    var pricePerNight = ${dto.pricePerNight};
		
	    arrList.push(0);
		var url = "<%=cp%>/room-details_ok.action";
		
		$.post(url,
				{arrList:arrList,
				pricePerNight:pricePerNight},
				function(args) {
			$("#listData").html(args);
			
		});
	}

	function showRequest() {

		return true;
	}
	
	function searchData(checkin,checkout,adult,children,pricePerNight) {
		
		//room-details로 바로 들어왔을경우
		if(checkin==""){
			
			
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
			
			var chkIn =new Array();
			chkIn = checkin.split("/");
			var chkout = new Array();
			chkout = checkout.split("/");
			
			if(chkIn[2]>chkout[2]) {
				alert("\n체크인 날짜보다 이전 날짜를 선택할 수 없습니다");
				$("#checkout").focus();
				return false;
			}
			
			if(chkIn[0]>chkout[0]) {
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
		    
			location.href = "<%=cp%>/booking-step2.action?checkin="+checkin
				+"&checkout=" + checkout + "&adult=" + adult + "&children="+children
				+"&total=<%=total%>&optionList2=" + optionList2
				+"&roomIndex="+${dto.roomIndex} + "&pricePerNight="+pricePerNight;
		}
		
		// 전체 체크박스 해제
		$("input:checkbox[id='form-check-input']").prop("checked", false);
		
		
		var adult = document.getElementById("adult").value;
		var children = document.getElementById("children").value;
		var checkin= document.getElementById("checkin").value;
		var checkout = document.getElementById("checkout").value;
		
		location.href = "<%=cp%>/booking-step2.action?checkin="+checkin
			+"&checkout=" + checkout + "&adult=" + adult + "&children="+children
			+"&total=<%=total%>&optionList2=" + optionList2
			+"&roomIndex="+${dto.roomIndex} + "&pricePerNight="+pricePerNight;
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
          <h1 class="text-white py-100">객실 상세정보</h1>
      </div>
    </div>
  </div>

  <div class="container-fluid page-border-top">
    <div class="row ">
      <div class="col-lg-12 text-center">
          <div class="page-breadcumb py-2">
            <a href="/hotel" class="text-white">Home</a>
            <span><i class="fa fa-angle-right text-white mx-1" aria-hidden="true"></i></span>
            <a href="#" class="text-white">Rooms</a>
        </div>
      </div>
    </div>
  </div>
</section>




<section class="section room-details ">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 mb-4 mb-lg-0">
				<div class="room-details-info p-4 border">
					<div class="room-img-lg">
						<img src="/hotel/resources/images/rooms/img${dto.roomIndex }.jpg" alt="" class="img-fluid">
					</div>

					
					<div class="room-heading row d-flex mt-3 mb-5">
						<div class="col-lg-9">
							<h2 class="mb-0">${dto.roomType}</h2>
							
							<c:if test="${dto.pricePerNight == 150000 }">
							<h3>Starting from : <span> 150,000</span> / <small>박</small> </h3>
							</c:if>
							
							<c:if test="${dto.pricePerNight == 200000 }">
							<h3>Starting from : <span> 200,000</span> / <small>박</small> </h3>
							</c:if>
							
							<c:if test="${dto.pricePerNight == 250000 }">
							<h3>Starting from : <span> 250,000</span> / <small>박</small> </h3>
							</c:if>
							
							<c:if test="${dto.pricePerNight == 500000 }">
							<h3>Starting from : <span> 500,000</span> / <small>박</small> </h3>
							</c:if>
							
							<c:if test="${dto.pricePerNight == 1000000 }">
							<h3>Starting from : <span> 1,000,000</span> / <small>박</small> </h3>
							</c:if>
							
							<c:if test="${dto.pricePerNight == 1200000 }">
							<h3>Starting from : <span> 1,200,000</span> / <small>박</small> </h3>
							</c:if>
							
						</div>

						<div class="col-lg-3">
				<!-- 			<a href="booking-step1.action" class="btn btn-main ">예약하기</a> -->
						</div>
					</div>
					
					
                    <div class="row">
                        <div class="col-md-4">
                            <ul class="mb-5 list-unstyled">
                                <li>
                                    <p><i class="fa fa-bed" aria-hidden="true"></i> 침대: <span> ${dto.bedType }</span></p>
                                </li>
                                <li>
                                    <p><i class="fa fa-binoculars" aria-hidden="true"></i> 전망: <span> ${dto.views }</span></p>
                                </li>
                                <li>
                                    <p><i class="fa fa-arrows-alt" aria-hidden="true"></i> 면적: <span> ${dto.roomSize } m2</span></p>
                                </li>
<!--                                 <li>
                                    <p><i class="fa fa-coffee" aria-hidden="true"></i> 조식: <span>조식포함</span></p>
                                </li> -->
                            </ul>
                        </div>

                        <div class="col-md-4">
                            <ul class="list-unstyled">
                                <li>
                                    <p><i class="fa fa-users" aria-hidden="true"></i> 최대 투숙인원: <span>4명</span></p>
                                </li>
                                <li>
                                    <p><i class="fa fa-wifi" aria-hidden="true"></i> Wifi: <span>무료와이파이</span></p>
                                </li>
                                <li>
                                    <p><i class="fa fa-recycle" aria-hidden="true"></i> 에어컨: <span>구비</span></p>
                                </li>
                                <li>
                                    <p><i class="fa fa-plug" aria-hidden="true"></i> 헤어드라이어: <span>구비</span></p>
                                </li>
                            </ul>
                        </div>

                        <div class="col-md-4">
                            <ul class="list-unstyled">
                                <li>
                                    <p><i class="fa fa-tv" aria-hidden="true"></i> 텔레비전: <span>구비</span></p>
                                </li>
                                <li>
                                    <p><i class="fa fa-cube" aria-hidden="true"></i> 안전금고: <span>구비</span></p>
                                </li>
                                <li>
                                    <p><i class="fa fa-bullseye" aria-hidden="true"></i> 흡연여부: <span>금연</span></p>
                                </li>
                                <li>
                                    <p><i class="fa fa-car" aria-hidden="true"></i> 주차: <span>투숙일 동안 무료</span></p>
                                </li>
                            </ul>
                        </div>

						<div class="col-lg-12">
							<h4 class="mb-3">Informations: </h4>
							<p>우아한 인테리어와 현대적 세련미가 조화롭게 어우러진 아이티윌호텔의 스탠다드 룸은 서울 시내 동급 호텔 대비 넓은 50㎡의 여유로운 공간을 제공합니다.
 초고층 객실에서 바라보는 서울 도심의 파노라믹뷰는 최상의 휴식을 제공합니다.</p>
						</div>
                	</div>
                </div>
			</div>
			<div class="col-lg-4">
					<div class="product-sidebar bg-dark p-4">
		<h3 class="text-white text-center py-2 text-uppercase ">예약하기</h3>
		
		
		<form action="" class="sidebar-form p-2">
			<div class="form-row">
			    <div class="form-group col-lg-12 col-sm-12 mb-3">
			    	<h6 class="text-white text-uppercase mb-2">체크인</h6>
			    	
			    	<div class="input-group tp-datepicker date" data-provide="datepicker">
					<input type="text" class="form-control" placeholder="체크인 날짜" id="checkin" value="${checkin }" autocomplete="off">
						<div class="input-group-addon">
							<span class="ion-android-calendar"></span>
						</div>
					</div>
					
			    	<%-- <h6 class="text-white text-uppercase mb-2">${checkin }</h6> --%>
	          	</div>
	          	
	          	<div class="form-group col-lg-12 col-sm-12 mb-3">
			    	<h6 class="text-white text-uppercase mb-2">체크아웃</h6>
			    	
			    	<div class="input-group tp-datepicker date" data-provide="datepicker">
					    <input type="text" class="form-control" placeholder="체크아웃 날짜" id="checkout" value="${checkout }" autocomplete="off">
					    <div class="input-group-addon">
					       <span class="ion-android-calendar"></span>
					    </div>
					</div>
			    	
			    	<%-- <h6 class="text-white text-uppercase mb-2">${checkout }</h6> --%>
	          	</div>

			    			    <div class="form-group col-lg-12  mb-3">
			    	<h6 class="text-white text-uppercase mb-2">성인</h6>
			    	
			    	<c:if test="${empty adult }">
				    	<select id="adult" class="form-control custom-select" value="adult" >
					        <option selected style="color:black;">성인</option>
						        <option value="1명" style="color:black;">1명</option>
				                <option value="2명" style="color:black;">2명</option>
				                <option value="3명" style="color:black;">3명</option>
				                <option value="4명" style="color:black;">4명</option>
				                <option value="5명" style="color:black;">5명</option>
					    </select>
					</c:if>
				    <c:if test="${!empty adult}">
						<select id="adult" class="form-control custom-select" value="adult">
						<% for(int j=1; j<=5; j++) { 
									if(adult==j) {
								%>
					    		  		<option selected style="color:black;">${adult }명</option>
					    		  <%} else {%>  
					        			<option value="<%=j %>명" style="color:black;"><%=j %>명</option>
					        	<% }} %>	
					    </select>
					</c:if>
			    	
			    	<%-- <h6 class="text-white text-uppercase mb-2">${adult }</h6> --%>
			    </div>

			    <div class="form-group col-lg-12  mb-3">
			    	<h6 class="text-white text-uppercase mb-2">어린이</h6>
			    	
			    	<c:if test="${empty children}">
			    		<select id="children" class="form-control custom-select" value="children">
					        <option selected style="color:black;">어린이</option>
					        	<option value="0명" style="color:black;">0명</option>
						        <option value="1명" style="color:black;">1명</option>
				                <option value="2명" style="color:black;">2명</option>
				                <option value="3명" style="color:black;">3명</option>
				                <option value="4명" style="color:black;">4명</option>
				                <option value="5명" style="color:black;">5명</option>
					    </select>
					</c:if>
				    <c:if test="${!empty children }">
						<select id="children" class="form-control custom-select" value="children">
								<% for(int i=0; i<=5; i++) { 
									if(children==i) {
								%>
					    		  	  <option selected style="color:black;">${children }명</option>
					    		  	<%} else {%>  
					        			<option value="<%=i %>명" style="color:black;"><%=i %>명</option>
					        	<% }} %>	
					        		
					        	
					    </select>
					</c:if>
			    	
			    	<%-- <h6 class="text-white text-uppercase mb-2">${children }</h6> --%>
			    </div>

				<div class="form-group col-lg-12 mb-3">
				 	<h6 class="text-white text-uppercase mb-2">Rooms</h6>
				 	<h6 class="text-white text-uppercase mb-2">${dto.roomType }</h6>
			    </div>

			    <div class="form-group col-lg-12 mt-4 mb-3">
				 	<h6 class="text-white text-uppercase mb-2">추가 시설</h6>
			 		<div class="form-check">
					  <input class="form-check-input" type="checkbox" 
					  value="30000"  name="야외수영장" id="form-check-input">
					  <label class="form-check-label" for="defaultCheck1">
					    야외수영장 (+30000)
					  </label>
					</div>

					<div class="form-check">
					  <input class="form-check-input" type="checkbox" 
					  	value="13000" name="조식" id="form-check-input">
					  <label class="form-check-label" for="defaultCheck2">
					    조식 (+13000)
					  </label>
					</div>

					<div class="form-check">
					  <input class="form-check-input" type="checkbox" 
					  	value="45000" name="와이너리" id="form-check-input">
					  <label class="form-check-label" for="defaultCheck3">
					     와이너리 (+45000)
					  </label>
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="checkbox" 
					  	value="60000" id="form-check-input" name="스파">
					  <label class="form-check-label" for="defaultCheck5">
					      스파 (+60000)
					  </label>
					</div>

					<div class="form-check">
					  <input class="form-check-input" type="checkbox" 
					  	value="23000" id="form-check-input" name="엑스트라베드">
					  <label class="form-check-label" for="defaultCheck4">
					      엑스트라 베드 (+23000)
					  </label>
					</div>
			    </div>

			    <div class="form-group col-lg-12 mb-3">
			    	<div class="input-group range_slider ">
	                    <div data-role="rangeslider" >
	                        <label>비용 (1박 기준) :</label>
	                        <div class="range">
	                            <span class="float-left text-white"></span>
	                            <span class="float-right text-white" id="listData"></span>
	                            <!-- <input class="ml-4" type="range" name="price-min" id="price-min" value="200" min="0" max="1000"> -->
	                        </div>
	                     </div>        
	                </div>
			    </div>  

			    <div class="form-group col-lg-12">
			<%--     <input type="button" value="View Details" class="btn btn-solid-border"
								 onclick="searchData('${checkin }','${checkout }','${adult }','${children }');"/>  --%>
				
				<input type="button"  value="예약하기"
			     	onclick="searchData('${checkin }','${checkout }','${adult }','${children }',${dto.pricePerNight });" class="btn btn-main btn-block"/>
				
			    </div>
			 </div>
		</form>
	</div>

			</div>
		</div>


		<div class="row">
			<div class="col-lg-8">
				<div class="room-details-review p-4 mt-5 " style="background-color: #FFFFFF;">

                    
					<c:if test="${countReview !=0}">
						<div class="post-comments p-5">
							<h3 class="post-sub-heading">객실 관련 후기 (총:${countReview }개)</h3>
							<ul class="media-list comments-list m-bot-50 clearlist">
							
								<!-- Comment Item start-->
								<c:forEach items="${lists }" var="dto">
								<li class="media mt-4">
									
									<div class="media-body">
										<div class="comment-info">
											<h4 class="comment-author m-0">
												<a href="#">${dto.name }</a>
											</h4>
											<div class="time"><span>${dto.created }</span></div>
											
											<c:if test="${sessionScope.login.userId eq dto.userId}">
											<a class="comment-button" href="javascript:location.href=
											'<%=cp%>/review-delete.action?roomIndex=${roomIndex }&reviewNum=${dto.reviewNum }';"
											 onclick="return confirm('후기를 삭제하시겠습니까?');">
											<i class="tf-ion-chatbubbles"></i>삭제</a>
											</c:if>
										</div>
										<p>
											${dto.content }
										</p>
									</div>
								</li>
								</c:forEach>
								<!-- End Comment Item -->
							</ul>
						</div>
						</c:if>
						<div class="post-comments-form mt-5">
							<h3 class="pb-3 mb-3 text-capitalize">소중한 후기를 남겨주세요</h3>
							<form action="review.action?roomIndex=${roomIndex }" method="post">
								<div class="row">
									<div class="col-lg-6 form-group">
				                    	<input type="text" name="name" id="reviewName" placeholder="이름" class="form-control" value="${sessionScope.login.userName }" readonly="readonly" style=" background-color: #ffffff;">
				                    </div>
				                    <div class="col-lg-6 form-group">
				                    	<input type="text" name="email" id="reviewEmail" placeholder="이메일" class="form-control" value="${userDTO.email }" readonly="readonly" style=" background-color: #ffffff;">
				                    </div>
				                    <div class="form-group col-lg-12">
				                    	<textarea class="form-control" name="content" placeholder="Message" rows="5" id="reviewText"></textarea>
				                    </div>
				                    
				                    <input type="hidden" name="userId" value="${userDTO.userId }">
			
				                    <div class="form-group col-lg-12">
				                        <div class="btn-submit">
				                        	<button type="submit" class="btn btn-main" id="reviewSubmit">작성하기</button>
				                        </div>
				                    </div>
								</div>
							</form>
						</div>
		
	                <!-- REVIEW COMMENT END -->
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
    <script src="/hotel/resources/http://cdnjs.cloudflare.com/ajax/libs/jquery.form/3.32/jquery.form.js"></script>
    <script src="/hotel/resources/http://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.11.1/jquery.validate.min.js"></script>
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
	    $("#reviewName,#reviewEmail,#reviewText,#reviewSubmit").click(function () {
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