package com.igo.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.igo.dao.EvaluateDao;
import com.igo.dao.ProductDao;
import com.igo.factory.DAOFactory;
import com.igo.pojo.Products;
import com.igo.service.EvaluateService;

/**
 * Servlet implementation class EvaluateServlet
 */
@WebServlet("/EvaluateServlet")
public class EvaluateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EvaluateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//获取productsId
		String sProductsId=request.getParameter("productsId");
		int loginId=(int)request.getSession().getAttribute("userId");
		
		//把用户ID和商品ID转换类型
		int productsId=0;
		if(sProductsId!=null){
			productsId=Integer.parseInt(sProductsId);
		}	
		//获取action
		String action=request.getParameter("action");
		String path="";
		EvaluateDao evaluate=DAOFactory.createDao(EvaluateDao.class);
		
		if(action!=null&&action.equals("go")){
			int status =evaluate.queryByProductId(productsId);
			//如果status=1则用户已经评论过
			if(status==1){
				//从客户端获取数据
				String curPage = request.getParameter("curPage");//设定当前页数		
				request.setAttribute("status",1);
				path="ShoppingCartServlet?action=lookPaidBuy&status=1&curPage="+ curPage +"";	
			}else{
				ProductDao service=DAOFactory.createDao(ProductDao.class);
				Products products=service.queryProductById(productsId);
				request.setAttribute("products", products);
				path="pingjia.jsp";
			}		
			//================================	
		}else if(action!=null&&action.equals("run")){
			//获取的123和内容
			String sFlower=request.getParameter("flower");
			int flower=1;
			if(sFlower!=null){
				flower=Integer.parseInt(sFlower);
			}		
			String textarea=request.getParameter("textarea");
			System.out.println(textarea+"评论内容");
			int status =evaluate.queryByProductId(productsId);	
			//如果status=1则用户已经评论过
			if(status==0){			
				boolean flag=evaluate.saveEvaluate(flower, textarea,productsId, loginId);
				if(flag){
					//跳转到详情页
					path="ProductServlet?status=1&action=goodslist-select&productId="+sProductsId+"";
				}else{
					request.setAttribute("flag", 0);
					path="EvaluateServlet?productsId="+sProductsId+"&action=go";			
				}
			}		
		}
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
