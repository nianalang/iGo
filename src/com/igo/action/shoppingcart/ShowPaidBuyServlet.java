package com.igo.action.shoppingcart;
/*
 * 查看已支付的商品
 */
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

public class ShowPaidBuyServlet implements Action{

	public ShowPaidBuyServlet() {
		// TODO Auto-generated constructor stub
	}
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
			String statusString=request.getParameter("status");
			int status=Integer.parseInt(statusString);
			//获取登录用户的ID
			String uids = String.valueOf(request.getSession().getAttribute("userId"));
			int userId = Integer.parseInt(uids);
			//新建tempProduct对象
			List listTempProducts=new ArrayList();
			//将取出的数据进行分页显示
			PageObject pageObject=new PageObject();
			int curPage =0;
			int pageSize=0;
			ShoppingCartDao shoppingCartDao=DAOFactory.createDao(ShoppingCartDao.class);	
			//根据用户名和购物车状态查询所有未支付的购物车列表
			List<Shopcarts> listShopcarts=shoppingCartDao.getAppointedProducts(userId,status);
			//将已购买的商品的商品一件件取出来
			for(int i=0;i<listShopcarts.size();i++){
				Shopcarts shopcarts=listShopcarts.get(i);			
				ProductDao productDao=DAOFactory.createDao(ProductDao.class);
				//根据productId查询该商品
				Products products=productDao.queryProductById(shopcarts.getProductId());
				if(products!=null){
					TempProducts tempProducts=new TempProducts();				
					tempProducts.setPruducts(products);	
					tempProducts.setNumber(shopcarts.getShopcartNum());			
					listTempProducts.add(tempProducts);//将取出的商品加入临时购物车
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
					pageSize =4;
				}
				//得到总的页数
				int pageCount=shoppingCartDao.getPageCount(pageSize, listTempProducts.size());
				
				pageObject.setCurPage(curPage);//设定当前页
				pageObject.setPageSize(pageSize);//设定每页显示的数量
				pageObject.setPageCount(pageCount);//设定总共有多少页
				pageObject.setData(listTempProducts);
				pageObject=shoppingCartDao.getPageObject(curPage, pageObject, listTempProducts);
			}
			request.setAttribute("pageObject", pageObject);
			return "products/hadbought.jsp";
	}
}
