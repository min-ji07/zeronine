<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.product.model.vo.*, java.util.*"%>
<%@page import="java.util.ArrayList"%>

<%
	ArrayList<Product> list = (ArrayList<Product>) session.getAttribute("productList");
	PageInfo pi = (PageInfo) session.getAttribute("pi");

	int listCount = pi.getListCount2();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	
%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>ZeroNine</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" />
<!-- 부트 스트랩 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/HeaderMenu.css">
<!-- 헤더 메뉴 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/headhesive.css">
<!-- 헤더 메뉴 스크롤 -->
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/resources/images/ico/favicon.png">
<!-- 웹 브라우저 아이콘 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/mainPage.css" />
<!-- 메인 페이지 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/default.css" />
<!--  메인페이지 카테고리 메뉴 배치 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/demo.css" />
<!-- menuCategory1 DIV CSS -->

<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
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
<!-- 스크롤 -->
<script type="text/javascript">

</script>
</head>

<!-- 레이아웃 페이지 스타일은 mainPageLayOut.css에 적용되어 있음-->

<body>

	<%@ include file="common/header.jsp"%>
	<!-- 전체 레이아웃 틀 ( container ) DIV -->

	<div style="background: #ffffff;">
		<div id="categoryHeader" style="height: 50px;"></div>
		<a id="showHere"></a>
		<div
			style="width: 1024px; margin: 0 auto; text-align: center; margin-top: 30px;">
			<h4 class="nino-sectionHeading" style="font-size: 30px;">#
				CULTURE</h4>
		</div>

		<div id="mainContainer2" style="width: 1024px;height:1000px; margin: 0 auto;">
			<div style="margin-left: 100px; margin-right: 100px; background: rgb(230, 230, 230); padding-bottom: 10px; padding-left: 5px;">
				<span id="itemButton" onclick="tag1Click();"><button id="itemButton2">#<span id="hashName1">티켓</span></button></span>
				<span id="itemButton" onclick="tag2Click();"><button id="itemButton2">#<span id="hashName2">문화</span></button></span> 
				<span id="itemButton" onclick="tag3Click();"><button id="itemButton2">#<span id="hashName3">사진전</span></button></span> 
				<span id="itemButton" onclick="tag4Click();"><button id="itemButton2">#<span id="hashName4">전시회</span></button></span>
			</div>


			<div id="categoryCounting"
				style="margin-left: 100px; margin-top: 10px; color: black;">
				등록제품 : ( <b style="font-size: 17px;color:rgb(199, 10, 10);"><%=pi.getListCount2()%></b> ) 개
			</div>
			<div class="form-group row pull-left" style="margin-left:85px;margin-top:5px;display:inline-block;">
				<div class="col-xs-8">
					<input class="form-control" type="text" size="35" id="search">
				</div>
				<div class="col-xs-2">
					<button class="btn btn-primary" type="button" onclick="searchButton();">검색</button>
				</div>
			</div>
			<select name="sources" id="sources" class="custom-selec"
				placeholder="- 정렬 선택 -" onchange="javascript:selectEvent(this);"
				style="margin-left: 850px;">
				<option value="1">최신 순</option>
				<option value="2">추천 순</option>
				<option value="3">저가 순</option>
				<option value="4">고가 순</option>
			</select>
			<!-- 임시적으로 스타일 지정 -->
			<!-- 중간 컨텐츠 영역 레이아웃 DIV -->

			<!-- <img src="./images/test2.png"><br> -->

			<section class="demo-2">
				<%
					for (Product p : list) {
				%>
				<div class="box" id="ajaxTable">
					<%if ( session.getAttribute("member") != null ) { %>
					<a href="<%=request.getContextPath()%>/productSelectOne.do?pno=<%= p.getPno()%>&userid=<%=m.getUserId()%>">  
					<%}else{ %>
					<a href="<%=request.getContextPath()%>/views/loginForm.jsp">
					<%} %>
					<svg width="100%" height="100%">
						<line class="top" x1="0" y1="0" x2="900" y2="0" />
						<line class="left" x1="0" y1="350" x2="0" y2="-920" />
						<line class="bottom" x1="200" y1="350" x2="-600" y2="350" />
						<line class="right" x1="200" y1="0" x2="200" y2="1380" />
					</svg>
						<div id="categoryName">
							<img
								src="${pageContext.request.contextPath}/resources/productUploadFiles/<%=p.getMainImage()%>">
						</div>
						<div id="categoryid1">
							<a href=""> <span id="ct1-1"><%=p.getMainPrice()%></span>
							<span id="ctPriceWon">원</span> 
							
							<span id="ct1-2">
							<a href="#"><i><img src="<%=request.getContextPath()%>/resources/images/CategoryIcon/icon2.png"> </i> <%=p.getLikeCount() %> </a>
							</span>
							
							</a> 
							<span id="ct2-1"><%=p.getMainTitle()%></span> 
							<span id="ct3-1">#<%=p.getHashtag1()%></span> 
							<span id="ct3-2">#<%=p.getHashtag2()%></span>
							<span id="ct3-3">#<%=p.getHashtag3()%></span> 
							<span id="ct4-1"><%=p.getWriterId() %>님의 스토어</span>
						</div>
					</a>
				</div>
				<%
					}
				%>

				<div class="pagingArea" align="center">

					<nav>
						<ul class="pagination pg-blue">
							<li class="page-item"><a class="page-link" aria-label="Previous" href="<%=request.getContextPath()%>/selectProductList.do?radio=1&currentPage=1">
									<span aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span>
							</a></li>
							<%
								for (int p = startPage; p <= endPage; p++) {
									if (p == currentPage) {
							%>
							<li class="page-item active"><a class="page-link"><%=p%></a></li>
							<%
								} else {
							%>
							<li class="page-item"><a class="page-link"
								href="<%=request.getContextPath()%>/selectProductList.do?radio=1&currentPage=<%=p%>"><%=p%></a></li>
							<%-- 						<li class="page-item"><a class="page-link"   ><%= p %></a></li> --%>
							<%
								}
							%>
							<%
								}
							%>
							<li class="page-item"><a class="page-link" aria-label="Next" href="<%=request.getContextPath()%>/selectProductList.do?radio=1&currentPage=<%=maxPage%>">
									<span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
							</a></li>
						</ul>
					</nav>
			</section>
		</div>
	</div>


	<%@ include file="common/footer.jsp"%>




	<!---------------------------------------------------------------->
	<a href="#" id="nino-scrollToTop">Go to Top</a>

	<!-- JS 파일 -->
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
		$(document).on("click",".JsonPage2",function(){  
 		$.ajax({
 			url: "<%=request.getContextPath()%>/OrderListServlet.do?radio=1&k=2",
             data : {aa :$(this).text()},
             type: "get",
             dataType : 'JSON', 
             success: function (data) {
             	$('.demo-2').html(data.data);
             },error: function(data){
             	alert("3번째 실패");
 			}
         });
		});
		$(document).on("click",".JsonPage3",function(){  
	 	    		$.ajax({
	 	    			url: "<%=request.getContextPath()%>/OrderListServlet.do?radio=2&k=3",
	 	                data : {aa :$(this).text()},
	 	                type: "get",
	 	                dataType : 'JSON', 
	 	                success: function (data) {
	 	                	$('.demo-2').html(data.data);
	 	                },error: function(data){
	 	                	alert("3번째 실패");
	 	    			}
	 	            });
	 	 });
		$(document).on("click",".JsonPage4",function(){  
	    		$.ajax({
	    			url: "<%=request.getContextPath()%>/OrderListServlet.do?radio=2&k=4",
	                data : {aa :$(this).text()},
	                type: "get",
	                dataType : 'JSON', 
	                success: function (data) {
	                	$('.demo-2').html(data.data);
	                },error: function(data){
	                	alert("3번째 실패");
	    			}
	            });
	    	});
	</script>
	<script>
    function selectEvent(selectObj) {
    	if(selectObj.value == '1'){
    		location.href = "<%=request.getContextPath()%>/selectProductList.do?radio=2&currentPage=1";
    	}
    	else if (selectObj.value == '2') {
        	$.ajax({
                url: "<%=request.getContextPath()%>/OrderListServlet.do?radio=2&k=2",		
                type: "get",
                dataType : 'JSON', 
                success: function (data) {
                	$('.demo-2').html(data.data);
                },error: function(data){
                	alert("3번째 실패");
				}
            });
         }
    	else if (selectObj.value == '3') {
        	$.ajax({
                url: "<%=request.getContextPath()%>/OrderListServlet.do?radio=2&k=3",		
                type: "get",
                dataType : 'JSON', 
                success: function (data) {
                	$('.demo-2').html(data.data);
                },error: function(data){
                	alert("3번째 실패");
				}
            });
         }
    	else if (selectObj.value == '4') {
        	$.ajax({
                url: "<%=request.getContextPath()%>/OrderListServlet.do?radio=2&k=4",		
                type: "get",
                dataType : 'JSON', 
                success: function (data) {
                	$('.demo-2').html(data.data);
                },error: function(data){
                	alert("4번째 실패");
				}
            });
         }
		};
	function tag1Click(){
		$.ajax({
            url: "<%=request.getContextPath()%>/tagSelect.do?radio=2&hashName="+$('#hashName1').text(),	
            type: "get",
            dataType : 'JSON',                   
            success: function (data) {
            	$('.demo-2').html(data.data);
            },error: function(data){
            	alert("실패");
			}
        });
	}
	function tag2Click(){
		$.ajax({
            url: "<%=request.getContextPath()%>/tagSelect.do?radio=2&hashName="+$('#hashName2').text(),	
            type: "get",
            dataType : 'JSON',                   
            success: function (data) {
            	$('.demo-2').html(data.data);
            },error: function(data){
            	alert("실패");
			}
        });
	}
	function tag3Click(){
		$.ajax({
            url: "<%=request.getContextPath()%>/tagSelect.do?radio=2&hashName="+$('#hashName3').text(),	
            type: "get",
            dataType : 'JSON',                   
            success: function (data) {
            	$('.demo-2').html(data.data);
            },error: function(data){
            	alert("실패");
			}
        });
	}
	function tag4Click(){
		$.ajax({
            url: "<%=request.getContextPath()%>/tagSelect.do?radio=2&hashName="+$('#hashName4').text(),	
            type: "get",
            dataType : 'JSON',                   
            success: function (data) {
            	$('.demo-2').html(data.data);
            },error: function(data){
            	alert("실패");
			}
        });
	}
	function searchButton(){
		$.ajax({
            url: "<%=request.getContextPath()%>/SearchSelect.do?radio=2&search="+$('#search').val(),	
            type: "get",
            dataType : 'JSON',                   
            success: function (data) {
            	$('.demo-2').html(data.data);
            },error: function(data){
            	alert("2번째 실패");
			}
        });
	}
	</script>
</body>
</html>
