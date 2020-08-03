<%@page import="com.exe.dto.HotelBookingDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
request.setCharacterEncoding("UTF-8"); 
String cp = request.getContextPath(); 
%>
<%
	String name = (String)request.getAttribute("name");
    String phone = (String)request.getAttribute("phone");
    String address = (String)request.getAttribute("address"); 
    String email = (String)request.getAttribute("email");
    int totalPrice = (Integer)request.getAttribute("total");
    
    totalPrice = totalPrice/1000;
    
   // HotelBookingDTO dto = (HotelBookingDTO)request.getAttribute("dto");
    
  //  System.out.println("총가격:"+ dto.getPrice());
    
    
/* 	
String name = "suzy";
    String phone = "010-2121-0851";
    String address = "강서구";
	//System.out.println("여기까진와5");
    String email = "suzy@naver.com";
    int totalPrice = 100; 
    */
     
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
    <script>
    $(function(){
    	
        var IMP = window.IMP; // 생략가능
        IMP.init("imp99234653"); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'inicis',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'IT WILL Hotel',
            amount : <%=totalPrice %>,
            buyer_email : '<%=email%>',
            buyer_name : '<%=name%>',
            buyer_tel : '<%=phone%>',
            buyer_addr : '<%=address%>',
            buyer_postcode : '123-456',
           // m_redirect_url : 'http://192.168.16.14:8080/hotel/confirmation_ok2.action'
        }, function(rsp) {
        	
            if ( rsp.success ) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                
                //성공시 이동할 페이지
                location.href="<%=cp%>/confirmation_ok.action";
                
            } else {
            	
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                alert(msg);
                
                //실패시 이동할 페이지
                location.href="<%=cp%>/";
           
            }
        });
    });
        
    </script>
 
</body>
</html>
