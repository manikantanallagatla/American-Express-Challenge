$(document).ready(function(){
		$('<div class="menu_res"><div class="menu_res_ins"> <a href="javascript:void(0)" class="cls_btn"></a></div></div>').insertBefore('#wrappr');
		$('.navbr ul').clone().appendTo('.menu_res_ins');
		$('.dashblnk ul').clone().appendTo('.menu_res_ins');
		$('.menu_btn').click(function(){
			$('.menu_res').fadeIn();
			$('.menu_res .menu_res_ins').animate({width:'260px'});
			$('#wrappr').animate({left:'260px'})
			$('body').addClass('bd_fx');
		});
		$('.menu_res').click(function(){
			$(this).fadeOut();
			$('.menu_res .menu_res_ins').animate({width:'0px'})
			$('#wrappr').animate({left:'0px'});
			$('body').removeClass('bd_fx');
		});
});