<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.question.model.vo.*"%>
    
<%
	Question q = (Question)request.getAttribute("question");
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- CSS 파일 -->
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/images/ico/favicon.png"> <!-- 웹 브라우저 아이콘 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" /> <!-- 부트 스트랩 CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/HeaderMenu.css"> <!-- 헤더 메뉴 CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/headhesive.css"> <!-- 헤더 메뉴 스크롤 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/default.css" /> <!-- 레이아웃 배치 전용 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mainPage.css" /> <!-- 메인 페이지 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/component.css" /> <!-- 메인페이지 메뉴 카테고리 CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/questionBoard.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/demo.css" />
<!-- JS 파일 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/headhesive.js"></script> <!-- 헤더메뉴 JS -->
<script src="<%=request.getContextPath()%>/resources/js/modernizr.custom.js"></script> <!-- 메인페이지 카테고리 JS -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.prettyPhoto.js"></script> <!-- 스크롤 JS -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.mCustomScrollbar.concat.min.js"></script> <!-- 스크롤 JS -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/unslider-min.js"></script> <!-- 스크롤 JS -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/template.js"></script> <!-- 스크롤 JS -->



<title>질문 수정</title>

</head>
<body style="background: url(<%=request.getContextPath()%>/resources/images/loginBackground.png);">
<%@ include file="common/header.jsp" %>
	<div class = "tableArea" style="width:1024px;height:750px;margin:0 auto;margin-top:40px;margin-bottom:40px;background:white;font-family: 'Nanum Gothic', sans-serif;">
	<h2 align="center" style="padding-top:30px;"><b>문의 사항 수정</b></h2>
	<hr style="width:90%; margin:0 auto;margin-top:20px; border:1px solid #CED8F6;">
	<form id="updateForm" method="post">
	<table>
		<%-- <tr>
			<td>제목 </td>
			<td colspan="3">
				<input type ="text" name ="title"
				value="<%= q.getTitle() %>">
				<input type="hidden" name="no" value="<%= q.getNo() %>">
			</td>
		</tr>
		<tr>
			<td>작성자 </td>
			<td>
				<input type="text" value="<%= q.getWriter() %>" name ="writer" readonly>
			</td>
			<td>작성일 </td>
			<td><input type="date" name="date" value="<%= q.getDate() %>"></td>
		</tr> --%>
		
		<tr>
			<td style="font-size:20px;color:black;padding-left:50px;padding-top:15px;">제목 : 
				<span style="margin-left:20px;"><input type="text" name ="title" value="<%= q.getTitle() %>"></span></td>
				<input type="hidden" name="no" value="<%= q.getNo() %>">
			</tr>
		<tr>
			<td style="font-size:20px;color:black;padding-left:50px;padding-top:15px;">작성자 : 
           		<span style="margin-left:10px;"><%= q.getWriter() %></span></td>
           	<%-- <td>
				<input type="text" value="<%= q.getWriter() %>" name ="writer" readonly>
			</td> --%>
		</tr>
		<tr>
           	<td style="font-size:20px;color:black;padding-left:50px;padding-top:15px;">작성일 :
           	<span style="margin-left:10px;"><%= q.getDate() %></span></td>
          </tr>
		
		<tr>
			<td style="font-size:20px;color:black;padding-left:50px;padding-top:15px;">내용 : </td>
		</tr>
		<tr>
			<td><br>
				<span style="margin-left:50px;"><textarea name= "content" cols="60" rows="3" style="resize:none;"><%= q.getContent() %></textarea></span>
			</td>
		</tr>
	</table>
	<br>
	<div align="center">
		<button id="questionBtn" style="background:#0174DF;" onclick="complete();">작성완료</button>
		<button id="questionBtn" onclick="deleteQuestion();">삭제하기</button>
	</div>
	<script>
		function complete(){
			$("#updateForm").attr("action","<%=request.getContextPath() %>/qUpdate.do");
			
		}
		
		function deleteQuestion(){
			if(confirm('삭제 하시겠습니까?') ==true){
			// delete 는 예약어 이므로 deleteNotice 로 ...!
			$("#updateForm").attr("action","<%=request.getContextPath() %>/qdelete.do");
				alert("삭제완료");
			}else{
				return;
			}
			
		}
	
	</script>
	</form>
	
	
	
	
	
	<%-- <% if( m != null && m.getUserId().equals("admin")) { %>
		<button onclick="location.href='nUpView.no?nno=<%=q.getNo()%>'">수정하기</button>
	<% } %> --%>
	
	</div>
	



<%@ include file="common/footer.jsp" %>
</body>
</html>