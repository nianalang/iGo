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

/**
 * Servlet implementation class ImportProductServlet
 */
@WebServlet("/ImportProductServlet")
public class ImportProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImportProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		String path="";
		if("beauty".equals(action)){//选中个美妆个护
			String keyWordOne=request.getParameter("keyWordOne");
			if("skincare".equals(keyWordOne)){
				//获取service对象
				ProductDao productDao=DAOFactory.createDao(ProductDao.class);
				List<Products> skinCareList=productDao.queryAll(keyWordOne, null, 0);			
				request.setAttribute("skinCareList",skinCareList);
			}
			String keyWordTwo=request.getParameter("keyWordTwo");
			if("washbath".equals(keyWordTwo)){
				//获取service对象
				ProductDao productDao=DAOFactory.createDao(ProductDao.class);
				List<Products> washBathList=productDao.queryAll(keyWordTwo, null, 0);			
				request.setAttribute("washBathList",washBathList);
			}			
			path="products/importproduct.jsp";
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
