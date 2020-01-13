<%-- <%@page import="java.util.ArrayList"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.member.model.vo.*" import="com.product.model.vo.Product" import="com.product.model.vo.paymentInfo"%>
    
<%-- <%-- <% --%>
<!-- // 	ArrayList<Product> p = (ArrayList<Product>)request.getAttribute("list"); -->
<%-- <%-- %> --%> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ZeroNine</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/HeaderMenu.css"> <!-- 헤더 메뉴 -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" /> <!-- 부트 스트랩 -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mainPageLayOut.css" /> <!-- 메인 페이지 -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mainPage.css" /> <!-- 메인 페이지 -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/materialdesignicons.min.css" /> <!-- 아이콘 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/headhesive.css"> <!-- 헤더 메뉴 스크롤 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/eclipse.css?v3">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/slick/slick.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/slick/slick-theme.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/default.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/component.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/categoryDetail.css" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/myPage.css" />
    <!-- JS 파일 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.6/highlight.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/headhesive.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/modernizr.custom.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/js/formIndex.js">    
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/myPage.js"></script>

</head>

<!-- 레이아웃 페이지 스타일은 mainPageLayOut.css에 적용되어 있음-->
<body>
    <%@ include file="common/header.jsp" %>
    <!-- 전체 레이아웃 틀 ( container ) DIV -->
    <div>
        <div id="myPageContainer">
            <div style="padding-top:50px;margin:0 auto;">
                <div class="myPageContent">
                    <div id="myInfo">
                            <div id="myInfoTitle">마이페이지</div>
                            <div id="myPage1" style="display:inline-block;"><img src="<%=request.getContextPath()%>/resources/images/person.png"></div>
                            <div id="myPage2" style="display:inline-block;margin-left:20px;width:400px;">
	                            <div style="color:black;"><span style="color:black;"><%= m.getUserName() %></span>님 반갑습니다!</div>
	                            <div style="color:black;margin-top:10px;">주소 : <%= m.getAddress2()%></div>
	                            <div id="getId" style="display:none;"><%= m.getUserId() %></div>
                            </div>
                            <div id="myPage3" style="display:inline-block;margin-left:100px;">
                            	<a href="<%=request.getContextPath()%>/views/memberUpdateForm.jsp">
                                	<button onclick="member" id='page3Btn2' style="width:120px;">개인정보수정</button>
                                </a>
                                <a href="<%=request.getContextPath()%>/views/memberdeleteForm.jsp">
                                    <button onclick="member" id='page3Btn3' style="width:120px;">회원탈퇴</button>
                                </a>
                            </div>
                    </div>
                    <div style="margin-left:40px;margin-top:10px;">
                    	<input id="option-1" name="radio" value="1" checked="checked" type="radio" onclick="btnClickA()"> <label for="option-1" class="labelOp">
                    	<span></span> 개인 (구매자) </label>
                        <input id="option-2" name="radio" value="2" type="radio" onclick="btnClickB()"> <label for="option-2" class="labelOp">
                        <span></span> 사업자 (판매자)</label>
                    </div>
                    <div id="showlist1"><!-- 개인(구매자)메뉴 -->    
                        <button id="btn1" onclick="btnClick1()">관심상품 내역</button>|
                        <button id="btn2" onclick="btnClick2()">구매상품 내역 </button>
                    </div>
                    <div id="showlist2"><!-- 사업자(판매자)메뉴 -->   
                        <button id="btn3" onclick="btnClick3()">상품관리 내역</button>|
                        <button id="btn4" onclick="btnClick4()">주문관리 내역</button>
                    </div>
                    <div id="div1"><!--  AJAX 영역 -->  
                    </div>
                    <div id="div2">   
                    </div>
                   	<div id="div3" style="display:block;">
                   	</div>
                    <div id="div4">           
                    </div>

                </div>
                <a id="showHere"></a> <!-- a 링크가 있어야 움직였을때 스크롤바 생성 가능-->
            </div>
        </div>
    <script>
	function btnClickB() { // 사업자(판매자)버튼, 상품관리내역
		$("#showlist1").hide();
		$("#showlist2").show();
		$("#div1").hide();
		$("#div2").hide();
		$("#div3").show();
		$("#div4").hide();
		$("#btn1").css('border-bottom','none');
		$("#btn2").css('border-bottom','none');
		$("#btn3").css('border-bottom','5px solid #ca3f56');
		$("#btn4").css('border-bottom','none');
		// AJAX 호출 영역
		if (document.getElementById("option-2").checked == true) { // 아이디 option-2 를 가진 라디오 박스가 체크됐을 경우
			$.ajax({											   // ajax 실행
	            url: "<%=request.getContextPath()%>/myPageProductList.do?getId="+$('#getId').text(),		
	            type: "get",
	            dataType : 'JSON', 
	            success: function (data) {
	            	$('#div3').html(data.data);
	            },error: function(data){
	            	alert("3번째 실패");
				}
	        });
	    }
	}
	
	function btnClick2(){ // 구매상품 내역
		$("#div1").hide();
		$("#div2").show();
		$("#div3").hide();
		$("#div4").hide();
		$("#btn1").css('border-bottom','none');
		$("#btn2").css('border-bottom','5px solid rgb(19, 95, 167)');
		$("#btn3").css('border-bottom','none');
		$("#btn4").css('border-bottom','none');
		
		$.ajax({											   
            url: "<%=request.getContextPath()%>/myPageOrderList.do?getId="+$('#getId').text(),		
            type: "get",
            dataType : 'JSON', 
            success: function (data) {
            	$('#div2').html(data.data);
            },error: function(data){
            	alert("2번째 실패");
			}
        });
	}
	
	function btnClick4(){ // 주문관리 내역
		$("#div1").hide();
		$("#div2").hide();
		$("#div3").hide();
		$("#div4").show();
		$("#btn1").css('border-bottom','none');
		$("#btn2").css('border-bottom','none');
		$("#btn3").css('border-bottom','none');
		$("#btn4").css('border-bottom','5px solid #ca3f56');
		
		$.ajax({											   
            url: "<%=request.getContextPath()%>/myPageSellerList.do?getId="+$('#getId').text(),		
            type: "get",
            dataType : 'JSON', 
            success: function (data) {
            	$('#div4').html(data.data);
            },error: function(data){
            	alert("4번째 실패");
			}
        });
	}
	</script>
	<script>
        $(document).ready(function(){
    		if (document.getElementById("option-1").checked == true) { 		// 아이디 option-1 를 가진 라디오 박스가 체크됐을 경우
    			$.ajax({											   		// ajax 실행
    				url: "<%=request.getContextPath()%>/myPageLikeList.do?getId="+$('#getId').text(),		
    	            type: "get",
    	            dataType : 'JSON', 
    	            success: function (data) {
    	            	$('#div1').html(data.data);
    	            },error: function(data){
    	            	alert("1번째 실패");
    				}
    	        });
    	    }
        });
    </script>
    </div>
    
   <%@ include file="common/footer.jsp" %>
    <!---------------------------------------------------------------->
    <a href="#" id="nino-scrollToTop">Go to Top</a>
</body>
</html>