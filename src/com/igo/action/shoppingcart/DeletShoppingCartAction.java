package com.igo.action.shoppingcart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.igo.action.Action;
import com.igo.dao.ShoppingCartDao;
import com.igo.factory.DAOFactory;

public class DeletShoppingCartAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取客户端传来的产品id
		String sProductId=request.getParameter("productsId");
		int productId=Integer.parseInt(sProductId);
		//获取登录用户的ID
		String uids = String.valueOf(request.getSession().getAttribute("userId"));
		int userId = Integer.parseInt(uids);	
		//调用sevice方法
		ShoppingCartDao shoppingCartDao=DAOFactory.createDao(ShoppingCartDao.class);	
		//通过产品id和用户id来删除商品
		boolean flag=shoppingCartDao.deleteProducts(userId, productId, 0);
		if(flag){
			//已成功将该宝贝删除~
			request.setAttribute("status", "已成功将该宝贝删除~");
		}else{
			request.setAttribute("status", "删除宝贝操作失败，请重试");
		}		
		return "ShoppingCartServlet?action=lookcarts&status=0";
	} 
}
