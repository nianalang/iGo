package com.igo.action.shoppingcart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.igo.action.Action;
import com.igo.dao.ShoppingCartDao;
import com.igo.factory.DAOFactory;
import com.igo.pojo.Shopcarts;

public class InsertShoppingCartAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		  //获取商品的ID
		 int productId = Integer.parseInt(String.valueOf(request.getParameter("productId")));
		
		 //获取商品的数量
		String snumber=request.getParameter("number");
		 int number=1;
		 if(snumber!=null){
			 number=Integer.parseInt(snumber);
		 }
		//获取登录用户的ID
		String usersId = String.valueOf(request.getSession().getAttribute("userId"));
		int userId = Integer.parseInt(usersId);
		try{
			//调用sevice方法
			ShoppingCartDao shoppingCartDao=DAOFactory.createDao(ShoppingCartDao.class);				
			Shopcarts shopcarts=shoppingCartDao.getProductsId(userId, productId, 0);
			if (shopcarts.getShopcartId()==0) {// 如果购物车中不存在
				//将商品加入购物车
				boolean flag=shoppingCartDao.addBuy(userId, productId, number);
				if( flag){
				//加入购物车成功	
					request.setAttribute("status", "已将该宝贝添加到您的购物车……");
				}			
			}else{	
				//修改购物车已有商品的数量
				boolean flag=shoppingCartDao.updatebuy(shopcarts.getShopcartId(),shopcarts.getShopcartNum()+number,0);
				if(flag){
					//加入购物车成功
					request.setAttribute("status", "已将该宝贝添加到您的购物车……");		
				}			
			}		
		}catch(Exception e){
			e.printStackTrace();
		}
		//status
		String status=request.getParameter("status");
		if(status!=null&&"rushbuy".equals(status)){
			return "products/rushbuy.jsp";
		}else if(status!=null&&"import".equals(status)){
			return "ImportProductServlet?action=beauty&keyWordOne=skincare&keyWordTwo=washbath";		
		}else if (status!=null&&"detail".equals(status)) {
			return "ProductServlet?action=goodslist-select&productId="+productId+"";
		}else {
			return "ProductServlet?keyword="+request.getSession().getAttribute("keyWord")+"&action=index-select";
		}		
	}
}
