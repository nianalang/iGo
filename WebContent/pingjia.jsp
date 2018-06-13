<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/pingjia.css">
<script type="text/javascript" src="js/jquery-1.8.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品评价</title>
</head>
<body>
<!--  引入头部-->
<jsp:include page="oldhead.jsp"></jsp:include>
<form action="EvaluateServlet?action=run&productsId=${products.productsId }" method="post">
	<div class="box">
		<div class="boxTop">
			<a class="boxTop_pingjia" href="">
				<span>评价宝贝</span>
			</a>
		</div>
		<div class="boxCenter">
			<!-- 左侧商品信息 -->
			<div class="boxCenter_inf">
				<img src="${products.productsUrlMain}" class="boxCenter_image"/>
				<a href="ProductServlet?action=goodslist-select&productId=${products.getProductsId()}"  class="boxCenter_a"><p class="boxCenter_brief">${products.described }</p></a>
			</div>
			<!-- 好评/中评/差评 -->
			<div class="boxCenter_flower">
				<ul class="boxCenter_flower_ul">
					<li class="boxCenter_flower_li flower_li1">
						<label for="flower" >
							<input type="radio" id="flower_good" name="flower" class="flower_good" value="1" checked="checked" />
							<img src="images/好评.png" class="flower_img1"/>
						</label>
						<span class="flower_text_good">好评</span>
					</li>
					<li class="boxCenter_flower_li flower_li2">
						<label for="flower" >
							<input type="radio" id="flower_middle" name="flower" class="flower_middle" value="2" />
							<img src="images/中评.png" class="flower_img2"/>
						</label>
						<span class="flower_text_middle">中评</span>
					</li>
					<li class="boxCenter_flower_li flower_li3">
						<label for="flower" >
							<input type="radio" id="flower_low" name="flower" class="flower_low" value="3" />
							<img src="images/差评.png" class="flower_img3"/>
						</label>
						<span class="flower_text_low">差评</span>
					</li>
				</ul>
			</div>
			<!-- 评价信息 -->
			<div class="boxCenter_msg">
				<p>请写下您的评价：</p>
				<textarea class="boxCenter_msg_detail" name="textarea" placeholder="请写下您的评价..."></textarea>
			</div>
		</div>
		<div class="boxBottom">
			<p class="boxBottom_box">店铺动态评分</p>
		</div>
		<!-- <div class="score">
  			<div class="score-expression"></div>
		</div> -->
		<a  class="return"  href="<%=basePath %>ShoppingCartServlet?action=lookPaidBuy&status=1">返回</a>
		<!-- 发表评论 -->
		<button type="submit" class="submit">发表评论</button>
	</div>
</form>
</body>
	<script type="text/javascript" src="js/pingjia.js"></script>
</html>