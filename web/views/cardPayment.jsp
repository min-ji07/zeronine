<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.product.model.vo.*, java.util.*"%>   
<% paymentInfo pm = (paymentInfo)session.getAttribute("payment");
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
        var IMP = window.IMP; 
        IMP.init('imp65079077'); 
        var msg;
        
        IMP.request_pay({
            pg : 'inicis',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '<%= pm.getpName() %>',	// 상품명
            amount : <%= pm.getResultPrice() %>,			// 금액
            buyer_email : 'TEST@naver.com',
            buyer_name : 'TEST',
            buyer_tel : '01000000000',
            buyer_addr : '123',
            buyer_postcode : '123-456',
        }, function(rsp) {
            if ( rsp.success ) {
                jQuery.ajax({
                    url: "/payments/complete", 
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                       
                    }
                }).done(function(data) {
                    
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                    }
                });
                alert("결제가 완료되었습니다.");
                location.href = "<%=request.getContextPath()%>/views/myPage.jsp";
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                alert(msg);
                location.href = "<%=request.getContextPath()%>/views/ZeroNineMainPage.jsp";
            }
        });
        
    });
    </script>
 
</body>
</html>
