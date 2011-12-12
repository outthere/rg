$(document).ready(function(){

	var period = $(".period").scrollable();
	if ($(".issues li").size() > 4) {
		var issues = $(".issues").scrollable({circular: true});
	} else {
		issues = $(".issues").scrollable();
	}

	$('.prev1').click(function(){
		period.data('scrollable').prev();
	});
	$('.next1').click(function(){
		period.data('scrollable').next();
	});
	$('.prev2').click(function(){
		issues.data('scrollable').prev();
	});
	$('.next2').click(function(){
		issues.data('scrollable').next();
	});


    if ( $('.period').length ){
	(function scroll2current() {
		var curr = $(".period li.act").index(".period li");
		period.data('scrollable').seekTo(curr);
	})();
    }



	var root = $('.slideshow').scrollable({circular: true, easing:'swing'}).navigator().autoscroll({ autopause: false, interval: 7000 });
	$('#slide_nav').click(function(){
		root.data('scrollable').stop();
	});		

	var timer;
	var down = true;
	$('#slideshow_container,#slide_nav').mousemove(function() {
	       if (timer) {
	           window.clearTimeout(timer);            
	           timer = 0;
	       } 
	       if(down) { 
	           $('.navi a, a.left, a.right').animate({top:'0px'},'fast');  
	          down = false;
	       }
	       timer = setTimeout(function() {
	          $('.navi a, a.left, a.right').animate({top:'50px'},'fast');
	          down = true;
	       }, 1500);
	
	   });
		
	});
