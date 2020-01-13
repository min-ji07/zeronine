<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.member.model.vo.*" import="com.product.model.vo.Product"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.member.model.vo.Member"%>


<%
	ArrayList<Member> mem = (ArrayList<Member>)request.getAttribute("member");	

	for(Member m : mem){
		m.getUserId();
	}

%>
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
				<!--  AJAX 호출 결과 영역 -->                    
					<div>
        				<table style="border:1px solid black; background:white;margin-top:20px;font-size:14px;" >
  							<tr style="height:30px;">
								<th style="width:150px; text-align:center;">아이디</th>
								<th style="width:150px; text-align:center;">닉네임</th>
								<th style="width:200px; text-align:center;">이메일주소</th>
								<th style="width:200px; text-align:center;">주소</th>
								<th style="width:100px; text-align:center;">가입 날짜</th>
								<th style="width:100px; text-align:center;">수정</th>
								<th style="width:100px; text-align:center;">삭제</th>								
							</tr>
							<% for(Member me : mem){ %>
								<% if(me.getUserjoin() != 2){ %> <!-- userjoin의 값이 2일경우 탈퇴한 회원. -->
								<tr style="border:1px solid black;height:40px;">
									<td style="width:150px; text-align:center;"><%=me.getUserId() %></td>
									<td style="width:150px; text-align:center;"><%=me.getUserName() %></td>
									<td style="width:200px; text-align:center;"><%=me.getEmail() %></td> 
									<td style="width:100px; text-align:center;"><%=me.getAddress2() %><%=me.getAddress3() %></td>
									<td style="width:180px; text-align:center;"><%=me.getEnrollDate() %></td>
									<td style="width:100px; text-align:center;">
										<button id='detailBtn4' type="button" onclick="window.open('<%=request.getContextPath()%>/views/userUpdatePop.jsp?userId=<%=me.getUserId()%>&userName=<%=me.getUserName()%>&addr1=<%=me.getAddress1()%>&addr2=<%=me.getAddress2()%>&addr3=<%=me.getAddress3()%>&email=<%=me.getEmail()%>')">
											수정
										</button>
									</td>
									<td style="width:180px; text-align:center;">
										<button id='detailBtn4' type="button" onclick="location.href='<%=request.getContextPath()%>/memberdelete.me?userId=<%=me.getUserId()%>'">
											삭제
										</button>
									</td>
								</tr>
								<%} %>
							<%} %>
						</table>              
					</div>
				</div>
			<a id="showHere"></a> <!-- a 링크가 있어야 움직였을때 스크롤바 생성 가능-->
			</div>
		</div>
	</div>    
	<%@ include file="common/footer.jsp" %>
    <!---------------------------------------------------------------->
    <a href="#" id="nino-scrollToTop">Go to Top</a>
</body>
</html>