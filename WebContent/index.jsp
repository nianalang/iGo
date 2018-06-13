<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>iGo购物网</title>
	<link rel="stylesheet" type="text/css" href="css/style.css">
	<script type="text/javascript" src="js/jquery-1.8.1.js"></script>	
</head>
 
<body>
	 <jsp:include page="share.jsp"></jsp:include>

	<!--注销对话框  -->
	<script type="text/javascript">
		 function logout(){
			 return confirm("您确定要注销吗？");
			 //不加return，点击确定取消都会跳转页面
		 }
	</script>
	<!--给搜索框的超链接赋值  -->
	<script type="text/javascript">
	function search(){
		var search=document.getElementById("search");
		var ssss="ProductServlet?action=fuzzyQuery&keyClass=1&keyword=";
		var aaaa=ssss+search.value;	
		$('.seachHref').attr('href',aaaa); 	
	}
	</script>
<!-- 

else if(userName!=null&&"2".equals(flag)){
			%>
				<a title="欢迎登陆iGo网！"><span id="login">欢迎您登录iGo网</span></a>
			<span id="cart"><a href="ManagerServlet?action=allproducts">我的管理</a></span>
			<span id="erweima"><a href="ManagerServlet?action=managerInf" >个人信息</a></span>
			<a  href="LoginOutServlet?loginOut=loginOut"  id="logout" onclick="return logout()"><span id="feedback">注销</span></a>
			}
 -->
<!-- 页眉 -->
<!-- 顶部信息 -->
	<div id="topbar">	
		<span id="topbox">		
			<%
				//取出session的值
				String userName=(String)session.getAttribute("userName");
				String flag=(String)session.getAttribute("flag");
				if(userName==null){
			%>
					<input type="hidden" name="action" value="login">
					<a href="login.jsp" title="您好，请登陆！"><span id="login">用户登陆</span></a>
					<a href="managerlogin/mlogin.jsp" title="您好，请登陆！"><span id="login">M登陆</span></a>
					<a href="register.jsp" title="注册" target="_blank" ><span id="register">注册</span></a>
			<% 
			}else if(userName!=null&&"1".equals(flag)){
			%>
			<a title="欢迎登陆iGo网！"><span id="login">欢迎您登录iGo网</span></a>
			<span id="cart"><a href="ShoppingCartServlet?action=lookcarts&status=0">购物车</a></span>
			<span id="erweima"><a href="ShoppingCartServlet?action=lookPaidBuy&status=1" >个人信息</a></span>
			<a  href="LoginOutServlet?loginOut=loginOut"  id="logout" onclick="return logout()"><span id="feedback">注销</span></a>
			<% 
			}
			%>	
		</span>
	</div>
	<div class="search-bar">
	<!-- logo -->
		<div class="logo"><img src="images/logo.jpg" alt="logo" id="logo" /></div>
		<!-- 搜索框 -->
		<div class="search">
			<input type="text" id="search" name="search"  onkeyup="getMoreContents()" onblur="keywordBlur()"/>
			<a href="javascript:;"   class="seachHref"  >
				<div id="icon-search">
					<img src="images/搜索.png" alt="搜索"  onclick="search();"/>
				</div>
			</a>
			<!-- 热搜商品列表 -->
			<span class="hotsearch">
				<span>除甲醛</span>
				<span>黑色酱油</span>
				<span>爱他美</span>
				<span>油烟机</span>
				<span>香皂</span>
				<span>电视</span>
				<span>茶几</span>
				<span>双人床</span>
				<span>电水壶</span>
				<span>自拍杆</span>
				<span>欧式果盘</span>
				<span>多肉</span>
			</span>
		</div>
		<!-- 二维码 -->
		<!-- 仿淘宝 -->
		<div class="QR">
			<img src="images/QR.png" alt="扫一扫" id="QRpng">
		</div>
		
	</div>
		<!--显示框-->
	<div id="box2">
		 <ul id="ul">			
		 </ul>
	</div>
	<script type="text/javascript">
	var xmlHttp=new XMLHttpRequest();
	function getMoreContents(){
		var content = document.getElementById("search");
		//alert(content.value+"111")
		if(content.value == ""){
			clearContent();
			return;
		}
	
		//定义服务器地址，
    	var url = "SearchServlrt?search="+encodeURI(content.value);	    	
    	xmlHttp.open("GET",url,true);	
		xmlHttp.send();
    	xmlHttp.onreadystatechange=function(){
      		 if(xmlHttp.readyState==4 && xmlHttp.status==200){
      			var json=JSON.parse(xmlHttp.responseText); 
      			//alert(json+"111")
				setContent(json);
      		 }
   	    }
	}
		function setContent(contents){
			var ul=document.getElementById("ul");
			document.getElementById("box2").style.display='block';
			var size=contents.length;
 			for(var i=0;i<size;i++){
    				var nextNode = contents[i];
					var li = document.createElement("li");
					var text = document.createTextNode(nextNode);
    				li.append(text);
    				ul.append(li);
					li.setAttribute("class","li");
					li.onmousedown = function(){
		            	document.getElementById("search").value =this.innerText;
		           }; 
 			}  
		}
		
		function clearContent(){
			var contentTableBody = document.getElementById("ul");
			var sizes = contentTableBody.childNodes.length;
			for(var i = sizes-1;i>=0;i--){
				contentTableBody.removeChild(contentTableBody.childNodes[i]);
			}
			document.getElementById("box2").style.display="none";
			
		}
		
		function keywordBlur(){
			clearContent();
		}
 </script>
	<div id="a123">
		<!-- 左侧导航 -->
		<div class="nav">
			<!--图标-->
			<div id="import" class="nav1">
				<img src="images/全球.png" id="img1"/>
				<span class="fisrt">全球进口</span>
			</div>
			<div id="food" class="nav1">
				<img src="images/食物.png" id="img2"/>
				<span class="fisrt">食品</span>
				<span>&frasl;</span>
				<span>酒</span>
				<span>&frasl;</span>
				<span>生鲜</span>
			</div>
			<div id="mombaby" class="nav1">
				<img src="images/baby.png" id="img3"/>
				<span class="fisrt">母婴</span>
				<span>&frasl;</span>
				<span>玩具</span>
				<span>&frasl;</span>
				<span>童装</span>
			</div>
			<div id="paper" class="nav1">
				<img src="images/纸巾.png" id="img4"/>
				<span class="fisrt">纸巾</span>
				<span>&frasl;</span>
				<span>厨卫清洁</span>
			</div>
			<div id="jiaju" class="nav1">
				<img src="images/家居.png" id="img5"/>
				<span class="fisrt">家居</span>
				<span>&frasl;</span>
				<span>家纺</span>
				<span>&frasl;</span>
				<span>家装</span>
				<span>&frasl;</span>
				<span>宠物</span>
			</div>
			<div id="clothes" class="nav1">
				<img src="images/女装.png" id="img6"/>
				<span class="fisrt">女装</span>
				<span>&frasl;</span>
				<span>男装</span>
				<span>&frasl;</span>
				<span>内衣</span>
				<span>&frasl;</span>
				<span>珠宝</span>
			</div>
			<div id="shoes" class="nav1">
				<img src="images/鞋靴.png" id="img7"/>
				<span class="fisrt">鞋靴</span>
				<span>&frasl;</span>
				<span>箱包</span>
				<span>&frasl;</span>
				<span>运动户外</span>
			</div>
			<div id="phone" class="nav1">
				<img src="images/手机.png" id="img8"/>
				<span class="fisrt">手机</span>
				<span>&frasl;</span>
				<span>数码</span>
				<span>&frasl;</span>
				<span>电脑办公</span>
			</div>
			<div id="cars" class="nav1">
				<img src="images/汽车用品.png" id="img9"/>
				<span class="fisrt">汽车用品</span>
				<span>&frasl;</span>
				<span>家用电器</span>
			</div>
			<div id="medicine" class="nav1">
				<img src="images/医药.png" id="img10"/>
				<span class="fisrt">医药</span>
				<span>&frasl;</span>
				<span>保健滋补</span>
				<span>&frasl;</span>
				<span>成人</span>
			</div>
			<div id="books" class="nav1">
				<img src="images/图书.png" id="img11">
				<span class="fisrt" id="book">图书</span>
			</div>
		</div><!--选项卡切换-->
		<div id="bigbox">
			<!-- 1全球进口 -->
			<div id="textlist1" class="textlist">
				<div id="aline1" class="list">
					<span class="first-list" id="afirst-list1">乳品生鲜&nbsp;&gt;</span>
					<a href="ProductServlet?keyword=milk&action=index-select"  target="_blank"><span>牛奶</span></a>
					<span>成人奶粉</span>
					<span>酸奶</span>
					<span>豆奶</span>
					<span>奶酪</span>
					<span>黄油/奶油</span>
					<span>水果</span>
				</div>
				<hr class="hr">
				<div id="aline2" class="list">
					<span class="first-list" id="afirst-list2">饼干糕点&nbsp;&gt;</span>
					<span>饼干</span>
					<span>曲奇</span>
					<span>威化</span>
					<span>夹心饼干</span>
					<span>苏打饼干</span>
					<span>黄油/奶油</span>
					<span>糕点</span>
					<span>小饼干</span>
				</div>
				<hr class="hr">
				<div id="aline3" class="list">
					<span class="first-list" id="afirst-list3">酒水饮料&nbsp;&gt;</span>
					<span>葡萄酒</span>
					<span>啤酒</span>
					<span>洋酒</span>
					<span>气泡酒</span>
					<span>饮用水</span>
					<span>碳酸饮料</span>
					<span>果蔬汁</span>
					<span>咖啡</span>
					<span>茶饮料</span>
				</div>
				<hr class="hr">
				<div id="aline4" class="list">
					<span class="first-list" id="afirst-list4">休闲零食&nbsp;&gt;</span>
					<span>坚果</span>
					<span>果干</span>
					<span>海苔</span>
					<span>膨化食品</span>
					<span>巧克力</span>
					<span>糖果</span>
					<span>果冻</span>
					<span>布丁</span>
					<span>辣条</span>
				</div>
				<hr class="hr">
				<div id="aline5" class="list">
					<span class="first-list" id="afirst-list5">粮油调味&nbsp;&gt;</span>
					<span>橄榄油</span>
					<span>大米</span>
					<span>方便面</span>
					<span>罐头</span>
					<span>食用油</span>
				</div>
				<hr class="hr">
				<div id="aline6" class="list">
					<span class="first-list" id="afirst-list6">茶冲咖啡&nbsp;&gt;</span>
					<span>速溶咖啡</span>
					<span>咖啡伴侣</span>
					<span>咖啡豆</span>
					<span>咖啡粉</span>
					<span>白咖啡</span>
				</div>
				<hr class="hr">
				<div id="aline7" class="list">
					<span class="first-list" id="afirst-list7">母婴玩具&nbsp;&gt;</span>
					<span>奶粉</span>
					<span>尿裤</span>
					<span>婴儿湿巾</span>
					<span>洗护清洁</span>
					<span>哺育喂养</span>
					<span>童车</span>
					<span>童床</span>
					<span>辅食</span>
					<span>婴儿零食</span>
				</div>
				<hr class="hr">
				<div id="aline8" class="list">
					<span class="first-list" id="afirst-list8">美妆个护&nbsp;&gt;</span>
					<span>洁面卸妆</span>
					<span>面膜</span>
					<span>彩妆</span>
					<span>香水</span>
					<span>洗发</span>
					<span>护发套装</span>
					<span>沐浴露</span>
					<span>洗手液</span>
					<span>牙膏</span>
					<span>牙刷</span>
					<span>漱口水</span>
					<span>卫生巾</span>
				</div>
				<hr class="hr">
				<div id="aline9" class="list">
					<span class="first-list" id="afirst-list9">家居清洁&nbsp;&gt;</span>
					<span>水具</span>
					<span>锅具</span>
					<span>刀具</span>
					<span>乳胶枕</span>
					<span>宠物用品</span>
					<span>宠物粮食</span>
					<span>宠物零食/玩具</span>
				</div>
				<hr class="hr">
				<div id="aline10" class="list">
					<span class="first-list" id="afirst-list10">学习用品&nbsp;&gt;</span>
					<span>参考书</span>
					<span>工具书</span>
					<span>笔</span>
					<span>精装笔记本</span>
					<span>港澳台名著</span>
				</div>
			</div>
			<!-- 2食品酒生鲜 -->
			<div id="textlist2" class="textlist">
				<div id="bline1" class="list">
					<span class="first-list" id="bfirst-list1">休闲零食&nbsp;&gt;</span>
					<span>坚果</span>
					<span>膨化食品</span>
					<span>糖果</span>
					<span>肉干/肉脯</span>
					<span>巧克力</span>
					<span>海味零食</span>
					<span>果冻</span>
					<span>布丁</span>
					<span>蜜饯类</span>
				</div>
				<hr class="hr">
				<div id="bline2" class="list">
					<span class="first-list" id="bfirst-list2">饼干糕点&nbsp;&gt;</span>
					<span>饼干</span>
					<span>曲奇</span>
					<span>威化</span>
					<span>夹心饼干</span>
					<span>苏打饼干</span>
					<span>黄油/奶油</span>
					<span>糕点</span>
					<span>小饼干</span>
				</div>
				<hr class="hr">
				<div id="bline3" class="list">
					<span class="first-list" id="bfirst-list3">酒水饮料&nbsp;&gt;</span>
					<span>葡萄酒</span>
					<span>白酒</span>
					<span>饮用水</span>
					<span>碳酸饮料</span>
					<span>果蔬汁</span>
					<span>啤酒</span>
					<span>洋酒</span>
					<span>气泡酒</span>
				</div>
				<hr class="hr">
				<div id="bline4" class="list">
					<span class="first-list" id="bfirst-list4">牛奶乳品&nbsp;&gt;</span>
					<span>纯牛奶</span>
					<span>儿童奶</span>
					<span>酸奶</span>
					<span>豆奶</span>
					<span>羊奶</span>
				</div>
				<hr class="hr">
				<div id="bline5" class="list">
					<span class="first-list" id="bfirst-list5">茶冲咖啡&nbsp;&gt;</span>
					<span>速溶咖啡</span>
					<span>咖啡伴侣</span>
					<span>咖啡豆</span>
					<span>成人奶粉</span>
					<span>咖啡粉</span>
					<span>普洱茶</span>
					<span>绿茶</span>
					<span>红茶</span>
					<span>乌龙茶</span>
					<span>柚子茶</span>
					<span>花草茶</span>
				</div>
				<hr class="hr">
				<div id="bline6" class="list">
					<span class="first-list" id="bfirst-list6">粮油干货&nbsp;&gt;</span>
					<span>菌菇</span>
					<span>桂圆</span>
					<span>莲子</span>
					<span>银耳</span>
					<span>枸杞</span>
					<span>食用油</span>
					<span>大米</span>
					<span>面粉</span>
					<span>杂粮</span>
					<span>面条</span>
					<span>粉丝</span>
				</div>
				<hr class="hr">
				<div id="bline7" class="list">
					<span class="first-list" id="bfirst-list7">方便速食&nbsp;&gt;</span>
					<span>罐头</span>
					<span>火腿肠</span>
					<span>年糕</span>
					<span>意大利面</span>
					<span>粽子</span>
					<span>腊制品</span>
					<span>方便面</span>
				</div>
				<hr class="hr">
				<div id="bline8" class="list">
					<span class="first-list" id="bfirst-list8">厨房调料&nbsp;&gt;</span>
					<span>糖</span>
					<span>酱油</span>
					<span>调味料</span>
					<span>调味酱</span>
					<span>淀粉</span>
					<span>盐</span>
					<span>果酱</span>
					<span>料酒</span>
					<span>鸡精/味精</span>
					<span>腐乳</span>
					<span>炼乳</span>
					<hr class="hr">
				</div>
				<div id="bline9" class="list">
					<span class="first-list" id="bfirst-list9">乳品速食&nbsp;&gt;</span>
					<span>火锅食材</span>
					<span>冷冻蔬菜</span>
					<span>半成品</span>
					<span>冰淇淋</span>
					<span>低温酸奶</span>
					<span>鲜奶</span>
					<span>黄油</span>
					<span>奶酪</span>
					<span>水饺馄饨</span>
					<hr class="hr">
				</div>
				<div id="bline10" class="list">
					<span class="first-list" id="bfirst-list10">肉蛋海鲜&nbsp;&gt;</span>
					<span>牛肉</span>
					<span>鱼</span>
					<span>虾类</span>
					<span>海参</span>
					<span>猪肉</span>
					<span>羊肉</span>
					<span>蛋类</span>
					<span>鸡肉</span>
					<span>海鲜</span>
				</div>
			</div>
			<!-- 3母婴玩具 -->
			<div id="textlist3" class="textlist">
				<div id="cline1" class="list">
					<span class="first-list" id="cfirst-list1">各种奶粉&nbsp;&gt;</span>
					<span>1段奶粉</span>
					<span>2段奶粉</span>
					<span>3段奶粉</span>
					<span>4段奶粉</span>
					<span>妈妈奶粉</span>
					<span>婴儿奶粉</span>
					<span>特殊配方奶粉</span>
					<span>牛奶粉</span>
					<span>羊奶粉</span>
				</div>
				<hr class="hr">
				<div id="cline2" class="list">
					<span class="first-list" id="cfirst-list2">婴幼食品&nbsp;&gt;</span>
					<span>米粉周</span>
					<span>果蔬/肉泥</span>
					<span>面条</span>
					<span>饼干/磨牙棒</span>
					<span>肉松</span>
					<span>果汁饮料</span>
					<span>零食</span>
					<span>调味品</span>
				</div>
				<hr class="hr">
				<div id="cline3" class="list">
					<span class="first-list" id="cfirst-list3">童装童鞋&nbsp;&gt;</span>
					<span>袜子</span>
					<span>家居服</span>
					<span>外套/大衣</span>
					<span>羽绒服</span>
					<span>连体衣/爬服</span>
					<span>裤子</span>
					<span>亲子装</span>
					<span>运动鞋</span>
					<span>学步鞋/步前鞋</span>
				</div>
				<hr class="hr">
				<div id="cline4" class="list">
					<span class="first-list" id="cfirst-list4">尿裤湿巾&nbsp;&gt;</span>
					<span>纸尿裤</span>
					<span>拉拉裤</span>
					<span>婴儿湿巾</span>
					<span>成人纸尿裤</span>
					<span>NB</span>
					<span>S</span>
					<span>M</span>
					<span>L</span>
				</div>
				<hr class="hr">
				<div id="cline5" class="list">
					<span class="first-list" id="cfirst-list5">妈妈专区&nbsp;&gt;</span>
					<span>妈咪包/背婴带</span>
					<span>产后塑身</span>
					<span>文胸/内裤</span>
					<span>防辐射服</span>
					<span>孕妈装</span>
					<span>孕期营养</span>
					<span>待产护理</span>
					<span>储奶器</span>
					<span>防溢乳垫</span>
				</div>
				<hr class="hr">
				<div id="cline6" class="list">
					<span class="first-list" id="cfirst-list6">宝宝服饰&nbsp;&gt;</span>
					<span>婴儿外出服</span>
					<span>婴儿内衣</span>
					<span>婴儿礼盒</span>
					<span>婴儿鞋帽袜</span>
					<span>安全防护</span>
					<span>睡袋</span>
					<span>抱被</span>
				</div>
				<hr class="hr">
				<div id="cline7" class="list">
					<span class="first-list" id="cfirst-list7">童车安全&nbsp;&gt;</span>
					<span>安全座椅</span>
					<span>婴儿手推车</span>
					<span>餐椅摇椅</span>
					<span>婴儿床</span>
					<span>学步车</span>
					<span>三轮车</span>
					<span>提篮式座椅</span>
				</div>
				<hr class="hr">
				<div id="cline8" class="list">
					<span class="first-list" id="cfirst-list8">宝宝喂养&nbsp;&gt;</span>
					<span>牙胶安抚</span>
					<span>水壶水具</span>
					<span>儿童餐具</span>
					<span>暖奶消毒</span>
					<span>吸奶器</span>
					<span>奶瓶奶嘴</span>
					<span>奶瓶刷/奶嘴刷</span>
					<hr class="hr">
				</div>
				<div id="cline9" class="list">
					<span class="first-list" id="cfirst-list9">洗护清洁&nbsp;&gt;</span>
					<span>宝宝护肤</span>
					<span>理发</span>
					<span>口腔清洗</span>
					<span>洗衣皂</span>
					<span>洗衣液</span>
					<span>坐便器</span>
					<span>奶瓶清洗</span>
					<span>洗发/护发</span>
					<span>沐浴露</span>
					<span>儿童洗手液</span>
					<hr class="hr">
				</div>
				<div id="cline10" class="list">
					<span class="first-list" id="cfirst-list10">营养食品&nbsp;&gt;</span>
					<span>钙铁锌</span>
					<span>维生素</span>
					<span>益生菌</span>
					<span>牛初乳</span>
					<span>葡萄糖</span>
					<span>蛋白粉</span>
					<span>鱼肝油</span>
				</div>
			</div>
			<!-- 4纸巾厨卫清洁 -->
			<div id="textlist4" class="textlist">
				<div id="dline1" class="list">
					<span class="first-list" id="dfirst-list1">&nbsp;&nbsp;&nbsp;一次性&nbsp;&gt;</span>
					<span>保鲜袋</span>
					<span>垃圾袋</span>
					<span>纸杯塑杯</span>
					<span>牙签</span>
					<span>密实袋</span>
					<span>一次性餐具</span>
					<span>保鲜膜</span>
				</div>
				<hr class="hr">
				<div id="dline2" class="list">
					<span class="first-list" id="dfirst-list2">纸品湿巾&nbsp;&gt;</span>
					<span>厨房用纸</span>
					<span>平板卫生纸</span>
					<span>手帕纸</span>
					<span>湿巾</span>
					<span>卷筒纸</span>
					<span>抽纸</span>
					<span>商务纸</span>
					<span>湿厕纸</span>
				</div>
				<hr class="hr">
				<div id="dline3" class="list">
					<span class="first-list" id="dfirst-list3">家庭清洁&nbsp;&gt;</span>
					<span>洗洁精</span>
					<span>消毒液</span>
					<span>油污清洁剂</span>
					<span>除臭芳香</span>
					<span>地板清洁护理</span>
					<span>家私清洁皮具护理</span>
					<span>多用途清洁剂</span>
				</div>
				<hr class="hr">
				<div id="dline4" class="list">
					<span class="first-list" id="dfirst-list4">衣物清洁&nbsp;&gt;</span>
					<span>洗衣粉</span>
					<span>洗衣皂</span>
					<span>洗衣液</span>
					<span>柔顺剂</span>
					<span>衣物除菌液</span>
					<span>衣领净</span>
					<span>彩漂</span>
					<span>去渍剂</span>
				</div>
				<hr class="hr">
				<div id="dline5" class="list">
					<span class="first-list" id="dfirst-list5">清洁用具&nbsp;&gt;</span>
					<span>钢丝球</span>
					<span>抹布百洁布</span>
					<span>除尘工具</span>
					<span>擦窗器</span>
					<span>拖把</span>
					<span>垃圾桶</span>
					<span>肥皂盒</span>
					<span>防滑垫</span>
					<span>家务手套</span>
				</div>
				<hr class="hr">
				<div id="dline6" class="list">
					<span class="first-list" id="dfirst-list6">驱虫除湿&nbsp;&gt;</span>
					<span>防霉除湿</span>
					<span>樟脑樟木</span>
					<span>除螨仪</span>
					<span>空气清新剂</span>
				</div>
			</div>
			<!-- 5家居 -->
			<div id="textlist5" class="textlist">
				<div id="eline1" class="list">
					<span class="first-list" id="efirst-list1">床上用品&nbsp;&gt;</span>
					<span>电热毯/电热垫</span>
					<span>床褥</span>
					<span>被子</span>
					<span>枕头枕芯</span>
					<span>床品套件</span>
					<span>儿童床品</span>
					<span>秋冬被</span>
				</div>
				<hr class="hr">
				<div id="eline2" class="list">
					<span class="first-list" id="efirst-list2">家纺布艺&nbsp;&gt;</span>
					<span>马桶套</span>
					<span>毛巾面巾</span>
					<span>沙发垫</span>
					<span>浴巾浴袍</span>
					<span>地毯地垫</span>
					<span>桌布</span>
					<span>防尘罩</span>
					<span>围裙</span>
				</div>
				<hr class="hr">
				<div id="eline3" class="list">
					<span class="first-list" id="efirst-list3">收纳洗晒&nbsp;&gt;</span>
					<span>压缩袋/泵</span>
					<span>鞋架</span>
					<span>收纳箱</span>
					<span>衣物收纳</span>
					<span>卫浴收纳</span>
					<span>收纳层架</span>
				</div>
				<hr class="hr">
				<div id="eline4" class="list">
					<span class="first-list" id="efirst-list4">餐具水具&nbsp;&gt;</span>
					<span>筷子</span>
					<span>碗盘碟</span>
					<span>刀叉匙</span>
					<span>果盘托盘</span>
					<span>保鲜盒</span>
					<span>餐具套装</span>
					<span>保温饭盒</span>
					<span>水具水壶</span>
				</div>
				<hr class="hr">
				<div id="eline5" class="list">
					<span class="first-list" id="efirst-list5">居家日用&nbsp;&gt;</span>
					<span>杯垫</span>
					<span>锅碗垫</span>
					<span>炭包</span>
					<span>除测甲醛</span>
					<span>挂钩粘钩</span>
					<span>雨伞雨具</span>
					<span>口罩</span>
					<span>暖宝贴</span>
				</div>
				<hr class="hr">
				<div id="eline6" class="list">
					<span class="first-list" id="efirst-list6">厨具锅具&nbsp;&gt;</span>
					<span>炒锅</span>
					<span>奶锅</span>
					<span>蒸锅</span>
					<span>压力锅</span>
					<span>平底锅</span>
					<span>烧水壶</span>
					<span>套装锅</span>
					<span>砧板</span>
					<span>烘焙工具</span>
				</div>
				<hr class="hr">
				<div id="eline7" class="list">
					<span class="first-list" id="efirst-list7">宠物用品&nbsp;&gt;</span>
					<span>保健品</span>
					<span>服装</span>
					<span>医护美容</span>
					<span>日用品</span>
					<span>出行装备</span>
					<span>玩具</span>
					<span>水族宠物</span>
					<span>猫主粮</span>
					<span>狗主粮</span>
					<span>猫零食</span>
					<span>狗零食</span>
				</div>
				<hr class="hr">
				<div id="eline8" class="list">
					<span class="first-list" id="efirst-list8">鲜花园艺&nbsp;&gt;</span>
					<span>花盆花架</span>
					<span>绿植盆栽</span>
					<span>庭园植物</span>
					<span>鲜花</span>
					<span>迷你植物</span>
					<span>园艺用品</span>
					<span>玫瑰</span>
					<span>多肉</span>
					<span>种子</span>
				</div>
				<hr class="hr">
				<div id="eline9" class="list">
					<span class="first-list" id="efirst-list9">家装建材&nbsp;&gt;</span>
					<span>墙纸</span>
					<span>地暖</span>
					<span>暖气片</span>
					<span>灯饰</span>
					<span>五金</span>
					<span>镜子</span>
					<span>厨房装修</span>
					<span>卫浴装修</span>
					<span>灯管灯泡</span>
					<span>涂料</span>
					<span>集成吊顶</span>
				</div>
			</div>
			<!-- 6女装男装 -->
			<div id="textlist6" class="textlist">
				<div id="fline1" class="list">
					<span class="first-list" id="ffirst-list1">女士服装&nbsp;&gt;</span>
					<span>羽绒服</span>
					<span>棉服</span>
					<span>外套</span>
					<span>连衣裙</span>
					<span>卫衣</span>
					<span>风衣</span>
					<span>针织衫</span>
					<span>毛呢大衣</span>
					<span>西装</span>
					<span>半身裙</span>
				</div>
				<hr class="hr">
				<div id="fline2" class="list">
					<span class="first-list" id="ffirst-list2">男士服装&nbsp;&gt;</span>
					<span>羽绒服</span>
					<span>休闲裤</span>
					<span>棒球服</span>
					<span>卫衣</span>
					<span>运动裤</span>
					<span>针织衫</span>
					<span>牛仔裤</span>
					<span>西装</span>
					<span>夹克</span>
				</div>
				<hr class="hr">
				<div id="fline3" class="list">
					<span class="first-list" id="ffirst-list3">内衣内裤&nbsp;&gt;</span>
					<span>文胸</span>
					<span>抹胸</span>
					<span>保暖衣裤</span>
					<span>塑身衣</span>
					<span>男士内裤</span>
					<span>女士背心</span>
				</div>
				<hr class="hr">
				<div id="fline4" class="list">
					<span class="first-list" id="ffirst-list4">睡衣配件&nbsp;&gt;</span>
					<span>睡衣套装</span>
					<span>睡裙</span>
					<span>睡袍</span>
					<span>领带/领结</span>
					<span>丝袜/连裤袜</span>
					<span>棉袜</span>
					<span>女袜</span>
					<span>手套</span>
				</div>
				<hr class="hr">
				<div id="fline5" class="list">
					<span class="first-list" id="ffirst-list5">珠宝饰品&nbsp;&gt;</span>
					<span>黄金</span>
					<span>K金</span>
					<span>铂金</span>
					<span>金银投资</span>
					<span>彩宝</span>
					<span>水晶玛瑙</span>
					<span>项链</span>
					<span>戒指</span>
				</div>
				<hr class="hr">
				<div id="fline6" class="list">
					<span class="first-list" id="ffirst-list6">各种钟表&nbsp;&gt;</span>
					<span>瑞士表</span>
					<span>国表</span>
					<span>配件</span>
					<span>男表</span>
					<span>女表</span>
					<span>儿童表</span>
					<span>电子表</span>
				</div>
				<hr class="hr">
				<div id="fline7" class="list">
					<span class="first-list" id="ffirst-list7">各种眼镜&nbsp;&gt;</span>
					<span>太阳镜</span>
					<span>老花镜</span>
					<span>眼镜架</span>
					<span>打火机</span>
					<span>烟具</span>
				</div>
			</div>
			<!-- 7鞋靴箱包 -->
			<div id="textlist7" class="textlist">
				<div id="gline1" class="list">
					<span class="first-list" id="gfirst-list1">女士鞋靴&nbsp;&gt;</span>
					<span>帆布鞋</span>
					<span>雪地靴</span>
					<span>女靴</span>
					<span>休闲鞋</span>
					<span>妈妈鞋</span>
					<span>高跟鞋</span>
					<span>松糕鞋</span>
					<span>马丁靴</span>
					<span>平底鞋</span>
					<span>小白鞋</span>
				</div>
				<hr class="hr">
				<div id="gline2" class="list">
					<span class="first-list" id="gfirst-list2">男士鞋靴&nbsp;&gt;</span>
					<span>帆布鞋</span>
					<span>商务鞋</span>
					<span>男靴</span>
					<span>工装鞋</span>
					<span>定制鞋</span>
					<span>球鞋</span>
					<span>网鞋</span>
					<span>休闲鞋</span>
					<span>高帮鞋</span>
				</div>
				<hr class="hr">
				<div id="gline3" class="list">
					<span class="first-list" id="gfirst-list3">运动鞋服&nbsp;&gt;</span>
					<span>跑步鞋</span>
					<span>篮球鞋</span>
					<span>休闲鞋</span>
					<span>帆布鞋</span>
					<span>综合训练鞋</span>
					<span>足球鞋</span>
					<span>羽毛球鞋</span>
					<span>运动服</span>
					<span>运动卫衣</span>
				</div>
				<hr class="hr">
				<div id="gline4" class="list">
					<span class="first-list" id="gfirst-list4">户外装备&nbsp;&gt;</span>
					<span>帐篷</span>
					<span>户外照明</span>
					<span>户外背包</span>
					<span>垂钓装备</span>
					<span>野餐烧烤</span>
					<span>户外鞋</span>
					<span>冲锋衣</span>
					<span>速干衣裤</span>
				</div>
				<hr class="hr">
				<div id="gline5" class="list">
					<span class="first-list" id="gfirst-list5">健身球具&nbsp;&gt;</span>
					<span>羽毛球</span>
					<span>篮球</span>
					<span>足球</span>
					<span>游泳</span>
					<span>瑜伽</span>
					<span>乒乓球</span>
					<span>轮滑</span>
					<span>自行车</span>
					<span>动感单车</span>
					<span>跑步机</span>
					<span>健身车</span>
				</div>
				<hr class="hr">
				<div id="gline6" class="list">
					<span class="first-list" id="gfirst-list6">&nbsp;&nbsp;&nbsp;女式包&nbsp;&gt;</span>
					<span>单肩包</span>
					<span>手提包</span>
					<span>斜挎包</span>
					<span>化妆包</span>
					<span>双肩包</span>
					<span>真皮包</span>
					<span>链条包</span>
					<span>水桶包</span>
					<span>帆布包</span>
				</div>
				<hr class="hr">
				<div id="gline7" class="list">
					<span class="first-list" id="gfirst-list7">&nbsp;&nbsp;&nbsp;男士包&nbsp;&gt;</span>
					<span>商务包</span>
					<span>手提包</span>
					<span>斜挎包</span>
					<span>胸包/腰包</span>
					<span>双肩包</span>
					<span>真皮包</span>
					<span>公文</span>
					<span>休闲包</span>
					<span>帆布包</span>
				</div>
				<hr class="hr">
				<div id="gline7" class="list">
					<span class="first-list" id="gfirst-list7">功能箱包&nbsp;&gt;</span>
					<span>男士钱包</span>
					<span>女士钱包</span>
					<span>短款钱包</span>
					<span>长款钱包</span>
					<span>拉杆箱</span>
					<span>拉杆包</span>
					<span>电脑包</span>
					<span>双肩包</span>
					<span>登机箱</span>
					<span>儿童书包</span>
				</div>
			</div>
			<!-- 8手机数码 -->
			<div id="textlist8" class="textlist">
				<div id="hline1" class="list">
					<span class="first-list" id="hfirst-list1">各种手机&nbsp;&gt;</span>
					<span>手机</span>
				</div>
				<hr class="hr">
				<div id="hline2" class="list">
					<span class="first-list" id="hfirst-list2">手机配件&nbsp;&gt;</span>
					<span>苹果配件</span>
					<span>蓝牙耳机</span>
					<span>手机储存卡</span>
					<span>手机耳机</span>
					<span>自拍杆</span>
					<span>数据线</span>
					<span>充电器</span>
					<span>手机壳</span>
					<span>贴膜</span>
				</div>
				<hr class="hr">
				<div id="hline3" class="list">
					<span class="first-list" id="hfirst-list3">摄影摄像&nbsp;&gt;</span>
					<span>单反相机</span>
					<span>微单</span>
					<span>运动相机</span>
					<span>拍立得</span>
					<span>数码相机</span>
					<span>镜头</span>
					<span>摄像机</span>
				</div>
				<hr class="hr">
				<div id="hline4" class="list">
					<span class="first-list" id="hfirst-list4">影音电教&nbsp;&gt;</span>
					<span>耳机及耳麦</span>
					<span>音响</span>
					<span>电子书</span>
					<span>录音笔</span>
					<span>点读机</span>
					<span>学生平板</span>
					<span>电子词典</span>
				</div>
				<hr class="hr">
				<div id="hline5" class="list">
					<span class="first-list" id="hfirst-list5">智能设备&nbsp;&gt;</span>
					<span>智能手环</span>
					<span>智能手表</span>
					<span>智能家居系统</span>
					<span>无人机</span>
					<span>网络机顶盒</span>
					<span>体感车</span>
				</div>
				<hr class="hr">
				<div id="hline6" class="list">
					<span class="first-list" id="hfirst-list6">数码配件&nbsp;&gt;</span>
					<span>移动电源</span>
					<span>滤镜</span>
					<span>闪光灯</span>
					<span>相机清洁</span>
					<span>镜头附件</span>
					<span>充电电池</span>
					<span>存储卡</span>
					<span>三脚架</span>
					<span>相机包</span>
				</div>
				<hr class="hr">
				<div id="hline7" class="list">
					<span class="first-list" id="hfirst-list7">电脑整机&nbsp;&gt;</span>
					<span>笔记本</span>
					<span>平板电脑</span>
					<span>游戏本</span>
					<span>一体机</span>
					<span>台式机</span>
				</div>
				<hr class="hr">
				<div id="hline7" class="list">
					<span class="first-list" id="hfirst-list7">网络外设&nbsp;&gt;</span>
					<span>鼠标</span>
					<span>键盘</span>
					<span>鼠标垫</span>
					<span>电脑清洁</span>
					<span>键鼠套装</span>
					<span>电脑包</span>
					<span>路由器</span>
					<span>网卡</span>
					<span>交换机</span>
				</div>
			</div>
			<!-- 9汽车用品 -->
			<div id="textlist9" class="textlist">
				<div id="iline1" class="list">
					<span class="first-list" id="ifirst-list1">厨房小电&nbsp;&gt;</span>
					<span>微波炉</span>
					<span>电饭煲</span>
					<span>电水壶</span>
					<span>豆浆机</span>
					<span>料理机</span>
					<span>榨汁机</span>
					<span>咖啡机</span>
					<span>电饼铛</span>
					<span>酸奶机</span>
					<span>电压力锅</span>
				</div>
				<hr class="hr">
				<div id="iline2" class="list">
					<span class="first-list" id="ifirst-list2">生活电器&nbsp;&gt;</span>
					<span>吸尘器</span>
					<span>智能扫地机</span>
					<span>蒸汽拖把</span>
					<span>空气净化器</span>
					<span>除湿机</span>
					<span>净水设备</span>
					<span>加湿器</span>
					<span>饮水机</span>
					<span>挂烫机/熨斗</span>
				</div>
				<hr class="hr">
				<div id="iline3" class="list">
					<span class="first-list" id="ifirst-list3">个护健康&nbsp;&gt;</span>
					<span>剃须刀</span>
					<span>电吹风</span>
					<span>按摩枕/按摩垫</span>
					<span>按摩椅</span>
					<span>足浴盆</span>
					<span>美发器</span>
					<span>美眼仪</span>
					<span>按摩肩带</span>
					<span>甩脂机</span>
				</div>
				<hr class="hr">
				<div id="iline4" class="list">
					<span class="first-list" id="ifirst-list4">电视空调&nbsp;&gt;</span>
					<span>4K电视</span>
					<span>智能电视</span>
					<span>曲面电视</span>
					<span>壁挂式空调</span>
					<span>柜式空调</span>
					<span>中央空调</span>
				</div>
				<hr class="hr">
				<div id="iline5" class="list">
					<span class="first-list" id="ifirst-list5">智能设备&nbsp;&gt;</span>
					<span>智能手环</span>
					<span>智能手表</span>
					<span>智能家居系统</span>
					<span>无人机</span>
					<span>网络机顶盒</span>
					<span>体感车</span>
				</div>
				<hr class="hr">
				<div id="iline6" class="list">
					<span class="first-list" id="ifirst-list6">厨卫大电&nbsp;&gt;</span>
					<span>燃气热水器</span>
					<span>电热水器</span>
					<span>油烟机</span>
					<span>燃气灶</span>
					<span>洗碗机</span>
					<span>消毒柜</span>
				</div>
				<hr class="hr">
				<div id="iline7" class="list">
					<span class="first-list" id="ifirst-list7">维修保养&nbsp;&gt;</span>
					<span>机油</span>
					<span>轮胎</span>
					<span>滤清器</span>
					<span>火花塞</span>
					<span>雨刷</span>
					<span>轮毂</span>
				</div>
				<hr class="hr">
				<div id="iline7" class="list">
					<span class="first-list" id="ifirst-list7">车载产品&nbsp;&gt;</span>
					<span>行车记录仪</span>
					<span>净化器</span>
					<span>车载电源</span>
					<span>倒车雷达</span>
					<span>汽车装饰</span>
				</div>
			</div>
			<!-- 10医药滋补 -->
			<div id="textlist10" class="textlist">
				<div id="jline1" class="list">
					<span class="first-list" id="jfirst-list1">营养健康&nbsp;&gt;</span>
					<span>美体瘦身</span>
					<span>调节免疫</span>
					<span>缓解疲劳</span>
					<span>改善睡眠</span>
					<span>明目益智</span>
					<span>肝脏养护</span>
					<span>肠胃养护</span>
					<span>清咽利喉</span>
				</div>
				<hr class="hr">
				<div id="jline2" class="list">
					<span class="first-list" id="jfirst-list2">营养成分&nbsp;&gt;</span>
					<span>蛋白粉</span>
					<span>鱼油</span>
					<span>益生菌</span>
					<span>维生素</span>
					<span>钙片</span>
					<span>叶酸</span>
					<span>胶原蛋白</span>
					<span>左旋肉碱</span>
					<span>葡萄籽</span>
				</div>
				<hr class="hr">
				<div id="jline3" class="list">
					<span class="first-list" id="jfirst-list3">传统滋补&nbsp;&gt;</span>
					<span>人参/西洋参</span>
					<span>冬虫夏草</span>
					<span>灵芝</span>
					<span>燕窝</span>
					<span>三七</span>
					<span>石斛/枫斗</span>
					<span>阿胶</span>
					<span>鹿茸</span>
					<span>珍珠粉</span>
				</div>
				<hr class="hr">
				<div id="jline4" class="list">
					<span class="first-list" id="jfirst-list4">家用器械&nbsp;&gt;</span>
					<span>创可贴</span>
					<span>体温计</span>
					<span>血压计</span>
					<span>血糖仪</span>
					<span>制氧机</span>
					<span>雾化器</span>
					<span>助听器</span>
				</div>
				<hr class="hr">
				<div id="jline5" class="list">
					<span class="first-list" id="jfirst-list5">隐形眼镜&nbsp;&gt;</span>
					<span>护理液</span>
					<span>润眼液</span>
					<span>隐形伴侣</span>
					<span>美瞳</span>
					<span>透明隐形</span>
				</div>
				<hr class="hr">
				<div id="jline6" class="list">
					<span class="first-list" id="jfirst-list6">厨卫大电&nbsp;&gt;</span>
					<span>燃气热水器</span>
					<span>电热水器</span>
					<span>油烟机</span>
					<span>燃气灶</span>
					<span>洗碗机</span>
					<span>消毒柜</span>
				</div>
				<hr class="hr">
				<div id="jline7" class="list">
					<span class="first-list" id="jfirst-list7">维修保养&nbsp;&gt;</span>
					<span>机油</span>
					<span>轮胎</span>
					<span>滤清器</span>
					<span>火花塞</span>
					<span>雨刷</span>
					<span>轮毂</span>
				</div>
				<hr class="hr">
				<div id="jline7" class="list">
					<span class="first-list" id="jfirst-list7">车载产品&nbsp;&gt;</span>
					<span>行车记录仪</span>
					<span>净化器</span>
					<span>车载电源</span>
					<span>倒车雷达</span>
					<span>汽车装饰</span>
				</div>
			</div>
			<!-- 11图书 -->
			<div id="textlist11" class="textlist">
				<div id="kline1" class="list">
					<span class="first-list" id="kfirst-list1">儿童教育&nbsp;&gt;</span>
					<span>中小学教辅</span>
					<span>外语学习</span>
					<span>字典</span>
					<span>词典</span>
					<span>工具书</span>
				</div>
				<hr class="hr">
				<div id="kline2" class="list">
					<span class="first-list" id="kfirst-list2">社科经管&nbsp;&gt;</span>
					<span>心理学</span>
					<span>政治</span>
					<span>军事</span>
					<span>国学</span>
					<span>古籍</span>
					<span>哲学</span>
					<span>宗教</span>
					<span>历史</span>
					<span>社会科学</span>
				</div>
				<hr class="hr">
				<div id="kline3" class="list">
					<span class="first-list" id="kfirst-list3">文学传记&nbsp;&gt;</span>
					<span>文学</span>
					<span>传记</span>
					<span>青春文学</span>
				</div>
				<hr class="hr">
				<div id="kline4" class="list">
					<span class="first-list" id="kfirst-list4">少儿童书&nbsp;&gt;</span>
					<span>0－2岁</span>
					<span>3－6岁</span>
					<span>7－10岁</span>
					<span>11－14岁</span>
					<span>儿童文学</span>
					<span>幼儿启蒙</span>
					<span>少儿英语</span>
				</div>
				<hr class="hr">
				<div id="kline5" class="list">
					<span class="first-list" id="kfirst-list5">&nbsp;&nbsp;刊/原版&nbsp;&gt;</span>
					<span>杂志期刊</span>
					<span>进口原版</span>
					<span>港台图书</span>
				</div>
			</div>
		</div>
	</div>
	
      
	<!-- 中间图片 -->
	 <div id="slider">
		<ul id="slider-main">
			<li class="slider-panel">
	            <img src="images/展示1.jpg" id="bigimglist1">
	        </li> 
	        <li class="slider-panel"> 
	            <img src="images/展示2.jpg" id="bigimglist2">
	        </li> 
	        <li class="slider-panel"> 
	            <img src="images/展示3.jpg" id="bigimglist3">
	        </li> 
	        <li class="slider-panel"> 
	            <img src="images/展示4.jpg" id="bigimglist4">
	        </li>
	        <li class="slider-panel"> 
	            <img src="images/展示5.jpg" id="bigimglist5">
	        </li> 
	        <li class="slider-panel"> 
	            <img src="images/展示6.jpg" id="bigimglist6">
	        </li> 
	        <li class="slider-panel"> 
	            <img src="images/展示7.jpg" id="bigimglist7">
	        </li> 
	        <li class="slider-panel"> 
	            <img src="images/展示8.jpg" id="bigimglist8">
	        </li> 
		</ul> 
	<!--下方圆点-->
		<div class="slider-extra">
			<ul class="slider-nav">
			  <li class="slider-item"></li>
			  <li class="slider-item"></li>
			  <li class="slider-item"></li> 
              <li class="slider-item"></li>
              <li class="slider-item"></li> 
              <li class="slider-item"></li>
              <li class="slider-item"></li> 
              <li class="slider-item"></li>
          </ul> 
     	</div> 
	</div>

	<!-- 倒计时 -->
		<div id="times">
			<p id="font">距抢购结束还有：</p>
			<ul class="countdown">
				<!-- <li>
					<span class="days">00</span>
					<p class="days_ref">天</p>
				</li>
				<li class="seperator">.</li> -->
				<li>
					<span class="hours">00</span>
					<p class="hours_ref">时</p>
				</li>
				<li class="seperator">:</li>
				<li>
					<span class="minutes">00</span>
					<p class="minutes_ref">分</p>
				</li>
				<li class="seperator">:</li>
				<li>
					<span class="seconds">00</span>
					<p class="seconds_ref">秒</p>
				</li>
			</ul>
			<a href="products/rushbuy.jsp"><p id="more">查看更多</p></a>
		</div>
	<!--  下方信息条 -->
	<%-- <c:forEach  items="${productTen}"   var="product"   begin="0"  end="3"  varStatus="status">	
	</c:forEach> --%>
	
		<div class="cuxiao"  onload="load();">
			<ul class="cuxiao-ul">
			<!--products/rushbuy.jsp  =====RushbuyServlet?action=sixteen&keyWord=sixteenrushbuy&flag=zero-->
				<a href="products/rushbuy.jsp" class="proda">
					<!-- <li class="prod" id="cuxiao1" >
						<div class="intro">
							<p class="name">南北疆坚果点心【奎屯馆】25g/袋 每日坚果礼盒孕妇儿童休闲零食果仁 30袋750g礼盒装</p>
							<p class="price">￥<em>89</em></p>
							<p class="price_ref"><del>参考价：￥<span>260</span></del></p>
							<img src="images/prod1.jpg" class="prodimg">
						</div>	
					</li> -->
				</a>
					<!-- <li class="prod" id="cuxiao1" >
						<div class="intro">
							<p class="name">南北疆坚果点心【奎屯馆】25g/袋 每日坚果礼盒孕妇儿童休闲零食果仁 30袋750g礼盒装</p>
							<p class="price">￥<em>89</em></p>
							<p class="price_ref"><del>参考价：￥<span>260</span></del></p>
							<img src="images/prod1.jpg" class="prodimg">
						</div>	
					</li> -->
					<!-- <li class="prod" id="cuxiao1" >
						<div class="intro">
							<p class="name">南北疆坚果点心【奎屯馆】25g/袋 每日坚果礼盒孕妇儿童休闲零食果仁 30袋750g礼盒装</p>
							<p class="price">￥<em>89</em></p>
							<p class="price_ref"><del>参考价：￥<span>260</span></del></p>
							<img src="images/prod1.jpg" class="prodimg">
						</div>	
					</li> -->
					<!-- <li class="prod" id="cuxiao1" >
						<div class="intro">
							<p class="name">南北疆坚果点心【奎屯馆】25g/袋 每日坚果礼盒孕妇儿童休闲零食果仁 30袋750g礼盒装</p>
							<p class="price">￥<em>89</em></p>
							<p class="price_ref"><del>参考价：￥<span>260</span></del></p>
							<img src="images/prod1.jpg" class="prodimg">
						</div>	
					</li> -->
			</ul>
		</div>


	<!-- 分类展示 -->
	<!-- 热销商品 -->
		<h4>
			<a href="#" title="热销商品">热销商品
				<span>></span>
			</a>
		</h4>
		<div class="display">
			<!-- 热销商品-全球进口 -->
			<div id="display-img-list1">
				<div class="alink">
					<ul class="alink-list">
						<li>
							<a title="心相印"  href="ProductServlet?keyword=mind&action=index-select"  target="_blank">心相印</a>
						</li>
						<li>
							<a title="牛奶乳制品" href="ProductServlet?keyword=milk&action=index-select"  target="_blank">牛奶饮品</a>
						</li>
						<li>
							<a title="酒水饮料" href="#">酒水饮料</a>
						</li>
						<li>
							<a title="饼干蛋糕" href="#">饼干蛋糕</a>
						</li>
						<li>
							<a title="咖啡冲饮" href="#">咖啡冲饮</a>
						</li>
						<li>
							<a title="饼干" href="#">进口饼干</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- 热销商品-田馥甄心相印图片 -->
			<div id="display-img-list2" class="display-img-list">
				<img src="images/prodimg2.jpg">
			</div>
			<!-- 热销商品-牛奶乳制品 -->
			<div id="display-img-list3" class="display-img-list">
				<p class="display-p1">牛奶乳制品</p>
				<p class="display-p2">满99减20</p>
				<img src="images/prodimg3.jpg">
			</div>
			<!-- 热销商品-酒水饮料 -->
			<div id="display-img-list4" class="display-img-list">
				<p class="display-p1">酒水饮料</p>
				<p class="display-p2">中外名酒</p>
				<img src="images/prodimg4.jpg">
			</div>
			<!-- 热销商品-饼干蛋糕 -->
			<div id="display-img-list5" class="display-img-list">
				<p class="display-p1">饼干蛋糕</p>
				<p class="display-p2">99元选10件</p>
				<img src="images/prodimg5.jpg">
			</div>
			<!-- 热销商品-咖啡冲饮 -->
			<div id="display-img-list6" class="display-img-list">
				<p class="display-p1">咖啡冲饮</p>
				<p class="display-p2">醇香健康</p>
				<img src="images/prodimg6.jpg">
			</div>
		</div>
		<!-- 热销商品右侧彩色列表展示 -->
		<div class="display-right">
			<ul class="display-ul">
				<a href="ImportProductServlet?action=beauty&keyWordOne=skincare&keyWordTwo=washbath"  target="_blank">
					<li id="display-img-list7">
						<p class="display-tit">美妆个护</p>
						<p class="display-tits">BEAUTY</p>
						<p class="display-color"></p>
						<img src="images/right1.png" class="li-img">
					</li>
				</a>
				<li id="display-img-list8">
					<p class="display-tit">母婴玩具</p>
					<p class="display-tits">MOM&amp;BABY</p>
					<p class="display-color"></p>
					<img src="images/right2.png" class="li-img">
				</li>
				<li id="display-img-list9">
					<p class="display-tit">食品生鲜</p>
					<p class="display-tits">FRESH</p>
					<p class="display-color"></p>
					<img src="images/right3.png" class="li-img">
				</li>
				<li id="display-img-list10">
					<p class="display-tit">家居家装</p>
					<p class="display-tits">HOME</p>
					<p class="display-color"></p>
					<img src="images/right4.png" class="li-img">
				</li>
				<li id="display-img-list11">
					<p class="display-tit">厨卫清洁</p>
					<p class="display-tits">CLEANNING</p>
					<p class="display-color"></p>
					<img src="images/right5.png" class="li-img">
				</li>
				<li id="display-img-list12">
					<p class="display-tit">医药保健</p>
					<p class="display-tits">HEALTH</p>
					<p class="display-color"></p>
					<img src="images/right6.png" class="li-img">
				</li>
			</ul>
		</div>		
	<script type="text/javascript" src="js/Ajax.js"></script>
	<script type="text/javascript" src="js/jquery.downCount.js"></script> 
	<script type="text/javascript" src="js/javascript.js"></script>

	 <jsp:include page="foot.jsp"></jsp:include>		
</body>
</html>
	
	