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
			<img src="<%=basePath %>images/logo.jpg" class="box_logo_img" />
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
					<a href="<%=basePath %>ManagerServlet?action=allmanager" class="a2">
						<li class="box_nav_li6">用户管理</li>
					</a>
				</ul>
			</div>

			<!-- 右侧对应div -->
			
			<!-- 用户管理 -->
			<div class="box_users">
				<form action="" type="submit">
				<!-- 选项卡 -->
					<div class="box_users_div">
						<a href="<%=basePath %>ManagerServlet?action=allmanager" class="box_m">管理员信息</a>
						<a href="<%=basePath %>ManagerServlet?action=alluser" class="box_u">用户信息</a>
					</div>
					<!-- 信息 -->
					<div class="box_m_content">
						<!-- 用户信息 -->
						<ul class="box_u_ul">
							<li class="box_u_li">
								<span class="box_u1">用户id</span>
								<span class="box_u2">用户名</span>
								<span class="box_u3">密码</span>
								<span class="box_u4">邮箱</span>
								<span class="box_u5">操作</span>
							</li>
							<c:choose>
								<c:when test="${empty uInf}">
									<div class="cartBox">
						            	<div class="order_content">  
						            			<li class="box_m_li1">
												<span class="box_li1_m1">没有用户信息</span>
											</li>
						           	 	</div>
						            </div>    			
								</c:when>
								<c:otherwise>
									<c:forEach items="${uInf}" var="allUserinf">
										<li class="box_u_li1">
											<span class="box_li1_u1">${allUserinf.loginId}</span>
											<span class="box_li1_u2">${allUserinf.userName}</span>
											<span class="box_li1_u3">${allUserinf.password}</span>
											<span class="box_li1_u4">${allUserinf.email}</span>
											<span class="box_li1_u5">
											<form action="ManagerServlet"  method="post">
												<input type="hidden" value="${allUserinf.loginId}" name="userId"/>
												<input type="hidden" value="deleteUser" name="action"/>
												<button type="submit">删除</button>
											</form>
											</span>
										</li>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>