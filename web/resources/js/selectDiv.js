		function fnMove1() {
			$("#show1").show();
			$("#show2").hide();
			$("#show3").hide();
			$("#btn1").css('border-bottom','5px solid rgb(19, 95, 167)');
			$("#btn2").css('border-bottom','none');
			$("#btn3").css('border-bottom','none');

		}
		function fnMove2() {
			$("#show1").hide();
			$("#show2").show();
			$("#show3").hide();
			$("#btn1").css('border-bottom','none');
			$("#btn2").css('border-bottom','5px solid rgb(19, 95, 167)');
			$("#btn3").css('border-bottom','none');
		}
		function fnMove3() {
			$("#show1").hide();
			$("#show2").hide();
			$("#show3").show();
			$("#btn1").css('border-bottom','none');
			$("#btn2").css('border-bottom','none');
			$("#btn3").css('border-bottom','5px solid rgb(19, 95, 167)');
		}

		$(document).ready(function(){
			$("#myButton").toggle(
			  function(){$("#Boardcontent").css({"display": "block"});},
			  function(){$("#Boardcontent").css({"display": "none"});
			});
		  });

		  function fnMove(){
			$("#show1").show();
			$("#show2").hide();
			$("#show3").hide();
            var offset = $("#show1").offset();
            $('html, body').animate({scrollTop : offset.top}, 100);
         }