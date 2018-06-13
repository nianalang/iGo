package com.igo.action.shoppingcart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.igo.action.Action;
import com.igo.dao.ProductDao;
import com.igo.dao.ShoppingCartDao;
import com.igo.factory.DAOFactory;
import com.igo.pojo.Products;
import com.igo.pojo.Shopcarts;
import com.igo.pojo.TempProducts;
import com.igo.tag.PageObject;

public class ShowShoppingcartAction implements Action{

	//查看购物车中的所有商品
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//新建tempProduct对象
		List listTempProducts=new ArrayList();
		//将取出的数据进行分页显示
		PageObject pageObject=new PageObject();
		//获取登录用户的ID
		String usersId = String.valueOf(request.getSession().getAttribute("userId"));
		int userId = Integer.parseInt(usersId);
		int curPage =0;int pageSize=0;
		String statusString=request.getParameter("status");
		int status=Integer.parseInt(statusString);
		//获取用户所有未支付的商品status=0表示未支付
		ShoppingCartDao shoppingCartDao=DAOFactory.createDao(ShoppingCartDao.class);	
		//根据用户名和购物车状态查询所有未支付的购物车列表
		List<Shopcarts> listShopcarts=shoppingCartDao.getAppointedProducts(userId,status);
		//将购物车的商品一件件取出来
		for(int i=0;i<listShopcarts.size();i++){
			Shopcarts shopcarts=listShopcarts.get(i);
			//根据提供productId获取商品
			ProductDao productDao=DAOFactory.createDao(ProductDao.class);
			//根据productId查询该商品
			Products products=productDao.queryProductById(shopcarts.getProductId());
			if(products!=null){
				TempProducts tempProducts=new TempProducts();
				//将取出的商品加入临时购物车
				tempProducts.setPruducts(products);	
				tempProducts.setNumber(shopcarts.getShopcartNum());
				listTempProducts.add(tempProducts);
			}									
		}	
		if(listTempProducts.size()>0&&listTempProducts!=null){		
			//从客户端获取数据
			String sCurPage = request.getParameter("curPage");//设定当前页数
			if (sCurPage != null &&sCurPage != "") {				
					curPage = Integer.parseInt(sCurPage);
			}else{
				curPage=1;
			}
			String sPageSize = request.getParameter("pageSize");//设定每页的显示数量
			if ( sPageSize != null && sPageSize != "") {					
					pageSize = Integer.parseInt(sPageSize);		
			}else{
				pageSize =5;
			}
			//得到总的页数
			int pageCount=shoppingCartDao.getPageCount(pageSize, listTempProducts.size());	
			pageObject.setCurPage(curPage);//设定当前页
			pageObject.setPageSize(pageSize);//设定每页显示的数量
			pageObject.setPageCount(pageCount);//设定总共有多少页
			pageObject=shoppingCartDao.getPageObject(curPage, pageObject, listTempProducts);
		}
		request.setAttribute("pageObject", pageObject);
		return "shoppingcart/myshopcart.jsp";
	}	
}
