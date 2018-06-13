package com.igo.action;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;

import com.igo.dao.ManagerUserDao;
import com.igo.dao.ProductDao;
import com.igo.dao.UserDao;
import com.igo.factory.DAOFactory;
import com.igo.pojo.ManagerLogin;
import com.igo.pojo.Products;
import com.igo.pojo.Users;
import com.igo.service.ManagerUserService;
import com.igo.tag.PageObject;
import com.sun.java.swing.plaf.windows.WindowsBorders.DashedBorder;

/**
 * Servlet implementation class ManagerServlet
 */
@WebServlet("/ManagerServlet")
public class ManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		//从session中取得管理员的用户名
		String userName=(String)request.getSession().getAttribute("userName");
		String path="";
		ManagerUserDao manager=DAOFactory.createDao(ManagerUserDao.class);
		int curPage=0;//当前页数
		int pageSize=0;//每页显示几行数据
		String manaId=(String)request.getSession().getAttribute("userName");
		if(manaId!=null){
			if(action!=null){
				//查看管理员 的信息
				if("managerInf".equals(action)){
					//service层中的queryByName方法
					ManagerLogin maLogin=manager.queryByName(userName);
					path="management/managerInf.jsp";//跳转到查看管理员个人信息的jsp
					request.setAttribute("Manager", maLogin);
					
				}else if("upManainf".equals(action)){//修改管理员的个人信息
					String password=request.getParameter("Minf_passwd");
					String confirm=request.getParameter("Minf_confirm");
					String email=request.getParameter("Minf_email");
			
					if(password.equals(confirm)){	
						boolean flag=manager.editInf(userName,email,password);	
						//修改信息  把信息显示在页面上
						if(flag){
								path="ManagerServlet?action=managerInf";
							}
						//System.out.println(flag);
					}else{
						ManagerLogin maLogin=manager.queryByName(userName);
						//密码和确认密码输入不相同
						request.setAttribute("status", "1");
						path="management/changeMinf.jsp";
						request.setAttribute("Manager", maLogin);
					}
					//修改管理员的信息
				}else if("mupdate".equals(action)){
					ManagerLogin maLogin=manager.queryByName(userName);
					path="management/changeMinf.jsp";
					request.setAttribute("Manager", maLogin);
					//用户管理:查看所有管理员的信息
				}else if("allmanager".equals(action)){
					Vector<ManagerLogin> allInf=manager.queryAllInf();
					path="management/usermanage.jsp";
					request.setAttribute("mInf", allInf);	
					//查看所有用户信息
				}else if("alluser".equals(action)){
					Vector<Users> allUserInf=manager.queryAllUser();
					path="management/user_information.jsp";
					request.setAttribute("uInf", allUserInf);
					//管理员查看所有抢购商品
				}else if("allproducts".equals(action)){//allproducts
					Vector allProducts=manager.queryStatusManager();
					
					String sCurPage = request.getParameter("curPage");//设定当前页数								
					if (sCurPage != null &&sCurPage != "") {				
							curPage = Integer.parseInt(sCurPage);
					}else{
						curPage=1;
					}
					String sPageSize = request.getParameter("pageSize");//设定每页的显示数量
					if (sPageSize != null && sPageSize != "") {					
						pageSize = Integer.parseInt(sPageSize);		
					}else{
						pageSize =6;
					}
					ProductDao productDao=DAOFactory.createDao(ProductDao.class);
					PageObject pageObject=new PageObject();
					//从数据库获取 pageCount	//获取总的分页数
					int pageCount=productDao.getPageCount(pageSize,"限时抢购","2");
					//System.out.println(pageCount+"---pageCount");
					//将pageCount(总的页数)放入pageObject
					pageObject.setPageCount(pageCount);
					//将总的数据放入pageObject
					//pageObject.setData(products);
					pageObject.setCurPage(curPage);
					pageObject.setPageSize(pageSize);	
					//返回调整后的数据
					pageObject=productDao.getPageObject(curPage, pageObject,allProducts);
					path="management/manager.jsp";
					request.setAttribute("pInf", pageObject);
				}else if ("deleteUser".equals(action)) {//删除该用户信息
					String sUserId=request.getParameter("userId");
					int userId=Integer.parseInt(sUserId);
					UserDao userDao=DAOFactory.createDao(UserDao.class);
					boolean flag=userDao.deleteUser(userId);
					if(flag){
						request.setAttribute("status", "删除用户成功");
						path="ManagerServlet?action=alluser";
					}
				}else if ("deleteMana".equals(action)) {//删除管理员
					ManagerUserDao mUserDao=DAOFactory.createDao(ManagerUserDao.class);
					String userMana=request.getParameter("userName");
					boolean flag=mUserDao.deleteManaUser(userMana);
					if(flag){
						request.setAttribute("status", "删除管理员成功");
						path="ManagerServlet?action=allmanager";
					}
				}else if ("deleteProduct".equals(action)) {//删除商品
					ProductDao productDao=DAOFactory.createDao(ProductDao.class);
					String sProductId=request.getParameter("productId");
					String sCurPage=request.getParameter("curPage");
					//System.out.println(sCurPage);
					int productId=Integer.parseInt(sProductId);
					boolean flag=productDao.deleteProductById(productId);
					if(flag){
						request.setAttribute("status", "删除商品成功");
						path="ManagerServlet?action=allproducts&curPage="+sCurPage+"";
					}
				}else if("updateProductStatus".equals(action)){//修改库存
					ProductDao productDao=DAOFactory.createDao(ProductDao.class);
					String sProductId=request.getParameter("productId");
					String sCurPage=request.getParameter("curPage");
					String sNumber=request.getParameter("number");
					//System.out.println(sNumber+"----sNumber");
					int number=Integer.parseInt(sNumber);
					int productId=Integer.parseInt(sProductId);
					boolean flag=productDao.updateProductById(productId,number);
					if(flag){
						request.setAttribute("status", "修改库存成功");
						path="ManagerServlet?action=allproducts&curPage="+sCurPage+"";
					}
				}
			}
		}else {
			path="managerlogin/mlogin.jsp";
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
