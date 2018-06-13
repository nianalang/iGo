<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 页脚的引用标签-->
<%@ taglib prefix="lms" uri="/lms-tags"%>
<%String path = request.getContextPath();  
	 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/myinf.css">
<%-- <script type="text/javascript" src="<%=basePath %>js/jquery-1.8.1.js"></script>	 --%>
<title>iGo购物网</title>
</head>
<body>
	<!--  引入头部-->
	<jsp:include page="../mhead.jsp"></jsp:include>
	
		<div class="header">
		<!--头部logo-->
		<div class="header_logo">
			<img src="<%=basePath %>images/home_logo2.jpg"/>
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
					<a href="<%=basePath %>ShoppingCartServlet?action=lookcarts&status=0"><span class="list">我的商品</span></a>
				</li> --%>
				<li class="bbb bbb2">
					<!-- ShoppingCartServlet?action=lookPaidBuy&status=1  -->
					<span class="list list1" id="bought"><a href="<%=basePath %>ManagerServlet?action=allproducts">已上架的商品</a></span>
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
        	
    		<!-- 个人信息 -->
    		<ul class="list_right_ul2">
    			<div class="list_right_inf">
    				<h1 class="my_inf">卖家信息</h1>
    				<img alt="" src="<%=basePath %>images/用户名.png" class="inf_img_user">
    				<p class="list_right_p">用户名：<span class="list_right_span">&nbsp;${Manager.userName}</span></p>
    				<img alt="" src="<%=basePath %>images/密码.png" class="inf_img_password">
    				<p class="list_right_p list_right_p2">密码：<span class="list_right_span">&nbsp;&nbsp;${Manager.password}</span></p>
    				<img alt="" src="<%=basePath %>images/电子邮件.png" class="inf_img_email">
    				<p class="list_right_p list_right_p3">电子邮箱：<span class="list_right_span">${Manager.email}</span></p>
    			</div>
    		</ul>
    		
       </div >	
	</div>
	<script type="text/javascript" src="<%=basePath %>js/myinf.js"></script>
</body>
</html>