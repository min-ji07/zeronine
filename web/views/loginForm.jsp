<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>ZeroNine</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
	<link href="http://weloveiconfonts.com/api/?family=fontawesome" rel="stylesheet">
	<!-- CSS 파일 -->
<!-- 	<style> -->
<%-- 	<%@include file="../resources/css/bootstrap.min.css"%> --%>
<%-- 	<%@include file="../resources/css/HeaderMenu.css"%> --%>
<%-- 	<%@include file="../resources/css/headhesive.css"%> --%>
<%-- 	<%@include file="../resources/css/default.css"%> --%>
<%-- 	<%@include file="../resources/css/loginStyle.css"%> --%>
<!-- </style> -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" /> <!-- 부트 스트랩 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/HeaderMenu.css"> <!-- 헤더 메뉴 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/headhesive.css"> <!-- 헤더 메뉴 스크롤 -->
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/images/ico/favicon.png"> <!-- 웹 브라우저 아이콘 -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/default.css" /> <!-- 레이아웃 배치 전용 CSS -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/loginStyle.css" /> <!-- 로그인 페이지 CSS -->
	<!-- JS 파일 -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/headhesive.js"></script> <!-- 헤더메뉴 JS -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.prettyPhoto.js"></script> <!-- 스크롤 JS -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.mCustomScrollbar.concat.min.js"></script> <!-- 스크롤 JS -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/unslider-min.js"></script> <!-- 스크롤 JS -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/template.js"></script> <!-- 스크롤 JS -->
</head>

<!-- 레이아웃 페이지 스타일은 mainPageLayOut.css에 적용되어 있음-->

<body style="background: url(../resources/images/loginBackground.png);">
    <%@ include file="common/header.jsp" %>
	<!-- 전체 레이아웃 틀 ( container ) DIV -->
    <div>
        <div id="LoginContainer">
			<div style="padding-top:100px;margin:0 auto;">
			    <div id="LoginContainer1-1">
						<form id="loginForm" action="<%=request.getContextPath()%>/login.me" method="post">							
							<fieldset class="clearfix">
								<div style="margin-bottom: 20px;">
										<img src="<%=request.getContextPath()%>/resources/images/logoIcon.png" id="logoImage"><br>
								</div>
								<p><span class="fontawesome-user"></span><input type="text" name="userId" placeholder="아이디"></p> 
								<p><span class="fontawesome-lock"></span><input type="password" name="userPwd" placeholder="********"></p> 
								<p><input type="submit" value="로그인" onclick='login()'></p>
							</fieldset>				
						</form>
						<br>
						<p><a href="./signUpForm.jsp" id="signUpLink">회원 가입  </a><span class="fontawesome-arrow-right"></span></p>
						<br>
						<p><a href="./Searchidpwd.jsp" id="signUpLink">아이디/비밀번호 찾기</a>  </a><span class="fontawesome-arrow-right"></span></p>
					</div>
			<a id="showHere"></a> <!-- a 링크가 있어야 움직였을때 스크롤바 생성 가능-->
		</div>
        </div>
    </div>
	<%@ include file="common/footer.jsp" %>



	<!---------------------------------------------------------------->
	<a href="#" id="nino-scrollToTop">Go to Top</a>
	<!-- JS 파일 -->
	<script>
		function login(){
			$('#loginForm').submit();
		}
	</script>
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
</body>

</html>