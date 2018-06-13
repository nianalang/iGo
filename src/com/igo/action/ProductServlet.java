package com.igo.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.igo.dao.EvaluateDao;
import com.igo.dao.ProductDao;
import com.igo.factory.DAOFactory;
import com.igo.pojo.Products;
import com.igo.tag.PageObject;

/**
 * Servlet implementation class GoodServlet
 */
@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		// 从index界面接收kinds的类型&action的查询方式(index-select表示只查询一个类)
		String keyWord = request.getParameter("keyword");// 要查询的商品类别
		// 将商品类别放入session中
		request.getSession().setAttribute("keyWord", keyWord);
		String action = request.getParameter("action");// 查询商品列表 或者 指定商品列表
		request.getSession().setAttribute("action", action);
		String path = "";// 商品要跳转的路径
		int curPage = 0;// 当前页数
		int pageSize = 0;// 每页显示几行数据
		// 调用pageObject方法,将前端的数据封装到其里
		PageObject pageObject = new PageObject();
		ProductDao productDao = DAOFactory.createDao(ProductDao.class);	// 调用sevice方法
		EvaluateDao evaluateDao = DAOFactory.createDao(EvaluateDao.class);
		if ("index-select".equals(action)) {// 查询商品列表
			try {
				// 查询所有的数据
				List list = productDao.queryAll(keyWord, null, 0);
				String sCurPage = request.getParameter("curPage");// 设定当前页数
				if (sCurPage != null && sCurPage != "") {
					curPage = Integer.parseInt(sCurPage);
				} else {
					curPage = 1;
				}
				String sPageSize = request.getParameter("pageSize");// 设定每页的显示数量
				if (sPageSize != null && sPageSize != "") {
					pageSize = Integer.parseInt(sPageSize);
				} else {
					pageSize = 10;
				}
				// 从数据库获取 pageCount //获取总的分页数
				int pageCount = productDao.getPageCount(pageSize, keyWord, null);
				// 将pageCount(总的页数)放入pageObject
				pageObject.setPageCount(pageCount);
				// 将总的数据放入pageObject
				pageObject.setData(list);
				pageObject.setCurPage(curPage);
				pageObject.setPageSize(pageSize);
				// 返回调整后的数据
				pageObject = productDao.getPageObject(curPage, pageObject, list);
				// 在productlist.jsp中取数据
				request.setAttribute("pageObject", pageObject);
				path = "/products/productslist.jsp";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("goodslist-select".equals(action)) {// 查询指定商品(详情)
			// 写入相应的逻辑
			String sProductId = request.getParameter("productId");// 得到商品id
			String statusA = request.getParameter("status");
			int status = 1;
			if (statusA != null) {
				status = Integer.parseInt(statusA);
			}

			int productId = Integer.parseInt(sProductId);
			// 根据id来查询该商品的详细信息
			Products products = productDao.queryProductById(productId);
			// System.out.println(status+"status");
			ArrayList list = evaluateDao.evaluate(status, productId);

			String sCurPage = request.getParameter("curPage");// 从前端取出当前的页数
			if (sCurPage != null) {
				curPage = Integer.parseInt(sCurPage);
			} else {
				curPage = 1;
			}
			String sPageSize = request.getParameter("pageSize");
			if (sPageSize != null) {
				pageSize = Integer.parseInt(sPageSize);
			} else {
				pageSize = 3;
			}

			// 算出总的页数
			int pageCount = evaluateDao.getPageCount(pageSize, list.size());
			pageObject.setCurPage(curPage);
			pageObject.setPageSize(pageSize);
			pageObject.setPageCount(pageCount);

			pageObject = evaluateDao.getPageObject(curPage, pageObject, list);
			// System.out.println(pageObject.getData().get(0)+"fff");

			request.setAttribute("products", products);
			request.setAttribute("pageObject", pageObject);

			path = "/products/productdetail.jsp";
		} else if ("fuzzyQuery".equals(action)) {// 模糊查询
			String keyClass = request.getParameter("keyClass");
			// keyWord=keyWord.replaceAll(" ", "");//去掉所有的空格
			List products = productDao.queryProducts(keyWord, keyClass);
			String sCurPage = request.getParameter("curPage");// 设定当前页数
			if (sCurPage != null && sCurPage != "") {
				curPage = Integer.parseInt(sCurPage);
			} else {
				curPage = 1;
			}
			String sPageSize = request.getParameter("pageSize");// 设定每页的显示数量
			if (sPageSize != null && sPageSize != "") {
				pageSize = Integer.parseInt(sPageSize);
			} else {
				pageSize = 10;
			}
			// 从数据库获取 pageCount //获取总的分页数
			int pageCount = productDao.getPageCount(pageSize, keyWord, keyClass);
			// 将pageCount(总的页数)放入pageObject
			pageObject.setPageCount(pageCount);
			// 将总的数据放入pageObject
			pageObject.setData(products);
			pageObject.setCurPage(curPage);
			pageObject.setPageSize(pageSize);

			// 返回调整后的数据
			pageObject = productDao.getPageObject(curPage, pageObject, products);
			request.setAttribute("pageObject", pageObject);
			path = "/products/productslist.jsp";
		}
		if (!"".equals(path)) {
			request.getRequestDispatcher(path).forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
