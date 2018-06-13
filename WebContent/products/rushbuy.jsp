<%@ page language="java"  contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
    
  <%	String path = request.getContextPath();  
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>iGo购物网</title>
	<link rel="stylesheet" type="text/css" href="<%=basePath %>css/rushbuy.css">	
	<script type="text/javascript" src="<%=basePath %>js/jquery-1.8.1.js"></script>
	
	<script type="text/javascript">
	 	var status ='<%=request.getAttribute("status")%>';   
	   	if(status!='null'){
	   		alert(status);
	   	}	 
	   	
	</script>
</head>
<body load="onload();">
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
	<!-- 整点抢购时间条 -->
	<div class="time">
		<div class="time_up">
			<a href="">整点抢</a>
		</div>
		<div class="time_down">
			<div class="time_down_inner">
				<ul class="time_down_ul">				
					<li id="list_1" class="time_down_li">		
						<span class="time_first aaa">抢购进行中</span>
						<p class="time_second aaa">16:00</p>
					</li>
			
					<li id="list_2" class="time_down_li">
						<span class="time_first bbb">即将开场</span>		
						<p class="time_second bbb">18:00</p>				
					</li>
	
					<li id="list_3" class="time_down_li">
					
						<span class="time_first ccc">即将开场</span>
						<p class="time_second ccc">20:00</p>
					</li>
					
					<li id="list_4" class="time_down_li">
						
						<span class="time_first ddd">即将开场</span>
						<p class="time_second ddd">22:00</p>
					</li>
					
					<li id="list_5" class="time_down_li">
						<span class="time_first eee">即将开场</span>
						<p class="time_second eee">00:00</p>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- 抢购内容区 -->
	<div class="content">
		<ul class="content_ul">		
			<%-- <li class="list_1">					
				<img src="${product1.productsUrlMain }"  class="list_img">
				<a href="ProductServlet?action=goodslist-select&flag=rushbuy&productId=${product1.productsId}"  target="_blank" class="list_inf">
					<span class="list_details">${product1.described }</span>
				</a>
				<div class="list_div">
					<span class="list_price"><span>￥</span>${product1.price }</span>
					<span class="list_pre">参考价:89</span>
					<span class="list_ed">已售：<span>0</span>%</span>
					
					<div class="votebox">
						<dl class="barbox">
							<dd class="barline">
								<div w="67" style="width:0px;" class="charts"></div>
							</dd>
						</dl>
					</div>
					<a href="ShoppingCartServlet?action=intobuy&productId=${product1.productsId }" class="list_button"><span>加入购物车</span></a>
				</div>
			</li> --%>
		
		</ul>	
		
	<ul class="content_ul2">
		
				<%-- <li>
				<img src="">
				<a href="ProductServlet?action=goodslist-select&flag=rushbuy&productId=${product2.productsId}"  target="_blank"  class="list_inf">
					<span class="list_details">${product2.described }</span>
				</a>
				<div class="list_div">
					<span class="list_price">￥<span>${product2.price}</span></span>
					<span class="list_pre">参考价:89</span>
					<span class="list_ed">已售：<span>0</span>%</span>
					<div class="votebox">
						<dl class="barbox">
							<dd class="barline">
								<div w="67" style="width:0px;" class="charts"></div>
							</dd>
						</dl>
					</div>
					<a href="" class="list_button"><span>加入购物车</span></a>
				</div>
			</li> --%>
		
	</ul>
				
	<ul class="content_ul3">	
				<%-- <li>
				<a href="##"><img src="${product3.productsUrlMain}"></a>
				<a href="ProductServlet?action=goodslist-select&productId=${product3.productsId}"  target="_blank"  class="list_inf">
					<span class="list_details">${product3.described }</span>
				</a>
				<div class="list_div">
					<span class="list_price"><span>￥</span>${product3.price }</span>
					<!-- <span class="list_pre">参考价:89</span> -->
					<span class="list_ed">已售：<span>0</span>%</span>
					<div class="votebox">
						<dl class="barbox">
							<dd class="barline">
								<div w="67" style="width:0px;" class="charts"></div>
							</dd>
						</dl>
					</div>
					<a href="" class="list_button"><span>加入购物车</span></a>
				</div>
			</li>		 --%>
	</ul>		
			
		<ul class="content_ul4">
			<%-- <li>
				<a href=""><img src="${product4.productsUrlMain}"></a>
				<a href="ProductServlet?action=goodslist-select&flag=rushbuy&productId=${product4.productsId}"  target="_blank"  class="list_inf">
					<span class="list_details">${product4.described }</span>
				</a>
				<div class="list_div">
					<span class="list_price">￥<span>${product4.price }</span></span>
				<!-- 	<span class="list_pre">参考价:89</span> -->
					<span class="list_ed">已售：<span>0</span>%</span>
					<div class="votebox">
						<dl class="barbox">
							<dd class="barline">
								<div w="67" style="width:0px;" class="charts"></div>
							</dd>
						</dl>
					</div>
					<a href="" class="list_button"><span>立即抢购</span></a>
				</div>
			</li> --%>
	</ul>		
			
		
		
		 <ul class="content_ul5">
			<%-- <li>
				<img src="">
				<a href="ProductServlet?action=goodslist-select&flag=rushbuy&productId=${product2.productsId}"  target="_blank"  class="list_inf">
					<span class="list_details">${product2.described }</span>
				</a>
				<div class="list_div">
					<span class="list_price">￥<span>${product2.price}</span></span>
					<span class="list_pre">参考价:89</span>
					<span class="list_ed">已售：<span>0</span>%</span>
					<div class="votebox">
						<dl class="barbox">
							<dd class="barline">
								<div w="67" style="width:0px;" class="charts"></div>
							</dd>
						</dl>
					</div>
					<a href="" class="list_button"><span>加入购物车</span></a>
				</div>
			</li> --%>
		</ul>
	</div>
	<!-- 页脚 -->
	<%-- <jsp:include page="../foot.jsp"></jsp:include> --%>
	<script type="text/javascript" src="<%=basePath %>js/rushbuy.js"></script>
</body>
</html>