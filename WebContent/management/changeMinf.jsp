<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String path = request.getContextPath();  
	 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/changemyinf.css">
<script type="text/javascript" src="<%=basePath %>js/jquery-1.8.1.js"></script>	
<title>iGo购物网</title>
<script type="text/javascript">
    	var status=<%=request.getAttribute("status")%>
    	if(status!=null){
    		if(status==1){
    			alert("密码和确认密码输入不相同");
    		}
    	}
  </script>
</head>

<body>
	<!--  引入头部-->
	<jsp:include page="../mhead.jsp"></jsp:include>
		<div class="header">
		<!--头部logo-->
		<div class="header_logo">
			<img src="<%=basePath  %>images/home_logo2.jpg" class="box_logo_img" />
		</div>

		<!--头部搜索框-->
		<div class="search">
			<form action="" method="post">
				<input class="search_text" id="keybord"  type="text"  placeholder="搜全部"/>
			</form>
		</div>
	</div>

	<!--内容-->

	<div class="list_main">
	<!--左边内容-->
		<div class="list_left">
			<ul class="aaa">
				<img class="my_title" src="<%=basePath %>images/jiaoyi.jpg"/>&nbsp;<span>我的交易</span>
				<%-- <li class="bbb bbb1">
					<a href="<%=basePath %>ShoppingCartServlet?action=lookcarts&status=0"><span class="list">我的购物车</span></a>
				</li> --%>
				<li class="bbb bbb2">
					<!-- ShoppingCartServlet?action=lookPaidBuy&status=1  -->
					<span class="list list1" id="bought"><a href="<%=basePath %>ManagerServlet?action=allproducts" >已上架的商品</a></span>
				</li>
			</ul>
			
			<ul class="aaaa">
				<img class="my_title" src="<%=basePath %>images/geren.jpg"/>&nbsp;<span>管理员资料</span>
				<li class="bbb bbb3">
					<span class="list list2" id="inf"><a href="<%=basePath %>ManagerServlet?action=managerInf">个人信息</a></span>
				</li>
				<li class="bbb bbb4">
					<span class="list list3" id="infa"><a href="<%=basePath %>ManagerServlet?action=mupdate" >修改资料</a></span>
				</li>
			</ul>
     
       </div>
        <!--右边内容-->
        <div class="list_right" >
    		<!-- 修改个人信息 -->
    		<ul class="list_right_ul3">	
    			<div class="list_inf_div">
    				<form action="ManagerServlet?action=upManainf" method="post" class="list_right_form">
    					<h1 class="list_inf">修改信息</h1>
    					
    					<p class="list_inf_p list_inf_pa">用户名：&nbsp;<span class="list_right_span">${Manager.userName }</span></p>
    					<%-- <p class="list_inf_p list_inf_pa">用户名：&nbsp;${users.userName }<input type="text" name="inf_user" value="" class="list_inf_input" /></p> --%>
    					<p class="list_inf_p">新密码：&nbsp;<input type="text" name="Minf_passwd"  class="list_inf_input" value="${Manager.password}"/></p>
    					<p class="list_inf_p">确认密码：<input type="text" name="Minf_confirm"  class="list_inf_input" value="${Manager.password}"/></p>
    					<p class="list_inf_p">电子邮箱：<input type="text" name="Minf_email"  class="list_inf_input" value="${Manager.email}"/></p>
    					<input type="submit" value="提交修改" class="list_inf_sub" />
    					<input type="reset" value="重置" class="list_inf_reset" />
    				</form>
    			</div>			
    		</ul>
       </div >	
	</div>
	<script type="text/javascript" src="<%=basePath %>js/myinf.js"></script>
</body>
</html>