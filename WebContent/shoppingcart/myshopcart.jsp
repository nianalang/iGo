<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 页脚的引用标签-->
<%@ taglib prefix="lms" uri="/lms-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%   String path = request.getContextPath();  
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="<%=basePath %>css/carts.css">
 <script src="<%=basePath %>js/jquery-1.8.1.js"></script>
<title>iGo购物网</title>
</head>

<script type="text/javascript">
    	function query(pageNo) {
    		document.getElementById("curPage").value=pageNo;
            document.getElementById("shoppingCart").submit();
		}  
    	
 </script>
 <script type="text/javascript">
 	 var status='<%=request.getAttribute("status") %>';
		if(status!='null'){
		alert(status);
	} 
 </script>
<body>
	<!--  引入头部-->
	<jsp:include page="../oldhead.jsp"></jsp:include>
    <!-- logo及搜索框 -->
    <div class="cart_all">
        <div class="cart_logo">
            <a class="cart_logo_cart" href="#">iGo购物车</a>
        </div>
        <div class="cart_input">
          <input type="text" name="cart_search" value="请输入关键词" onfocus="if(this.value=='请输入关键词'){this.value='';}"  
            	onblur="if(this.value==''){this.value='请输入关键词';}" />
            <img src="<%=basePath %>images/cart_search.png">
        </div>
    </div>
    <!-- 放在一个大的section中，分为头中尾 -->
    <section class="cartMain">
        <div class="cartMain_hd">
            <ul class="order_lists" id="orderCart">
                <li class="list_chk">
                    <!--所有商品全选-->
                    <input type="checkbox" id="all" class="whole_check">
                 
                    <span>全选</span>
                </li>
                <li class="list_con"><span>商品信息</span></li>
             
                <li class="list_price"><span>单价（元）</span></li>
                <li class="list_amount"><span>数量</span></li>
                <li class="list_sum"><span>小计（元）</span></li>
                <li class="list_op"><span>操作</span></li>
            </ul>
        </div>	
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
			<!-- -->
			<div class="cartBox">
            <div class="order_content"> 
          <form action="ShoppingCartServlet?action=paidbuy"  method="post">                     
			<c:forEach  items="${pageObject.data}"   var="tempProduct"   begin="0"  end="${fn:length(pageObject.data)}"  varStatus="status">
           		
           	  <ul class="order_lists"   id="${tempProduct.pruducts.productsId}">
                    <li class="list_chk">
                        <input type="checkbox" id="checkbox_2" class="son_check" value="${tempProduct.pruducts.productsId }" name="productsId">
                    </li>
                    <li class="list_con">
                        <div class="list_img"><a href="javascript:;"><img src="${tempProduct.pruducts.productsUrlMain }" alt=""></a></div>
                        <div class="list_text"><a href="javascript:;">${tempProduct.pruducts.described}</a></div>
                    </li>
                   
                    <li class="list_price">
                        <p class="price">${tempProduct.pruducts.price}</p>
                    </li>
                    <li class="list_amount">
                        <div class="amount_box">
                            <a href="javascript:;" class="reduce">-</a>
                            <input type="text" value="${ tempProduct.number}" class="sum" name="number">
                            <a href="javascript:;" class="plus">+</a>
                        </div>
                    </li>
                    <li class="list_sum">
                        <p class="sum_price">${tempProduct.pruducts.price*tempProduct.number}</p>
                    </li>
                    <li class="list_op">
                        <p class="del"><a href="javascript:;" class="delBtn"><img src="<%=basePath %>images/cart_delete.png"></a></p>
                    </li>                  
           </ul>                      	
           	</c:forEach>
           	
			<!--底部-->
	        <div class="bar-wrapper">
	            <div class="bar-right">
	                <div class="piece">已选商品<strong class="piece_num">0</strong>件</div>
	                <div class="totalMoney">共计: <strong class="total_text">￥0</strong></div>
	             <%--    <input type="hidden" value="${pageObject.curPage }" name="curPage"> --%>
	                <div class="calBtn"><input type="submit" value="结算" class="submit_btn"></div>
	               
	            </div>
	        </div>
			</form>      
		 
		 <!-- 模态框 -->
    		<section class="model_bg"></section>
    		<section class="my_model">
	        	<p class="title">删除宝贝<span class="closeModel">X</span></p>
	        	<p>您确认要删除该宝贝吗？</p>
	        	<div class="opBtn">
			    <a href="ShoppingCartServlet?action=deleteCart&productsId=${tempProduct.pruducts.productsId}" class="dialog-sure">确定</a>
		            <a href="javascript:;" class="dialog-close">关闭</a>
				</div>
			</section>
		 
		
           		<!--引用分页功能 -->
					<form action="ShoppingCartServlet?action=lookcarts" id="shoppingCart" method="post">
				 <input type="hidden" value="5" name="pageSize"> <input id="curPage" type="hidden"
					value="${pageObject.curPage }" name="curPage"><input type="hidden" value="0" name="status"/>				
					<lms:page object="${pageObject}" script="query">
						<jsp:include page="../page.jsp" flush="true"></jsp:include>
					</lms:page>
					</form>         	
			</div>
			</div>
		</c:otherwise>	
	</c:choose>
        
    </section>	
    <script src="<%=basePath %>js/carts.js"></script>
</body>
</html>