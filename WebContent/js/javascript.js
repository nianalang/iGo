//导航栏分类触发事件
	//鼠标经过导航栏时，将子分类的visibility更改为visible
	//鼠标悬停在子分类时，左侧对应的导航栏也要保持改变后的样式
	//1全球购
	$(function(){
	   $("#import,#textlist1").hover(
	   	function () {
	   		$("#textlist1").css("visibility", "visible"),
	   		$("#import").css({"background":"#fff","color":"#666"}),
	   		$("#img1").attr('src', 'images/全球红.png');
	   	},
	    function(){
	    	$("#textlist1").css("visibility", "hidden"),
	    	$("#import").css({"background":"#444038","color":"#fff"}),
	    	$("#img1").attr('src', 'images/全球.png');
	    });
	});
	//2食品
	$(function(){
	   $("#food,#textlist2").hover(
	   	function () {
	   		$("#textlist2").css("visibility", "visible"),
	   		$("#food").css({"background":"#fff","color":"#666"}),
	   		$("#img2").attr('src', 'images/食物红.png');
	   	},
	    function(){
	    	$("#textlist2").css("visibility", "hidden"),
	    	$("#food").css({"background":"#444038","color":"#fff"}),
	    	$("#img2").attr('src', 'images/食物.png');
	    });
	});
	//3母婴产品
	$(function(){
	   $("#mombaby,#textlist3").hover(
	   	function () {
	   		$("#textlist3").css("visibility", "visible"),
	   		$("#mombaby").css({"background":"#fff","color":"#666"}),
	   		$("#img3").attr('src', 'images/baby红.png');
	   	},
	    function(){
	    	$("#textlist3").css("visibility", "hidden"),
	    	$("#mombaby").css({"background":"#444038","color":"#fff"}),
	    	$("#img3").attr('src', 'images/baby.png');
	    });
	});
	//4纸巾
	$(function(){
	   $("#paper,#textlist4").hover(
	   	function () {
	   		$("#textlist4").css("visibility", "visible"),
	   		$("#paper").css({"background":"#fff","color":"#666"}),
	   		$("#img4").attr('src', 'images/纸巾红.png');
	   	},
	    function(){
	    	$("#textlist4").css("visibility", "hidden"),
	    	$("#paper").css({"background":"#444038","color":"#fff"}),
	    	$("#img4").attr('src', 'images/纸巾.png');
	    });
	});
	//5家居家纺
	$(function(){
	   $("#jiaju,#textlist5").hover(
	   	function () {
	   		$("#textlist5").css("visibility", "visible"),
	   		$("#jiaju").css({"background":"#fff","color":"#666"}),
	   		$("#img5").attr('src', 'images/家居红.png');
	   	},
	    function(){
	    	$("#textlist5").css("visibility", "hidden"),
	    	$("#jiaju").css({"background":"#444038","color":"#fff"}),
	    	$("#img5").attr('src', 'images/家居.png');
	    });
	});
	//6女装男装
	$(function(){
	   $("#clothes,#textlist6").hover(
	   	function () {
	   		$("#textlist6").css("visibility", "visible"),
	   		$("#clothes").css({"background":"#fff","color":"#666"}),
	   		$("#img6").attr('src', 'images/女装红.png');
	   	},
	    function(){
	    	$("#textlist6").css("visibility", "hidden"),
	    	$("#clothes").css({"background":"#444038","color":"#fff"}),
	    	$("#img6").attr('src', 'images/女装.png');
	    });
	});
	//7鞋靴箱包
	$(function(){
	   $("#shoes,#textlist7").hover(
	   	function () {
	   		$("#textlist7").css("visibility", "visible"),
	   		$("#shoes").css({"background":"#fff","color":"#666"}),
	   		$("#img7").attr('src', 'images/鞋靴红.png');
	   	},
	    function(){
	    	$("#textlist7").css("visibility", "hidden"),
	    	$("#shoes").css({"background":"#444038","color":"#fff"}),
	    	$("#img7").attr('src', 'images/鞋靴.png');
	    });
	});
	//8手机电脑
	$(function(){
	   $("#phone,#textlist8").hover(
	   	function () {
	   		$("#textlist8").css("visibility", "visible"),
	   		$("#phone").css({"background":"#fff","color":"#666"}),
	   		$("#img8").attr('src', 'images/手机红.png');
	   	},
	    function(){
	    	$("#textlist8").css("visibility", "hidden"),
	    	$("#phone").css({"background":"#444038","color":"#fff"}),
	    	$("#img8").attr('src', 'images/手机.png');
	    });
	});
	//9汽车用品
	$(function(){
	   $("#cars,#textlist9").hover(
	   	function () {
	   		$("#textlist9").css("visibility", "visible"),
	   		$("#cars").css({"background":"#fff","color":"#666"}),
	   		$("#img9").attr('src', 'images/汽车用品红.png');
	   	},
	    function(){
	    	$("#textlist9").css("visibility", "hidden"),
	    	$("#cars").css({"background":"#444038","color":"#fff"}),
	    	$("#img9").attr('src', 'images/汽车用品.png');
	    });
	});
	//10医疗保健
	$(function(){
	   $("#medicine,#textlist10").hover(
	   	function () {
	   		$("#textlist10").css("visibility", "visible"),
	   		$("#medicine").css({"background":"#fff","color":"#666"}),
	   		$("#img10").attr('src', 'images/医药红.png');
	   	},
	    function(){
	    	$("#textlist10").css("visibility", "hidden"),
	    	$("#medicine").css({"background":"#444038","color":"#fff"}),
	    	$("#img10").attr('src', 'images/医药.png');
	    });
	});
	//11图书分类
	$(function(){
	   $("#books,#textlist11").hover(
	   	function () {
	   		$("#textlist11").css("visibility", "visible"),
	   		$("#books").css({"background":"#fff","color":"#666"}),
	   		$("#img11").attr('src', 'images/图书红.png');
	   	},
	    function(){
	    	$("#textlist11").css("visibility", "hidden"),
	    	$("#books").css({"background":"#444038","color":"#fff"}),
	    	$("#img11").attr('src', 'images/图书.png');
	    });
	});


// 中间切换图片部分
// 轮播
	$(document).ready(function() { 
		var length,currentIndex = 0, 
		//是否已经开始轮播
		interval,hasStarted = false, 
		//轮播时间间隔  
		t = 3000; 
		//将除了第一张图片隐藏 （只显示第一张图片）
		length = $('.slider-panel').length; 
	 	$('.slider-panel:not(:first)').hide(); 	 	
		//将第一个slider-item设为激活状态,现在为选中状态，
		//为第一个选中的li圆点增加类“slider-item-selected”
		//在css中提前设置好了slider-item-selected类的样式
	 	$('.slider-item:first').addClass('slider-item-selected'); 
	 	//鼠标悬停时停止滑动，鼠标离开时开始滑动 
		 $('.slider-panel').hover(
		 	function() { 
		  	stop(); 
		 }, 
		 	function() {
		  	start(); 
		 }); 

		 $('.slider-item').hover(
		 	function(e) { 
		  	stop(); 
		  	var preIndex = $(".slider-item").filter(".slider-item-selected").index(); 
		  	currentIndex = $(this).index(); 
		  	play(preIndex, currentIndex); 
		 }, 
		 	function() { 
		  	start(); 
		 }); 

	 	//定义翻页
	 	//向前翻页
		 function pre() { 
			  var preIndex = currentIndex; 
			  currentIndex = (--currentIndex + length) % length; 
			  play(preIndex, currentIndex); 
		 } 
		 //向后翻页
		 function next() { 
			  var preIndex = currentIndex; 
			  currentIndex = ++currentIndex % length; 
			  play(preIndex, currentIndex); 
		 }  
		 // 从preIndex页翻到currentIndex页 
		 // preIndex 整数，翻页的起始页 
		 // currentIndex 整数，翻到的那页 
	 	function play(preIndex, currentIndex) { 
		//fadeOut()和fadeIn()是jquery渐隐及渐显效果，设置其作用的间隔时间（反应速度）
			  $('.slider-panel').eq(preIndex).fadeOut(300) 
			  .parent().children().eq(currentIndex).fadeIn(300); 
			  $('.slider-item').removeClass('slider-item-selected'); 
			  $('.slider-item').eq(currentIndex).addClass('slider-item-selected'); 
		 } 

		 //定义轮播
		 //开始轮播
		 function start() { 
			  if(!hasStarted) { 
			  hasStarted = true; 
			  interval = setInterval(next, t); 
		  	} 
		 } 

		 //停止轮播
		 function stop() { 
		  	clearInterval(interval); 
		  	hasStarted = false; 
		 } 
		 //开始轮播 
		 start(); 
	 }); 




	//倒计时设置时间
	$(function() { 
		$('.countdown').downCount({
			date: '11/25/2018 10:43:00',
			offset: 0
	}, function () {
		alert('倒计时结束!');
	});
	});
	

/*	// 中间商品列表滑过样式
	$(document).ready(function() { 
		$('.prodimg').hover(
	    function(){
	     $(this).addClass('hover1')
	    },
	    function(){
	     $(this).removeClass('hover1')
	    });
	});
*/
	
	//热销商品鼠标滑过样式
	$(document).ready(function() { 
		$('.display-img-list').hover(
	    function(){
	     $(this).addClass('hover2')
	    },
	    function(){
	     $(this).removeClass('hover2')
	    });
	});

	$(document).ready(function() { 
		$('.li-img').hover(
	    function(){
	     $(this).addClass('hover3')
	    },
	    function(){
	     $(this).removeClass('hover3')
	    });
	});


	
