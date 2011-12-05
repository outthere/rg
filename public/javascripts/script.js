	$(document).ready(function(){
		$('#call_box_right').hover(function(){
			$('.right_arrow').animate({left: '+=10'});
			$('#its_free').fadeIn();
			},
			function(){
				$('.right_arrow').animate({left: '-=10'});
				$('#its_free').fadeOut();
			});
			
		$('#call_box_left').hover(function(){
			$('.left_arrow').animate({right: '+=10'});
			$('#get_started').fadeIn();
			},
			function(){
				$('.left_arrow').animate({right: '-=10'});
				$('#get_started').fadeOut();
			});
			
		$('#blog_box').hover(function(){
			$('#blog_foot').animate({top: '+=5'});
			},
			function(){
				$('#blog_foot').animate({top: '-=5'});
		});
		
		$('#blog_box').click(function(){
			 window.location=$('a#blog_link').attr("href");
			 return false;
		});
		
		$('#call_box_right').click(function(){
			 window.location=$('a#online_link').attr("href");
			 return false;
		});
		
		$('.home_blurb').click(function(){
			 window.location=$('a:first',this).attr("href");
			 return false;
		});
		
		$('#call_box_left').click(function(){
			 window.location=$('a#classroom_link').attr("href");
			 return false;
		});
		
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
		$('#blog_blurb .blog_img img').addClass('blurb_img'); 
		
	});
