<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
 String radio = (String)request.getParameter("radio");
    System.out.println(radio);
%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ZeroNine</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>

<%--    <%@include file="../resources/css/bootstrap.min.css"%> --%>
<%--    <%@include file="../resources/css/HeaderMenu.css"%> --%>
<%--    <%@include file="../resources/css/headhesive.css"%> --%>
<%--    <%@include file="../resources/css/mainPage.css"%> --%>
<%--    <%@include file="../resources/css/default.css"%> --%>
<%--    <%@include file="../resources/css/signUpstyle.css"%> --%>
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
        
                    <!-- <img src="images/signup-bg.jpg" alt=""> -->
                    <div class="container">
                        <div class="signup-content">
                            <form name="signform" method="POST" id="signup-form" class="signup-form" action="<%=request.getContextPath()%>/mInsert.me">
                                <h2 class="form-title">Create account</h2>
                                <div class="form-group">
                                    <input type="text" class="form-input2" name="userId" id="userId" placeholder="아이디 입력" required/>
                                    <input type="button" id="addButton" for="open-pop" value="중복 확인" onclick="idcheck();">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-input" name="userName" id="userName" placeholder="이름 입력" required/>
                                </div>
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



                                <div class="form-group">
                                    <input type="email" class="form-input" name="email" id="email" placeholder="이메일 입력" required/>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-input2" name="address1" id="address1" placeholder="우편번호">
                                    <input type="button" id="addButton" onclick="addrSearch();" value="우편번호 찾기">
                                </div>
                                <div class="form-group"> <input type="text" class="form-input3" name="address2" id="address2"
                                        placeholder="주소"></div>
                                <div class="form-group"> <input type="text" class="form-input3" name="address3" id="address3"
                                        placeholder="상세주소"></div>
        
                                <div class="form-group" style="margin-top:40px;">
                                    <input type="submit" name="submit" id="submit" class="form-submit" value="회원가입" onclick="insertMember();" >
                                </div>
                            </form>
                            <p class="loginhere">이미 계정을 갖고 계신가요?<a href="./loginForm.jsp" class="menuList">로그인</a>
                            </p>
                        </div>
                    </div>
        
                    <a id="showHere"></a> <!-- a 링크가 있어야 움직였을때 스크롤바 생성 가능-->
                </div>
            
        </div>
    </div>

   <%@ include file="common/footer.jsp" %>

    <div id="loginmodal" style="display:none;">
           <div style="font-size:18px;color:black;">
                <span style="color:rgb(247, 146, 64);">AAA</span>는 이미 사용중인 아이디입니다.
           </div>
           <div style="font-size:16px;margin-top:25px;">
                다른 아이디를 선택하세요.
           </div>           
    </div>

    <!---------------------------------------------------------------->
    <a href="#" id="nino-scrollToTop">Go to Top</a>
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
    var count = 0;
    function idcheck(){
			$.ajax({
				url:"<%=request.getContextPath()%>/idDup.me",
				type:"post",
				data:{userId : $('#userId').val()},
				success:function(data){
					
					//console.log(data);
					if(data == 'ok'){
						alert("사용 가능한 아이디입니다.");
						count = 0;
					}else{
						alert("이미 사용중인 아이디입니다.");
						$('#userId').select();
						count = 1;
						
					}
					
				},error:function(request,status,error){
					console.log("--- ERROR ---");
					console.log(request);
					console.log(status);
					console.log(error);
					console.log("-------------");
				}
			});
       }

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

       function insertMember() {
          var form = document.signform;
          if( !form.userId.value )   // form 에 있는 name 값이 없을 때
          {
           alert( "아이디를 적어주세요" ); // 경고창 띄움
           form.userId.focus();   // form 에 있는 name 위치로 이동
           return;
          }
          
          
          
          
          if( !form.userName.value)   // form 에 있는 name 값이 없을 때
          {
           alert( "이름을 적어주세요" ); // 경고창 띄움
           form.userName.focus();   // form 에 있는 name 위치로 이동
           return;
          }
          
          if( !form.userPwd.value || form.userPwd.value <=8)
          {
           alert( "비밀번호를 8자리 이상 적어주세요" );
           form.userPwd.focus();
           return;
          }
          
          
          
         if( !form.email.value )
          {
           alert( "이메일을 적어주세요");
           form.email.focus();
           return;
          }
         
         if(count == 1){
        	 alert("아이디가 중복됩니다.");
        	 event.preventDefault();
         }else{
        	 alert("회원가입이 완료되었습니다.");
             form.submit();
         }
         
        
         }

          
        

        
        $('#modaltrigger').leanModal({ top: 110, overlay: 0.5, closeButton: ".hidemodal" });
        function addrSearch() {
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
                   $('#address1').val(data.zonecode); //5자리 새우편번호 사용
                   
                   $('#address2').val(fullAddr);

                   // 커서를 상세주소 필드로 이동한다.
                   $('#address3').focus();
               }
           }).open();
       };
        </script>
</body>

</html>