<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String path = request.getContextPath();  
	 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>iGo购物网</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/mhead.css">
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
      	 <%-- <a href="<%=basePath %>index.jsp">
            <span id="index"><img src="<%=basePath %>images/首页.png">iGo首页</span>
        </a> --%>  
            <span id="topbox">欢迎管理员登录iGo网</span>
            <span id="cart"><a href="ManagerServlet?action=allproducts" >我的管理</a></span>
            <span id="erweima"><a href="ManagerServlet?action=managerInf">个人信息</a></span>            
            <a  href="LoginOutServlet?loginOut=loginOut"  id="logout" onclick="return logout()"><span id="feedback">注销</span></a>
    </div>
</body>
</html>