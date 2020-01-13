<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ZeroNine</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSS 파일 -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css" /> <!-- 부트 스트랩 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/HeaderMenu.css"> <!-- 헤더 메뉴 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/headhesive.css"> <!-- 헤더 메뉴 스크롤 -->
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/images/ico/favicon.png">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mainPageLayOut.css" /> <!-- 메인 페이지 -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/mainPage.css" /> <!-- 메인 페이지 -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/materialdesignicons.min.css" /> <!-- 아이콘 -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/default.css" /> <!-- 페이지 배치 -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/slick/slick.css"> <!-- itemAddPage1 슬라이더 CSS -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/slick/slick-theme.css">  <!-- itemAddPage1 슬라이더 CSS -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/itemAddPage1.css" /> <!-- 페이지 배치 -->
    
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/template.js"></script> <!-- 스크롤 -->

</head>

<!-- 레이아웃 페이지 스타일은 mainPageLayOut.css에 적용되어 있음-->

<body>

<%@ include file="common/header.jsp" %>
    <!-- 전체 레이아웃 틀 ( container ) DIV -->

    <div id="item1BackGround">     
        <div id="itemContainer">
                <div id="arrowDiv">
                        <a href="./ZeroNineMainPage.jsp" id="arrowA">
                          <span class="left"></span>
                        </a>
                      </div>
            <!-- 이 부분에서 작업 -->
            <div id="itemAddTitle1">               
                <img src="<%=request.getContextPath()%>/resources/images/logoIcon.png"><br>
                제로나인에서 판매할 상품의<br> <span>대표 이미지를 등록해주세요</span>

            </div>
            <section class="center slider" id="sliderStyle">
                <div>
                    <img src="<%=request.getContextPath()%>/resources/images/addItemList/1.jpg" id="itemAddPicture1">
                </div>
                <div>
                    <img src="<%=request.getContextPath()%>/resources/images/addItemList/2.jpg" id="itemAddPicture1">
                </div>
                <div>
                    <img src="<%=request.getContextPath()%>/resources/images/addItemList/3.jpg" id="itemAddPicture1">
                </div>
                <div>
                    <img src="<%=request.getContextPath()%>/resources/images/addItemList/4.jpg" id="itemAddPicture1">
                </div>

            </section>
            <div id="addItemButton1">
                <input type='file' id='file' name='file' style="position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip:rect(0,0,0,0); border: 0; "//>
                <button id='btn-upload' class="button1 white selected" onfocus="this.blur();">사진 등록</button>
            </div>
            <a id="showHere"></a>
        </div>
    </div>

<%@ include file="common/footer.jsp" %>



    <!---------------------------------------------------------------->
    <a href="#" id="nino-scrollToTop">Go to Top</a>
    <!-- JS 파일 -->
    <script src="<%=request.getContextPath()%>/resources/slick/slick.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
        $(document).on('ready', function () {
            $(".center").slick({
                dots: true,
                infinite: true,
                centerMode: true,
                slidesToShow: 2,
                slidesToScroll: 4,
                autoplay: true,
                autoplaySpeed: 1500
            });
        })
    </script>
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
        $(function () {
            $('#btn-upload').click(function (e) {
                e.preventDefault();
                $("input:file").click();
                var ext = $("input:file").val().split(".").pop().toLowerCase();
                if (ext.length > 0) {
                    if ($.inArray(ext, ["gif", "png", "jpg", "jpeg"]) == -1) {
                        alert("gif,png,jpg 파일만 업로드 할수 있습니다.");
                        return false;
                    }
                }
                
                $("input:file").val().toLowerCase();
                

            });
            $('input[name=file]').change(function(ev) {
                    location.href = "./itemAddPage2.jsp";

            });
           
        });
    </script>
</body>

</html>