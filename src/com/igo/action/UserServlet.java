package com.igo.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;

import com.igo.dao.UserDao;
import com.igo.factory.DAOFactory;
import com.igo.pojo.Users;

import net.sf.json.JSONArray;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");;
		//从session中取出用户的id
		String userName=(String)request.getSession().getAttribute("userName");
		UserDao userDao=DAOFactory.createDao(UserDao.class);
		String path="";
		if(userName!=null){
			if("lookmyinf".equals(action)){//查看个人信息
				Users users=userDao.queryByName(userName);//取出用户的信息
				path="user/myinf.jsp";
				request.setAttribute("users", users);
			}else if("updatemyinf".equals(action)){//修改用户信息
				//取到从客户端传的值
				String password=request.getParameter("inf_passwd");
				String confirm=request.getParameter("inf_confirm");
				String email=request.getParameter("inf_email");	
				if(password.equals(confirm)){	
					boolean flag=userDao.editInf(userName,email,password);
					if(flag){
						path="UserServlet?action=lookmyinf";
					}
				}else{
					Users users=userDao.queryByName(userName);//取出用户的信息
					request.setAttribute("status", "1");//密码和确认密码输入不相同
					path="user/changemyinf.jsp";
					request.setAttribute("users", users);
				}
			}else if("lookmyupdate".equals(action)){
				Users users=userDao.queryByName(userName);//取出用户的信息
				path="user/changemyinf.jsp";
				request.setAttribute("users", users);
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
