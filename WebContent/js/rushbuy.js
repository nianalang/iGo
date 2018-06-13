/*$(function(){
	$('#list_1').click(function(){
		$('.list_1').css("visibility", "visible"),
		$('.list_1').siblings().css("visibility", "hidden"),
		$('.aaa').css("color","#ff3014"),
		$('.time_first, .time_second').siblings().css("color","#73738a");		
	});
	
	$('#list_2').click(function(){
		//alert("111")
		$('.list_2').siblings().css("visibility", "hidden"),
		//alert("222")
		$('.list_2').css("visibility", "visible");
		//alert("333")
		$('.time_first, .time_second').siblings().css("color","#73738a"),
		//alert("444")
		$('.bbb').css("color","#ff3014");
		
		
	});
	$('#list_3').click(function(){
		$('.list_3').siblings().css("visibility", "hidden"),
		$('.list_3').css("visibility", "visible"),
		$('.time_first, .time_second').siblings().css("color","#73738a"),
		$('.ccc').css("color","#ff3014");
		
	});
	$('#list_4').click(function(){
		$('.list_4').siblings().css("visibility", "hidden"),
		$('.list_4').css("visibility", "visible"),
		$('.time_first, .time_second').siblings().css("color","#73738a"),
		$('.ddd').css("color","#ff3014");
		
	});
	$('#list_5').click(function(){
		$('.list_5').siblings().css("visibility", "hidden"),
		$('.list_5').css("visibility", "visible"),
		$('.time_first, .time_second').siblings().css("color","#73738a"),
		$('.eee').css("color","#ff3014");
		
	});
});*/

//=====================设定顶部导航栏隐藏/显示=========================
/*$(function(){  
  var winHeight = $(document).scrollTop();
 
  $(window).scroll(function() {
  	// 获取垂直滚动的距离，即滚动了多少
    var scrollY = $(document).scrollTop();
    //如果滚动距离大于100px则隐藏
    if (scrollY > 30){ 
    	$('.time').addClass('show'),
    	$('#topbar').hide();
    } 
    // else {
    //   $('.top-title').removeClass('hiddened');
    // }
 	//如果没滚动到顶部,时间还是固定
    if (scrollY > winHeight){ 
      $('.time').addClass('show');
    } 
    else {
      $('.time').removeClass('show'),
      $('#topbar').show(300);
    }        
   });
});*/
$(function onload(){
	//alert("111")
		$('.aaa').css("color","#ff3014"),
		$('.content_ul').siblings().css("visibility", "hidden"),
		$('.content_ul').css("visibility", "visible"),
		$('#list_1').siblings().find('*').css("color","#73738a");
		$.ajax({
			type:"Get",
			url: "http://localhost:8088/iGo/RushbuyServlet?action=sixteen&keyWord=sixteenrushbuy",
			success:function(data){
	        	if(data.length>0){	
  					var datas = eval(data); 						
	  					$.each(datas, function(i, item) {		
	  						var url = datas[i].productsUrlMain;
	  						var productsId=datas[i].productsId;
	  						var described=datas[i].described;
	  						var price=datas[i].price;
	  						//alert(url)						
	  						var $img=$('<img src="'+url+'" class="list_img">');
	  						var $link=$('<a href="http://localhost:8088/iGo/ProductServlet?action=goodslist-select&productId='+productsId+'"  target="_blank" class="list_inf"><span class="list_details">'+described+'</span></a>');	
	  						var $lia=$('<li class="list_1"></li>');	
	  						$('.content_ul').append($lia);
	  						$($lia).append($img);
	  						$($img).after($link);	
	  						var $diva=$('<div class="list_div"></div>');
	  						$($link).append($diva);
							var $spanb=$('<span class="list_price">￥'+price+'</span>');
							$($diva).append($spanb);
							var $spanc=$('<span class="list_ed">已售：<span>0</span>%</span>');
							$($spanb).after($spanc);
							var $bar=$('<div class="votebox"><dl class="barbox"><dd class="barline"><div w="67" style="width:0px;" class="charts"></div></dd></dl></div>');
	  						$($spanc).after($bar);
	  						$(function(){
								function animate(){
								$(".charts").each(function(i,item){
									var a=parseInt($(item).attr("w"));
									$(item).animate({
										width: a+"%"
									},1000);
								});
							}
								animate();
							});
	  						var $shopcart=$('<a href="http://localhost:8088/iGo/ShoppingCartServlet?action=intobuy&status=rushbuy&productId='+productsId+'" class="list_button"><span>加入购物车</span></a>');
							$($bar).after($shopcart);
						});
    			}	
			}
});

});


	$('#list_1').click(function(){
		$('.content_ul').find('li').detach();
		$('.aaa').css("color","#ff3014"),
		$('.content_ul').siblings().css("visibility", "hidden"),
		$('.content_ul').css("visibility", "visible"),
		$('#list_1').siblings().find('*').css("color","#73738a");
		$.ajax({
			type:"Get",
			url: "http://localhost:8088/iGo/RushbuyServlet?action=sixteen&keyWord=sixteenrushbuy",
			success:function(data){
	        	if(data.length>0){	
  					var datas = eval(data); 						
	  					$.each(datas, function(i, item) {		
	  						var url = datas[i].productsUrlMain;
	  						var productsId=datas[i].productsId;
	  						var described=datas[i].described;
	  						var price=datas[i].price;
	  						//alert(url)						
	  						var $img=$('<img src="'+url+'" class="list_img">');
	  						var $link=$('<a href="http://localhost:8088/iGo/ProductServlet?action=goodslist-select&productId='+productsId+'"  target="_blank" class="list_inf"><span class="list_details">'+described+'</span></a>');	
	  						var $lia=$('<li class="list_1"></li>');	
	  						$('.content_ul').append($lia);
	  						$($lia).append($img);
	  						$($img).after($link);	
	  						var $diva=$('<div class="list_div"></div>');
	  						$($link).append($diva);
							var $spanb=$('<span class="list_price">￥'+price+'</span>');
							$($diva).append($spanb);
							var $spanc=$('<span class="list_ed">已售：<span>0</span>%</span>');
							$($spanb).after($spanc);
							var $bar=$('<div class="votebox"><dl class="barbox"><dd class="barline"><div w="67" style="width:0px;" class="charts"></div></dd></dl></div>');
	  						$($spanc).after($bar);
	  						$(function(){
								function animate(){
								$(".charts").each(function(i,item){
									var a=parseInt($(item).attr("w"));
									$(item).animate({
										width: a+"%"
									},1000);
								});
							}
								animate();
							});
	  						var $shopcart=$('<a href="http://localhost:8088/iGo/ShoppingCartServlet?action=intobuy&status=rushbuy&productId='+productsId+'" class="list_button"><span>加入购物车</span></a>');
							$($bar).after($shopcart);
						});
    			}	
			}
		});
	
	});
	$('#list_2').click(function(){
		$('.content_ul2').find('li').detach();
		$('.bbb').css("color","#ff3014"),
		$('.content_ul2').css("visibility", "visible"),
		$('.content_ul2').siblings().css("visibility", "hidden"),
		$('#list_2').siblings().find('*').css("color","#73738a");
		$.ajax({
			type:"Get",
			url: "http://localhost:8088/iGo/RushbuyServlet?action=eighteen&keyWord=eighteenrushbuy",
			success:function(data){
	        	if(data.length>0){	
  					var datas = eval(data); 						
	  					$.each(datas, function(i, item) {	
	  						
	  						var url = datas[i].productsUrlMain;
	  						var productsId=datas[i].productsId;
	  						var described=datas[i].described;
	  						var price=datas[i].price;
	  						//alert(url)						
	  						var $img=$('<img src="'+url+'" class="list_img">');
	  						var $link=$('<a href="http://localhost:8088/iGo/ProductServlet?action=goodslist-select&productId='+productsId+'"  target="_blank" class="list_inf"><span class="list_details">'+described+'</span></a>');	
	  						var $lia=$('<li class="list_2"></li>');	
	  						$('.content_ul2').append($lia);
	  						$($lia).append($img);
	  						$($img).after($link);	
	  						var $diva=$('<div class="list_div"></div>');
	  						$($link).append($diva);
							var $spanb=$('<span class="list_price">￥'+price+'</span>');
							$($diva).append($spanb);
							var $spanc=$('<span class="list_ed">已售：<span>0</span>%</span>');
							$($spanb).after($spanc);
							var $bar=$('<div class="votebox"><dl class="barbox"><dd class="barline"><div w="67" style="width:0px;" class="charts"></div></dd></dl></div>');
	  						$($spanc).after($bar);
	  						$(function(){
								function animate(){
								$(".charts").each(function(i,item){
									var a=parseInt($(item).attr("w"));
									$(item).animate({
										width: a+"%"
									},1000);
								});
							}
								animate();
							});
	  						var $shopcart=$('<a href="http://localhost:8088/iGo/ShoppingCartServlet?action=intobuy&status=rushbuy&productId='+productsId+'" class="list_button"><span>加入购物车</span></a>');
							$($bar).after($shopcart);
						});
						
    			}	
			}
		});
		});	
	$('#list_3').click(function(){
		$('.content_ul3').find('li').detach();
		$('.ccc').css("color","#ff3014"),
		$('.content_ul3').siblings().css("visibility", "hidden"),
		$('.content_ul3').css("visibility", "visible"),	
		$('#list_3').siblings().find('*').css("color","#73738a");
		$.ajax({
			type:"Get",
			url: "http://localhost:8088/iGo/RushbuyServlet?action=eightpm&keyWord=eightpmrushbuy",
			success:function(data){
	        	if(data.length>0){	
  					var datas = eval(data); 						
	  					$.each(datas, function(i, item) {
	  						var url = datas[i].productsUrlMain;
	  						var productsId=datas[i].productsId;
	  						var described=datas[i].described;
	  						var price=datas[i].price;
	  						//alert(url)						
	  						var $img=$('<img src="'+url+'" class="list_img">');
	  						var $link=$('<a href="http://localhost:8088/iGo/ProductServlet?action=goodslist-select&productId='+productsId+'"  target="_blank" class="list_inf"><span class="list_details">'+described+'</span></a>');	
	  						var $lia=$('<li class="list_3"></li>');	
	  						$('.content_ul3').append($lia);
	  						$($lia).append($img);
	  						$($img).after($link);	
	  						var $diva=$('<div class="list_div"></div>');
	  						$($link).append($diva);
							var $spanb=$('<span class="list_price">￥'+price+'</span>');
							$($diva).append($spanb);
							var $spanc=$('<span class="list_ed">已售：<span>0</span>%</span>');
							$($spanb).after($spanc);
							var $bar=$('<div class="votebox"><dl class="barbox"><dd class="barline"><div w="67" style="width:0px;" class="charts"></div></dd></dl></div>');
	  						$($spanc).after($bar);
	  						$(function(){
								function animate(){
								$(".charts").each(function(i,item){
									var a=parseInt($(item).attr("w"));
									$(item).animate({
										width: a+"%"
									},1000);
								});
							}
								animate();
							});
	  						var $shopcart=$('<a href="http://localhost:8088/iGo/ShoppingCartServlet?action=intobuy&status=rushbuy&productId='+productsId+'" class="list_button"><span>加入购物车</span></a>');
							$($bar).after($shopcart);
						});
						
    			}	
			}
		});
	});
	$('#list_4').click(function(){
		$('.content_ul4').find('li').detach();
		$('.ddd').css("color","#ff3014"),
		$('.content_ul4').siblings().css("visibility", "hidden"),
		$('.content_ul4').css("visibility", "visible"),	
		$('#list_4').siblings().find('*').css("color","#73738a");
		$.ajax({
			type:"Get",
			url: "http://localhost:8088/iGo/RushbuyServlet?action=tenpm&keyWord=tenpmrushbuy",
			success:function(data){
	        	if(data.length>0){	
  					var datas = eval(data); 						
	  					$.each(datas, function(i, item) {	
	  						
	  						var url = datas[i].productsUrlMain;
	  						var productsId=datas[i].productsId;
	  						var described=datas[i].described;
	  						var price=datas[i].price;
	  						//alert(url)						
	  						var $img=$('<img src="'+url+'" class="list_img">');
	  						var $link=$('<a href="http://localhost:8088/iGo/ProductServlet?action=goodslist-select&productId='+productsId+'"  target="_blank" class="list_inf"><span class="list_details">'+described+'</span></a>');	
	  						var $lia=$('<li class="list_4"></li>');	
	  						$('.content_ul4').append($lia);
	  						$($lia).append($img);
	  						$($img).after($link);	
	  						var $diva=$('<div class="list_div"></div>');
	  						$($link).append($diva);
							var $spanb=$('<span class="list_price">￥'+price+'</span>');
							$($diva).append($spanb);
							var $spanc=$('<span class="list_ed">已售：<span>0</span>%</span>');
							$($spanb).after($spanc);
							var $bar=$('<div class="votebox"><dl class="barbox"><dd class="barline"><div w="67" style="width:0px;" class="charts"></div></dd></dl></div>');
	  						$($spanc).after($bar);
	  						$(function(){
								function animate(){
								$(".charts").each(function(i,item){
									var a=parseInt($(item).attr("w"));
									$(item).animate({
										width: a+"%"
									},1000);
								});
							}
								animate();
							});
	  						var $shopcart=$('<a href="http://localhost:8088/iGo/ShoppingCartServlet?action=intobuy&status=rushbuy&productId='+productsId+'" class="list_button"><span>加入购物车</span></a>');
							$($bar).after($shopcart);
						});
						
    			}	
			}
		});
		
	});
	
	$('#list_5').click(function(){
		$('.content_ul5').find('li').detach();
		$('.eee').css("color","#ff3014"),
		$('.content_ul5').siblings().css("visibility", "hidden"),
		$('.content_ul5').css("visibility", "visible"),	
		$('#list_5').siblings().find('*').css("color","#73738a");
		$.ajax({
			type:"Get",
			url: "http://localhost:8088/iGo/RushbuyServlet?action=zeropm&keyWord=zeropmrushbuy",
			success:function(data){
	        	if(data.length>0){	
  					var datas = eval(data); 						
	  					$.each(datas, function(i, item) {	
	  						
	  						var url = datas[i].productsUrlMain;
	  						var productsId=datas[i].productsId;
	  						var described=datas[i].described;
	  						var price=datas[i].price;
	  						//alert(url)						
	  						var $img=$('<img src="'+url+'" class="list_img">');
	  						var $link=$('<a href="http://localhost:8088/iGo/ProductServlet?action=goodslist-select&flag=rushbuy&productId='+productsId+'"  target="_blank" class="list_inf"><span class="list_details">'+described+'</span></a>');	
	  						var $lia=$('<li class="list_5"></li>');	
	  						$('.content_ul5').append($lia);
	  						$($lia).append($img);
	  						$($img).after($link);	
	  						var $diva=$('<div class="list_div"></div>');
	  						$($link).append($diva);
							var $spanb=$('<span class="list_price">￥'+price+'</span>');
							$($diva).append($spanb);
							var $spanc=$('<span class="list_ed">已售：<span>0</span>%</span>');
							$($spanb).after($spanc);
							var $bar=$('<div class="votebox"><dl class="barbox"><dd class="barline"><div w="67" style="width:0px;" class="charts"></div></dd></dl></div>');
	  						$($spanc).after($bar);
	  						$(function(){
								function animate(){
								$(".charts").each(function(i,item){
									var a=parseInt($(item).attr("w"));
									$(item).animate({
										width: a+"%"
									},1000);
								});
							}
								animate();
							});
	  						var $shopcart=$('<a href="http://localhost:8088/iGo/ShoppingCartServlet?action=intobuy&status=rushbuy&productId='+productsId+'" class="list_button"><span>加入购物车</span></a>');
							$($bar).after($shopcart);
						});
						
    			}	
			}
		});
		
	});	


// =================================进度条====================================
// 




























	