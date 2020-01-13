<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.question.model.vo.*"%>

<%@page import="java.util.ArrayList"%>
<%
	Question q = (Question)request.getAttribute("question");
	
	// 댓글 리스트
	ArrayList<QuestionComment> clist = (ArrayList<QuestionComment>)request.getAttribute("clist");

%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- CSS 파일 -->
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/images/ico/favicon.png">
<!-- 웹 브라우저 아이콘 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" />
<!-- 부트 스트랩 CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/HeaderMenu.css">
<!-- 헤더 메뉴 CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/headhesive.css">
<!-- 헤더 메뉴 스크롤 CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/default.css" />
<!-- 레이아웃 배치 전용 CSS -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/mainPage.css" />
<!-- 메인 페이지 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/component.css" />
	
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/questionBoard.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/demo.css" />	
<!-- 메인페이지 메뉴 카테고리 CSS -->

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
<script
	src="<%=request.getContextPath()%>/resources/js/modernizr.custom.js"></script>
<!-- 메인페이지 카테고리 JS -->
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



<title>질문 게시판 상세</title>

</head>
<body style="background: url(<%=request.getContextPath()%>/resources/images/loginBackground.png);">
	<%@ include file="common/header.jsp"%>
	
	<div class="tableArea" style="width:1024px;height:780px;margin:0 auto;margin-top:40px;margin-bottom:40px;background:white;font-family: 'Nanum Gothic', sans-serif;">
	<table>
	<h2 align="center" style="padding-top:30px;"><b>문의 사항</b></h2>
	<hr style="width:90%; margin:0 auto;margin-top:20px; border:1px solid #CED8F6;">
	<% if(m != null ) { %>
			<tr>
				<td style="font-size:20px;color:black;padding-left:50px;padding-top:15px;">제목 : </td>
            	<td colspan="3" style="padding-left:20px;padding-top:15px;"><%= q.getTitle() %></td>
			</tr>
			<tr>
				<td style="font-size:20px;color:black;padding-left:50px;padding-top:15px;">작성자 : </td>
            	<td style="padding-left:20px;padding-top:15px;"><%= q.getWriter() %></td>
			</tr>
			<tr>
            	<td style="font-size:20px;color:black;padding-left:50px;padding-top:15px;">작성일 : </td>
            	<td style="padding-left:20px;padding-top:15px;"><%= q.getDate() %></td>
            </tr>
			<tr>
				<td style="font-size:20px;color:black;padding-left:50px;padding-top:15px;">내용 : </td>
            	<td style="padding-left:20px;padding-top:15px;">
				<span><%= q.getContent().charAt(0) %></span><%= q.getContent().substring(1) %>
				</td>
			</tr>
			</table>

		<%-- <button onclick="location.href='qUpview.do?no=<%=q.getNo()%>'">수정하기</button> --%>
		<% if(q.getWriter().equals(m.getUserId())){ %> <!-- 동일 아이디 아니면 수정하기 버튼 안보이도록 가려놓음-->
		<button id="questionBtn" class="btn btn-primary" style="margin-left:50px;margin-top:150px;" onclick="location.href='<%=request.getContextPath()%>/qUpview.do?no=<%=q.getNo()%>'">수정하기</button>
		<%} %>
      	<button id="questionBtn" class="btn btn-info" style="margin-left:10px;margin-top:150px;" onclick="location.href='<%=request.getContextPath()%>/qList.do'">목록으로 돌아가기</button>	
			
		<div class="replyArea">
			<div class="replyWriteArea" style="margin-top:20px;">
				<form id="CommentForm" action="/semiProject/qComment.do" method="post">
					<input type="hidden" name="cwriter" value="<%=m.getUserId()%>" />
					<input type="hidden" name="no" value="<%=q.getNo()%>" /> 
					<input type="hidden" name="refcno" value="0" /> 
					<input type="hidden" name="clevel" value="1" />
					<table align="center" style="margin-left:50px;">
						<tr>
							<td>댓글 작성</td>
							<td style="padding-left:20px;"><textArea rows="2" cols="80" id="replyContent"
                           	name="replyContent" style="resize: none;"></textArea></td>
                     		<td style="padding-left:20px;"><button type="submit" id="addReply" class="btn btn-primary">댓글 등록</button></td>
						</tr>
					</table>
				</form>
			</div>

			<div id="replySelectArea">
				<!--게시글의 댓글들 보여주는 부분  -->
				<% if (clist != null){ %>
				<% for(QuestionComment qco : clist) { %>

				<table id="replySelectTable"
					style="margin-left : 50px;
					width : <%= 800 - ((qco.getClevel()-1) * 15) %>px;"
					class="replyList<%=qco.getClevel() %>">
					<tr>
						<td rowspan="2"></td>
						<td><b><%= qco.getCwriter() %></b></td>
						<td><%= qco.getCdate() %></td>
						<td align="center">
							<%if(m.getUserId().equals(qco.getCwriter())) {%> <input
							type="hidden" name="cno" value="<%=qco.getCno() %>" />

							<button type="button" class="updateBtn" id="questionBtn3"
								onclick="updateReply(this);">수정하기</button>
							<button type="button" class="updateConfirm" id="questionBtn3" style="display:none" onclick="updateConfirm(this);">수정완료</button>
							&nbsp;&nbsp;

							<button type="button" class="deleteBtn" id="questionBtn2" style="width:80px;height:30px;font-size:14px;" 
								onclick="deleteReply(this);">삭제하기</button> 
								<% } else if (qco.getClevel() <3) { %>
								
							<input type="hidden" name="cwriter" value="<%=m.getUserId() %>" />
							<input type="hidden" name="refcno" value="<%= qco.getCno() %>" />
							<input type="hidden" name="clevel" value="<%= qco.getClevel() %>" />
							<button type="button" class="insertBtn"
								onclick="reComment(this);">댓글 달기</button>&nbsp;&nbsp;

							<button type="button" class="insertConfirm"
								onclick="reConfirm(this);"
								style="display: none;">댓글 추가완료</button> 
								<% } else {%> 
								<span> 마지막 레벨입니다.</span> <% } %>
						</td>
					</tr>
					<tr class="comment replyList<%=qco.getClevel()%>">
					<td colspan="3" style="background: transparent;">
					<textarea  class="reply-content" cols="90" rows="2" 
					readonly="readonly"  style="resize: none;"><%= qco.getCcontent() %></textarea>
						</td>
					</tr>
				</table>
				
				<% }  } else {%>
				<p>현재 등록된 댓글이 없습니다.</p>
				<% } %>

			</div>
		</div>

	</div>
	<script>
		function updateReply(obj){
			 $(obj).parent().parent().next().find('textarea')
		      .removeAttr('readonly');
		      
		      // 수정 완료 버튼을 화면 보이게 하기
		      $(obj).siblings('.updateConfirm').css('display','inline');
		      
		      // 수정하기 버튼 숨기기
		      $(obj).css('display', 'none');
			
		}
		
		function updateConfirm(obj) {
		      // 댓글의 내용 가져오기
		      var content
		        = $(obj).parent().parent().next().find('textarea').val();
		      
		      // 댓글의 번호 가져오기
		      var cno = $(obj).siblings('input').val();
		      
		      // 게시글 번호 가져오기
		      var no = '<%=q.getNo()%>';
		      
		      location.href="/semiProject/updateComment.do?" 
		             +"cno="+cno+"&no="+no+"&content="+content;
		   }
		
		
		function deleteReply(obj) {
			if(confirm('삭제 하시겠습니까?') ==true){
		      // 댓글의 번호 가져오기
		      var cno = $(obj).siblings('input').val();
		      
		      // 게시글 번호 가져오기
		      var no = '<%=q.getNo()%>';
		      
		      location.href="/semiProject/deleteComment.do"
		      +"?cno="+cno+"&no="+no;
				
		      alert("삭제 완료")
			}else{
				return;
			}
			
		   }
		

		function reComment(obj){
		      // 추가 완료 버튼을 화면 보이게 하기
		      $(obj).siblings('.insertConfirm').css('display','inline');
		      
		      // 클릭한 버튼 숨기기
		      $(obj).css('display', 'none');
		      
		      // 내용 입력 공간 만들기
		      var htmlForm = 
		         '<tr class="comment"><td></td>'
		            +'<td colspan="3" style="background : transparent;">'
		               + '<textarea class="reply-content" style="background : ivory;" cols="105" rows="3"></textarea>'
		            + '</td>'
		         + '</tr>';
		      
		      $(obj).parents('table').append(htmlForm);
 	
		}
		
		function reConfirm(obj) {
		      // 댓글의 내용 가져오기
		      
		      // 참조할 댓글의 번호 가져오기
		      var refcno = $(obj).siblings('input[name="refcno"]').val();
		      var level = Number($(obj).siblings('input[name="clevel"]').val()) + 1;
		      
		      // console.log(refcno + " : " + level);
		      
		      // 게시글 번호 가져오기
		      var no = '<%=q.getNo() %>';
		      
		      var parent = $(obj).parent();
		      var grandparent = parent.parent();
		      var siblingsTR = grandparent.siblings().last();
		      
		      var content = siblingsTR.find('textarea').val();
		      
		      location.href='/semiProject/qComment.do'
		                 + '?cwriter=<%= m.getUserId() %>' 
		                 + '&replyContent=' + content
		                 + '&no=' + no
		                 + '&refcno=' + refcno
		                 + '&clevel=' + level;
		   }
	</script>
	<% } else {
      request.setAttribute("msg", "회원만 가능한 서비스 입니다.");
      request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
   }%>
	<%-- <% if( m != null && m.getUserId().equals("admin")) { %>
		<button onclick="location.href='nUpView.no?nno=<%=q.getNo()%>'">수정하기</button>
	<% } %> --%>
	<%@ include file="common/footer.jsp"%>
</body>
</html>