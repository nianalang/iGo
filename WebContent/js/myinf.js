$(function(){
	$('#bought').click(function(){
		$(this).css("color","#ff0000"),
		$('.list_right_ul').css("visibility", "visible"),//("visibility", "visible"),
		$('.list_right_ul').siblings().css("visibility", "hidden"),
		$('.bbb3,.bbb4').find('.list').css("color","#73738a");
	});
	$('#inf').click(function(){
		$(this).css("color","#ff0000"),
		$('.list_right_ul2').css("visibility", "visible"),//("visibility", "visible"),
		$('.list_right_ul2').siblings().css("visibility", "hidden"),
		$('.bbb2,.bbb4').find('.list').css("color","#73738a");
	});
	$('#infa').click(function(){
		$(this).css("color","#ff0000"),
		$('.list_right_ul3').css("visibility", "visible"),//("visibility", "visible"),
		$('.list_right_ul3').siblings().css("visibility", "hidden"),
		$('.bbb2,.bbb3').find('.list').css("color","#73738a");
	});
});