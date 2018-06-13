<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String path = request.getContextPath();  
	 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";   %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>iGo购物网</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/oldhead.css">
	<!--注销对话框  -->
	<script type="text/javascript">
		 function logout(){
			 return confirm("您确定要注销吗？");
			 //不加return，点击确定取消都会跳转页面
		}
	</script>
</head>
<body>

<!-- 顶部信息 -->
    <div id="topbar">
        <a href="<%=basePath %>index.jsp">
            <span id="index"><img src="<%=basePath %>images/首页.png">iGo首页</span>
        </a>
            <span id="topbox">欢迎您登录iGo网</span>
            <span id="cart"><a href="<%=basePath %>ShoppingCartServlet?action=lookcarts&status=0" >我的购物车</a></span>
            <span id="erweima"><a href="<%=basePath %>ShoppingCartServlet?action=lookPaidBuy&status=1">个人信息</a></span>            
            <a  href="LoginOutServlet?loginOut=loginOut"  id="logout" onclick="return logout()"><span id="feedback">注销</span></a>
    </div>
</body>
</html>