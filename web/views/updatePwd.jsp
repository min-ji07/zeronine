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
    <!-- CSS 파일 -->
<!--     <style> -->
<%--     <%@include file="../resources/css/HeaderMenu.css"%> --%>
<%--    <%@include file="../resources/css/headhesive.css"%> --%>
<%--    <%@include file="../resources/css/default.css"%> --%>
<%--    <%@include file="../resources/css/bootstrap.min.css"%> --%>
<%--    <%@include file="../resources/fonts/material-icon/css/material-design-iconic-font.min.css"%> --%>
<%--    <%@include file="../resources/css/signUpstyle.css"%> --%>
<!--     </style> -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/HeaderMenu.css"> <!-- 헤더 메뉴 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/headhesive.css"> <!-- 헤더 메뉴 스크롤 -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/default.css" /> <!-- 전체 페이지 CSS -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" /> <!-- 부트 스트랩 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/fonts/material-icon/css/material-design-iconic-font.min.css">
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

<body style="height:900px;background: url(./resources/images/loginBackground.png);">
     <%@ include file="common/header.jsp" %>
    <!-- 전체 레이아웃 틀 ( container ) DIV -->
    <div>
        <div id="idpwdContainer">
         <div style="padding-top:100px;margin:0 auto;">
                <div class="signup-content" style="width:600px;margin: 0 auto;">
                    <form method="POST" id="signup-form" class="signup-form" action="updatePwdServlet.do">
                        <h2 class="form-title">비밀번호 재설정</h2>
                        <div style="text-align: center;font-size:17px;">바꿀 비밀번호를 입력하세요</div> <br><br>

                         <div class="form-group">
                                    <input type="password" class="form-input" name="userPwd" id="password" minlength=8
                                        maxlength=20 placeholder="비밀번호 입력 (8 ~ 20 자리 이하)" required/>
                                    <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                                </div>
                                <div class="form-group">
                                    <input type="password" class="form-input" name="userPwd2" id="re_password" minlength=8
                                        maxlength=20 placeholder="비밀번호 재입력" required/>
                                </div>
                                
                                <div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
                        <div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
                       
                       
                       
                               <div style="margin-left:120px;margin-top:35px;">
                            <p><input type="submit" id="addButton" value="수정하기">
                            
                                </p>         
                        </div>   
           </form>
                       
                        
         <a id="showHere"></a> <!-- a 링크가 있어야 움직였을때 스크롤바 생성 가능-->
      </div>
        </div>
    </div>

      <%@ include file="common/footer.jsp" %>
 <script type="text/javascript">
    $(function(){
        $("#alert-success").hide();
        $("#alert-danger").hide();
        $("input").keyup(function(){
            var pwd1=$("#password").val();
            var pwd2=$("#re_password").val();
            if(pwd1 != "" || pwd2 != ""){
                if(pwd1 == pwd2){
                    $("#alert-success").show();
                    $("#alert-danger").hide();
                    $("#submit").removeAttr("disabled");
                }else{
                    $("#alert-success").hide();
                    $("#alert-danger").show();
                    $("#submit").attr("disabled", "disabled");
                }    
            }
        });
    });
    </script>


    <!---------------------------------------------------------------->
    <a href="#" id="nino-scrollToTop">Go to Top</a>
</body>

</html>