package com.igo.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.igo.dao.ManagerUserDao;
import com.igo.dao.UserDao;
import com.igo.factory.DAOFactory;
import com.igo.pojo.ManagerLogin;
import com.igo.pojo.Users;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		
		//得到隐藏表单的内容
		String action=request.getParameter("action");
		String path="";
		//判断俩验证码是否相同
		if(action.equals("login")){	
			//得到从login.jsp（客户端）传来的用户名和密码
			String userName=request.getParameter("email");
			String passWord=request.getParameter("password");
			//接收从客户端传来的记住密码标志
			String remember=request.getParameter("remember");
				UserDao userDao=null;
				try {
					//得到UserDao实例
					userDao=DAOFactory.createDao(UserDao.class);			
					//将从数据库取密码与从客户端传来的密码比对
					Users users=userDao.queryByName(userName);
					if( users!=null){
						if(users.getPassword().equals(passWord)){
							//将用户名放入session中
							request.getSession().setAttribute("userName", userName);
							request.getSession().setAttribute("flag", "1");
							//将id值放入session中
							request.getSession().setAttribute("userId",users.getLoginId());
							//用户希望记住用户名和密码
							if("remember".equals(remember)){		
								//创建cookie
								Cookie cookie1=new Cookie("userName",userName );
								//设置Cookie的保存时间（一周）以秒计算
								cookie1.setMaxAge(60*60*24*7);
								//将cookie回送给浏览器
								response.addCookie(cookie1);
								Cookie cookie2=new Cookie("passWord",passWord );
								//设置Cookie的保存时间
								cookie2.setMaxAge(60*60*24*7);
								//将cookie回送给浏览器
								response.addCookie(cookie2);	
								//跳转到首页
								 path="index.jsp";
							}		
						}else{
							//跳转到登录界面
							path="login.jsp";
							//提示密码不能为空
							request.setAttribute("errorMessage", "1");
						}
						
					}else{//没有该用户					
						//跳转到登录界面
						path="login.jsp";
						//提示密码不能为空
						request.setAttribute("errorMessage", "2");
					}
				
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else if("mlogin".equals(action)){//如果是卖家登录
				//接收客户端传来的信息
				String userName=request.getParameter("username");
				String password=request.getParameter("password");
				ManagerUserDao mDao=DAOFactory.createDao(ManagerUserDao.class);
				//通过用户名查询该用户是否存在
				ManagerLogin mLogin=mDao.queryByName(userName);
				if(mLogin!=null){
					//System.out.println(mLogin.getPassword()+"-------");
					if(mLogin.getPassword().equals(password)){//跳转到管理界面
						//将用户名放入session中
						request.getSession().setAttribute("userName",userName);
						request.getSession().setAttribute("flag", "2");
						path="ManagerServlet?action=managerInf";
					}else{//密码输入错误
						//跳转到登录界面
						path="managerlogin/mlogin.jsp";
						//提示密码不能为空
						request.setAttribute("errorMessage", "1");
					}
				}else{//用户名不存在
					//跳转到登录界面
					path="managerlogin/mlogin.jsp";
					//提示密码不能为空
					request.setAttribute("errorMessage", "2");
				}
			}
		request.getRequestDispatcher(path).forward(request, response);	
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
