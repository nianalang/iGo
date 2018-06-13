jQuery.jsGlasses = {
    glasses:function(_obj){//定义函数名为“glasses”的函数，函数体是function(_obj),函数需要传递的参数是_obj
		var _box = $("#"+_obj.boxid);//获取盒子参数
		var _sum = $("#"+_obj.sumid);//获取列表参数
		var _last,_next;//定义左切换、右切换变量
		var _imgarr = _box.find("img");//找到的img标签  find() 方法获得当前元素集合中每个元素的后代,通过选择器、jQuery 对象或元素来筛选。
		var _length = _imgarr.length;//图片列表长度
		var _index = 0;//定义number类型，从0开始计数
		var _arr = new Array();//调用数组构造函数生成的数组
		_sum.append("<p style='position:absolute;left:0;top:0;'></p>");//append()函数用于向每个匹配元素内部的末尾位置追加指定的内容
		var _sumbox = _sum.find("p");//定义展示列表盒子sumbox，获取列表中的p元素。

		for(var i=0;i<_length;i++){   //for循环遍历数组
			_arr[i] = new Array();//声明一维数组
			_arr[i][0] = _imgarr.eq(i).attr("src");//数组第1位获取匹配到的“src”属性
			_arr[i][1] = _imgarr.eq(i).attr("width");//数组第2位获取匹配到的“width”属性
			_arr[i][2] = _imgarr.eq(i).attr("height");//数组第3位获取匹配到的“height”属性
			var _scale = _arr[i][1]/_arr[i][2];   //定义变量名为“_scale”（尺寸）=宽/高
			if(_scale == 1){           //宽=高
				_arr[i][3] = _obj.boxw;//数组第4位获取盒子的宽度
				_arr[i][4] = _obj.boxh;//数组第5位获取盒子的高度
				_arr[i][5] = 0;//top
				_arr[i][6] = 0;//left
				_arr[i][7] = _obj.boxw/2;//width
				_arr[i][8] = _obj.boxw*2;//width
				_arr[i][9] = _obj.boxh*2;//height
				_sumbox.append("<span><img src='"+_imgarr.eq(i).attr("src")+"' width='"+_obj.sumw+"' height='"+_obj.sumh+"' /></span>");
				}
			if(_scale > 1){       //宽>高
				_arr[i][3] = _obj.boxw;//width
				_arr[i][4] = _obj.boxw/_scale;
				_arr[i][5] = (_obj.boxh-_arr[i][4])/2;
				_arr[i][6] = 0;//left
				_arr[i][7] = _arr[i][4]/2;
				_arr[i][8] = _obj.boxh*2*_scale;//width
				_arr[i][9] = _obj.boxh*2;//height
				var _place = _obj.sumh - (_obj.sumw/_scale);
				_place = _place/2;
				_sumbox.append("<span><img src='"+_imgarr.eq(i).attr("src")+"' width='"+_obj.sumw+"' style='top:"+_place+"px;' /></span>");
				}
			if(_scale < 1){                //宽<高
				_arr[i][3] = _obj.boxh*_scale;//width
				_arr[i][4] = _obj.boxh;//height
				_arr[i][5] = 0;//top
				_arr[i][6] = (_obj.boxw-_arr[i][3])/2;
				_arr[i][7] = _arr[i][3]/2;
				_arr[i][8] = _obj.boxw*2;//width
				_arr[i][9] = _obj.boxw*2/_scale;
				var _place = _obj.sumw - (_obj.sumh*_scale);
				_place = _place/2;
				_sumbox.append("<span><img src='"+_imgarr.eq(i).attr("src")+"' height='"+_obj.sumh+"' style='left:"+_place+"px;' /></span>");
				}
		}
		_imgarr.remove();

		_sum.append("<div style='clear:both;width:100%;'></div>"); //向列表追加内容
		var _sumarr = _sum.find("span");//定义“_sumarr”变量,获取列表数组的<span>标签
		var _sumimg = _sum.find("img");//定义“_sumimg”变量,获取“img”
		_sumarr.eq(_index).addClass(_obj.sumsel);//获取匹配到的列表中的活动框“sumsel”
		var _border = _obj.sumborder*2 + _obj.sumh;//边框=列表边框*2+列表高度
		var _sumwidth = (_border+_obj.sumi)*_obj.sums;//列表宽度=（+）
		var _sumboxwidth = (_border+_obj.sumi)*_length;
		_sum.css({                     //定义列表样式
			"overflow":"hidden",
			"height":_border+"px",
			"width":_sumwidth+"px",
			"position":"relative"
			});
		_sumbox.css({   //定义列表盒子的样式
			"width":_sumboxwidth+"px"
			});
		_sumarr.css({   //定义列表里各项的样式
			"float":"left",
			"margin-left":_obj.sumi+"px",
			"width":_obj.sumw+"px",
			"height":_obj.sumh+"px",
			"overflow":"hidden",
			"position":"relative"
		});
		_sumimg.css({   //定义列表图片的样式
			"max-width":"100%",
			"max-height":"100%",
			"position":"relative"
		});

		_box.append(   //向主图盒子追加样式
			"<div style='position:relative;'>" +
			"<b style='display:block;'><img style='display:block;' src='' /></b>" +
			"<span style='position:absolute;left:0;top:0;display:none;z-index:5;background-color:#768DF5;opacity: 0.7'></span>" +
			"</div><p style='position:absolute;overflow:hidden;top:0;display:none;'>" +
			"<img style='max-width:none;max-height:none;position:relative;left:0;top:0;' src='' /></p>");
		var _glass = _box.find("span");//遮罩层 获取_box里<span>标签定义的样式
		var _imgout = _box.find("div");//左侧商品展示盒子
		var _boximg = _box.find("b img");//左侧商品大图
		var _showbox = _box.find("p");//右侧放大后的图片盒子
		var _showimg = _box.find("p img");//右侧定义放大后的图片
		_box.css({  //定义商品展示盒子的样式
			"width":_obj.boxw+"px",
			"height":_obj.boxh+"px",
			"position":"relative"
			});
		var _showboxleft = _obj.boxw +10; //放大后盒子左边=大图盒子的宽度+10（隔开点缝隙）
		_showbox.css({   //定义放大后图片盒子的样式
			"width":_obj.boxw+"px",
			"height":_obj.boxh+"px",
			"left":_showboxleft+"px"
			});

		var imgPlaces = function(){
			_showimg.attr("src",_arr[_index][0]);
			_boximg.attr("src",_arr[_index][0]);
			_boximg.css({
			    "width":_arr[_index][3]+"px",
			    "height":_arr[_index][4]+"px"
			});
			_showimg.css({
				"width":_arr[_index][8]+"px",
				"height":_arr[_index][9]+"px"
			});
			_imgout.css({
				"width":_arr[_index][3]+"px",
			    "height":_arr[_index][4]+"px",
			    "top":_arr[_index][5]+"px",
			    "left":_arr[_index][6]+"px",
			    "position":"relative"
			});
			_glass.css({
			    "width":_arr[_index][7]+"px",
			    "height":_arr[_index][7]+"px"
			});

		};
		imgPlaces();

		_imgout.mousemove(function(e){               //mousemove 事件，鼠标指针穿过被选元素或其子元素时触发；
			var _gl_w = _glass.width()/2;  //不可移动区域宽度
			var _maxX = _imgout.width() - _gl_w; //最大值  300
			var _maxY = _imgout.height() - _gl_w;
			var _moveX = 0,_moveY = 0;  //可移动坐标
			var _nowX = e.pageX - _imgout.offset().left; //鼠标相对位置
		    var _nowY = e.pageY - _imgout.offset().top;
			var _moveX = _nowX-_gl_w,_moveY = _nowY-_gl_w;

			if(_nowX <= _gl_w){ _moveX = 0; }
			if(_nowX >= _maxX){ _moveX = _maxX-_gl_w; }
			if(_nowY <= _gl_w){ _moveY = 0;}
			if(_nowY >= _maxY){ _moveY = _maxY-_gl_w;}
			_glass.css({"left":_moveX+"px","top":_moveY+"px"});

			var _imgX = -_moveX*_showbox.width()/_glass.width();
			var _imgY = -_moveY*_showbox.width()/_glass.width();
			_showimg.css({"left":_img+"px","top":_imgY+"px"});

		});

		_imgout.mouseenter(function(){   //mouseenter事件，鼠标指针穿过被选元素触发的事件
			_glass.css("display","block");
			_showbox.css("display","block");

			});
		_imgout.mouseleave(function(){   //mouseleave事件，鼠标离开指定的对象触发的事件；
			_glass.css("display","block");
			_showbox.css("display","none");
			});

		//图片列表部分
		var _nextbtn = $("#"+_obj.nextid);//获取右切换按钮的参数
		var _lastbtn = $("#"+_obj.lastid);//获取左切换按钮的参数
		var _moveindex = 0;//索引移动

		var _sumListMove = function(){         //为列表移动添加事件
			var _leftmove = -_moveindex*(_border+_obj.sumi);  //设置移动列表时，左移的距离
			if(_sumbox.is(":animated")){_sumbox.stop(true,true);} /* 判断“内容展示区域”是否正在处于动画*/
			_sumbox.animate({left:_leftmove+"px"},300);/*设置动画的过度时间 300毫秒*/
			_sumarr.eq(_index).addClass(_obj.sumsel).siblings().removeClass(_obj.sumsel);
			imgPlaces();
		};

		if(_length <= _obj.sums){    //图片列表的长度<=列表显示个数
			var _place = (_obj.sums-_length)*_border/2;
			_sumbox.css("left",_place+"px");
			_nextbtn.click(function(){
				_index++;
				if(_index >= _length){ _index=_length;}
				_sumarr.eq(_index).addClass(_obj.sumsel).siblings().removeClass(_obj.sumsel);
			    imgPlaces();
			});
			_lastbtn.click(function(){  //为左切换按钮添加鼠标点击事件
				_index--;
				if(_index <= 0){ _index=0;}
				_sumarr.eq(_index).addClass(_obj.sumsel).siblings().removeClass(_obj.sumsel);
			    imgPlaces();
			});
		}else{
			var _maxNum = _length-_obj.sums;
			_nextbtn.click(function(){             //为右切换按钮添加鼠标点击事件
			   _moveindex++;
			   if(_moveindex >= _maxNum){ _moveindex=_maxNum; }
			   if(_index <= _moveindex){ _index=_moveindex;}
			   _sumListMove();
		    });
			_lastbtn.click(function(){             //为左切换按钮添加鼠标点击事件
				_moveindex--;
				if(_moveindex <= 0){ _moveindex=0;}
				if(_index >= _moveindex+_obj.sums){ _index=_moveindex+_obj.sums-1;}
				_sumListMove();
			});
		}

		_sumarr.hover(function(){                  //列表鼠标悬浮事件
			_index = $(this).index();
			_sumarr.eq(_index).addClass(_obj.sumsel).siblings().removeClass(_obj.sumsel);
			imgPlaces();
		});

  }
}