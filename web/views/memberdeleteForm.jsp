<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 탈퇴</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
<%-- 	<%@include file="../resources/css/bootstrap.min.css"%> --%>
<%-- 	<%@include file="../resources/css/HeaderMenu.css"%> --%>
<%-- 	<%@include file="../resources/css/headhesive.css"%> --%>
<%-- 	<%@include file="../resources/css/mainPage.css"%> --%>
<%-- 	<%@include file="../resources/css/default.css"%> --%>
<%-- 	<%@include file="../resources/css/signUpstyle.css"%> --%>
</style>
	<!-- CSS 파일 -->
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" /> <!-- 부트 스트랩 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/HeaderMenu.css"> <!-- 헤더 메뉴 -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/headhesive.css"> <!-- 헤더 메뉴 스크롤 -->
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/images/ico/favicon.png"> <!-- 웹 브라우저 아이콘 -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/default.css" /> <!--  전체 레이아웃 CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/signUpstyle.css"> <!-- 회원 가입 CSS -->
	<!-- JS 파일 -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/headhesive.js"></script> <!-- 헤더메뉴 JS -->
	<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.prettyPhoto.js"></script> <!-- 스크롤 JS -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.mCustomScrollbar.concat.min.js"></script> <!-- 스크롤 JS -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/unslider-min.js"></script> <!-- 스크롤 JS -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/template.js"></script> <!-- 스크롤 JS -->  
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/resources/js/jquery.leanModal.min.js"></script> <!-- 레이어 팝업 -->
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>

<!-- 레이아웃 페이지 스타일은 mainPageLayOut.css에 적용되어 있음-->

<body style="background: url(../resources/images/loginBackground.png);">
<%@ include file="common/header.jsp" %>
    <!-- 전체 레이아웃 틀 ( container ) DIV -->


    <div>
        <div id="signUpContainer">
                <!-- 임시적으로 스타일 지정 -->
                <!-- 중간 컨텐츠 영역 레이아웃 DIV -->
                <div style="padding-top:30px;margin:0 auto;">
                    <div class="container">
                        <div class="signup-content">
                            <form method="POST" id="signup-form" class="signup-form" action="<%=request.getContextPath()%>/MemberDeleteServlet.do">
                                <h2 class="form-title">탈퇴하시겠습니까?</h2>
                                <div class="form-group">
                                    <p><strong>이름 : <%= m.getUserName() %></strong></p><br>
                                </div>
                                <div class="form-group">
                                    <p><strong>회원 아이디 : <%= m.getUserId() %></strong></p><br>
                                </div>
                                <div class="form-group">
                                    <p><strong>회원 이메일 : <%= m.getEmail() %></strong></p><br>
                                </div>
                                <div class="form-group">
                                	<p><strong>회원 주소 :<br><br> <%= m.getAddress1() %></strong></p>
                                </div>
                                <div class="form-group"> 
                                	<p><strong><%= m.getAddress2() %></strong></p>
                                </div>
                                <div class="form-group"> 
                                	<p><strong><%= m.getAddress3() %></strong></p>
                                </div>
                                <br><br><br><br><br>
                                <div class="form-group"> 
                                	<p>회원님의 개인정보, 거래내역 및 모든 기록이 삭제되며<br>복구하실 수 없습니다.
                                				정말로 탈퇴하시겠습니까?</p>
                                </div>
                                <div class="form-group" style="margin-top:40px;">
                                    <a href="<%=request.getContextPath()%>/views/myPage.jsp"></a><input type="submit" name="submit" id="submit" class="form-submit" value="탈퇴하겠습니다~!" onclick="deleteMember();">
                                </div>
                            </form>
                        </div>
                    </div>
        
                    <a id="showHere"></a> <!-- a 링크가 있어야 움직였을때 스크롤바 생성 가능-->
                </div>
            
        </div>
    </div>

	<%@ include file="common/footer.jsp" %>

    <!---------------------------------------------------------------->
    <a href="#" id="nino-scrollToTop">Go to Top</a>
    
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
    <script type="text/javascript">
    	function deleteMember() {
		$("#signup-form").submit();
		alert("회원탈퇴가 완료되었습니다.");
		}
        
   	</script>
</body>

</html>