<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp= request.getContextPath();
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

.bgcolor{
	background-color: #ffffff;
	}
	
h6 {	
	padding: 5px;
}



</style>

</head>
<body>
<div class="container">

 <c:choose>
 <c:when test="${not empty message}">

	<div>
	<ul class="list-group">
 	 <h4 style="text-align: center;">중복된 예약이 있습니다</h4>
  	 <h6>&nbsp;이벤트 이름</h6>

  	 <li class="list-group-item" id="bgcolor">${edto.eventTitle }</li>
     <h6> 장소 및 시간</h6>
     <li class="list-group-item" id="bgcolor">${edto.location } /${edto.time } </li>
      <h6>동행인원</h6>
     <li class="list-group-item" id="bgcolor">${dto.companionNumber }</li>
      <h6>요청사항</h6>
     <li class="list-group-item" id="bgcolor">${dto.userRequest }</li>
     </ul>
     </div>  
     <br/>
</c:when>
<c:otherwise>
	<div>
		<ul class="list-group">
 		 <h4 style="text-align: center;">예약이 확정되었습니다.</h4>
  	 	 <h6>&nbsp;이벤트 이름</h6>

  	 	<li class="list-group-item" id="bgcolor">${edto.eventTitle }</li>
    	  <h6>장소 및 시간</h6>
   		 <li class="list-group-item" id="bgcolor">${edto.location } /${edto.time } </li>
          <h6>동행인원</h6>
         <li class="list-group-item" id="bgcolor">${dto.companionNumber }</li>
          <h6>요청사항</h6>
         <li class="list-group-item" id="bgcolor">${dto.userRequest }</li>

        </ul>
     </div>  
     <br/>
</c:otherwise>
</c:choose>
	
</div>
 
<div align="center">
	<a class="btn btn-main" href="eventCheck.action" role="button">예약 확인</a>
	<!--  <a class="btn btn-main" href="javascript:location.href='<%=cp %>/event-request.action?userId=${sessionScope.login.userId }
	&eventIndex=${eventIndex }'"  role="button">다른 예약</a> -->
	<a class="btn btn-main" href="event-booking-delete.action?eventBookingNum=${dto.eventBookingNum }" role="button">예약 취소</a>
	<button type="button" class="btn btn-main" data-dismiss="modal">닫기</button>
</div>	

</body>
</html>
