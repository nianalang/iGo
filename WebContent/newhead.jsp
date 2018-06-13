<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String path = request.getContextPath();  
	 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";   %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>iGo购物网</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/newhead.css">
</head>
<body>
<!-- 顶部信息 -->
	<div id="topbar">
	 <a href="<%=basePath %>index.jsp">
            <span id="index"><img src="<%=basePath %>images/首页.png">iGo首页</span>
        </a>
		<span id="topbox">
			<a href="<%=basePath %>login.jsp" title="您好，请登陆！"><span id="login">登陆</span></a>
			<a href="<%=basePath %>register.jsp" title="注册" target="_blank" ><span id="register">注册</span></a>
			<a href="<%=basePath %>ShoppingCartServlet?action=lookcarts" ><span id="cart">购物车</span></a>
			<span id="erweima">二维码</span>
			<span id="feedback">反馈</span>
		</span>
	</div>
</body>
</html>