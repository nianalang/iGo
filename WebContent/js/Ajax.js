$(function load(){
	//alert("111")
	$.ajax({
			type:"Get",
			url: "JsonServlet?action=eighteen&keyWord=eighteenrushbuy",
			success:function(data){
				//alert("111"+data)
				//var datas=data;
	        	if(data.length>0){	
  					var datas = eval(data); 
  					$.each(datas, function(i, item) {
  						var describe = datas[i].described;
  						var price1 = datas[i].price;   
           				var $li=$('<li class="prod"></li>');
           				var $div=$('<div class="intro"></div>');
           				var url = datas[i].productsUrlMain;  
           				var $p1=$('<p class="name">'+describe+'</p>');
           				var $p2=$('<p class="price"><em>'+'￥'+price1+'</em></p>');
						var $img=$('<img src="'+url+'" class="prodimg" />');
						var $a=$('.proda');
						$($a).append($li);	
						$($li).append($div);
						$($div).append($p1);
						$($div).append($p2);
						$($div).append($img);
					});
    			}	
	        		
			}
		});

});
/*
		var anArray = ['one','two','three'];
			$.each(anArray,function(n,value){
			alert(n);
			alert(value);
			});*/






