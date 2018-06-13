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

import net.sf.json.JSONArray;

/**
 * Servlet implementation class SearchServlrt
 */
@WebServlet("/SearchServlrt")
public class SearchServlrt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlrt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		String search=request.getParameter("search");	
		search=search.replaceAll(" ", "");//去掉所有的空格
		if(search!=null&&!search.equals("")){
			ProductDao productDao=DAOFactory.createDao(ProductDao.class);		
			List<String> listData=productDao.queryBySearch(search);			
			if(listData.size()>10){
				List<String> newData=new ArrayList<String>();
				for(int i=0;i<10;i++){
				    //只取前10条数据
					String value=listData.get(i);
					newData.add(value);			
				 }
				response.setCharacterEncoding("utf-8");
				response.getWriter().write(JSONArray.fromObject(newData).toString());
			}
			if(listData.size()<10){
				response.setCharacterEncoding("utf-8");
				response.getWriter().write(JSONArray.fromObject(listData).toString());
			}		  				 	 	
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
