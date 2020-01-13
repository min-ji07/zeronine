<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-with, initial-scale=1">
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
<!-- 메인페이지 메뉴 카테고리 CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/custom.css">
<title>JSA AJAX 실시간 익명 채팅사이트</title>
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
<script type="text/javascript">
	var lastID = 0;
	function submitFunction(){		
		var chatName = $('#chatName').val();
		var chatContent = $('#chatContent').val();
		$.ajax({
			type : "POST",
			url : "../chatSubmitServlet",
			data :{
				chatName 	: encodeURIComponent(chatName),
				chatContent : encodeURIComponent(chatContent)
			},
			success: function(result){
				if(result == 1){
					autoClosingAlert('#successMessage',2000);
				}else if(result == 0){
					autoClosingAlert('#dangerMessage',2000);
				}else{
					autoClosingAlert('#warningMessage',2000);
				}
			}			
		});
		$('#chatContent').val('');
	}
	function autoClosingAlert(selector,delay){
		var alert = $(selector).alert();
		alert.show();
		window.setTimeout(function() {alert.hide()},delay);		
	}
	
	function chatListFunction(type){
		//alert ('test');
		$.ajax({
			type : "POST",
			url : "../chatListServlet",
			data :{
				listType : type,
			},
			success: function(data){
				if(data == "") return;
				var parsed = JSON.parse(data);
				var result = parsed.result;
				for(var i = 0; i < result.length;i++){
					addChat(result[i][0].value, result[i][1].value, result[i][2].value);
				}
				lastID = Number(parsed.last);				
			}		
		});		
	}
	function addChat(chatName, chatContent, chatTime){		
		$('#chatList').append('<div class="row">' +
							  	'<div class="col-lg-12">' +
									'<div class="media">' +
										'<div class="media-body">' +
											'<h4 class="media-heading">' +
												chatName +
												'<span class="small pull-right" style="padding-left:400px;">' +
												chatTime	 +
												'</span>' +
											'</h4>' +
											'<p>' +
											chatContent +
											'</p>' +
										'</div>' +
									'</div>' +
								'</div>' +
							 '</div>' +
							'<hr>');
						$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
							
	}
	function getInfiniteChat(){
		setInterval(function(){
			chatListFunction(lastID);
		},1000)
	}
</script>
</head>
<body style="background: url(../resources/images/loginBackground.png);">
<%@ include file="common/header.jsp"%>
	<div class="container" style="margin-top:20px;">
		<div class="container bootstrap snippet">
			<div class="row">
				<div class="col-xs-12">
					<div class="portlet portlet-default">
						<div class="portlet-heading">
							<div class="portlet-title">
								<h4><i class="fa fa-circle text-green"></i>제로나인 채팅문의</h4>
							</div>
							<div class="clearfix"></div>
						</div>
						<div id="chat" class="panel-collapse collapse in">
							<div id="chatList" class="portlet-body chat-widget" style="overflow-y: auto; width:auto; height:600px">
																
							</div>
							<div class="portlet-footer">
								<div class="row">
									<div class="form-group col-xs-4">
										<input style="height:40px;" type="text" id="chatName" class="form-control" placeholder="이름" maxlength="20">											
									</div>
								</div>
								<div class="row" style="height:90px">
									<div class="form-group col-xs-10">
										<textarea style="height:80px;" id="chatContent" class="form-control" placeholder="메세지를 입력하세요" maxlength="100"></textarea>					
									</div>
									<div class="form-group col-xs-2">
										<button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="alert alert-success" id="successMessage" style="display:none;">
		<strong>메세지전송에 성공했습니다</strong>	
		</div>
		<div class="alert alert-danger" id="dangerMessage" style="display:none;">
			<strong>이름과 내용을 확인해주세요</strong>	
		</div>
		<div class="alert alert-warning" id="warningMessage" style="display:none;">
			<strong>메세지전송 실패</strong>	
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){
			chatListFunction('ten');
			getInfiniteChat();
		})
	</script>
</body>
</html>