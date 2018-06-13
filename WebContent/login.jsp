<%@ page language="java" import="com.igo.utils.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>iGo购物网</title>
<link rel="stylesheet" type="text/css" href="css/register-login.css">
<%
	CreateCode code=new CreateCode();
	String num=code.makeNum();
	session.setAttribute("checkCode", num);
%>
</head>
<body>
<%
	String username="";
	String password="";
	//从cookie中查看用户有没有保存用户名和密码
	Cookie cookies[]=request.getCookies();
	if(cookies!=null){
		//遍历cookie
		for(int i=0;i<cookies.length;i++){
			Cookie cookie1=cookies[i];
			//取出cookie名
			String userName=cookie1.getName();
			if(userName.equals("userName")){
				//取到用户名
				username=cookie1.getValue();
				//在遍历cookie取密码
				for(int j=0;j<cookies.length;j++){
					Cookie cookie2=cookies[j];
					//取出cookie名
					String passName=cookie2.getName();
					if(passName.equals("passWord")){
						//取到密码
						password=cookie2.getValue();
						break;
					}
				}
			}
		}
	}
%>
<div id="box"></div>
<div class="cent-box">
	<div class="cent-box-header">
		<h1 class="main-title hide">iGo</h1>
		<h2 class="sub-title">世界与您，近在咫尺</h2>
	</div>

	<div class="cont-main clearfix">
		<div class="index-tab">
			<div class="index-slide-nav">
				<a href="login.jsp" class="active">登录</a>
				<a href="register.jsp">注册</a>
				<div class="slide-bar"></div>				
			</div>
		</div>
		
<form action="/iGo/LoginServlet" method="post">
		<div class="login form">
			<div class="group">
				<div class="group-ipt email">
				<%
					if(username!=null){
				%>
					<input type="text" name="email" id="email" class="ipt" placeholder="手机号或邮箱地址" required value="<%=username %>"/>
				<% 
					}else{
					%>
					<input type="text" name="email" id="email" class="ipt" placeholder="手机号或邮箱地址" required />
					<% 
					}
				%>
					
				</div>
				<div class="group-ipt password">
				<%
					if(password!=null){
				%>
					<input type="password" name="password" id="password" class="ipt" placeholder="请输入您的登录密码" required value="<%=password%>">
				<% 
					}else{
					%>
					<input type="password" name="password" id="password" class="ipt" placeholder="请输入您的登录密码" required>
					<% 
					}
				%>
				</div>
				<div class="group-ipt verify">
					<input type="text" name="verify" id="verify" class="ipt" placeholder="输入验证码" required>
					 <img src="/iGo/CreateCode"  class="imgcode"/> 
				</div>
			</div>
		</div>
		<div class="button">
			<input type="hidden" name="action" value="login">
			
			<button type="submit" class="login-btn register-btn" id="button"  >登录</button>
						
		</div>
		<div class="remember clearfix">
			<label class="remember-me">			
				<input type="checkbox" name="remember"  value="remember">记住我 
			</label>
	
			<label class="forgot-password">
				<a href="index.jsp">回到首页</a>
			</label>
		</div>
	</form>
	</div>
</div>


<jsp:include page="foot.jsp"></jsp:include>

<script src='js/particles.js' type="text/javascript"></script>
<script src='js/background.js' type="text/javascript"></script>
<script src='js/jquery.min.js' type="text/javascript"></script>
<script src='js/layer/layer.js' type="text/javascript"></script>
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

		$("#button").click(function() {
			var yzm=${sessionScope.checkCode};/* alert(yzm+"123"); */
			var value = $("#verify").val(); /* alert(value);  */
			var len=$("#verify").val().length;			
					if(value!=""){
						if(value!=yzm){
							alert("验证码错误");			
							return false;
						}
					}		
		}); 
	});  	
</script>
</body>
</html>