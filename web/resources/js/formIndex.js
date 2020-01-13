var $inputItem = $(".js-inputWrapper");
$inputItem.length && $inputItem.each(function() {
    var $this = $(this),
        $input = $this.find(".formRow--input"),
        placeholderTxt = $input.attr("placeholder"),
        $placeholder;
    
    $input.after('<span class="placeholder">' + placeholderTxt + "</span>"),
    $input.attr("placeholder", ""),
    $placeholder = $this.find(".placeholder"),
    
    $input.val().length ? $this.addClass("active") : $this.removeClass("active"),
        
    $input.on("focusout", function() {
        $input.val().length ? $this.addClass("active") : $this.removeClass("active");
    }).on("focus", function() {
        $this.addClass("active");
    });
});

$(function() {
	var Accordion = function(el, multiple) {
		this.el = el || {};
		this.multiple = multiple || false;

		// Variables privadas
    var links = this.el.find('.link');
		// Evento
    links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)
    

	}

	Accordion.prototype.dropdown = function(e) {
		var $el = e.data.el;
			$this = $(this),
			$next = $this.next();

    $next.slideToggle();
 
		$this.parent().toggleClass('open');
		if (!e.data.multiple) {
			$el.find('.submenu').not($next).slideUp().parent().removeClass('open');
		};
	}	

	var accordion = new Accordion($('#accordion'), false);
});

function st1Function() {
  var x = document.getElementById("subtext1").value;
  var link1 = document.getElementById("link1");
  link1.innerHTML = x;
}

function st2Function() {
  var y = document.getElementById("subtext2").value;
  var link2 = document.getElementById("link2");
  link2.innerHTML = y;
}

function st3Function() {
  var z = document.getElementById("subtext3").value;
  var link3 = document.getElementById("link3");
  link3.innerHTML = z;

}

function st4Function() {
  
  var z1 = document.getElementById("subtext4").value;
  var link4 = document.getElementById("link4");
  link4.innerHTML = z1;

}

function st5Function() {
  
  var z2 = document.getElementById("subtext5").value;
  var link5 = document.getElementById("link5");
  link5.innerHTML = z2;

}

function inNumber(){
  if(event.keyCode<48 || event.keyCode>57){
     event.returnValue=false;
  }
}



  
