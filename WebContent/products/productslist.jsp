<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 页脚的引用标签-->
<%@ taglib prefix="lms" uri="/lms-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%	String path = request.getContextPath();  
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>iGo购物网</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/productslist.css" />
<style type="text/css">
	/*加入购物车样式*/
.shoppingCart{
    width: 166px;
    height: 30px;
    
    margin-top:10px;
}
#numberinput{
	width: 60px;
    height:30px;
}
	#addCart{
	margin-left:10px;
	width:80px;
	height:35px;
	background:#ff5555;
	color:#fff;	
	border:0px;
	
}
	#addCart:hover{
	color:#ff0000;
	background:#ff0000;
	opacity:0.8;
	color:#fff;
	cursor:pointer;
}
</style>
<script type="text/javascript" src="<%=basePath %>js/jquery-1.8.1.js"></script>
<script language="JavaScript">
        $(document).ready(function() {
            $('.face li').hover(
                    function(){
                        $(this).addClass('imgsize')
                    },
                    function(){
                        $(this).removeClass('imgsize')
                    });
        });
       var status ='<%=request.getAttribute("status")%>';   
	   	if(status!='null'){
	   		alert(status);
	   	}	   	
    </script>

<script type="text/javascript">
    	function query(pageNo) {
    		document.getElementById("curPage").value=pageNo;
            document.getElementById("productlist").submit();
		}    
 </script>
</head>
<body>
	<!--引入head.jsp  -->
		<%
			//取出session的值
			String userName=(String)session.getAttribute("userName");
			if(userName==null){
		%>
				<jsp:include page="../newhead.jsp" />	 
		<%}else{	%>		
				<jsp:include page="../oldhead.jsp" />
		<% }%>
		
		<c:choose>
			<c:when test="${empty pageObject.data}">
				<span>此商品无货</span>
			</c:when>
			<c:otherwise>

				<!--算出需要几个div  -->
				<c:if test="${fn:length(pageObject.data)%5 ==0}">
					<c:set value="${fn:length(pageObject.data)/5 }" var="dataSize"></c:set>
				</c:if>
				<c:if test="${fn:length(pageObject.data)%5 !=0}">
					<c:set value="${fn:length(pageObject.data)/5+1 }" var="dataSize"></c:set>
				</c:if>
				<c:forEach begin="1" end="${dataSize}" varStatus="status">
					<div id="products-first" class="products">
						<ul id="faceul-first" class="face">
							<c:if test="${status.last!=true }">
								<c:set value="${status.index*5-1 }" var="lineSize"></c:set>
							</c:if>
							<c:if test="${status.last==true }">
								<c:set value="${fn:length(pageObject.data)-1 }" var="lineSize"></c:set>
							</c:if>
							<c:forEach items="${pageObject.data}" var="products"
								varStatus="status" begin="${(status.index-1)*5 }"
								end="${lineSize}">
								<li><img src="${products.	getProductsUrlMain() }">				
									<p class="proPrice">${products.getPrice()}</p>
									<p class="proName">
										<a href="ProductServlet?action=goodslist-select&productId=${products.getProductsId()}"  target="_blank">${products.described}</a>
									</p> <!--购物车的那一行-->
									<div class="shoppingCart">
									<form action="ShoppingCartServlet"  method="post">
										<input type="number"  name="number" id="numberinput" value="1" min="1"> 
										<input type="hidden"  name="productId"  value="${products.getProductsId()}" >
										 <input type="hidden"  name="action"  value="intobuy" >
									 	 <input  type="hidden" value="${pageObject.curPage }" name="curPage">
										<input type="submit" value="加入购物车"  id="addCart"/>
									</form>
									</div>									
								</li>
							</c:forEach>
						</ul>
					</div>
				</c:forEach>
				
				<!--引用分页功能 -->
					<form action="ProductServlet?keyword=${sessionScope.keyWord }" id="productlist" method="post">
					<input type="hidden" value="${sessionScope.action }" name="action"> <input
					type="hidden" value="10" name="pageSize"> <input id="curPage" type="hidden"
					value="${pageObject.curPage }" name="curPage"><input type="hidden"  name="keyClass" value="1"/>
					<input type="hidden" value="0" name="status">				
					<lms:page object="${pageObject}" script="query">
						<jsp:include page="../page.jsp" flush="true"></jsp:include>
					</lms:page>
					</form>
			</c:otherwise>
		</c:choose>	
	<jsp:include page="../foot.jsp"></jsp:include>
</body>
</html>