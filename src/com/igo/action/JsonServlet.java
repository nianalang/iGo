package com.igo.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.igo.dao.ProductDao;
import com.igo.factory.DAOFactory;
import com.igo.pojo.Products;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class JsonServlet
 */
@WebServlet("/JsonServlet")
public class JsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JsonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		String action=request.getParameter("action");
		String keyWord=request.getParameter("keyWord");
		if("eighteen".equals(action)){//16点抢购
			//获取productService对象
			ProductDao productDao=DAOFactory.createDao(ProductDao.class);
			List<Products> products=productDao.queryAllByTime(keyWord, null,"2018-11-30 18:00:00", 1);	
			List<Products>data=new ArrayList<Products>();
			//传递四条数据
			if(products.size()>4&&products!=null){
				for(int i=0;i<4;i++){
					Products products2=products.get(i);
					data.add(products2);
				}
			}	
			response.getWriter().write(JSONArray.fromObject(data).toString());//存放了4条数据的json
		}else if("lookPaidBuy".equals(action)){ //查看已支付的商品
//			Action targetAction=new ShowShoppingcartAction();	
//			path=targetAction.execute(request, response);//调用执行的方法
		}		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
