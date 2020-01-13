function btnClickA() {
	$("#showlist1").show();
	$("#showlist2").hide();
	$("#div1").show();
	$("#div2").hide();
	$("#div3").hide();
	$("#div4").hide();
	$("#btn1").css('border-bottom','5px solid rgb(19, 95, 167)');
	$("#btn2").css('border-bottom','none');
	$("#btn3").css('border-bottom','none');
	$("#btn4").css('border-bottom','none');
}

function btnClickB() {
	$("#showlist2").show();
	$("#showlist1").hide();
	$("#div1").hide();
	$("#div2").hide();
	$("#div3").show();
	$("#div4").hide();
	$("#btn1").css('border-bottom','none');
	$("#btn2").css('border-bottom','none');
	$("#btn3").css('border-bottom','5px solid #ca3f56');
	$("#btn4").css('border-bottom','none');

}


		function btnClick1() {
			$("#div1").show();
			$("#div2").hide();
			$("#div3").hide();
			$("#div4").hide();
			$("#btn1").css('border-bottom','5px solid rgb(19, 95, 167)');
			$("#btn2").css('border-bottom','none');
			$("#btn3").css('border-bottom','none');
			$("#btn4").css('border-bottom','none');
		}
		function btnClick2() {
			$("#div1").hide();
			$("#div2").show();
			$("#div3").hide();
			$("#div4").hide();
			$("#btn1").css('border-bottom','none');
			$("#btn2").css('border-bottom','5px solid rgb(19, 95, 167)');
			$("#btn3").css('border-bottom','none');
			$("#btn4").css('border-bottom','none');
		}
		function btnClick3() {
			$("#div1").hide();
			$("#div2").hide();
			$("#div3").show();
			$("#div4").hide();
			$("#btn1").css('border-bottom','none');
			$("#btn2").css('border-bottom','none');
			$("#btn3").css('border-bottom','5px solid #ca3f56');
			$("#btn4").css('border-bottom','none');
		}
		function btnClick4() {
			$("#div1").hide();
			$("#div2").hide();
			$("#div3").hide();
			$("#div4").show();
			$("#btn1").css('border-bottom','none');
			$("#btn2").css('border-bottom','none');
			$("#btn3").css('border-bottom','none');
			$("#btn4").css('border-bottom','5px solid #ca3f56');
		}