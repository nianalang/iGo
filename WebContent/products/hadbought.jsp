<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 页脚的引用标签-->
<%@ taglib prefix="lms" uri="/lms-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%String path = request.getContextPath();  
	 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/home.css">
<script type="text/javascript" src="<%=basePath %>js/jquery-1.8.1.js"></script>	
<title>iGo购物网</title>

<script type="text/javascript">
	function query(pageNo) {
		document.getElementById("curPage").value=pageNo;
	    document.getElementById("shoppingCart").submit();
}  
</script>
<script type="text/javascript">
    	//如果用户已经评论过该商品，弹出错误对话框
    	var status=${status};	
    	if(status==1){
			$('.button').text("已评价");
	      		alert("您已经评论过该商品")      		
    	}  	
</script>
</head>

<body>
	<!--  引入头部-->
	<jsp:include page="../oldhead.jsp"></jsp:include>
		<div class="header">
		<!--头部logo-->
		<div class="header_logo">
			<img src="<%=basePath %>images/homelogo.jpg"/>
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
				<li class="bbb bbb1">
					<a href="<%=basePath %>ShoppingCartServlet?action=lookcarts&status=0"><span class="list">我的购物车</span></a>
				</li>
				<li class="bbb bbb2">
					<!-- ShoppingCartServlet?action=lookPaidBuy&status=1  -->
					<span class="list list1" id="bought"><a href="<%=basePath %>ShoppingCartServlet?action=lookPaidBuy&status=1" >已购买的宝贝</a></span>
				</li>
			</ul>
			
			<ul class="aaaa">
				<img class="my_title" src="<%=basePath %>images/geren.jpg"/>&nbsp;<span>会员资料</span>
				<li class="bbb bbb3">
					<span class="list list2" id="inf"><a href="<%=basePath %>UserServlet?action=lookmyinf">个人信息</a></span>
				</li>
				<li class="bbb bbb4">
					<span class="list list3" id="infa"><a href="<%=basePath %>UserServlet?action=lookmyupdate" >修改资料</a></span>
				</li>
			</ul>
     
       </div>
        <!--右边内容-->
        <div class="list_right" >
        	<!-- 已买到的商品 -->
    		<ul class="list_right_ul">
    			<li class="list_right_li_1">
    				<div class="lists_inf">
  						<span>商品信息</span>
    				</div>
    				<div class="lists_pri">
    					<span>单价（元）</span>
    				</div>
    				<div class="lists_num">
    					<span>数量</span>
    				</div>
    				<div class="lists_caozuo">
    					<span>操作</span>
    				</div>
    			</li>
    	<c:choose>
		<c:when test="${empty pageObject.data}">
			<div class="cartBox">
            	<div class="order_content">  
            			 <ul class="order_lists"  id="cartTop">
            			 	<li  style="font-size: 20px; font-weight: bold; text-align:center; ">您的购物车中没有任何商品~</li> 
            			 </ul>
           	 	</div>
            </div>    			
		</c:when>
		
		<c:otherwise>
		<!--"${fn:length(pageObject.data) }"  -->
			<c:forEach items="${pageObject.data}"   var="tempPaid"   begin="0"  end="${fn:length(pageObject.data)}" varStatus="status">
				<li class="lists_detail">
    				<div class="lists_img">
    					<img alt="" src="${tempPaid.pruducts.productsUrlMain }" class="images1">
    				</div>
    				<div class="lists_information">
    					<a href="ProductServlet?action=goodslist-select&productId=${tempPaid.pruducts.productsId}"  target="_blank"><span>${tempPaid.pruducts.described }</span></a>
    				</div>
    				<div class="lists_price">
    					<span>${tempPaid.pruducts.price*tempPaid.number }</span>
    				</div>
    				<div class="lists_number">
    					<span>${tempPaid.number}</span>
    				</div>
    				<div class="lists_pingjia">
    					<a href="EvaluateServlet?curPage=${pageObject.curPage }&productsId=${tempPaid.pruducts.productsId }&action=go" ><button class="button" type="button">去评价</button></a>
    				</div>
    			</li>
			</c:forEach>
			
		</c:otherwise>
	</c:choose>  		 			
    			<%-- <li class="lists_detail">
    				<div class="lists_img">
    					<img alt="" src="<%=basePath%>images/prod1.jpg" class="images1">
    				</div>
    				<div class="lists_information">
    					<span>澳大利亚 进口奶粉 德运 （Devondale）调制乳粉（全脂）成人奶粉 1kg 袋装</span>
    				</div>
    				<div class="lists_price">
    					<span>55</span>
    				</div>
    				<div class="lists_number">
    					<span>55</span>
    				</div>
    			</li>
    			<li class="lists_detail">
    				<div class="lists_img">
    					<img alt="" src="<%=basePath%>images/prod1.jpg" class="images1">
    				</div>
    				<div class="lists_information">
    					<span>澳大利亚 进口奶粉 德运 （Devondale）调制乳粉（全脂）成人奶粉 1kg 袋装</span>
    				</div>
    				<div class="lists_price">
    					<span>55</span>
    				</div>
    				<div class="lists_number">
    					<span>55</span>
    				</div>
    			</li>
    			<li class="lists_detail">
    				<div class="lists_img">
    					<img alt="" src="<%=basePath%>images/prod1.jpg" class="images1">
    				</div>
    				<div class="lists_information">
    					<span>澳大利亚 进口奶粉 德运 （Devondale）调制乳粉（全脂）成人奶粉 1kg 袋装</span>
    				</div>
    				<div class="lists_price">
    					<span>55</span>
    				</div>
    				<div class="lists_number">
    					<span>55</span>
    				</div>
    			</li> --%>
    				<!--引用分页功能 -->
				 <form action="ShoppingCartServlet?action=lookPaidBuy" id="shoppingCart" method="post">
				 	<input type="hidden" value="4" name="pageSize"> <input id="curPage" type="hidden"
					value="${pageObject.curPage }" name="curPage"><input type="hidden" value="1" name="status"/>				
					<lms:page object="${pageObject}" script="query">
						<jsp:include page="../page.jsp" flush="true"></jsp:include>
					</lms:page>
				</form>     
    			
    		</ul>
       </div >	
	</div>
</body>
</html>