package com.igo.action.shoppingcart;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;

import com.igo.action.Action;
import com.igo.dao.ProductDao;
import com.igo.dao.ShoppingCartDao;
import com.igo.factory.DAOFactory;
import com.igo.pojo.Products;
import com.igo.pojo.Shopcarts;

public class UpdateShoppingCartAction implements Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		String [] productsId=request.getParameterValues("productsId");

		//获取登录用户的ID
		String uids = String.valueOf(request.getSession().getAttribute("userId"));
		int userId = Integer.parseInt(uids);
		//获取商品的数量
		String[] sNumber=request.getParameterValues("number");
		//调用sevice方法
		ShoppingCartDao shoppingCartDao=DAOFactory.createDao(ShoppingCartDao.class);	
		if(productsId!=null){
			for(int i=0;i<productsId.length;i++){
					String sProductId=productsId[i];//商品id
					String numberSt=sNumber[i];//商品数量
					int number=Integer.parseInt(numberSt);
					if(sProductId!=null){
					int productId=Integer.parseInt(sProductId);
					//将该商品的标志位置为1		
					Shopcarts shopcarts=shoppingCartDao.getProductsId(userId, productId, 1);
					if(shopcarts.getShopcartId()==0){	//说明以前没有结算过该商品
						//将购物车的状态置为1 修改该商品的数量					
						boolean flag=shoppingCartDao.updateShopcarts(productId, 1, number);	
						if(flag){
							//将数据库的已购买数量加number将库存减number
							ProductDao productDao=DAOFactory.createDao(ProductDao.class);
							Products products=productDao.queryProductById(productId);							
							String sProductNum=products.getProductsNum();
							int productNum=Integer.parseInt(sProductNum);
							boolean trueFlag=productDao.updatePurchasedNum(productId, number,(productNum-number));
							if(trueFlag){
								request.setAttribute("status", "恭喜您，结算成功");
							}							
						}
					}else{
						//修改购物车的数量
						boolean flag=shoppingCartDao.updateNumberShopcarts(productId,number);	
						if(flag){
							//将数据库的已购买数量加一将库存减一
							ProductDao productDao=DAOFactory.createDao(ProductDao.class);
							Products products=productDao.queryProductById(productId);							
							String sProductNum=products.getProductsNum();
							int productNum=Integer.parseInt(sProductNum);
							boolean trueFlag=productDao.updatePurchasedNum(productId, number,(productNum-number));
							if(trueFlag){
								//将购物车的状态置为1 修改该商品的数量					
								boolean flag1=shoppingCartDao.updateShopcarts(productId, 1, number);
								if(flag1){
									request.setAttribute("status", "恭喜您，结算成功");
								}	
							}							
						}						
					}
				}
			}
		}	
		return "ShoppingCartServlet?action=lookcarts&status=0";
	}

}
