<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="lms" uri="/lms-tags"%>
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
<script type="text/javascript">
   	function query(pageNo) {
   		document.getElementById("curPage").value=pageNo;
           document.getElementById("managerServlet").submit();
	}  
    	
 </script>
 <script type="text/javascript">
 	var status='<%=request.getAttribute("status")%>';
 	if(status!='null'){
 		alert(status);
 	}
 </script>
<body>
	<jsp:include page="../mhead.jsp"></jsp:include>
	<!-- 最大的div -->
	<div class="bigbox">
		<!-- logo所在的行 -->
		<div class="box_logo">
			<!-- logo -->
			<a href=""><img src="<%=basePath %>images/logo.jpg" class="box_logo_img" /></a>
		</div>
		<!-- 中间的大div -->
		<div class="box_1">
			<!-- 左侧导航 -->
			<div class="box_nav">
				<ul class="box_nav_ul">
					<li class="box_nav_li1">首页</li>
					<a href="<%=basePath %>ManagerServlet?action=allproducts" class="a3">
						<li class="box_nav_li2">商品信息</li>
					</a>
					<a href="<%=basePath %>ManagerServlet?action=allmanager" class="a4">
						<li class="box_nav_li3">用户管理</li>
					</a>
				</ul>
			</div>
			<!-- 右侧对应div -->
			<!-- 商品管理 -->
			<div class="box_goods">
				<!-- <form action="" type="submit"> -->
					<div class="box_goods_div">
						<ul class="box_goods_div_ul">
							<li class="box_goods_div_li1">商品id</li>
							<li class="box_goods_div_li2">图</li>
							<li class="box_goods_div_li3">描述</li>
							<li class="box_goods_div_li4">修改库存</li>
							<!-- <li class="box_goods_div_li5">价格</li> -->
							<!--已购数量/抢购日期-->
							<!-- <li class="box_goods_div_li6">已购数量</li> -->
							<li class="box_goods_div_li7">抢购日期</li>
							<!--删除-->
							<li class="box_goods_div_li8">操作</li>
						</ul>
					</div>
					<!-- 下方具体内容 -->
				
				<ul class="list_ul">
				 <c:choose>
					<c:when test="${empty pInf.data}">
						<div class="cartBox">
			            	<div class="order_content">  
			            			<li class="box_m_li1">
									<p class="box_li1_m1">没有抢购的商品</p>
								</li>
			           	 	</div>
			            </div>    			
					</c:when>
					<c:otherwise>
						<c:forEach items="${pInf.data}" var="pInfs">
							<li class="list">
								<span class="span_id">${pInfs.productsId}</span>
								<span class="span_img">
									<img src="${pInfs.productsUrlMain}" class="img" />
								</span>
								<span class="span_describe">${pInfs.described}</span>
								<span class="span_left">
									<form action="ManagerServlet"  method="post">
										<input type="text" value="${pInfs.productsNum}" class="input"  name="number"/>
										<input type="hidden" value="${pInfs.productsId}" name="productId"/>
										<input type="hidden" value="updateProductStatus" name="action"/>
										<input type="hidden" value="${pInf.curPage }" name="curPage">
										<button class="confirm" type="submit">确认</button>
									</form>
								</span>
								<span class="span_date">${pInfs.date}</span>
								<span class="span_delete">
								<form action="ManagerServlet"  method="post">
										<input type="hidden"  value="${pInfs.productsId}" name="productId"/>
										<input type="hidden"  value="deleteProduct" name="action"/>
										<input type="hidden" value="${pInf.curPage }" name="curPage">
										<button type="submit" class="delete">删除</button>
								</form>
								</span> 
							</li>
						</c:forEach>
						<!--引用分页功能 -->
						<form action="ManagerServlet?action=allproducts" id="managerServlet" method="post">
					 	<input type="hidden" value="6" name="pageSize"> <input id="curPage" type="hidden"
						value="${pInf.curPage }" name="curPage"><input type="hidden" value="1" name="status"/>
						<lms:page object="${pInf}" script="query">
							<jsp:include page="../page.jsp" flush="true"></jsp:include>
						</lms:page>
						</form>    
					</c:otherwise>
				</c:choose>
					 
				</ul>
				
			</div>
			
		</div>
	</div>
	<script type="text/javascript" src="<%=basePath  %>js/manager.js"></script>
</body>
</html>