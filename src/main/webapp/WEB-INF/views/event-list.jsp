<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

</head>

<body >
	
<!-- 하나의 이벤트 띄위기 -->

    <c:choose>
        <c:when test="${mode eq 'mainstart'}">
            <div class="row">
            <c:forEach items="${originalLists }" var="dto2">
                <div class="col-lg-6 col-md-6">
                    <div class="event-box mb-5 position-relative">
						<a href="event-single.action?eventIndex=${dto2.eventIndex}">
                      	<img src="/hotel/resources/images/event/${dto2.savefileName}" alt="" class="img-fluid w-100">
                      	</a>                           
                      	 <div class="event-content mt-3">
                               <!--  
                                <div class="event-date p-3 text-white">
                                    <span class="date font-weight-bold d-block">${dto2.price }</span>
                                    
                                </div>
                                -->
                                <a href="event-single.action?eventIndex=${dto2.eventIndex}">
                                    <h3>${dto2.eventTitle }</h3>
                                </a>
                                <div class="event-post-meta mt-2 mb-3">
                                	<span>
                                		<i class="ion-calendar"></i>${dto2.startDate }~${dto2.endDate }</span>
                                    <span>
                                        <i class="ion-clock"></i>${dto2.time }</span>
                                    <span>
                                        <i class="ion-ios-location"></i>${dto2.location }</span>
                                     <span>
                                       &nbsp;<i class="ion-laptop"></i><a href="event-single.action?eventIndex=${dto2.eventIndex}">자세히 보기</a></span>
                                </div>
                                <p>${dto2.content1 }</p>
                            </div>
                        </div>
                       <!-- <div align="left">
                        	<span>
                               <i class="ion-calendar"></i>자세히보기>></span>
                        </div>  --> 
                    </div>
                </c:forEach>
            </div>
            </c:when>
            
            <c:otherwise>
                <c:if test="${fn:length(availableEventLists)==0}">
                 
                    <div align="center">
                   <!--   <img src="/hotel/resources/images/event/sorry.jpg" alt=" " class="img-fluid w-100"> -->
                   <H4>검색하신 <b style="color: #ff0000">${startDate }</b> 부터
                    <b style="color: #ff0000">${endDate }</b> 까지의
                       </H4>
                      <H4>해당 날짜에는 예정된 이벤트가 없습니다.</H4>
                      <h5> <a href="event-grid.action">>>다른 이벤트 보기</a></h5>
                    </div>
                  
                </c:if>
                
                <c:if test="${fn:length(availableEventLists) > 0 }">
                 <div class="row">
                  <c:forEach items="${availableEventLists }" var="dto3">
                   <div class="col-lg-6 col-md-6">
                    <div class="event-box mb-5 position-relative">
                      <a href="event-single.action?eventIndex=${dto3.eventIndex}">
                      	<img src="/hotel/resources/images/event/${dto3.savefileName }" alt=" " class="img-fluid w-100">
                      	</a>
                            <div class="event-content mt-3">
                            <!-- 
                                <div class="event-date p-3 text-white">
                                    <span class="date font-weight-bold d-block">${dto3.price }</span>
                                   
                                </div>
                                 -->
                                    <h3>${dto3.eventTitle }</h3>
                                
                                <div class="event-post-meta mt-2 mb-3">
                                	<span>
                                		<i class="ion-calendar"></i>${dto3.startDate }~${dto3.endDate }</span>
                                    <span>
                                        <i class="ion-clock"></i>${dto3.time }</span>
                                    <span>
                                        <i class="ion-ios-location"></i>${dto3.location }</span>
                                        <span>
                                       &nbsp;<i class="ion-laptop"></i><a href="event-single.action?eventIndex=${dto3.eventIndex}">자세히 보기</a></span>
                                </div>
                                <p>${dto3.content1 }</p>
                            </div>
                        </div>
                       </div>
                      </c:forEach>
                      </div>
                    </c:if>
                </c:otherwise>
            </c:choose>
        
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

  </body>
  </html>