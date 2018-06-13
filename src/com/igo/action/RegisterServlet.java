package com.igo.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;

import com.igo.dao.ManagerUserDao;
import com.igo.dao.UserDao;
import com.igo.factory.DAOFactory;
import com.igo.pojo.ManagerLogin;
import com.igo.pojo.Users;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 得到隐藏表单的内容
		String action = request.getParameter("action");
		String path = "";
		if (action.equals("register")) {
			boolean flag = false;
			// 获取用户注册数据
			String email = request.getParameter("email");
			String userPhone = request.getParameter("user_phone");
			String passWord = request.getParameter("password");
			UserDao userDao = null;
			try {
				// 得到UserDao实例
				userDao = DAOFactory.createDao(UserDao.class);
				// 先根据email在数据库查看该用户名是否存在
				Users users = userDao.queryByEmail(email);
				if (users == null) {
					// 通过电话号码查询用户
					Users users2 = userDao.queryByName(userPhone);
					if (users2 == null) {
						users=new Users();
						// 新增用户
						users.setUserName(userPhone);
						users.setPassword(passWord);
						users.setEmail(email);
						flag = userDao.addUser(users);
						if (flag) {
							path = "login.jsp";
						} else {
							// 注册失败
							request.setAttribute("status", "2");
							path = "register.jsp";
						}
					} else {
						if (users2.getUserName().equals(userPhone)) {// 电话号码相同
							request.setAttribute("status", "4");
							path = "register.jsp";
						}
					}

				} else {
					// 邮箱相同
					if (users.getEmail().equals(email)) {
						request.setAttribute("status", "3");
						path = "register.jsp";
					}
				}

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if ("mRegister".equals(action)) {//管理员注册
			String username=request.getParameter("username");
			//System.out.println(username+"username");
			String password=request.getParameter("password");
			String confirmpassword=request.getParameter("confirmpassword");
			String email=request.getParameter("email");
			ManagerUserDao mUserDao=DAOFactory.createDao(ManagerUserDao.class);
			ManagerLogin mLogin=mUserDao.queryByName(username);//判断用户名是否存在
			//System.out.println(mLogin+"kkkk");
			if(mLogin==null){
				mLogin=new ManagerLogin();
				if(password.equals(confirmpassword)){
					mLogin.setUserName(username);
					mLogin.setPassword(password);
					mLogin.setConfirdPassWd(confirmpassword);
					mLogin.setEmail(email);
					boolean b=mUserDao.addManaUser(mLogin);
					if(b){//注册成功
						path="managerlogin/mlogin.jsp";
					}
				}else{//密码不同
					// 注册失败
					request.setAttribute("status", "2");
					path = "managerlogin/mregister.jsp";
				}
			}else{//用户名存在
					//System.out.println(mLogin.getUserName()+"000000");
					request.setAttribute("status", "4");
					path = "managerlogin/mregister.jsp";
				}
		}
		request.getRequestDispatcher(path).forward(request, response);
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
