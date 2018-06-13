<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="lms" uri="/lms-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
  <%String path = request.getContextPath();  
	 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>iGo购物网</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>css/good.css"/>
 <script type="text/javascript" src="<%=basePath %>js/jquery-1.9.1.min.js"></script>
 <script type="text/javascript">
	function query(pageNo) {
		document.getElementById("curPage").value=pageNo;
    	document.getElementById("ProductServlet").submit();
	}
 </script>
 <script src="<%=basePath %>js/good.js" type="text/javascript" charset="utf-8"></script>

	   <script type="text/javascript">
	   var status ='<%=request.getAttribute("status")%>';   
	   	if(status!='null'){
	   		alert(status);
	   	}	   	
	   
	   	
		$(document).ready(function(){
			var t = $("#text_box");

			$('#min').attr('disabled',true);

			$("#add").click(function(){
				t.val(parseInt(t.val())+1)
				if (parseInt(t.val())!=1){
					$('#min').attr('disabled',false);
				}

			})
			$("#min").click(function(){
				t.val(parseInt(t.val())-1);
				if (parseInt(t.val())==1){
					$('#min').attr('disabled',true);
				}

			})
		});
	   
	   
	   
			   $(document).ready(function(){
				   var showproduct = {
					   "boxid":"showbox",
					   "sumid":"showsum",
					   "boxw":400,//宽度
					   "boxh":400,//高度
					   "sumw":60,//列表每个宽度
					   "sumh":60,//列表每个高度
					   "sumi":6,//列表间隔
					   "sums":5,//列表显示个数
					   "sumsel":"sel",
					   "sumborder":1,//列表边框
					   "lastid":"showlast",
					   "nextid":"shownext"
				   };//参数定义
				   $.ljsGlasses.pcGlasses(showproduct);//方法调用，在加载完后执行
			   });
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
<div class="showall">
	<!--左侧内容 -->
	<div class="showbot">
		<div id="showbox">
		<c:if test="${null!=products.productsUrlOne}">
				<img src="${products.productsUrlOne }"  width="400" height="400"/>
		</c:if>
		<c:if test="${null!=products.productsUrlTwo}">
				<img src="${products.productsUrlTwo}"  width="400" height="400"/>
		</c:if>
		<c:if test="${null!=products.productsUrlThree}">
					<img src="${products.productsUrlThree }"  width="400" height="400" />
		</c:if>
		<c:if test="${null!=products.productsUrlFour}">
				<img src="${products.productsUrlFour }"  width="400" height="400" />
		</c:if>
		<c:if test="${null!=products.productsUrlFive }">
				<img src="${products.productsUrlFive }" width="400" height="400" />
		</c:if>
		<c:if test="${null!=products.productsUrlSix }">
				<img src="${products.productsUrlSix }" width="400" height="400" />
		</c:if>		
		</div><!--展示图片盒子-->
		<div id="showsum">
			<!--展示图片里边-->
		</div>
		<p class="showpage">
			<a href="javascript:void(0);" id="showlast"> < </a>
			<a href="javascript:void(0);" id="shownext"> > </a>
		</p>
	</div>
	<!--中心内容-->
	<div class="tb-property">
		<div class="tr-nobdr">
			<h4>${products.described }</h4>
		</div>
		<div class="txt">
			<span class="nowprice">￥<a href="">${products.price }</a></span>
			<div class="cumulative">
				<span class="number one">累计售出<br /><em id="add_sell_num1">${products.getPurchasedNum() }</em></span>
				<span class="number two">累计评价<br /><em id="add_sell_num2">0</em></span>
			</div>
		</div>
	<form action="ShoppingCartServlet?action=intobuy&status=detail" method="post">
		<div class="txt-h">
		<!--  ***************************************************-->
		<div class="goodsT">
			<span class="goods-count">选择数量</span>
			<input id="min" type="button" value="-" />
			<input id="text_box" name="number"  type="text" value="1"style="width:30px; text-align: center; color: #0F0F0F;"/>
			<input id="add" type="button" value="+" />
			<span class="kucun">库存${products.productsNum }</span>
		 </div>
		 	<script>
				$(document).ready(function(){
					var t = $("#text_box");   //获得文本框对象
					$('#min').attr('disabled',true); //初始化数量为1 ，并失效减
					$("#add").click(function(){   //数量增加操作
						t.val(parseInt(t.val())+1)  // 给获取的val加上绝对值，避免出现负数
						if (parseInt(t.val())!=1){
							$('#min').attr('disabled',false);
						}
					})
					$("#min").click(function(){  	//数量减少操作
						t.val(parseInt(t.val())-1);  //数量为1时 ，失效减，其他情况正常减
						if (parseInt(t.val())==1){
							$('#min').attr('disabled',true);
						}
					})
				});
			</script> 
		 <div class="hiddens">
			<span class="tex-o">选择颜色</span>
			<ul class="glist" id="glist" data-monitor="goodsdetails_fenlei_click">
				<li>
					<a title="深空灰" href="" >
					<img src="<%=basePath %>images/深空灰.jpg"  width="30" height="30">深空灰</a>
				</li>
				<li><a title="银色" href="">
					<img src="<%=basePath %>images/银色.jpg"  width="30" height="30">银色</a>
				</li>
			</ul>
			</div>			
		</div> 
		
	 	<div class="txt-o">
			<span class="tex-o">选择版本</span>
			<ul class="glist" id="glist" data-monitor="goodsdetails_fenlei_click">
				<li><a title="全网通64G" href="" >全网通64G</a></li>
				<li><a title="全网通256G" href="">全网通256G</a></li>
			</ul>
		</div> 

		<div class="nobdr-btns">
			<input type="hidden" value="${products.productsId }" name="productId">
			<button type="submit" class="addcart jiaru"><img src="<%=basePath %>images/加入购物车.png" width="25" height="25"/>加入购物车</button>
		</div>
	</form>
	<!-- 用户评论区 -->
	<c:choose>
		<c:when test="${empty pageObject.data}">
			<div class="user">
				<ul class="user_ul">
					<li>该商品还没有被评论</li>
				</ul>
			</div>
		</c:when>
		<c:otherwise>
			<div class="user">
				<ul class="user_ul">
					<span class="user_head">用户评论</span>
					<li class="user_li">
						<span class="user_li_s1">用户ID</span>
						<span class="user_li_s2">评价</span>
						<span class="user_li_s3">详情</span>
					</li>
					
					<c:forEach  items="${pageObject.data}"   var="comment"   begin="0"  end="${fn:length(pageObject.data)}"  varStatus="status">
						<li class="user_li1">
						<span class="user_li_s4">${comment.login_id }</span>
						<span class="user_li_s5">${comment.quality }</span>
						<span class="user_li_s6">${comment.evaluate }</span>
					</li>
					</c:forEach>	
					
				</ul>
				<div class="user_page">
					<!--引用分页功能 -->
					<form action="ProductServlet?action=goodslist-select" id="ProductServlet" method="post">
				 	<input type="hidden" value="3" name="pageSize"> <input id="curPage" type="hidden"
					value="${pageObject.curPage }" name="curPage">	
					<lms:page object="${pageObject}" script="query">
						<jsp:include page="../page.jsp" flush="true"></jsp:include>
					</lms:page>
					</form>    
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	
	</div>
	<!--right -->
	<div class="extInfo">
		<div class="brand-logo">
			<a href="" title="Three旗舰店">
				<img src="<%=basePath %>images/store-logo.jpg"/>
			</a>
		</div>
		<div class="seller-pop-box">
			<span class="tr">商家名称：Three旗舰店</span>
			<span class="tr">商家等级：高级店铺</span>
			<span class="tr">商家电话：18242095108</span>
          	<span class="tr hoh">
          		<a title="所在地区：辽宁省大连市开发区辽河西路18号大连民族大学" href="">所在地区：辽宁省大连市开发区辽河西路18号大连民族大学</a>
          	</span>
		</div>
		<div class="seller-phone">
           	<span class="pop im">
           		<a href="" data-name="联系卖家"><img src="<%=basePath %>images/phon.png"/>联系卖家</a>
           	</span>
           	<span class="pop in">
           		<a href="" data-name="咨询卖家"><img src="<%=basePath %>images/qq.png"/>咨询卖家</a>
           	</span>
           	<span class="pop in">
           		<a href="" data-name="进店逛逛"><img src="<%=basePath %>images/shop-line.png"/>进店逛逛</a>
           	</span>
           	<span class="pop in">
           		<a href="" data-name="关注店铺"><img src="<%=basePath %>images/staar.png"/>关注店铺</a>
           	</span>
		</div>

			<div class="seller-service">
			<span class="service"><a href="" data-name="平台承诺">平台承诺</a></span>
			</div>

           <div class="seller-describe">
			  <dl class="dl">
				  <dt class="dt">全国联保</dt>
				  <dd class="dd">凭质保证书及Three旗舰店发票，可享受全国联保服务</dd>
				  <dt class="dt">权利声明</dt>
				  <dd class="dd">所有商品信息未经许可，禁止非法转载使用</dd>
				  <dt class="dt">问题反馈</dt>
				  <dd class="dd">如有疑问，建议您在购买前联系客服咨询。
				  </dd>
			  </dl>
		   </div>
	</div>
</div>
</body>
</html>