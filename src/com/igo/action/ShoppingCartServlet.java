package com.igo.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.igo.action.shoppingcart.DeletShoppingCartAction;
import com.igo.action.shoppingcart.InsertShoppingCartAction;
import com.igo.action.shoppingcart.ShowPaidBuyServlet;
import com.igo.action.shoppingcart.ShowShoppingcartAction;
import com.igo.action.shoppingcart.UpdateShoppingCartAction;

/**
 * Servlet implementation class ShoppingCartServlet
 */
@WebServlet("/ShoppingCartServlet")
public class ShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShoppingCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//接收标志
		String action=request.getParameter("action");		
		//从session中取出用户的id
		String userName=(String)request.getSession().getAttribute("userName");
		String path="";//要返回的路径
		Action targetAction=null;//要跳转的目标路径
		//判断id是否为空
		if(userName!=null){
			//判断action的值为多少
			if("lookcarts".equals(action)){	//说明用户要查看购物车的所有商品	
				targetAction=new ShowShoppingcartAction();	
				path=targetAction.execute(request, response);//调用执行的方法
			}else if ("intobuy".equals(action)) {//加入购物车
				targetAction=new InsertShoppingCartAction();
				path=targetAction.execute(request, response);
			}else if ("deleteCart".equals(action)) {//通过id删除购物车的商品
				targetAction=new DeletShoppingCartAction();
				path=targetAction.execute(request, response);
			}else if("paidbuy".equals(action)){//将购物车的商品改为结算商品
				targetAction=new UpdateShoppingCartAction();
				path=targetAction.execute(request, response);		
			}else if("lookPaidBuy".equals(action)){//查看结算的商品
				targetAction=new ShowPaidBuyServlet();
				path=targetAction.execute(request, response);
			}
		}else{
			 path="login.jsp";
		}		
		//跳转到相应的界面
		request.getRequestDispatcher(path).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
