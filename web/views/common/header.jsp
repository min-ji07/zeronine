<%@ page language="java" contentType="text/html; charset=UTF-8" 
pageEncoding="UTF-8" import="com.member.model.vo.*"%>
<%
	Member m = (Member)session.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
    <header class="banner">
        <!-- 헤더 베너 메뉴 -->
        <div id="bannerWidth">
            <div id="logo" onclick="Home()" style="cursor:pointer;">
                <!-- 좌측 로고 DIV -->
                <a href="<%=request.getContextPath()%>/views/ZeroNineMainPage.jsp">
                <img src="<%=request.getContextPath()%>/resources/images/mainLogo.jpg" id="logoImage">
                </a>
            </div>
            <%if ( m == null ) { %>
            <div id="menu">
                <!-- 우측 메뉴 DIV -->
                <ul>
                    <li><a href="<%=request.getContextPath()%>/views/ZeroNineMainPage.jsp" class="menuList" id="menuListHome">HOME</a>
                    </li>
                    <li><a href="<%=request.getContextPath()%>/views/loginForm.jsp" class="menuList">로그인</a></li>
                    <li><a href="<%=request.getContextPath()%>/views/signUpForm.jsp" class="menuList">회원가입</a></li>
                </ul>
            </div>           
            <% } else { %>
	            <% if(( m.getUserId().equals("admin") )){%>
	            <div id="menu">
	                <!-- 우측 메뉴 DIV -->
	                <ul>
	                	<li><a href="<%=request.getContextPath()%>/memberselect.me" class="menuList">관리자</a></li>
	                    <li><a href="<%=request.getContextPath()%>/views/loginForm.jsp" class="menuList" id="menuListHome">HOME</a>
	                    </li>	                    
	                    <li><a href="<%=request.getContextPath()%>/views/myPage.jsp" class="menuList">마이페이지</a></li>
	                    <li><a href="/semiProject/logout.me" class="menuList">로그아웃</a></li>
	                </ul>
	            </div>
	            <%}else{ %>
	            <div id="menu">
	                <!-- 우측 메뉴 DIV -->
	                <ul>	                	
	                    <li><a href="<%=request.getContextPath()%>/views/loginForm.jsp" class="menuList" id="menuListHome">HOME</a>
	                    </li>                  
	                    <li><a href="<%=request.getContextPath()%>/views/myPage.jsp" class="menuList">마이페이지</a></li>
	                    <li><a href="/semiProject/logout.me" class="menuList">로그아웃</a></li>
	                </ul>
	            </div>
            	<% } %>
            <%} %>
        </div>
    </header>
</body>
</html>