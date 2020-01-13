<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.item.model.vo.ItemSelectVo" %>
<%@ page import="com.boardComment.model.vo.BoardComment"%>
<%@ page import="com.boardLikey.model.vo.Likey" %>
<%@ page import="com.product.model.vo.Product" %>
<%@ page import="java.util.ArrayList"%>

<%
	ArrayList<BoardComment> clist = (ArrayList<BoardComment>)request.getAttribute("clist");		
	
	Product scnt = (Product)request.getAttribute("sang_cnt");
	
	Product bcnt = (Product)request.getAttribute("buy_cnt");	
	
	BoardComment bc = new BoardComment();
	
	Product p = (Product)request.getAttribute("item");
	
	Likey yn = (Likey)request.getAttribute("likeyYn");
	
	String ynId = (String)request.getAttribute("ynId");

	Likey yncnt = (Likey)request.getAttribute("yncnt");

%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>ZeroNine</title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link href="https://fonts.googleapis.com/css?family=Lato+Script&display=swap" rel="stylesheet">
   <!-- CSS 파일 -->
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" /> <!-- 부트 스트랩 -->
   <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/HeaderMenu.css"> <!-- 헤더 메뉴 -->
   <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/headhesive.css"> <!-- 헤더 메뉴 스크롤 -->
   <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/images/ico/favicon.png"> <!-- 웹 브라우저 아이콘 -->
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mainPageLayOut.css" /> <!-- 메인 페이지 -->
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mainPage.css" /> <!-- 메인 페이지 -->
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/default.css" /> <!--  메인페이지 카테고리 메뉴 배치 -->
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/component.css" /> <!-- 메인페이지 카테고리 메뉴 -->
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/demo.css" /> <!-- menuCategory1 DIV CSS -->
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/selectBoxStyle.css"> <!-- menuCategory1 DIV CSS -->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/categoryDetail.css" />
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/payment.css" />
   <!-- JS 파일 -->
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   
   <script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.6/highlight.min.js"></script>
   <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/headhesive.js"></script>
   <script src="<%=request.getContextPath()%>/resources/js/modernizr.custom.js"></script>
   <script src="<%=request.getContextPath()%>/resources/js/selectDiv.js"></script> <!-- 현재 페이지 button 클릭시 div function 설정 -->
   <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap" rel="stylesheet">
   <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
   
   <script>
      $(document).ready(function () {
         $(".myButton").toggle(
            function () {
               $(this).next(".Boardcontent").css({ "display": "block" });
               $(this).closest(".menu").css({ "height": "120px" });
            },
            function () {
               $(this).next(".Boardcontent").css({ "display": "none" });
               $(this).closest(".menu").css({ "height": "90px" });
            });
      });
      $('.starRev span').click(function () {
         $(this).parent().children('span').removeClass('on');
         $(this).addClass('on').prevAll('span').addClass('on');
         return false;
      });
     </script>
</head>

<!-- 레이아웃 페이지 스타일은 mainPageLayOut.css에 적용되어 있음-->

<body onload="init();" style="background: #ffffff;">
   <%@ include file="common/header.jsp" %>
   <!-- 전체 레이아웃 틀 ( container ) DIV -->
   <div>
      <div id="mainContainer" style="margin:0 auto;">
         <!-- 이 부분에서 작업 -->
         <div id="detailbackground" style="width:100%;height:520px;">
            <div class="main">
               <div class="main_1 main_common" id="mainImageDiv" style="background: white;">
                  <img src="${pageContext.request.contextPath}/resources/productUploadFiles/<%=p.getMainImage()%>"> </div>
               <div class="main_2 main_common">
                  <span style="font-size: 30px;color:black;margin-top:10px;display: inline-block;"><%=p.getMainTitle()%></span><br>
                  <span style="font-size:20px;">판매가격:</span><span id="price"><%=p.getMainPrice()%></span><span id="won">원</span>
                  <br>
                  <% if(p.getHashtag1() != null){%>
                  <span id="dt3-1"># <%=p.getHashtag1()%></span>
                  <%} if(p.getHashtag2() != null){%>
                  <span id="dt3-2"># <%=p.getHashtag2()%></span>
                  <%} if(p.getHashtag3() != null){%>
                  <span id="dt3-3"># <%=p.getHashtag3()%></span>
                  <%} %>                  
                  <p style="margin-top:5px;font-size:15px;color:black;">
          			<input type="hidden" id="min_cnt" value="<%= p.getMin_count() %>">         
                  	최소 구매 수량 : <span style="color:rgb(179, 65, 65);"><%=p.getMin_count() %></span>개 </p>
                  <p style="font-size:15px;color:black;margin-top:-10px;">배송 기간 : <%=p.getDv_due() %>일 / 배송비 : <%=p.getDv_price() %>원</p>
                  <div>
                     <div style="margin-top:-10px;">
                        <select id="changeSelect" onchange="javascript:selectEvent(this);">
                           <option value="hide" selected="selected">--</option>
                           <% if(p.getOp1_title() != null){%>
                           <option value="1"><%= p.getOp1_title() %></option>
                           <%} %>
                           <% if(p.getOp2_title() != null){%>
                           <option value="2"><%= p.getOp2_title() %></option>
                           <%} %>
                           <% if(p.getOp3_title() != null){%>
                           <option value="3"><%= p.getOp3_title() %></option>
                           <%} %>
                        </select>
                        <!-- <script type="text/javascript" src="js/selectScript.js"></script> -->
                     </div>
                     <div id="dt1">
                        <div style="height:40px;background: rgb(247, 247, 247);margin-top:5px;width:480px;">
                           <div class="handle-counter" id="handleCounter3" style="margin-left:10px;">
                              <table style="height: 40px;">
                                 <tr>
                                    <td style="width:180px;font-size: 13px;"><%= p.getOp1_title() %>
                                    </td>
                                    <td id="getPrice1" style="padding-left:20px;color:black;font-size: 13px;" onclick="getPrice();">
                                       <%= p.getOp1_price() %>원
                                       <input type="hidden" id="sell_price1" value="<%=p.getOp1_price()%>"> 
                                    </td>
                                    <td style="padding-left:40px;">
                                       <button class="counter-minus btn btn-primary" onclick="del();">-</button>
                                       <input type="text" id="amount1" value="1" onchange="change();" onkeydown="keydown();">
                                       <button class="counter-plus btn btn-primary" id="add" onclick="add();">+</button>
                                    </td>
                                    <td id="del1" onclick="delete1();" style="padding-left:30px;">
                                       <img src="<%=request.getContextPath()%>/resources/images/close.png">
                                    </td>
                                 </tr>
                              </table>
                           </div>
                        </div>
                     </div>
                     <div id="dt2">
                        <div style="height:40px;background: rgb(247, 247, 247);margin-top:10px;width:480px;">
                           <div class="handle-counter" id="handleCounter3" style="margin-left:10px;">
                              <table style="height: 40px;">
                                 <tr>
                                    <td style="width:180px;font-size: 13px;"><%= p.getOp2_title() %>
                                    </td>
                                    <td id="getPrice2" style="padding-left:20px;color:black;font-size: 13px;">
                                       <%= p.getOp2_price() %>원
                                        <input type="hidden" id="sell_price2" value="<%=p.getOp2_price()%>"> 
                                    </td>
                                    <td style="padding-left:40px;">
                                       <button class="counter-minus btn btn-primary" onclick="del2();">-</button>
                                       <input type="text" id="amount2" value="1" onchange="change();"
                                          onkeydown="keydown();">
                                       <button class="counter-plus btn btn-primary" id="add2"
                                          onclick="add2();">+</button>
                                    </td>
                                    <td id="del2" onclick="delete2();" style="padding-left:30px;">
                                       <img src="<%=request.getContextPath()%>/resources/images/close.png">
                                    </td>
                                 </tr>
                              </table>
                           </div>
                        </div>
                     </div>
                     <div id="dt3">
                        <div style="height:40px;background: rgb(247, 247, 247);margin-top:10px;width:480px;">
                           <div class="handle-counter" id="handleCounter3" style="margin-left:10px;">
                              <table style="height: 40px;">
                                 <tr>
                                    <td style="width:180px;font-size: 13px;"> <%= p.getOp3_title() %>
                                    </td>
                                    <td id="getPrice3" style="padding-left:20px;color:black;font-size: 13px;">
                                       <%= p.getOp3_price() %>원
                                       <input type="hidden" id="sell_price3" value="<%=p.getOp3_price()%>"> 
                                    </td>
                                    <td style="padding-left:40px;">
                                       <button class="counter-minus btn btn-primary" onclick="del3();">-</button>
                                       <input type="text" id="amount3" value="1" onchange="change();"
                                          onkeydown="keydown();">
                                       <button class="counter-plus btn btn-primary" id="add3"
                                          onclick="add3();">+</button>
                                    </td>
                                    <td id="del3" onclick="delete3();" style="padding-left:30px;">
                                       <img src="<%=request.getContextPath()%>/resources/images/close.png">
                                    </td>
                                 </tr>
                              </table>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div style="margin-top:10px;font-size:20px;">
                     <span style="font-size:20px;margin-left:300px;">총 금액 :</span>
                      <% if(p.getOp1_title() != null && p.getOp2_title() != null && p.getOp3_title() != null){%>
                     	<span id="totalSum" style="font-size:25px;color: rgb(199, 10, 10);font-weight: bold;"><%=p.getMainPrice()%></span>원 
                      <%}else{ %>
                      	<span id="totalSum" style="font-size:25px;color: rgb(199, 10, 10);font-weight: bold;"><%=p.getMainPrice()%></span>원
                      <%} %>                      
                     
                  </div>
                  <div style="margin-top:10px;">
                    <%--  <button id='detailBtn1' onclick="likeAdd();"><img src="<%=request.getContextPath()%>/resources/images/categoryDetail/1.png"><%=p.getLikeCount() %></button> --%>
                    <% if(ynId == "n"){ %>
                    <button id='detailBtn1' onclick="insertLikey(this);" value="y">                  	
						<img src="<%=request.getContextPath()%>/resources/images/categoryDetail/1.png">click me!
					</button>
                    
                    <%}else{ %>
                    <button id='detailBtn1'>
						<img src="<%=request.getContextPath()%>/resources/images/categoryDetail/1.png"><%= yncnt.getYn_cnt() %>
					</button>
                    <%} %>
                    
                     <button id='detailBtn22' onclick="fnMove();"><img src="<%=request.getContextPath()%>/resources/images/categoryDetail/2.png">상세정보</button></a>        
                     
                     	 <%-- <a href="<%=request.getContextPath()%>/views/paymentPage.jsp"> --%>
                     	<button id='detailBtn3' onclick="clickPayment();">
                     		<img src="<%=request.getContextPath()%>/resources/images/categoryDetail/3.png">　구매하기
                     	</button>
                     <!-- </a> -->
                     
                  </div>
               </div>
            </div>
         </div>
         <div
            style="width:100%;height:50px;border-top:1px solid rgb(211, 211, 211);border-bottom: 2px solid rgb(65, 65, 65);">
            <div style="width:1024px;margin:0 auto;">
               <button id="btn1" style="margin-left:40px;" onclick="fnMove1()">상품설명</button>|
               <button id="btn2" onclick="fnMove2()">상품문의</button>|
               <button id="btn3" onclick="fnMove3()">상품리뷰</button>
               <!-- <button id="btn4" onclick="fnMove4()">취소환불/상품고시</button> -->
            </div>
            <div id="show1" style="width:960px;margin:0 auto;margin-top:20px;text-align:center;">       
               <img src="${pageContext.request.contextPath}/resources/productUploadFiles/<%=p.getDetailImage()%>">
            </div>
             <!--============================================================================-->
            <!--============================= 상품문의 시작 ======================================-->
            <!--============================================================================-->
            <!-- 헤헹 -->
            <script>

            </script>

            <div id="show2" style="width:960px;margin:0 auto;margin-top:20px;">
            <!-- ================ 문의글등록 작업중 ============== -->               	
            
					<form action="<%=request.getContextPath()%>/insertComment.bo" method="post">
					<input type="hidden" name="loc" value="1"/> 
					<input type="hidden" name="writer" value="<%= m.getUserId() %>"/> <!-- 유저아이디 -->
					<input type="hidden" name="bno" value="<%=p.getPno() %>" />	<!-- 글번호 -->
					<input type="hidden" name="refdno" value="0" /> <!-- 댓글번호 -->
					<input type="hidden" name="clevel" value="1" /> <!-- 댓글레벨 -->
	               		<table>
		                  	<tr>
		                     	<td>
		                     		<label for="" style="font-size:20px;">상품문의</label> 총 <label style="color:rgb(219, 126, 38);"><%=scnt.getSangcnt() %></label> 개
		                     	</td>
		                  	</tr>
		                  	<tr>
		                     	<td colspan="2">상품과 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등의 글은 예고없이 삭제됩니다.</td>
		                  	</tr>
		                  	
		                  	<tr>
		                     	<td colspan="2" style="padding-top:20px;">
		                     		<textarea class="noresize" name="content" rows="5" cols="40" style="width:960px;height:80px;" placeholder="상품에 대해 궁금한 점을 물어보세요"></textarea>
		                  		</td>
		                  	</tr>
		                  	<tr>
		                     	<td style="width:800px;">
		                        	<div class="custom-control custom-checkbox">
		                           		<input type="checkbox" id="jb-checkbox" class="custom-control-input">
		                        	</div>
		                     	</td>
		                     	<td><button id='detailBtn3' type="submit">등록하기</button></td>
		                  	</tr>		                  		
	               		</table>
               		</form>
             
               		<hr>               		
               	    
               		<% for(BoardComment bco : clist){ %> 
               			<% if(bco.getLoc() == 1){ %> 
	               		<table class="menu" style="margin-left : <%= (bco.getClevel()-1) * 15 %>px; width : <%= 800 - ((bco.getClevel()-1) * 15)%>px; class="replyList<%=bco.getClevel()%>">
	               			<tr>
	               				<td colspan="3">
	               					<input type="hidden" name="loc" value="1"/>
	               					<input type="hidden" name="writer" value="<%= m.getUserId()%>"/>
									<input type="hidden" name="refdno" value="<%= bco.getDno() %>" />
									<input type="hidden" name="clevel" value="<%= bco.getClevel() %>" />
			                  		<span style="font-size:17px;"> <%= bco.getUserid() %> </span>
			                  		<span style="margin-left:500px;"><%= bco.getDdate() %></span>
			                  		<%-- <div style="margin-left:30px;margin-top:10px;"><%= bco.getDcontent() %></div> --%>			                  					                  																			 																			                  				                	
			                		<%if(m.getUserId().equals(bco.getCwriter())) { %>
										<input type="hidden" name="cno" value="<%=bco.getDno()%>"/>										
										<!-- 수정하기 버튼을 클릭시 버튼이 수정완료로 바뀜, 삭제하기버튼은 고정 -->
										<button type="button" class="updateBtn"  id='detailBtn3' onclick="updateReply(this);">수정하기</button>							
										<button type="button" class="updateConfirm" id='detailBtn3' onclick="updateConfirm(this);" style="display:none;" >수정완료</button> &nbsp;&nbsp;
										
										<!-- 수정하기 버튼을 클릭시 버튼이 수정완료로 바뀜, 삭제하기버튼은 고정 -->	
										<button type="button" class="deleteBtn" id='detailBtn3' onclick="deleteReply(this);">삭제하기</button>
									
									<!-- 대댓글은 3개까지만 허용. -->
									<% } else if( bco.getClevel() < 3) { %>
										<input type="hidden" name="loc" value="1"/>
										<input type="hidden" name="writer" value="<%=m.getUserId()%>"/>
										<input type="hidden" name="refcno" value="<%= bco.getDno() %>" />
										<input type="hidden" name="clevel" value="<%=bco.getClevel() %>" />
										<!-- 대댓글달기 버튼 클릭시 대댓글 추가완료 버튼으로 바뀜, -->
										<button type="button" class="insertBtn" id='detailBtn4' onclick="reComment(this);">댓글 달기</button>&nbsp;&nbsp;							 
										<button type="button" class="insertConfirm" id='detailBtn4' onclick="reConfirm(this);" style="display:none;" >댓글 추가</button> 
											
									<% } else {%>
										<span> 마지막 레벨입니다.</span>
									<% } %>			                					                		
			                	</td>
							</tr>
							<%if(bco.getClevel() == 1){ %>
							<tr class="comment replyList<%=bco.getClevel()%>">
								<td colspan="3" style="background : transparent;">
									<div style="margin-left:30px;margin-top:10px;"><%= bco.getDcontent() %></div>
								</td>
							</tr>
							<%}else{ %>
							<tr class="comment replyList<%=bco.getClevel()%>">
								<td colspan="3" style="background : transparent;">
									<div style="margin-left:30px;margin-top:10px;">ㄴ<%= bco.getDcontent() %></div>
								</td>
							</tr>
							<%} %>
	               		</table>
	               		
               			<hr>
               			<%} %>
               		<% } %>
				</div>
            <!--============================================================================-->
            <!--============================= 상품문의 끝 ======================================-->
            <!--============================================================================-->

            <!--============================================================================-->
            <!--============================= 구매후기 시작 ======================================-->
            <!--============================================================================-->
            <div id="show3" style="width:960px;margin:0 auto;margin-top:20px;">
            <!-- ================ 문의글등록 작업중 ============== -->               	
					<form action="<%=request.getContextPath()%>/insertComment.bo?userid=<%=m.getUserId() %>" method="post">
					<input type="hidden" name="loc" value="2"/>
					<input type="hidden" name="writer" value="<%= m.getUserId() %>"/> <!-- 유저아이디 -->
					<input type="hidden" name="bno" value="<%=p.getPno() %>" />	<!-- 글번호 -->
					<input type="hidden" name="refdno" value="0" /> <!-- 댓글번호 -->
					<input type="hidden" name="clevel" value="1" /> <!-- 댓글레벨 -->
	               		<table>
		                  	<tr>
		                     	<td>
		                     		<label for="" style="font-size:20px;">구매</label> 
		                     		총 <label style="color:rgb(219, 126, 38);"><%=bcnt.getBuycnt() %></label> 개
		                     	</td>
		                  	</tr>
		                  	<tr>
		                     	<td colspan="2">상품과 관계없는 글, 양도, 광고성, 욕설, 비방, 도배 등의 글은 예고없이 삭제됩니다.</td>
		                  	</tr>
		                  	
		                  	<tr>
		                     	<td colspan="2" style="padding-top:20px;">
		                     		<textarea class="noresize" name="content" rows="5" cols="40" style="width:960px;height:80px;" placeholder="구매후기를 남겨주세요"></textarea>
		                  		</td>
		                  	</tr>
		                  	<tr>
		                     	<td style="width:800px;">
		                        	<div class="custom-control custom-checkbox">
		                           		<!-- <input type="checkbox" id="jb-checkbox" class="custom-control-input">
		                           		<label class="custom-control-label" for="jb-checkbox" style="font-weight: none;">비밀글로 문의하기</label> -->
		                        	</div>
		                     	</td>
		                     	<td><button id='detailBtn3' type="submit">등록하기</button></td>
		                  	</tr>		                  		
	               		</table>
               		</form>
             
               		<hr>               		
               	             
               		<% for(BoardComment bco : clist){ %> 
               		<% System.out.println("test"); %>
               		<% System.out.println(bco.getLoc()); %>
               			<% if(bco.getLoc() == 2){ %> 
	               			<% if(bco.getClevel() == 1){ %>
		               		<table class="menu" style="margin-left : <%= (bco.getClevel()-1) * 15 %>px; width : <%= 800 - ((bco.getClevel()-1) * 15)%>px;" class="replyList<%=bco.getClevel()%>">
		               			<tr>
		               				<td colspan="3">
		               					<input type="hidden" name="writer" value="<%= bco.getUserid()%>"/>
										<input type="hidden" name="refdno" value="<%= bco.getDno() %>" />
										<input type="hidden" name="clevel" value="<%= bco.getClevel() %>" />
				                  		<span style="font-size:17px;"> <%= bco.getUserid() %> </span>
				                  		<span style="margin-left:650px;"><%= bco.getDdate() %></span>
				                  		<%-- <div style="margin-left:30px;margin-top:10px;"><%= bco.getDcontent() %></div> --%>
				                	</td>
								</tr>
								<tr class="comment replyList<%=bco.getClevel()%>">
									<td colspan="3" style="background : transparent;">
										<div style="margin-left:30px;margin-top:10px;"><%= bco.getDcontent() %></div>
									</td>
								</tr>
		               		</table>
		               		
	               			<hr>
	               			<%}else{ %>
	               			<table class="menu" style="margin-left : <%= (bco.getClevel()-1) * 15 %>px; width : <%= 800 - ((bco.getClevel()-1) * 15)%>px;" class="replyList<%=bco.getClevel()%>">
		               			<tr>
		               				<td colspan="3">
		               					<input type="hidden" name="writer" value="<%= bco.getUserid()%>"/>
										<input type="hidden" name="refdno" value="<%= bco.getDno() %>" />
										<input type="hidden" name="clevel" value="<%= bco.getClevel() %>" />
				                  		<span style="font-size:17px;"> <%= bco.getUserid() %> </span>
				                  		<span style="margin-left:650px;"><%= bco.getDdate() %></span>
				                  		<%-- <div style="margin-left:30px;margin-top:10px;"><%= bco.getDcontent() %></div> --%>
				                	</td>
								</tr>
								<tr class="comment replyList<%=bco.getClevel()%>">
									<td colspan="3" style="background : transparent;">
										<div style="margin-left:30px;margin-top:10px;"><%= bco.getDcontent() %></div>
									</td>
								</tr>
		               		</table>
		               		
	               			<hr>
	               			<%} %>
               			<%} %>
               		<% } %>
				</div>
				
				<script>
					function updateReply(obj) {
						// 현재 위치와 가장 근접한 textarea 접근하기
						$(obj).parent().parent().next().find('textarea')
						.removeAttr('readonly');
						
						// 수정 완료 버튼을 화면 보이게 하기
						$(obj).siblings('.updateConfirm').css('display','inline');
						
						// 수정하기 버튼 숨기기
						$(obj).css('display', 'none');
					}
					
					
					function insertLikey(obj){															
						
						location.href="<%=request.getContextPath()%>/likeyInsert.do?bno=<%= p.getPno()%>&userid=<%= m.getUserId()%>";
					}
					
					function updateConfirm(obj) {
						// 댓글의 내용 가져오기
						var content
						  = $(obj).parent().parent().next().find('textarea').val();
						
						// 댓글의 번호 가져오기
						var cno = $(obj).siblings('input').val();
						
						// 게시글 번호 가져오기
						 var bno = '게시글번호';
						
						
						location.href="/myWeb/updateComment.bo?"
								 +"cno="+cno+"&bno="+bno+"&content="+content;
					}
					
					function deleteReply(obj) {
						// 댓글의 번호 가져오기
						var cno = $(obj).siblings('input').val();
						
						// 게시글 번호 가져오기
						var bno = '게시글번호';
						
						location.href="/myWeb/deleteComment.bo"
						+"?cno="+cno+"&bno="+bno;
					}
					
					function reComment(obj){
						// 추가 완료 버튼을 화면 보이게 하기
						$(obj).siblings('.insertConfirm').css('display','inline');
						
						// 클릭한 버튼 숨기기
						$(obj).css('display', 'none');
						
						// 내용 입력 공간 만들기
						var htmlForm = 
							
							'<tr class="comment"><td></td>'
							+'<input type="hidden" name="bno" value="pno" />'
							+'<input type="hidden" name="loc" value="1" />'
								+'<td colspan="3" style="background : transparent;">'
									+ '<textarea class="reply-content" style="background : ivory;" cols="105" rows="3" name="content"></textarea>'
								+ '</td>'
							+ '</tr>';
						
						$(obj).parents('table').append(htmlForm);
						
					}
					
					function reConfirm(obj) {
						// 댓글의 내용 가져오기
						
						// 참조할 댓글의 번호 가져오기
						var refdno = $(obj).siblings('input[name="refdno"]').val();
						var loc = $(obj).siblings('input[name="loc"]').val();
						var level = Number($(obj).siblings('input[name="clevel"]').val()) + 1;
						
						// console.log(refcno + " : " + level);
						
						// 게시글 번호 가져오기
						
						
						var parent = $(obj).parent();
						var grandparent = parent.parent();
						var siblingsTR = grandparent.siblings().last();
						
						var bno = $(obj).siblings('input[name="bno"]').val();
						var content = siblingsTR.find('textarea').val();
						
						
						location.href='<%=request.getContextPath()%>' + '/insertComment.bo' + '?writer=<%= m.getUserId() %>'+ '&content=' + content + '&bno='+ <%=p.getPno() %> + '&refdno=' + refdno + '&clevel=' + level + '&loc=' + loc;
											//insert.Comment.bo 라는 서블릿에 작성자,댓글내용,게시글번호,댓글번호,몇번째인지를 파라미터로 넘긴다.
					}
					
			</script>
            <!--============================================================================-->
            <!--============================= 구매후기 끝 ======================================-->
            <!--============================================================================-->

            <!--============================================================================-->
            <!--============================= 취소/환불고시 시작======================================-->
            <!--============================================================================-->
            <div id="show4" style="width:960px;margin:0 auto;margin-top:20px;">
               <label for="">환불/교환 기간</label>
               <p style="font-size:13px;margin-left:20px">
                  환불/교환 요청은 배송 완료 시점으로부터 7일 이내에 가능합니다.<br>
                  &nbsp;(단, 수령한 상품이 표기 광고의 내용과 다르거나 계약 내용과 다르게 이행된 경우에는 수령한 날로부터 3개월 이내,<br>
                  &nbsp;그 사실을 알 수 있었던 날로부터 30일 이내에는 환불/교환 신청 가능합니다.)
               </p>
               <hr>

               <label for="" style="margin-left:10px">환불/교환 요청방법</label>
               <p style="font-size:13px;margin-left:20px">
                  &nbsp;환불 : 마이페이지 내 환불신청 후 고객센터로 연락<br>
                  &nbsp;교환 : 마이페이지 내 교환신청 후 고객센터로 연락<br><br>
                  <b>환불,교환에 대한 자세한 내용은 FAQ에서 확인 가능합니다.</b>
               </p>


               <div style="border:1px solid black">
                  <p style="font-weight:bold; padding-left:10px;">환불/교환 가능안내</p>
                  <hr>
                  <p style="padding-left:5px;">상태별 환불/교환불가 사유</p>
                  <p style="font-size:13px;margin-left:20px">
                     ·환불/교환 요청 가능 기간이 초과한 경우(배송 완료 시점으로부터 7일 초과 시)<br>
                     ·재고가 부족한 경우(단순 변심으로 교환을 요청했으나 재고가 부족한 경우 환불처리될 수 있음)<br>
                     ·주문/제작 상품의 제작이 이미 진행된 경우<br>
                     ·분실/파손/고장/오염이 발생한 경우<br>
                     ·모니터 해상도 차이로 인하여 색상 등 이미지가 실제와 상이한 경우<br>
                  </p>
                  <hr>
                  <p style="padding-left:5px;">상태별 환불/교환불가군 종류</p>
                  <p style="font-size:13px;margin-left:20px">
                     ·포장을 개봉하였거나 포장이 훼손되어 상품의 가치가 현저히 상실된 경우<br>
                     ·의류/애완용품/악세사리 등 유상 재화 상품<br>
                     ·구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우<br>
                     ·시간의 경과로 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한 경우<br>
                     ·복제가 가능한 상품 등의 포장을 개봉/훼손한 경우<br>
                     ·상품을 개봉하여 설치/장착한 경우<br>
                  </p>
               </div><br>
               <p style="font-size:14px;">정당한 사유로 반품 요청을 하였으나 판매자와 협의가 되지 않는 경우, 제로나인 고객센터로 문의해주세요</p>

            </div>
            <!--============================================================================-->
            <!--============================= 취소/환불고시 끝======================================-->
            <!--============================================================================-->
               <%@ include file="common/footer.jsp" %>
         </div>





         <a id="showHere"></a>


      </div>
   </div>






   <!---------------------------------------------------------------->
   <a href="#" id="nino-scrollToTop">Go to Top</a>






   <!-- JS 파일 -->
   <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
   <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/isotope.pkgd.min.js"></script>
   <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.prettyPhoto.js"></script>
   <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
   <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.hoverdir.js"></script>
   <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/modernizr.custom.97074.js"></script>
   <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
   <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/unslider-min.js"></script>
   <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/template.js"></script>
   <script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/priceSelect.js"></script>
   <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
   <script src="<%=request.getContextPath()%>/resources/slick/slick.js" type="text/javascript" charset="utf-8"></script>
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
   		function getPrice(){
   			var aa = document.getElementById('getPrice11').value;
   			alert(aa);
   		}
   </script>
   <script>
   		function likeAdd(){
   			$.ajax({
   	            url: "<%=request.getContextPath()%>/likeAdd.do",	
   	            type: "get",
   	            dataType : 'JSON',                   
   	            success: function (data) {
   	            	$('.demo-2').html(data.data);
   	            },error: function(data){
   	            	alert("1번째 실패");
   				}
   	        });
   		}
   </script>
   	<script>
   

   	function clickPayment() {
        var min_cnt = document.getElementById('min_cnt').value;
        document.getElementById('min_cnt').innerHTML = min_cnt;
        amount_total = amount1 + amount2 + amount3; 
           if(amount_total < min_cnt){
              alert('옵션갯수확인');
           }else{
            location.href = "<%=request.getContextPath()%>/productPayment.do?pno=<%= p.getPno()%>&totalSum="+$('#totalSum').text()+"&sell_price1="+$('#sell_price1').val()+"&amount1="+$('#amount1').val()+"&sell_price2="+$('#sell_price2').val()+"&amount2="+$('#amount2').val()+"&sell_price3="+$('#sell_price3').val()+"&amount3="+$('#amount3').val()
           }
     }
   </script>
</body>

</html>