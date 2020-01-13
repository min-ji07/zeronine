

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/css/mainPageLayOut.css" />
<!-- 메인 페이지 -->
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/css/mainPage.css" />
<!-- 메인 페이지 -->
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/css/materialdesignicons.min.css" />
<!-- 아이콘 -->
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/css/itemAddPage1.css" />
<!-- 메인 페이지 -->
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/css/itemAddPage2.css" />
<!-- 메인 페이지 -->
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/slick/slick.css">
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/slick/slick-theme.css">
<link rel="stylesheet" type="text/css"
   href="<%=request.getContextPath()%>/resources/css/default.css" />
<!-- 페이지 배치 -->
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/hashTagStyle.css"
   type="text/css">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/css/formStyle.css">

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
<!-- JS 파일 -->
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.15.6/highlight.min.js"></script>
<script type="text/javascript"
   src="<%=request.getContextPath()%>/resources/js/headhesive.js"></script>
<script
   src="<%=request.getContextPath()%>/resources/js/modernizr.custom.js"></script>
<link
   href="https://fonts.googleapis.com/css?family=Nanum+Gothic&display=swap"
   rel="stylesheet">
<link rel="stylesheet"
   href="<%=request.getContextPath()%>/resources/js/formIndex.js">
</head>
<body>



   <%@ include file="common/header.jsp"%>

   <div id="item2BackGround">
      <a id="showHere"></a>
      <form name="productform" method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/productInsert.do">
         <div id="item2Container">
            <!-- 이 부분에서 작업 -->
            <input type="hidden" value="<%= m.getUserId() %>" name="writerId">
            <div id="itemAddTitle2"><br>제로나인에서 판매할 상품의 정보를 입력해주세요</div>
            <div id="listTitle">- 상품구성 -</div>
            <div id="itemAdd1">
            
               <div class="wrapper">
                  <div id="imageAdd">
                     <img id="image_preview"
                        src="<%=request.getContextPath()%>/resources/images/addItemList/5.jpg">
                  </div>
                  <label for="file_to_upload" id="labelImage1">이미지 변경</label> <input
                     type="file" id="file_to_upload" name="mainImage"
                     onchange="ImagePreview()" accept=".gif, .jpg, .png" />
                  <fieldset class="formRow" id="fieldset1">
                     <div class="formRow--item">
                        <label class="formRow--input-wrapper js-inputWrapper"
                           id="label1"> <input type="text" name="mainTitle"
                           class="formRow--input js-input" id="firstname"
                           placeholder="상품명">
                        </label>
                     </div>
                  </fieldset>
                  <fieldset class="formRow" id="fieldset2">
                     <div class="formRow--item">
                        <label class="formRow--input-wrapper js-inputWrapper"
                           id="label1"> <input type="text" name="mainPrice"
                           class="formRow--input js-input" id="lastname" placeholder="판매가"
                           onkeypress="inNumber();">
                        </label>
                        <!-- ==============================================================================-->
                        <!-- =============== 옵션추가 라인 시작 =============================================-->
                        <!-- ==============================================================================-->
                        <div style="margin-left: 300px;">
                           <div id="option1_add" style="display: inline-block;">
                              <img id="image_preview"
                                 src="<%=request.getContextPath()%>/resources/images/plus.png">
                           </div>
                           <div id="option1_sub" style="display: inline-block;">
                              <img id="image_preview"
                                 src="<%=request.getContextPath()%>/resources/images/minus.png">
                           </div>
                        </div>

                        <div id="option1_box" style="display: none">
                           <div style="color: rgb(114, 203, 245);">- 옵션1 내용 -</div>
                           <div class="formRow--item" style="margin-top: 10px;">
                              <label class="formRow--input-wrapper js-inputWrapper"
                                 id="label1"> <input type="text" name="op1_title"
                                 class="formRow--input js-input" id="op1_name"
                                 placeholder="상세옵션1 상품명">
                              </label>
                           </div>
                           <div class="formRow--item" style="margin-top: 20px;">
                              <label class="formRow--input-wrapper js-inputWrapper"
                                 id="label1"> <input type="text" name="op1_price"
                                 class="formRow--input js-input" id="op1_price"
                                 placeholder="상세옵션1 판매가">
                              </label>
                              <div style="margin-left: 300px;">
                                 <div id="option2_add" name="op2_add"
                                    style="display: inline-block;">
                                    <img id="image_preview"
                                       src="<%=request.getContextPath()%>/resources/images/plus.png">
                                 </div>
                                 <div id="option2_sub" name="op2_add"
                                    style="display: inline-block;">
                                    <img id="image_preview"
                                       src="<%=request.getContextPath()%>/resources/images/minus.png">
                                 </div>
                              </div>
                           </div>


                        </div>
                        <div id="option2_box" style="display: none">
                           <div style="color: rgb(114, 203, 245);">- 옵션2 내용 -</div>
                           <div class="formRow--item" style="margin-top: 10px;">
                              <label class="formRow--input-wrapper js-inputWrapper"
                                 id="label1"> <input type="text" name="op2_title"
                                 class="formRow--input js-input" id="op2_name"
                                 placeholder="상세옵션2 상품명">
                              </label>
                           </div>
                           <div class="formRow--item" style="margin-top: 20px;">
                              <label class="formRow--input-wrapper js-inputWrapper"
                                 id="label1"> <input type="text" name="op2_price"
                                 class="formRow--input js-input" id="op2_price"
                                 placeholder="상세옵션2 판매가">
                              </label>
                              <div style="margin-left: 300px;">
                                 <div id="option3_add" name="op2_add"
                                    style="display: inline-block;">
                                    <img id="image_preview"
                                       src="<%=request.getContextPath()%>/resources/images/plus.png">
                                 </div>
                                 <div id="option3_sub" name="op2_add"
                                    style="display: inline-block;">
                                    <img id="image_preview"
                                       src="<%=request.getContextPath()%>/resources/images/minus.png">
                                 </div>
                              </div>
                           </div>

                        </div>
                        <div id="option3_box" style="display: none">
                           <div style="color: rgb(114, 203, 245);">- 옵션3 내용 -</div>
                           <div class="formRow--item" style="margin-top: 10px;">
                              <label class="formRow--input-wrapper js-inputWrapper"
                                 id="label1"> <input type="text" name="op3_title"
                                 class="formRow--input js-input" id="op3_name"
                                 placeholder="상세옵션1 상품명">
                              </label>
                           </div>
                           <div class="formRow--item" style="margin-top: 20px;">
                              <label class="formRow--input-wrapper js-inputWrapper"
                                 id="label1"> <input type="text" name="op3_price"
                                 class="formRow--input js-input" id="op3_price"
                                 placeholder="상세옵션3 판매가">
                              </label>
                           </div>
                        </div>
                        <hr>
                        <div
                           style="margin-top: 10px; font-family: 'Nanum Gothic', sans-serif;">
                           <span style="font-size: 15px; color: black;">- 카테고리 설정 -</span>
                           <br> <input id="option-1" name="radio" value="1"
                              checked="checked" type="radio"> <label for="option-1"
                              class="labelOp"> <span></span> 의류
                           </label> <input id="option-2" name="radio" value="2" type="radio">
                           <label for="option-2" class="labelOp"> <span></span>
                              문화/레저
                           </label> <input id="option-3" name="radio" value="3" type="radio">
                           <label for="option-3" class="labelOp"> <span></span>
                              애완용품
                           </label> <input id="option-4" name="radio" value="4" type="radio">
                           <label for="option-4" class="labelOp"> <span></span>
                              악세사리
                           </label>
                        </div>

                     </div>
                  </fieldset>

               </div>

            </div>
            <div id="listTitle">- 판매설정 -</div>
            <ul id="accordion" class="accordion">

               <li>
                  <div class="link">
                     배송설정 <i class="fa fa-chevron-down"></i> <span id="link1">2500</span>원/
                     <span id="link2">2</span>일
                  </div>
                  <ul class="submenu">
                     <li>배송비 <input type="text" id="subtext1" name="dv_price"
                        value="2500" maxlength="5" oninput="st1Function()"
                        onkeypress="inNumber();"> 원
                     </li>
                     <li>예상배송기간<input type="text" id="subtext2" name="dv_due"
                        value="2" maxlength="2" oninput="st2Function()"
                        onkeypress="inNumber();"> 일
                     </li>
                  </ul>
               </li>
               <li>
                  <div class="link">
                     구매설정<i class="fa fa-chevron-down"></i>
                     <span id="link3" style="display:none;">0명</span>
                     <span id="link4" style="margin-left:240px;">1</span>개
                  </div>
                  <ul class="submenu">
                     <li style="display:none;">최소구매인원<input type="text" id="subtext3" name="min_person"
                        value="0" maxlength="4" oninput="st3Function()"
                        onkeypress="inNumber();"> 명
                     </li>
                     <li>최소구매수량(인 당)<input type="text" id="subtext4"
                        name="min_count" value="1" maxlength="3" oninput="st4Function()"
                        onkeypress="inNumber();"> 개
                     </li>
                  </ul>
               </li>
            </ul>
            <div id="listTitle">- 해시태그 -</div>
            <div id="itemAdd" style="height: 130px;">
               <ul class="tags">
                  <li class="tagAdd taglist"><input type="text" id="tags-field"></li>
                   <input type="hidden" id="tocken" name="hashtag1" value="0">
                   <input type="hidden" id="tocken" name="hashtag2" value="0">
                   <input type="hidden" id="tocken" name="hashtag3" value="0">
               </ul>
            </div>
            <div id="listTitle">- 상세설명 -</div>
            <div id="itemAdd" style="height: 400px;">

               <div id="ta1" contentEditable="true"
                  style="width: 95%; height: 80%; margin: 0 auto; overflow: scroll;">
                  <div class="upload-image">
                     <div class="upload-image-preview"></div>
                  </div>
               </div>
               <label for="file_to_upload2" id="labelImage2">상품 이미지 등록</label> <input
                  type="file" name="detailImage" id="file_to_upload2"
                  value="Upload Image" />
            </div>
            <script
               src="<%=request.getContextPath()%>/resources/js/formIndex.js"></script>
            <div id="addItemButton1">
               <input type='file' id='file' name='file'
                  style="position: absolute; width: 1px; height: 1px; padding: 0; margin: -1px; overflow: hidden; clip: rect(0, 0, 0, 0); border: 0;" />
               <button id='btn-upload' class="button1 white selected" onclick="productInsert();" onfocus="this.blur();">게시하기</button>
            </div>
      </form>
      <a id="showHere"></a>
   </div>
   </div>

   <%@ include file="common/footer.jsp"%>




   <!---------------------------------------------------------------->
   <a href="#" id="nino-scrollToTop">Go to Top</a>






   <!-- JS 파일 -->

   <script type="text/javascript"
      src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
   <script type="text/javascript"
      src="<%=request.getContextPath()%>/resources/js/isotope.pkgd.min.js"></script>
   <script type="text/javascript"
      src="<%=request.getContextPath()%>/resources/js/jquery.prettyPhoto.js"></script>
   <script type="text/javascript"
      src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
   <script type="text/javascript"
      src="<%=request.getContextPath()%>/resources/js/jquery.hoverdir.js"></script>
   <script type="text/javascript"
      src="<%=request.getContextPath()%>/resources/js/modernizr.custom.97074.js"></script>
   <script type="text/javascript"
      src="<%=request.getContextPath()%>/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
   <script type="text/javascript"
      src="<%=request.getContextPath()%>/resources/js/unslider-min.js"></script>
   <script type="text/javascript"
      src="<%=request.getContextPath()%>/resources/js/template.js"></script>
   <script src="https://code.jquery.com/jquery-2.2.0.min.js"
      type="text/javascript"></script>

   <script src="<%=request.getContextPath()%>/resources/slick/slick.js" type="text/javascript" charset="utf-8"></script>
   <script>
   function productInsert(){
      var form = document.productform;
      
      if( !form.mainImage.value ){   
         alert( "메인이미지를 등록해주세요" ); 
         event.preventDefault();
         return;
      }
      if( !form.mainTitle.value ){   
            alert( "상품명을 입력해주세요" ); 
            event.preventDefault();
            return;
         }
      if( !form.mainPrice.value ){   
         alert( "상품판매가를 입력해주세요" ); 
         event.preventDefault();
         return;
      }
      if( !form.op1_title.value && !form.op2_title.value && !form.op3_title.value){   
            alert( "기본 옵션을 1가지 이상 등록해주세요" ); 
            event.preventDefault();
            return;
      }
      if( !form.dv_price.value ){   
            alert( "배송비를 입력해주세요" ); 
            event.preventDefault();
            return;
      }
      if( !form.dv_due.value ){   
            alert( "배송기간을 입력해주세요" ); 
            event.preventDefault();
            return;
      }
      if( !form.min_count.value && form.min_count.value >0){   
            alert( "최소구매수량을 입력해주세요" ); 
            event.preventDefault();
            return;
      }
      if( !form.detailImage.value ){   
            alert( "상세이미지를 등록해주세요" ); 
            event.preventDefault();
            return;
      }
      else{
         alert("상품이 등록되었습니다.");
      }
       }
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
                            $(document).ready(function(){
                                var count = 0;
                                ///////////////////옵션1 시작////////////////////////
                                $("#option1_add").click(function(){
                                    var idx = $(this).index();
                                    if($("#option1_box").css("display","block")){
                                            $("#itemAdd1").css("height","750px");
                                            $('#mainContainer').css("height","1800px");
                                    }else{
                                        $("#option1_box").css("display","block").eq(idx).css("display","none");
                                        $("#itemAdd1").css("height","750px");
                                        $('#mainContainer').css("height","1800px");
                                    }
                                });

                                $("#option1_sub").click(function(){
                                    var idx = $(this).index();
                                    $("#option1_box").css("display","none");                                             
                                    $("#option2_box").css("display","none");
                                    $("#option3_box").css("display","none");
                                    $("#itemAdd1").css("height","550px");
                                    $(".op2_add").css("display","none");
                                    $('#mainContainer').css("height","1600px");
                                    $('input[name=op1_title]').val('');
                                    $('input[name=op1_price]').val('');
                                    $('input[name=op2_title]').val('');
                                    $('input[name=op2_price]').val('');
                                    $('input[name=op3_title]').val('');
                                    $('input[name=op3_price]').val('');
                                    
                                });
                                $("#option2_add").click(function(){
                                    var idx = $(this).index();

                                    if($("#option2_box").css("display","block")){
                                            $("#itemAdd1").css("height","950px");
                                            $('#mainContainer').css("height","2000px");
                                    }else{
                                        $("#option2_box").css("display","block")
                                             .eq(idx).css("display","none");
                                        $("#itemAdd1").css("height","950px");
                                        $('#mainContainer').css("height","2000px");
                                    }                                             
                                });
                                $("#option2_sub").click(function(){
                                    var idx = $(this).index();
                                    $("#option2_box").css("display","none");
                                    $("#option3_box").css("display","none");
                                    $("#itemAdd1").css("height","750px");
                                    $('#mainContainer').css("height","1800px");
                                    $('input[name=op2_title]').val('');
                                    $('input[name=op2_price]').val('');
                                    $('input[name=op3_title]').val('');
                                    $('input[name=op3_price]').val('');
                                    
                                });
                                $("#option3_add").click(function(){
                                    var idx = $(this).index();

                                    $("#option3_box").css("display","block")
                                    $("#itemAdd1").css("height","1100px");
                                    $('#mainContainer').css("height","2200px");
                                });
                                $("#option3_sub").click(function(){
                                    var idx = $(this).index();
                                    $("#option3_box").css("display","none")
                                    $("#itemAdd1").css("height","950px");
                                    $('#mainContainer').css("height","2000px");
                                    $('input[name=op3_title]').val('');
                                    $('input[name=op3_price]').val('');            
                                });
                            });                            
                            </script>
   <script>
        $(document).ready(function () {


            $('#addTagBtn').click(function () {

                $('#tags option:selected').each(function () {
                   event.preventDefault();
                    $(this).appendTo($('#selectedTags'));


                });
            });
            $('#removeTagBtn').click(function () {
                $('#selectedTags option:selected').each(function (el) {
                   event.preventDefault();
                    $(this).appendTo($('#tags'));

                });
            });
            $('.tagRemove').click(function (event) {
                event.preventDefault();
                $(this).parent().remove();


            });
            $('ul.tags').click(function () {
               event.preventDefault();
                $('#tags-field').focus();
            });
            $(this).parent().remove().click(function () {


            });
            $('#tags-field').keypress(function (event) {
                if (event.which == '13') {
                    if ($("li").length < 16) {
                        if ($(this).val() != '') {
                           event.preventDefault();
                           if($('.addedTag').length < 1){
                               $('<li class="addedTag" name="hashtag1">' + "#" + $(this).val() + '<span id="tagRemove1" onclick="remove1();"> x</span><input type="hidden" value="' + $(this).val() + '" name="tags[]"></li>').insertBefore('.tags .tagAdd');
                                 var value = $(this).val();
                                 $('input[name=hashtag1]').val(value);
                                 $(this).val('');
                           }else if($('.addedTag').length < 2){
                               $('<li class="addedTag" name="hashtag2">' + "#" + $(this).val() + '<span id="tagRemove2" onclick="remove2();"> x</span><input type="hidden" value="' + $(this).val() + '" name="tags[]"></li>').insertBefore('.tags .tagAdd');
                                 var value = $(this).val();
                                 $('input[name=hashtag2]').val(value);
                                 $(this).val('');
                           }else if($('.addedTag').length < 3){
                              $('<li class="addedTag" name="hashtag3">' + "#" + $(this).val() + '<span id="tagRemove3" onclick="remove3();"> x</span><input type="hidden" value="' + $(this).val() + '" name="tags[]"></li>').insertBefore('.tags .tagAdd');
                             var value = $(this).val();
                             $('input[name=hashtag3]').val(value);
                          }  
                        }  
                    } else {
                        alert("해시태그는 3가지 이상 등록하실 수 없습니다.");
                        event.preventDefault();
                    }
                }
            });
        });
        function remove1(){
           $('#tagRemove1').parent().remove();
           $('input[name=hashtag1]').val('');
        }
        function remove2(){
           $('#tagRemove2').parent().remove();
           $('input[name=hashtag2]').val('');
        }
        function remove3(){
           $('#tagRemove3').parent().remove();
           $('input[name=hashtag3]').val('');
        }
    </script>
   <script type="text/javascript">
        function ImagePreview() {
            var ImagePreview = document.getElementById('image_preview');
            var UploadFile = document.getElementById('file_to_upload').files[0];
            var ReaderObj = new FileReader();
            ReaderObj.onloadend = function () {
                ImagePreview.src = ReaderObj.result;
            }
            if (UploadFile) {
                ReaderObj.readAsDataURL(UploadFile);
            } else {
                ImagePreview.src = '';
            }
        }

        $("#file_to_upload2").change(function () {
            if (this.files && this.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    var img = $('<img>').attr('src', e.target.result);
                    $('.upload-image-preview').html(img);
                };

                reader.readAsDataURL(this.files[0]);
            }
        });
    </script>
</body>
</html>