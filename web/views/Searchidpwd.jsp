<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ZeroNine</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <!-- CSS 파일 -->
<!--     <style> -->
<%--    <%@include file="../resources/css/HeaderMenu.css"%> --%>
<%--    <%@include file="../resources/css/bootstrap.min.css"%> --%>
<%--    <%@include file="../resources/css/materialdesignicons.min.css"%> --%>
<%--    <%@include file="../resources/css/default.css"%> --%>
<%--    <%@include file="../resources/css/headhesive.css"%> --%>
<%--    <%@include file="../resources/css/signUpstyle.css"%> --%>
<!--    </style> -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/images/ico/favicon.png"> <!-- 웹 브라우저 아이콘 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/HeaderMenu.css"> <!-- 헤더 메뉴 -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" /> <!-- 부트 스트랩 -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/materialdesignicons.min.css" /> <!-- 아이콘 -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/default.css" /> <!-- 전체 페이지 레이아웃 CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/headhesive.css"> <!-- 헤더 메뉴 스크롤 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/eclipse.css?v3">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/signUpstyle.css"> <!-- 아이디 / 비밀번호 찾기 CSS -->
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
        <div id="idpwdContainer">
         <div style="padding-top:100px;margin:0 auto;">
                <div class="signup-content">
                            <div style="text-align: center;font-size:20px;color:black;font-weight:bold;">
                                          회원님의 아이디를 잊으셨나요?
                            </div>
                            <div style="text-align: center;font-size:17px;">
                                          이메일 주소를 입력해주세요.
                            </div>
                        <div class="form-group" style="margin-top:20px;">
                            <input type="text" class="form-input" name="email" id="user_email" placeholder="이메일 주소" />
                        </div>
                       
                        <div style="margin-left:125px;">
                            <p><input type="button" id="addButton" value="아이디 찾기"   onclick="idSearch();">            
                        </div>   
                        <br><br>
<!--                         2.폼
                       <form method="get" action="/semiProject09-01/pwdSearchServlet.do">
                        
                        <div style="text-align: center;font-size:20px;color:black;font-weight:bold;">
                                회원님의 비밀번호를 잊으셨나요?
                        </div>
                        <div style="text-align: center;font-size:17px;">
                                ID와 이메일 주소를 입력해주세요.
                        </div>
                        <div class="form-group" style="margin-top:20px;">
                                <input type="text" class="form-input" name="id" id="user_id" placeholder="아이디 주소" />
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-input" name="email2" id="user_email2" placeholder="이메일 주소" /> 
                            </div> 
                            <div style="margin-left:125px;">
                                  <p><a href="./SearchPwdResult.jsp"> 
                                   <input type="submit" id="addButton" value="비밀번호 찾기"> 
                            </div>

                      </form>  -->
                      
                      <form method="get" action="<%=request.getContextPath()%>/rePwdServlet.do">
                         <div style="text-align: center;font-size:20px;color:black;font-weight:bold;">
                                      회원님의 비밀번호를 잊으셨나요?
                        </div>
                        <div style="text-align: center;font-size:17px;">
                                ID와 이메일 주소를 입력해주세요.
                        </div>
                        <div class="form-group" style="margin-top:20px;">
                                <input type="text" class="form-input" name="id" id="user_id" placeholder="아이디 주소" />
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-input" name="email2" id="user_email2" placeholder="이메일 주소" /> 
                            </div> 
                            <div style="margin-left:125px;">
                                   <p><a href="<%=request.getContextPath()%>/views/updatePwd.jsp"> 
                                   <input type="submit" id="addButton" value="비밀번호 재설정"> </a>
                            </div>
                      
                      </form>
             

            <a id="showHere"></a> <!-- a 링크가 있어야 움직였을때 스크롤바 생성 가능-->
        </div>
      </div>
        </div>
    </div>






   <%@ include file="common/footer.jsp" %>



    <!---------------------------------------------------------------->
    <a href="#" id="nino-scrollToTop">Go to Top</a>
  <script>
      function idSearch(){
         location.href = "<%=request.getContextPath()%>/idSearchServlet.do?email="+$('#user_email').val()
      }
   </script>
    
</body>

</html>