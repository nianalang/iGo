<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%String path = request.getContextPath();  
	 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/registercss.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>iGo购物网</title>
</head>
<script type="text/javascript">
	var status=<%=request.getAttribute("status")%>
	if(status!=null){
		if(status==2){
			alert("两次输入的密码不同");
		}
		if(status==4){
			alert("电话号码已经存在过");
		}
	}
	
</script>
<body>
<!-- 登陆注册按钮 -->
<div class="buttonstyle">
	<a href="<%=basePath %>managerlogin/mlogin.jsp" class="active1">登录<a href="<%=basePath %>managerlogin/mregister.jsp" id="right1">注册</a>
</div>

<div class="main1">
	<h1>iGo</h1>
		<div class="box1">
			<form action="<%=basePath %>RegisterServlet?action=mRegister" method="post">
				<input type="text" name="username" placeholder="用户名" class="tag1" />
				<input type="password" name="password" placeholder="密码" class="tag1" />
				<input type="password" name="confirmpassword" placeholder="再次输入密码" class="tag1" />
				<input type="email" name="email" placeholder="邮箱地址" class="tag1"  id="tag1" onchange="check1('tag1')"/>
				<div class="click-login1">
					<input type="submit" value="注册">
				</div>
				<p class="click-register1">
					如果你还已有账户，请
					<a href="<%=basePath %>managerlogin/mlogin.jsp">点击登陆</a>
				</p>
			</form>
		</div>
</div>
<script type="text/javascript">
    //判断邮箱及手机号格式是否正确
		function check1(id) {
			var text = document.getElementById(id).value;
			if (id == "tag1") {
				var isemail = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				var isphone =/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
				if (isemail.test(text)||isphone.test(text)) {
					
				} else {
					alert("输入的邮箱格式不正确");
				}
			}
		}
    </script>
</body>
</html>