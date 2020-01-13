<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.member.model.vo.*"%>
<%@page import="com.product.model.vo.*"%>
<%
	PageInfo pi = (PageInfo) session.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZeroNine</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

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
<!-- 메인페이지 메뉴 카테고리 CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/custom.css">
<!-- 채팅 CSS -->
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
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/chat.js"></script>
<!-- 채팅 전용 JS -->
</head>
<body>
	<%@ include file="common/header.jsp"%>
	<!-- 전체 레이아웃 틀  DIV -->
	<div id="container1">
		<div id="container1Text">
			<!-- 슬라이드 배너 DIV -->
			<section id="nino-slider" class="carousel slide container"
				data-ride="carousel">
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<h4 class="nino-sectionHeading">
							<span class="nino-subHeading">Group Buying Site</span> Zero Nine
						</h4>
						<span id="itemTitle"> 공동구매 사이트 제로나인에서 간단하게 상품 판매 / 구매를
							시작해보세요. </span> <br>
						<%if ( session.getAttribute("member") != null ) { %>
						<a href="<%=request.getContextPath()%>/views/itemAddPage2.jsp">
							<span id="itemButton"><button id="itemButton1">#
									상품 판매 하기</button></span>
						</a>
						<% } else { %>
						<a href="<%=request.getContextPath()%>/views/loginForm.jsp"> <span
							id="itemButton"><button id="itemButton1"># 상품 판매 하기</button></span>
						</a>
						<% } %>
					</div>
				</div>

			</section>
			<!-- 슬라이드 배너 -->
		</div>
	</div>

	<div id="mainContainer">
		<div id="container2">
			<a id="showHere"></a>
			<!-- 중간 컨텐츠 영역 레이아웃 DIV -->
			<div id="container2Div">

				<div class="main clearfix">
					<nav id="categoryMenu" class="nav">
						<ul>
							<li><a
								href="<%=request.getContextPath()%>/selectProductList.do?radio=1">
									<span class="icon"> <i aria-hidden="true"> <img
											src="<%=request.getContextPath()%>/resources/images/mainCategory/category1.png">
									</i>
								</span> <span># 의류</span>
							</a></li>
							<li><a
								href="<%=request.getContextPath()%>/selectProductList.do?radio=2">
									<span class="icon"> <i aria-hidden="true"> <img
											src="<%=request.getContextPath()%>/resources/images/mainCategory/category2.png">
									</i>
								</span> <span># 문화/레저</span>
							</a></li>
							<li><a
								href="<%=request.getContextPath()%>/selectProductList.do?radio=3">
									<span class="icon"> <i aria-hidden="true"> <img
											src="<%=request.getContextPath()%>/resources/images/mainCategory/category3.png">
									</i>
								</span> <span># 애완 용품</span>
							</a></li>
							<li><a
								href="<%=request.getContextPath()%>/selectProductList.do?radio=4">
									<span class="icon"> <i aria-hidden="true"> <img
											src="<%=request.getContextPath()%>/resources/images/mainCategory/category4.png">
									</i>
								</span> <span># 악세사리</span>
							</a></li>
							<li><a href="<%=request.getContextPath()%>/qList.do"> <span class="icon">
										<i aria-hidden="true"> <img
											src="<%=request.getContextPath()%>/resources/images/mainCategory/category5.png">
									</i>
								</span> <span># 고객 센터</span>
							</a></li>
							<li><a href="<%=request.getContextPath()%>/views/index.jsp" class="open"> <span class="icon">
										<i aria-hidden="true"> <img
											src="<%=request.getContextPath()%>/resources/images/mainCategory/category6.png">
									</i>
								</span> <span># 채팅</span>
							</a></li>
						</ul>
					</nav>
				</div>
			</div>
			<br> <br>

			<div id="padding-content">
				<br>
				<h2 class="nino-sectionHeading"># Best Item</h2>
			</div>
			<div id="container3">
				<section id="BestSellerList" class="top3Section">
					
			</div>

		</div>

		<br>
	</div>

	<section id="nino-counting">
<!-- 		<div id="nino-counting-Container"> -->
<!-- 			<div layout="row" class="verticalStretch"> -->
<!-- 				<div class="item"> -->
<!-- 					<div class="number">10</div> -->
<!-- 					<div class="text">의류 상품 개수</div> -->
<!-- 				</div> -->
<!-- 				<div class="item"> -->
<!-- 					<div class="number">20</div> -->
<!-- 					<div class="text">문화/레저 상품 개수</div> -->
<!-- 				</div> -->
<!-- 				<div class="item"> -->
<!-- 					<div class="number">30</div> -->
<!-- 					<div class="text">애완 용품 상품 개수</div> -->
<!-- 				</div> -->
<!-- 				<div class="item"> -->
<!-- 					<div class="number">40</div> -->
<!-- 					<div class="text">악세사리 상품 개수</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
	</section>
	<%@ include file="common/footer.jsp"%>

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
	<script> 
		$(document).ready(function() {
			$.ajax({
		          url: "<%=request.getContextPath()%>/top3Select.do",
		          type: "get",
	     	  dataType : 'JSON',                   
		          success: function (data) {
		        	$('.top3Section').html(data.data);
		         },error: function(data){
		            	alert("실패");
					}
		         });
 	});
</script>
</body>
</html>