package com.igo.action;

import java.io.IOException;
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
 * Servlet implementation class RushbuyServlet
 */
@WebServlet("/RushbuyServlet")
public class RushbuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RushbuyServlet() {
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
		//String flag=request.getParameter("flag");
		List<Products> products=null;
		String path="";
		//获取productService对象
		ProductDao productDao=DAOFactory.createDao(ProductDao.class);
		if("sixteen".equals(action)){//16点抢购	
			products=productDao.queryAllByTime(keyWord, null,"2018-11-30 16:00:00", 1);				
		}else if("eighteen".equals(action)){
			products=productDao.queryAllByTime(keyWord, null,"2018-11-30 18:00:00", 1);	
		}else if("eightpm".equals(action)){
			products=productDao.queryAllByTime(keyWord, null,"2018-11-30 20:00:00", 1);		
		}else if("tenpm".equals(action)){
			 products=productDao.queryAllByTime(keyWord, null,"2018-11-30 22:00:00", 1);	
		}else if("zeropm".equals(action)){
			 products=productDao.queryAllByTime(keyWord, null,"2018-11-30 00:00:00", 1);	
		}
		response.getWriter().write(JSONArray.fromObject(products).toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
