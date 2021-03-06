<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Member m2 = (Member)request.getAttribute("m2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZeroNine</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<!-- CSS 파일 -->
<!--     <style> -->
<%-- 	<%@include file="../resources/css/HeaderMenu.css"%> --%>
<%-- 	<%@include file="../resources/css/bootstrap.min.css"%> --%>
<%-- 	<%@include file="../resources/css/materialdesignicons.min.css"%> --%>
<%-- 	<%@include file="../resources/css/default.css"%> --%>
<%-- 	<%@include file="../resources/css/headhesive.css"%> --%>
<%-- 	<%@include file="../resources/css/signUpstyle.css"%> --%>
<!-- 	</style> -->
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/images/ico/favicon.png">
<!-- 웹 브라우저 아이콘 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/HeaderMenu.css">
<!-- 헤더 메뉴 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" />
<!-- 부트 스트랩 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/materialdesignicons.min.css" />
<!-- 아이콘 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/default.css" />
<!-- 전체 페이지 레이아웃 CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/headhesive.css">
<!-- 헤더 메뉴 스크롤 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/eclipse.css?v3">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/signUpstyle.css">
<!-- 아이디 / 비밀번호 찾기 CSS -->
<!-- JS 파일 -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.0.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/headhesive.js"></script>
<!-- 헤더메뉴 JS -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.prettyPhoto.js"></script>
<!-- 스크롤 JS -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
<!-- 스크롤 JS -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/unslider-min.js"></script>
<!-- 스크롤 JS -->
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/template.js"></script>
<!-- 스크롤 JS -->




</head>

<!-- 레이아웃 페이지 스타일은 mainPageLayOut.css에 적용되어 있음-->

<body
	style="background: url(<%=request.getContextPath()%>/resources/images/loginBackground.png);">
	<%@ include file="common/header.jsp"%>
	<!-- 전체 레이아웃 틀 ( container ) DIV -->
	<div>
		<div id="idpwdContainer">
			<div style="padding-top: 100px; margin: 0 auto;">
				<div class="signup-content">
					<h2 class="form-title">아이디 찾기</h2>
					<div style="text-align: center; font-size: 17px;">회원님의 사용자
						아이디를 찾은 결과입니다</div>
						<%if(m2 != null){ %>
					<div class="form-group"
						style="font-size: 25px; text-align: center; margin-top: 20px; color: black;">
						
						<%= m2.getUserId() %>
						<%}else{ %>
						<div class="form-group"
						style="font-size: 17px; text-align: center; margin-top: 20px; color: black;">
						해당 정보가 조회되지 않습니다
						<%} %>
					</div>
					<div style="margin-left: 60px; margin-top: 20px;">
						<p>
							<a href="<%=request.getContextPath()%>/views/loginForm.jsp"><input
								type="button" id="addButton" value="로그인"></a> <a
								href="<%=request.getContextPath()%>/views/Searchidpwd.jsp"><input
								type="button" id="addButton" value="비밀번호 찾기"></a>
						</p>
					</div>
					<br>
					<br>
					<br>
					<br> <a id="showHere"></a>
					<!-- a 링크가 있어야 움직였을때 스크롤바 생성 가능-->
				</div>
			</div>
		</div>
	</div>






	<%@ include file="common/footer.jsp"%>



	<!---------------------------------------------------------------->
	<a href="#" id="nino-scrollToTop">Go to Top</a>
	<script>
		function idSearch(){
			location.href = "<%=request.getContextPath()%>/idSearchServlet.do?email="+$('#user_email').val()
		}
	</script>
	<script>
	function pwdSearch(){
			location.href = "<%=request.getContextPath()%>/pwdSearchServlet.do?userid="+$('#user_id').val()
		}
	</script>
</body>

</html>