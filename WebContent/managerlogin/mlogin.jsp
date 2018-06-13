<%@ page language="java" contentType="text/html; charset=UTF-8" import="com.igo.utils.*" 
    pageEncoding="UTF-8"%>
  <%String path = request.getContextPath();  
	 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/logincss.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>iGo购物网</title>
<%
	CreateCode code=new CreateCode();
	String num=code.makeNum();
	session.setAttribute("checkCode", num);
%>
</head>
<body>
<!-- 登陆注册按钮 -->
<div class="button">
	<a href="<%=basePath %>managerlogin/mlogin.jsp" class="active">登录<a href="<%=basePath %>managerlogin/mregister.jsp" id="right">注册</a>
</div>

<div class="main">
	<h1>iGo</h1>
		<div class="box">
			<form action="<%=basePath %>LoginServlet?action=mlogin" method="post">
				<input type="text" name="username" placeholder="用户名" class="tag" />
				<input type="password" name="password" placeholder="密码" class="tag" />
				<input type="text" name="confirm" placeholder="请输入验证码" class="tag" id="confirm"/>
				<img src="/iGo/CreateCode" />
				<div class="click-login">
					<input type="submit" value="登录" id="mlogin">
				</div>
				<p class="click-register">
					如果你还没有账户，请
					<a href="<%=basePath %>managerlogin/mregister.jsp">点击注册</a>
				</p>
			</form>
		</div>
</div>
<script type="text/javascript">
	/* 提示错误信息 */
	var a = '<%=request.getAttribute("errorMessage")%>' ;
	if(a!=null){
		if(a==1){
			alert("输入密码不正确");
		}
		if(a==2){
			alert("用户名不正确或不存在");
		}
		a=null;
	}

	$(document).ready(function(){  

		$("#mlogin").click(function() {
			var yzm=${sessionScope.checkCode};/* alert(yzm+"123"); */
			var value = $("#confirm").val(); /* alert(value);  */
			var len=$("#confirm").val().length;			
					if(value!=""){
						if(value!=yzm){
							alert("验证码错误")
						}
					}		
		}); 
	});  	
</script>
</body>
</html>