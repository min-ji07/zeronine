<%@page import="com.question.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.question.model.vo.Question"%>
<%@page import="java.util.ArrayList"%>

<%
	ArrayList<Question> list = (ArrayList<Question>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");

	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ZeroNine</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS 파일 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/HeaderMenu.css">
<!-- 헤더 메뉴 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" />
<!-- 부트 스트랩 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/mainPageLayOut.css" />
<!-- 메인 페이지 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/mainPage.css" />
<!-- 메인 페이지 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/materialdesignicons.min.css" />
<!-- 아이콘 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/headhesive.css">
<!-- 헤더 메뉴 스크롤 -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/default.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/component.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/questionBoard.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/demo.css" />
<!-- 카테고리 DIV CSS -->

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
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
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
	src="<%=request.getContextPath()%>/resources/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/resources/js/jquery.leanModal.min.js"></script>
<!-- 레이어 팝업 -->
</head>


<!-- 레이아웃 페이지 스타일은 mainPageLayOut.css에 적용되어 있음-->

<body>
	<%@ include file="common/header.jsp"%>


	<div style="background: #ffffff;">
		<div id="mainContainer"
			style="width: 1024px; height: 1100px; margin: 0 auto; background: rgb(255, 255, 255);">
			<!-- 이 부분에서 작업 -->

			<br>
			<br>
			<div class="Question" style="text-align: center;">
				<h2>
					<b>자주 묻는 질문</b>
				</h2>
			</div>
			<br>
			<div
				style="height: 240px; border: 2px; border-style: solid; border-color: rgb(95, 199, 202); border-radius: 20px; padding: 0;">
				<a href="#modal1" class="modaltrigger"><div id="FAQ1">
						<B style="font-size: 20px;">1</B><br>상품 배송은 얼마나 걸리나요?
					</div></a> <a href="#modal2" class="modaltrigger"><div id="FAQ1">
						<B style="font-size: 20px;">2</B><br>탈퇴 후 재가입할 수 있나요?
					</div></a> <a href="#modal3" class="modaltrigger"><div id="FAQ1">
						<B style="font-size: 20px;">3</B><br>닉네임을 설정할 수 있나요?
					</div></a> <a href="#modal4" class="modaltrigger"><div id="FAQ1">
						<B style="font-size: 20px;">4</B><br>최소구매수량이 있나요?
					</div></a> <a href="#modal5" class="modaltrigger"><div id="FAQ1last">
						<B style="font-size: 20px;">5</B><br>배송비는 어떻게 결제하나요?
					</div></a> <a href="#modal6" class="modaltrigger"><div id="FAQ2">
						<B style="font-size: 20px;">6</B><br>부분환불이 무엇인가요?
					</div></a> <a href="#modal7" class="modaltrigger"><div id="FAQ2">
						<B style="font-size: 20px;">7</B><br>상품 진열 순서를 알고 싶어요
					</div></a> <a href="#modal8" class="modaltrigger"><div id="FAQ2">
						<B style="font-size: 20px;">8</B><br>A/S가 가능한지 알고싶어요
					</div></a> <a href="#modal9" class="modaltrigger"><div id="FAQ2">
						<B style="font-size: 20px;">9</B><br>카드 승인이 안돼요
					</div></a> <a href="#modal10" class="modaltrigger"><div id="FAQ2last">
						<B style="font-size: 20px;">10</B><br>아이디는 하나만 가능한가요?
					</div></a>
			</div>





			<a id="showHere"></a> &nbsp;&nbsp;
			<div id="menu">
				<ul class="navi">
					<%
						if (session.getAttribute("member") != null) {
					%>
					<li><a href="#a" class="open">문의하기</a></li>
					<%
						} else {
					%>
					<li><a
						href="<%=request.getContextPath()%>/views/loginForm.jsp">
							1:1문의</a></li>
					<%
						}
					%>
				</ul>
			</div>

			<!-- 1대1 상담 폼* -->
			<div class="popup2" style="font-family: 'Nanum Gothic', sans-serif;">
				<div style="font-size: 30px; text-align: center">문의 하기</div>
				<div class="con">
					<form id="QuestionForm"
						action="<%=request.getContextPath()%>/qInsert.do" method="post">
						<table class="type1">
							<colgroup>
								<col style="width: 111px">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th><label for="txt2" style="font-size: 18px;">문의
											제목</label></th>
									<td><input type="tel" id="txt2" name="title"
										style="width: 450px; margin-top: 10px;"></td>
								</tr>
								<tr>
									<th><label for="txt1" style="font-size: 18px;">문의
											내용</label></th>
									<td><textarea name="content" cols="40" rows="10"
											style="width: 450px; height: 100px; resize: none;"></textarea></td>
								</tr>
							</tbody>
						</table>
					</form>

					<div class="agree">
						<input type="checkbox" id="chk1_4" name="chk1_4" onclick="">
						<label for="chk1_4"><span>[필수]</span>개인정보 수집 및 이용 동의</label>
					</div>
				</div>
				<div class="txt_center">
					<a href="#a" class="btn_type2">취소</a> <a href="#a"
						class="btn_type1" onclick="questionAdd();">문의신청</a>
				</div>
			</div>

			<div class="boardPopup"
				style="font-family: 'Nanum Gothic', sans-serif;">
				<div style="font-size: 30px; text-align: center">1 :1 문의</div>
				<div class="con">
					<table class="type1">
						<tbody>
							<tr>
								<th><label for="txt2" style="font-size: 18px;">문의
										제목</label></th>
								<td><input type="tel" id="txt2"
									style="width: 440px; margin-top: 10px; margin-left: 20px;"></td>
							</tr>
							<tr>
								<th><label for="txt1" style="font-size: 18px;">문의
										내용</label></th>
								<td><textarea name="content" cols="40" rows="10"
										style="width: 440px; height: 100px; resize: none; margin-left: 20px;"></textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="txt_center">
					<a href="#a" class="btn_type2">취소</a><a href="#a" class="btn_type1">문의수정</a><a
						href="#a" class="btn_type4">문의삭제</a>
				</div>
			</div>
			<div class="dim2"></div>

			<script>
      $(document).ready(function(){
          $(".open").on('click',function(){
        	  $("#QuestionForm")[0].reset();
              $('.popup2').show();
              $('.dim2').show();
          });
          $(".btn_type2").on('click',function(){
              $('.popup2').hide();
              $(".dim2").hide();
          });
          $("#board1").on('click',function(){
              $('.boardPopup').show();
              $(".dim2").show();
          });
          $(".btn_type2").on('click',function(){
            $('.boardPopup').hide();
              $(".dim2").hide();
          });
          
      });
      
  </script>


			<!-- 체크 박스 클릭, 문의 신청 클릭 스크립트 -->
			<script>
		
	   function questionAdd(){
			if(!$('#chk1_4').is(":checked")){
				alert("약관에 동의해 주세요");
			}else{
				$('#QuestionForm').submit();
			}
		}
	
	/* function chk1_4(check){
		
		 } */
	
 
    
	</script>

			<script>
		$(function(){
			$("#board td").click(function(){
				
				var no = $(this).parent().children().eq(1).text();
				
				location.href="<%=request.getContextPath()%>/qselectone.do?no=" + no;
			});
		});
		
	
	</script>


			&nbsp;&nbsp;&nbsp;&nbsp;

			<!-- <div class = "tableArea"> -->
			<table class="table table-hover" id="board">
				<thead>
					<!-- thead는 열의 제목 / table에서 한번만 가능, tbody나 tfoot보다 먼저 선언해야함-->
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<%
					for (Question q : list) {
				%>
				<tr>
					<input type="hidden" value="<%=q.getNo()%>" />
					<td><%=q.getNo()%></td>
					<td><%=q.getTitle()%></td>
					<td><%=q.getWriter()%></td>
					<td><%=q.getDate()%></td>
					<td><%=q.getCount()%></td>
				</tr>
				<%
					}
				%>

			</table>
			<%-- 페이지 처리 --%>
			<div class="pagingArea" align="center">
				<nav>
					<ul class="pagination pg-blue">
						<li class="page-item"><a class="page-link"
							aria-label="Previous"
							href="<%=request.getContextPath()%>/qList.do?radio=1&currentPage=1">
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
							href="<%=request.getContextPath()%>/qList.do?radio=1&currentPage=<%=p%>"><%=p%></a></li>
						<%-- 						<li class="page-item"><a class="page-link"   ><%= p %></a></li> --%>
						<%
							}
						%>
						<%
							}
						%>
						<li class="page-item"><a class="page-link" aria-label="Next"
							href="<%=request.getContextPath()%>/qList.do?radio=1&currentPage=<%=maxPage%>">
								<span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span>
						</a></li>
					</ul>
				</nav>


			</div>

			<!-- <div class="text-center">
      <ul class="pagination">
         <li><a href="@">1</a></li>
         <li><a href="@">2</a></li>
         <li><a href="@">3</a></li>
      </ul>
   </div> -->
			<div class="searchArea" align="center" style="margin-top: 5px;">
				<select id="searchCondition" name="searchCondition" style="height:30px;">
					<option>----</option>
					<option value="writer">아이디</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select> <input type="search" id="keyword" style="height:30px;"palceholder="키워드를 입력하세요">
				<button type="button" id="queBtn" style="margin-left: 10px;" onclick="search();">검색하기</button>
			</div>
		</div>

		<script>
	function search(){
		location.href="<%=request.getContextPath()%>/searchQ.do?con="
						+ $('#searchCondition').val()
						+ "&keyword="
						+ $('#keyword').val();
				console.log($('#searchCondition').val() + ":" + "&keyword="
						+ $('#keyword').val());
			}
		</script>



		<!-- 아코디언  -->
		<script>
			$(function() {
				var accordion_btn = $(".accordion ul li");
				accordion_btn.click(function() {
					$(this).siblings().removeClass("on");
					if ($(this).hasClass("on")) {
						$(this).siblings().removeClass("on");
					} else {
						$(this).addClass("on");
					}
				});
			})
		</script>



		<div id="modal1" style="display: none;">
			<h3>상품 배송은 얼마나 걸리나요?</h3>
			<table class="type2">
				<tbody>
					<tr>
						<th><br> <span>" 상품배송 기간은 상품마다 다릅니다 "<br>
							<br></span> 배송기간은 상품마다 다르기 때문에 상품페이지 내 배송정보를 참고하거나 판매자에게 문의하기 바랍니다.<br>
							만약 배송정보의 평균발송일보다 현저하게 배송이 지연되거나 판매자와 연락두절 시 제로나인 고객센터로 연락 바랍니다.<br>
						</th>
					</tr>
				</tbody>
			</table>
		</div>

		<div id="modal2" style="display: none;">
			<h3>탈퇴 후 재가입할 수 있나요?</h3>
			<table class="type2">
				<tbody>
					<tr>
						<th><br> <span>"일반 회원의 경우 바로 재가입이 가능하고, 정회원의 경우
								명의당 5개까지 회원가입이 가능하므로 탈퇴한 ID를 포함하여 5개 미만시 <br>바로 재가입이
								가능합니다."<br>
							<br>
						</span> 탈퇴한 ID의 개인정보는 90일 경과 후 정보가 삭제됩니다.<br> 정회원 가입일 경우, 탈퇴한 ID를
							포함하여 5개의 ID를 보유중이라면 직후 재가입은 어려우며 탈퇴 시점에서 90일 경과 뒤에 재가입 바랍니다.<br>
						</th>
					</tr>
				</tbody>
			</table>
		</div>

		<div id="modal3" style="display: none;">
			<h3>닉네임을 설정할 수 있나요?</h3>
			<table class="type2">
				<tbody>
					<tr>
						<th><br> <span>"네, 마이페이지 > 개인정보관리 > 회원정보수정 페이지에서
								설정 가능합니다 "<br>
							<br>
						</span> <b>닉네임 등록 시 유의사항</b><br> 1. 닉네임은 한글 또는 영문, 숫자의 조합으로 12자 이내로
							등록 가능합니다 (특수문자, 띄어쓰기 및 한글 초성 금지)<br> 2. 다음 닉네임의 경우 사전 경고 없이
							사용 중지되거나 등록 거부될 수 있으니 유의 바랍니다.<br> - 다른 판매자와 동일 영업 주체로 오인할 수
							있거나 상표권을 침해하는 경우<br> - 제로나인에서 판매 불가한 상품명 또는 문구가 포함된 경우<br>
							- 도덕적으로 부적합한 문구(욕설,비속어) 또는 성인용품 관련 단어가 포함된 경우<br> - 판매하는 물품과
							무관한 브랜드 또는 상품명을 포함한 경우<br> 3. 닉네임 분쟁 발생 시 아래 기준으로 사용권한을
							결정합니다.<br> (1) 사업자 등록증에 기재된 업체명<br> (2) 아이디 혹은 아이디의 한글
							표기명<br></th>
					</tr>
				</tbody>
			</table>
		</div>

		<div id="modal4" style="display: none;">
			<h3>최소 구매수량이 있나요?</h3>
			<table class="type2">
				<tbody>
					<tr>
						<th><br> <span>"네, 제로나인은 상품마다 최소 구매수량이 있습니다."<br>
							<br></span> 제로나인의 경우 상품마다 판매자가 지정한 최소 구매수량이 있습니다.<br> 구매 수량
							이상으로 구매할 시 판매자가 지정한 판매단가로 구매가능합니다.<br></th>
					</tr>
				</tbody>
			</table>
		</div>

		<div id="modal5" style="display: none;">
			<h3>배송비는 어떻게 결제 하나요?</h3>
			<table class="type2">
				<tbody>
					<tr>
						<th><br> <span>"판매자가 설정한 배송비 결제방법으로 결제할 수 있습니다."<br>
							<br></span> 판매자가 설정한 배송비 결제방법으로 결제합니다<br> 선결제 : 상품 구매 시 배송비를
							함께 결제합니다<br> 착불 : 상품 수령 시 구매자가 배송비를 직접 결제합니다<br> 선결제 혹은
							착불 구매자 선택 : 상품 구매 시 구매자가 배송비 결제 방법을 선택할 수 있습니다<br>
						<br> <b>※ 참고</b> <br> 대량 구매 시 배송비 조정이나 도서산간 지역 배송비 선결제를
							원하시는 경우 상품상세페이지 내 '배송비견정요청'을 이용해 주시기 바랍니다.<br></th>
					</tr>
				</tbody>
			</table>
		</div>

		<div id="modal6" style="display: none;">
			<h3>부분 환불이 무엇인가요?</h3>
			<table class="type2">
				<tbody>
					<tr>
						<th><br> <span>"누락 및 품절 등의 사유로 결제금액 중 일부금액을 환불하는
								것입니다."<br>
							<br>
						</span> <b>부분환불 사유 예시</b><br>
						<br> 판매상품의 일부옵션(색상, 사이즈)이 품절인 경우<br> 일부상품이 누락되어서 환불이 필요한
							경우 <br> 배송수량이 달라 환불이 필요한 경우<br></th>
					</tr>
				</tbody>
			</table>
		</div>

		<div id="modal7" style="display: none;">
			<h3>상품 진열 순서를 알고 싶어요</h3>
			<table class="type2">
				<tbody>
					<tr>
						<th><br> <span>"카테고리 검색시에는 도매꾹 랭킹순, 키워드 검색시에는
								정확도순으로 고정 진열됩니다 "<br>
							<br>
						</span> 또한 옵션별 상품 진열순서는 다음과 같습니다<br> 옵션별 상품 진열 순서<br> 포토포커스 +
							포토갤러리<br> 포토포커스 <br> 프리미엄 + 포토갤러리<br> 프리미엄 <br>
							우대등록 + 포토갤러리 <br> 우대등록 <br> 랭킹순 <br> 업데이트순 정렬 <br>

						</th>
					</tr>
				</tbody>
			</table>
		</div>

		<div id="modal8" style="display: none;">
			<h3>A/S가 가능한지 알고싶어요</h3>
			<table class="type2">
				<tbody>
					<tr>
						<th><br> <span>"상품의 A/S는 판매자를 통해 진행 가능합니다 "<br>
							<br></span> 주문한 상품의 A/S는 상품상세페이지 > 판매자/반품/교환 탭에 기재되어 있으며 정보가 부족할 경우
							판매자에게 문의하기 바랍니다.<br></th>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="modal9" style="display: none;">
			<h3>카드 승인이 안돼요</h3>
			<table class="type2">
				<tbody>
					<tr>
						<th><br> <span>"카드 승인 실패 사유는 카드사에 문의 바랍니다"<br>
							<br></span> 카드 승인 시 실패 사유는 카드사에서 보내는 메시지입니다.<br> 정확한 실패 사유를
							확인하고 싶을 경우 카드사에 문의 바랍니다 .<br></th>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="modal10" style="display: none;">
			<h3>아이디는 하나만 가능한가요?</h3>
			<table class="type2">
				<tbody>
					<tr>
						<th><br> <span>"정회원 아이디는 5개까지 사용이 가능합니다"<br>
							<br></span> 정회원 인증은 5개의 아이디까지 가능합니다.<br> 단, 포인트 적립등의 정회원 혜택의
							경우 인증정보 확인하여 동일명의 아이디 최초 1개에만 적립됩니다.<br></th>
					</tr>
				</tbody>
			</table>
		</div>




		<!---------------------------------------------------------------->
		<a href="#" id="nino-scrollToTop">Go to Top</a>

		<!-- JS 파일 -->
		<script>
			var options = {
				offset : '#showHere',
				offsetSide : 'top',
				classes : {
					clone : 'banner--clone',
					stick : 'banner--stick',
					unstick : 'banner--unstick'
				}
			};
			var banner = new Headhesive('.banner', options);
		</script>
		<script type="text/javascript">
			$(function() {
				$('#loginform').submit(function(e) {
					return false;
				});

				$('.modaltrigger').leanModal({
					top : 110,
					overlay : 0.3,
					closeButton : ".hidemodal"
				});
			});
		</script>
	</div>
	<%@ include file="common/footer.jsp"%>
	</div>

</body>

</html>