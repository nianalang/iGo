<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
		/*分页导航*/
    #pagebar{
	  	text-align:center;
	  	margin-top: 10px;
	  	margin-right: 10px;	
  }
 	#pagebar span{
	  	font-size:1.6em;
	  	text-decoration: none;
	  	color: #fff;
	  	background-color: #ff5555;
	  	display: inline-block;
	  	width: 25px;
	  	height: 25px;
	  	text-align: center;
	  	color: #fff;
	  	padding-top: 3px;
	  	font-size: 13px;
	  	  	
  }
  #pagebar span:hover{
	  	z-index: 100;
	
	  	cursor:pointer;
	  	background-color: #ff0000;
  }
  #pagebar .arrow{
  		width: 60px;
  }
</style>

	<div id="pagebar">
		<c:choose>
			<c:when test="${iPageObjectTag[0]==0 }">
				<span>无</span>
			</c:when>
					
			<c:when test="${iPageObjectTag[0]==1 }">
			    <span class="arrow" >1</span> 
			</c:when>				
			<c:otherwise>
			第<c:out value="${iPageObjectTag[1]}"/>页/共<c:out value="${iPageObjectTag[0]}"/>页
			&nbsp;&nbsp;
			<c:if test="${iPageObjectTag[1]!=1 }">
				<span  class="arrow"   onclick="toPage(${iPageObjectTag[1]-1})">上一页</span> 
			</c:if>
			
			<c:forEach   var="i"  begin="1"   end="${iPageObjectTag[0] }">
				<span onclick="toPage(${i})">${i}</span>
			</c:forEach>
			
			
			<c:if test="${iPageObjectTag[1]!=iPageObjectTag[0] }">
				  <span class="arrow"   onclick="toPage(${iPageObjectTag[1]+1})">下一页</span>
			</c:if>
						
			<script type="text/javascript">
			
				var curPage=${iPageObjectTag[1]};//得到当前页数
				function toPage(pageNo){
				
				 if(pageNo==curPage ){
						  return;
				  }		
				//如果script不等于空
				if(${sPageObjectTag}!=' '){ 
					 ${sPageObjectTag}(pageNo);
					
				}				
			}			
			</script>								
		</c:otherwise>
	</c:choose>                                       
 </div>
