$(function() {
	var $good = $('#flower_good');
	var $text_good = $('.flower_text_good');

	var $middle = $('#flower_middle');
	var $text_middle = $('.flower_text_middle');

	var $low = $('#flower_low');
	var $text_low = $('.flower_text_low');
	// 设置默认显示好评
	if ($($good).attr("checked")) {
		$text_good.css("visibility", "visible");
		$('.boxCenter_msg_detail').attr("placeholder", "系统默认好评");
	}
	// 设置必填
	// boxCenter_msg_detail
	$('.submit').click(function() {
		var value = $('.boxCenter_msg_detail').val();// 获取值
		value = $.trim(value); // 用jQuery的trim方法删除前后空格
		// 好评时没有填入评论详情
		if (value == '') {

			if ($($good).attr("checked")) {
				alert("输入不能为空!");
				return false;
			} else if ($($middle).attr("checked")) {
				alert("请填写具体评价内容");
				return false;
			} else {
				alert("请填写具体评价内容");
				return false;
			}
		}
	});
	$good.click(function() {
		if ($(this).attr("checked")) {
			// alert("选中");
			$text_good.css("visibility", "visible");
			$middle.attr("checked", false);
			$text_middle.css("visibility", "hidden");
			$low.attr("checked", false);
			$text_low.css("visibility", "hidden");
			$('.boxCenter_msg_detail').attr("placeholder", "系统默认好评");
		}
	});
	$middle
			.click(function() {
				if ($(this).attr("checked")) {
					$text_middle.css("visibility", "visible");
					$good.attr("checked", false);
					$text_good.css("visibility", "hidden");
					$low.attr("checked", false);
					$text_low.css("visibility", "hidden");
					$('.boxCenter_msg_detail').attr("placeholder",
							"你给卖家打了中评，需要说明原因哦~");
				}
			});
	$low.click(function() {
		if ($(this).attr("checked")) {
			$text_low.css("visibility", "visible");
			$middle.attr("checked", false);
			$text_middle.css("visibility", "hidden");
			$good.attr("checked", false);
			$text_good.css("visibility", "hidden");
			$('.boxCenter_msg_detail').attr("placeholder",
					"你给卖家打了差评，可以先联系一下卖家~");
		}
	});
});
