<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%  String path = request.getContextPath();  
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>iGo购物网</title>
	<link rel="stylesheet" type="text/css" href="<%=basePath %>css/importproduct.css">
	<script type="text/javascript">
	 	var status ='<%=request.getAttribute("status")%>';   
	   	if(status!='null'){
	   		alert(status);
	   	}	   	
	</script>
</head>
<body>
	<!--引入head.jsp  -->
		<%
			//取出session的值
			String userName=(String)session.getAttribute("userName");
			if(userName==null){
		%>
				<jsp:include page="../newhead.jsp" />	 
		<%}else{	%>		
				<jsp:include page="../oldhead.jsp" />
		<% }%>
	<!-- 上面背景图的div-->
	<div class="bgcolor">
		<!-- 灰色背景 -->
		<div class="headTitle">
			<!-- 白色背景 -->
			<ul class="title">
				<!-- 文字 -->
				<li class="life">精致生活</li>
				<li class="globle">尽在全球进口</li>
				<li class="beauty">【美妆个护篇】</li>
			<ul>
		</div>	
	</div>
	<!-- 护肤(skin care)彩妆(make-up product) -->
	<div class="skinCare">
		<p>护肤彩妆</p>
	</div>
	<!-- 护肤彩妆图片区 -->
	<ul class="faceul">
		<c:forEach items="${skinCareList}"   var="skinCare"   begin="0"  end="${fn:length(skinCareList)}"  varStatus="status">
			<li>
				<img src="${skinCare.productsUrlMain }">
				<p class="p1">
					<a href="ProductServlet?action=goodslist-select&productId=${skinCare.getProductsId()}"  target="_blank">${skinCare.described }</a>
				</p>
				<p class="p2">促销价:<span>${skinCare.price }</span></p>
				<a id="purchase" href="<%=basePath %>ShoppingCartServlet?action=intobuy&status=import&productId=${skinCare.productsId }">
					<p class="p3">加入购物车</p>
				</a>
		</li>
		</c:forEach>
	</ul>
	<!-- 洗发沐浴 -->
	<div class="skinCare">
		<p>洗发沐浴</p>
	</div>
	<!-- 洗发沐浴图片区 -->
	<ul class="faceul">
		<c:forEach items="${washBathList}"   var="washBath"   begin="0"  end="${fn:length(washBathList)}"  varStatus="status">
			<li>
				<img src="${washBath.productsUrlMain }">
				<p class="p1"><a href="ProductServlet?action=goodslist-select&productId=${washBath.getProductsId()}"  target="_blank">${washBath.described }</a></p>
				<p class="p2">促销价:<span>${washBath.price }</span></p>
				<a class="purchase"  href="<%=basePath %>ShoppingCartServlet?action=intobuy&status=import&productId=${washBath.productsId }"><p class="p3">加入购物车</p></a>
		</li>
		</c:forEach>
	</ul>
<%-- 	<!-- 口腔护理 -->
	<div class="skinCare">
		<p>口腔护理</p>
	</div>
	<!-- 口腔护理图片区 -->
	<ul class="faceul">
		<li>
			<img src="<%=basePath%>images/importproduct/护肤1.jpg">
			<p class="p1"><a>芙丽芳丝(freeplus)净润洗面霜100g(温和洁面 敏感肌 洗面奶 男女适...</a></p>
			<p class="p2">促销价:<span>139元</span></p>
			<a id="purchase"><p class="p3">立即购买</p></a>
		</li>

		<li>
			<img src="<%=basePath%>images/importproduct/护肤2.jpg">
			<p class="p1"><a>芙丽芳丝(freeplus)净润洗面霜100g(温和洁面 敏感肌 洗面奶 男女适...</a></p>
			<p class="p2">促销价:<span>139元</span></p>
			<a id="purchase"><p class="p3">立即购买</p></a>
		</li>

		<li>
			<img src="<%=basePath%>images/importproduct/护肤3.jpg">
			<p class="p1"><a>芙丽芳丝(freeplus)净润洗面霜100g(温和洁面 敏感肌 洗面奶 男女适...</a></p>
			<p class="p2">促销价:<span>139元</span></p>
			<a id="purchase"><p class="p3">立即购买</p></a>
		</li>
		<li>
			<img src="<%=basePath%>images/importproduct/护肤4.jpg">
			<p class="p1"><a>芙丽芳丝(freeplus)净润洗面霜100g(温和洁面 敏感肌 洗面奶 男女适...</a></p>
			<p class="p2">促销价:<span>139元</span></p>
			<a id="purchase"><p class="p3">立即购买</p></a>
		</li>
	</ul>

	<!-- 女性护理 -->
	<div class="skinCare">
		<p>女性护理 </p>
	</div>
	<!-- 女性护理 图片区 -->
	<ul class="faceul">
		<li>
			<img src="<%=basePath%>images/importproduct/护肤1.jpg">
			<p class="p1"><a>芙丽芳丝(freeplus)净润洗面霜100g(温和洁面 敏感肌 洗面奶 男女适...</a></p>
			<p class="p2">促销价:<span>139元</span></p>
			<a id="purchase"><p class="p3">立即购买</p></a>
		</li>

		<li>
			<img src="<%=basePath%>images/importproduct/护肤2.jpg">
			<p class="p1"><a>芙丽芳丝(freeplus)净润洗面霜100g(温和洁面 敏感肌 洗面奶 男女适...</a></p>
			<p class="p2">促销价:<span>139元</span></p>
			<a id="purchase"><p class="p3">立即购买</p></a>
		</li>

		<li>
			<img src="<%=basePath%>images/importproduct/护肤3.jpg">
			<p class="p1"><a>芙丽芳丝(freeplus)净润洗面霜100g(温和洁面 敏感肌 洗面奶 男女适...</a></p>
			<p class="p2">促销价:<span>139元</span></p>
			<a id="purchase"><p class="p3">立即购买</p></a>
		</li>
		<li>
			<img src="<%=basePath%>images/importproduct/护肤4.jpg">
			<p class="p1"><a>芙丽芳丝(freeplus)净润洗面霜100g(温和洁面 敏感肌 洗面奶 男女适...</a></p>
			<p class="p2">促销价:<span>139元</span></p>
			<a id="purchase"><p class="p3">立即购买</p></a>
		</li>
	</ul> --%>
	<jsp:include page="../foot.jsp"></jsp:include>
</body>
</html>