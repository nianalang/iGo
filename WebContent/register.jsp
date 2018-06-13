<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>iGo购物网</title>
<link rel="stylesheet" type="text/css" href="css/register-login.css">
<script type="text/javascript">
	var status=<%=request.getAttribute("status")%>
	if(status!=null){
		if(status==2){
			alert("服务器繁忙");
		}
		if(status==3){
			alert("email已经存在过");
		}
		if(status==4){
			alert("电话号码已经存在过");
		}
	}
	
</script>
</head>

<body>
	<div id="box"></div>
	<div class="cent-box register-box">
		<div class="cent-box-header">
			<h1 class="main-title hide">iGo</h1>
			<h2 class="sub-title">世界与您，近在咫尺</h2>
		</div>
		<form action="RegisterServlet" method="post">
			<div class="cont-main clearfix">
				<div class="index-tab">
					<div class="index-slide-nav">
						<a href="login.jsp">登录</a> <a href="register.jsp" class="active">注册</a>
						<div class="slide-bar slide-bar1"></div>
					</div>
				</div>
				<div class="login form">
					<div class="group">
						<div class="group-ipt email">
							<input type="text" name="email" id="email" class="ipt"
								placeholder="输入邮箱地址" onchange="check1('email'),testEmail1('email'),testEmail2('email')" required>
				
								<div class="form-error ng-hide" id="emailck"
								style="display: none;color:#CC3300">请输入正确的邮箱</div>
						</div>
					 	<div class="group-ipt user">
							<input type="text" name="user_phone" id="user" class="ipt"
								placeholder="输入手机号" onchange="check1('email'),testEmail1('email'),testEmail2('email')" required>
						</div>
						<div class="group-ipt password">
							<input type="password" name="password" id="password" class="ipt"
								placeholder="输入密码" onchange="check2('password')" required>
								<div class="form-error ng-hide" id="passwordck"
								style="display: none;color:#CC3300">请输入6-12位数字或字母密码</div>
						</div>
						<div class="group-ipt password1">
							<input type="password" name="password1" id="password1"
								class="ipt" placeholder="确认密码"onchange="check3('password1')" required>
								<div class="form-error ng-hide" id="password1ck"
								style="display: none;color:#CC3300">两次密码输入不一致</div>

						</div>
					
					</div>
				</div>
				<div class="button">
					<input type="hidden" name="action" value="register">
					<button type="submit" class="login-btn register-btn" id="button" >注册</button>
				</div>
			</div>
		</form>
	</div>

	<div class="footer">
		<p>iGo - Thousands Find</p>
		<p>Designed By Three in 2017</p>
	</div>

	<script src='js/particles.js' type="text/javascript"></script>
	<script src='js/background.js' type="text/javascript"></script>
	<script src='js/jquery.min.js' type="text/javascript"></script>
	<script src='js/layer/layer.js' type="text/javascript"></script>
	<script type="text/javascript">
    //判断邮箱及手机号格式是否正确
		function check1(id) {
			var text = document.getElementById(id).value;
			if (id == "email") {
				var isemail = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				var isphone =/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
				if (isemail.test(text)||isphone.test(text)) {
					emailck.style.display = "none";
				} else {
					emailck.style.display = "";
				}
			}
		}
		 //判断密码
		function check2(id) { 
			var password = document.getElementById(id).value;
			if (id == "password") {
				var ispassword = /^[A-Za-z0-9]{6,12}$/;  //正则表达式判断密码
				if(ispassword.test(password)){
					passwordck.style.display = "none";
	
				}else{
					passwordck.style.display = "";		
				}
			}
		}
		 //判断确认密码是否为空及两次输入密码是否相同
		function check3(id) {
			var p1=document.getElementById("password1").value;
			var password=document.getElementById("password").value;
			if(p1!=""){

				if(p1!=password){
					password1ck.style.display="";
				}
				else{
					password1ck.style.display="none";		
				}
			}else{
				password1ck.style.display="none";			
			}
		}

	</script>
</body>
</body>
</html>