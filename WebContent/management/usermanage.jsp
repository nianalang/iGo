<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%   String path = request.getContextPath();  
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=basePath  %>css/manager.css">
<script type="text/javascript" src="<%=basePath  %>js/jquery-1.8.1.js"></script>
<title>iGo购物网</title>
</head>
<body>
<jsp:include page="../mhead.jsp"></jsp:include>
	<!-- 最大的div -->
	<div class="bigbox">
		<!-- logo所在的行 -->
		<div class="box_logo">
			<!-- logo -->
			<a href=""><img src="<%=basePath  %>images/logo.jpg" class="box_logo_img" /></a>
		</div>
		<!-- 中间的大div -->
		<div class="box_1">
			<!-- 左侧导航 -->
			<div class="box_nav">
				<ul class="box_nav_ul">
					<li class="box_nav_li4">首页</li>
					<a href="<%=basePath %>ManagerServlet?action=allproducts" class="a1">
						<li class="box_nav_li5">商品信息</li>
					</a>
					<a href="ManagerServlet?action=allmanager" class="a2">
						<li class="box_nav_li6">用户管理</li>
					</a>
				</ul>
			</div>

			<!-- 右侧对应div -->
			
			<!-- 用户管理 -->
			<div class="box_users">
				
				<!-- 选项卡 -->
					<div class="box_users_div">
						<a href="<%=basePath %>ManagerServlet?action=allmanager" class="box_m2">管理员信息</a>
						<a href="<%=basePath %>ManagerServlet?action=alluser" class="box_u2">用户信息</a>
					</div>
					<!-- 信息 -->
					<div class="box_m_content">
						<!-- 管理员信息 -->
						<ul class="box_m_ul">
							<li class="box_m_li">
								<span class="box_m1">管理员id</span>
								<span class="box_m2">管理员名称</span>
								<span class="box_m3">密码</span>
								<span class="box_m4">邮箱</span>
								<span class="box_m5">操作</span>
							</li>
							<c:choose>
							<c:when test="${empty mInf}">
								<div class="cartBox">
					            	<div class="order_content">  
					            			<li class="box_m_li1">
											<span class="box_li1_m1">没有管理员信息</span>
										</li>
					           	 	</div>
					            </div>    			
							</c:when>
							<c:otherwise>
								<c:forEach items="${mInf}" var="inf">
										<li class="box_m_li1">
											<span class="box_li1_m1">${inf.manaloginId}</span>
											<span class="box_li1_m2">${inf.userName}</span>
											<span class="box_li1_m3">${inf.password}</span>
											<span class="box_li1_m4">${inf.email}</span>
											<span class="box_li1_m5 li_delete">
											<form action="ManagerServlet" method="post">
												<input type="hidden" value="${inf.userName}" name="userName"/>
												<input type="hidden" value="deleteMana" name="action"/>
												<button type="submit">删除</button>
											</form>
												
											</span>
										</li>
								</c:forEach>
							</c:otherwise>
							</c:choose>
							
						</ul>
					</div>
				
			</div>
		</div>
	</div>	
</body>
</html>