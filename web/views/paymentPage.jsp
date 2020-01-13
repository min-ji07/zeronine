<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.product.model.vo.*, java.util.*"%>
<% Product p = (Product)request.getAttribute("item");
   String totalSum = request.getParameter("totalSum");
   int totalPrice = Integer.parseInt(totalSum) + p.getDv_price();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZeroNine</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/HeaderMenu.css">
<!-- 헤더 메뉴 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/headhesive.css">
<!-- 헤더 메뉴 스크롤 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" />
<!-- 부트 스트랩 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/mainPageLayOut.css" />
<!-- 메인 페이지 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/mainPage.css" />
<!-- 메인 페이지 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/materialdesignicons.min.css" />
<!-- 아이콘 -->
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/images/ico/favicon.png">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/default.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/component.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/payment.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/demo.css" />
<!-- 카테고리 DIV CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/selectBoxStyle.css">

<!-- JS 파일 --> 
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.6/highlight.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/eclipse.js?v3"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/headhesive.js"></script>
<script
	src="<%=request.getContextPath()%>/resources/js/modernizr.custom.js"></script>
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
        function fnMove1() {
            $("#bar1").show();
            $("#bar2").hide();

        }
        function fnMove2() {
            $("#bar2").show();
            $("#bar1").hide();
        }
    </script>
</head>

<!-- 레이아웃 페이지 스타일은 mainPageLayOut.css에 적용되어 있음-->

<body onload="init();"
	style="background: #f4f4f4; height: 1550px; font-family: 'Nanum Gothic', sans-serif;">

	<%@ include file="common/header.jsp"%>
	<!-- 전체 레이아웃 틀 ( container ) DIV -->
	<a id="showHere"></a>
	<div id="paymentTitle">
		<img src="<%=request.getContextPath()%>/resources/images/payment/paymentIcon.png">주문서
		작성 및 결제
	</div>
	<div id="mainContainer"
		style="width: 1024px; height: 1300px; margin: 0 auto; margin-top: 20px;">
		<!-- 이 부분에서 작업 -->
		<div id="testjoo" style="margin-left: 35px;">
			<span id="paymentLabel" style="margin-top: 30px; color: rgb(91, 189, 202); font-size: 17px;">주문자 정보</span>
		</div>
		<form name="paymentform" method="POST" id="signup-form" class="signup-form" action="<%=request.getContextPath()%>/paymentInfo.do">
		<input type="hidden" name="userId" value="<%= m.getUserId() %>">
		<input type="hidden" name="sellerId" value="<%= p.getWriterId() %>">
		<input type="hidden" name="pName" value="<%= p.getMainTitle() %>">
		<div style="border: 1px solid #eee; width: 960px; margin: 0 auto; padding-top: 15px; padding-bottom: 15px;">
			<table style="margin: 10px; padding: 10px;">
				<tr class="space">
					<td style="width: 150px; height: 35px;">주문자명</td>
					<td><input type="text" class="form-input"
						style="width: 250px;" id="order1" name="userName"/></td>
				</tr>
				<tr>
					<td style="width: 150px; height: 35px;">주문자 연락처</td>
					<td><input type="text" class="form-input"
						style="width: 250px;" id="order2" name="userPhone" maxlength="11" onkeypress="inNumber();"/></td>
				</tr>
			</table>
		</div>

		<div id="testjoo" style="margin-left: 35px; margin-top: 20px;">
			<span id="paymentLabel"
				style="color: rgb(91, 189, 202); font-size: 17px;">배송상품 수취인
				정보</span>
		</div>

		<div
			style="border: 1px solid #eee; width: 960px; margin: 0 auto; padding-top: 15px; padding-bottom: 15px;">
			<table style="margin: 10px; padding: 10px;">
				<tr style="display: none;">
					<td id="payTitle"><%= p.getMainTitle() %></td>
				</tr>
				<tr class="space">
					<td style="width: 150px; height: 35px;">받는사람</td>
					<td><input type="text" id="orderA" class="form-input"
						style="width: 250px;" name="orderA"/></td>
					<td><input type="button" id="btn" onclick="sameInfo();" value="주문자와동일"></td>
				</tr>
				<tr class="space">
					<td style="width: 150px; height: 40px;">배송시 연락처</td>
					<td><input type="text" id="orderB" class="form-input"
						style="width: 250px;" name="orderB" maxlength="11" onkeypress="inNumber();"/></td>
				</tr>
				<tr class="space">
					<td style="width: 150px; height: 40px;">우편 번호</td>
					<td><input type="text" name="add1" id="add1" class="form-input"
						style="width: 160px;" value="<%=m.getAddress1()%>">
					<input type="button" id="btn" style="margin-left: 20px;" value="주소찾기" onclick="addrSearch2();" ></td>
					<td></td>
				</tr>
				<tr class="space">
					<td style="width: 150px; height: 40px;">배송지 주소</td>
					<td><input type="text" name="add2" id="add2" class="form-input"
						style="width: 250px;" value="<%=m.getAddress2()%>"></td>
					<td></td>
				</tr>
				<tr class="space">
					<td style="width: 150px; height: 40px;">상세 주소</td>
					<td><input type="text" name="add3"  id="add3" class="form-input"
						style="width: 250px;" value="<%=m.getAddress3()%>"></td>
					<td></td>
				</tr>
			</table>
		</div>
		<div id="testjoo" style="margin-left: 35px; margin-top: 20px;">
			<span id="paymentLabel"
				style="color: rgb(91, 189, 202); font-size: 17px;">주문 상품</span>
		</div>
		<div style="border: 1px solid #eee; width: 960px; margin-left: 30px; padding-top: 10px; display: inline-block;">
			<table>
				<%if(Integer.parseInt(request.getParameter("amount1")) >= 1 || Integer.parseInt(request.getParameter("amount2")) >=1 || Integer.parseInt(request.getParameter("amount3")) >=1){%>
				<thead style="border-bottom: 1px solid #eee;">
					<td style="padding-left: 30px; width: 340px;">상품명</td>
					<td style="width: 290px;">수량</td>
					<td style="width: 320px;">금액</td>
				</thead>
				<%} if(Integer.parseInt(request.getParameter("amount1")) >= 1){%>
				<tbody style="margin-top: 5px;">
					<td style="padding-left: 30px;"><%=p.getMainTitle()%> - <%= p.getOp1_title() %></td>
					<td><%= Integer.parseInt(request.getParameter("amount1")) %> 개</td>
					<td><%= Integer.parseInt(request.getParameter("amount1")) * Integer.parseInt(request.getParameter("sell_price1")) %>원</td>
				</tbody>
				<%}if(Integer.parseInt(request.getParameter("amount2")) >=1){%>
				<tbody style="margin-top: 5px;">
					<td style="padding-left: 30px;"><%=p.getMainTitle()%> - <%= p.getOp2_title() %></td>
					<td><%= Integer.parseInt(request.getParameter("amount2")) %> 개</td>
					<td><%= Integer.parseInt(request.getParameter("amount2")) * Integer.parseInt(request.getParameter("sell_price2")) %>원</td>
				</tbody>
				<%}if(Integer.parseInt(request.getParameter("amount3")) >=1) {%>
				<tbody style="margin-top: 5px;">
					<td style="padding-left: 30px;"><%=p.getMainTitle()%> - <%= p.getOp3_title() %></td>
					<td><%= Integer.parseInt(request.getParameter("amount3")) %> 개</td>
					<td><%= Integer.parseInt(request.getParameter("amount3")) * Integer.parseInt(request.getParameter("sell_price3")) %>원</td>
				</tbody>
				<%} %>
			</table>
		</div>
		<div id="testjoo" style="margin-left: 35px; margin-top: 20px;">
			<span id="paymentLabel"
				style="color: rgb(91, 189, 202); font-size: 17px;">결제 금액</span>
		</div>
		<div
			style="border: 1px solid #eee; width: 960px; margin-left: 30px; padding-top: 15px; padding-bottom: 15px; display: inline-block;">
			<div style="margin-top: 5px; font-size: 17px;">
				<span style="font-size: 17px; margin-left: 30px;">상품 금액:</span> <span
					id="sum"
					style="font-size: 20px; color: rgb(199, 10, 10); font-weight: bold;"><%=totalSum %></span>원
				<span style="font-size: 17px; margin-left: 80px;">+ </span> <span
					style="font-size: 17px; margin-left: 60px;">배송비 :</span> <span
					id="sum"
					style="font-size: 20px; color: rgb(199, 10, 10); font-weight: bold;"><%=p.getDv_price() %></span>원
				<span style="font-size: 17px; margin-left: 80px;">= </span> <span
					style="font-size: 17px; margin-left: 60px;">총금액 :</span> <span
					id="paySum"
					style="font-size: 20px; color: rgb(199, 10, 10); font-weight: bold;"><%= totalPrice %></span>원
				<input type="hidden" name="resultPrice" value="<%= totalPrice %>">
			</div>
		</div>
		<div id="testjoo" style="margin-left: 35px; margin-top: 20px;">
			<span id="paymentLabel"
				style="color: rgb(91, 189, 202); font-size: 17px;">주문 결제</span>
		</div>
		<div
			style="border: 1px solid #eee; width: 960px; margin-left: 30px; padding-top: 15px; padding-bottom: 15px; padding-left: 20px; display: inline-block;">
			<span>결제종류 <select id="paymentSelect" name="paymentSelect">
					<option value="신용카드">신용카드</option>
					<option value="카카오페이">카카오페이</option>
			</select>
			</span>
		</div>
		<div id="testjoo" style="margin-left: 35px; margin-top: 20px;">
			<span id="paymentLabel"
				style="color: rgb(91, 189, 202); font-size: 17px;">주문 및
				결제정보제공 동의</span>
		</div>
		<div
			style="border: 1px solid #eee; width: 960px; margin-left: 30px; padding-top: 15px; padding-bottom: 15px; padding-left: 20px; display: inline-block;">
			<p>
				<span style="padding-right: 100px;"> 1. 판매자에게 제공되는 주문정보<br>
					제로나인은 통신판매중개 서비스로 주문정보를 판매자에게 제공하고 있습니다.<br> - 제공대상 : 구매자가
					구매결정한 상품의 판매자 또는 제조자<br> - 제공목적 : 상품배송 및 주문, 예약 서비스 제공 시 본인확인<br>
					- 제공항목 : 상품주문 종류 및 갯수, 구매번호, 배송지정보 (이름,주소,연락처) 서비스 이행을 위한 필수적인 항목<br>
					- 개인정보 보유 및 이용기간 : 물품 배송 또는 사용이후 유효기간 종료시 파기함
				</span>
			</p>
			<p>
				<input type="checkbox" name="chk_box" value="동의" checked="checked">
				정보제공 및 조건 등 주의사항을 모두 읽어보았으며 이에 동의합니다.
			</p>
		</div>
		</form>
		<div
			style="border: 1px solid #eee; width: 960px; margin-left: 30px; padding-top: 15px; padding-bottom: 15px; padding-left: 20px; display: inline-block;">
			<%if ( session.getAttribute("member") != null ) { %>
			<input type="button" id="detailBtn" value="결제하기" onclick="payment();">
			<% } else { %>
				<a href="<%=request.getContextPath()%>/views/loginForm.jsp"> 
				<input type="button" id="detailBtn" value="결제하기">
				</a>
			<% } %>
			<a href="<%=request.getContextPath()%>/productSelectOne.do?pno=<%= p.getPno()%>"><input type="button"
				id="detailBtn2" value="이전으로"></a>
		</div>
	</div>


	<%@ include file="common/footer.jsp"%>





	<!---------------------------------------------------------------->
	<a href="#" id="nino-scrollToTop">Go to Top</a>


	<!-- JS 파일 -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/isotope.pkgd.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery.prettyPhoto.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery.hoverdir.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/modernizr.custom.97074.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/unslider-min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/template.js"></script>
	<script src="https://code.jquery.com/jquery-2.2.0.min.js"
		type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/resources/slick/slick.js"
		type="text/javascript" charset="utf-8"></script>
	<script>
        var options = {
            offset: '#showHere',
            offsetSide: 'top',
            classes: {
                clone: 'banner--clone',
                stick: 'banner--stick',
                unstick: 'banner--unstick'
            }
        };
        var banner = new Headhesive('.banner', options);
    </script>
	<script>
		function sameInfo(){
			var order1 = $("#order1").val();
			var order2 = $("#order2").val();
			$('#orderA').val(order1);
			$('#orderB').val(order2);
		}
		
	
    	function payment(){
    		var payment= $("#paymentSelect option:selected").val();
    		var form = document.paymentform;
   			  if( !form.userName.value )   
   	          {
   	           alert( "주문자명을 적어주세요" ); 
   	           form.userName.focus();  
   	           event.preventDefault();
   	           return;
   	          }
   			  if( !form.userPhone.value )   
   	          {
      	           alert( "주문자 연락처를 적어주세요" ); 
      	           form.userName.focus();  
      	           event.preventDefault();
      	           return;
      	      }
   			  if( !form.orderA.value || !form.orderB.value)   
 	          {
    	           alert( "배송상품 수취인 정보를 입력해주세요" ); 
    	           form.orderA.focus();  
    	           event.preventDefault();
    	           return;
    	      }
   			if( !form.add1.value || !form.add2.value || !form.add3.value)   
	          {
  	           alert( "배송지 주소를 입력해주세요" ); 
  	           form.add1.focus();  
  	           event.preventDefault();
  	           return;
  	      	}
   			  
   			 else{
   	        	 alert("결제 페이지로 이동합니다.");
   	             form.submit();
   	         }
    		
    	}
    	
    </script>
    <script>
    function addrSearch2() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $('#add1').val(data.zonecode); //5자리 새우편번호 사용
                
                $('#add2').val(fullAddr);

                // 커서를 상세주소 필드로 이동한다.
                $('#add3').focus();
                
            }
        }).open();
    };
    function inNumber(){
    	  if(event.keyCode<48 || event.keyCode>57){
    	     event.returnValue=false;
    	  }
    	}
    </script>
</body>

</html>