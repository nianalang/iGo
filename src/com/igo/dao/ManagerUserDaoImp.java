package com.igo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import com.igo.pojo.ManagerLogin;
import com.igo.pojo.Products;
import com.igo.pojo.Users;
import com.igo.tag.PageObject;
import com.igo.utils.DBHelper;
import com.igo.utils.SetPageObject;


public class ManagerUserDaoImp implements ManagerUserDao{
	private Connection connection=null;
	private  PreparedStatement pStatement=null;
	private ResultSet rSet=null;
	public ManagerUserDaoImp() {
		// TODO Auto-generated constructor stub
	}
	//添加用户
	@Override
	public boolean addManaUser(ManagerLogin mLogin) {
		boolean flag=false;
		String sql="insert into manalogin(userName,password,confirdPassWd,email) values(?,?,?,?)";
		try {
			connection=DBHelper.getConnection();
			pStatement=connection.prepareStatement(sql);
			//给问号赋值
			pStatement.setString(1, mLogin.getUserName());
			pStatement.setString(2, mLogin.getPassword());
			pStatement.setString(3, mLogin.getConfirdPassWd());
			pStatement.setString(4, mLogin.getEmail());
			int a=pStatement.executeUpdate();
			if(a>0){
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return flag;
	}
	//修改用户信息
	@Override
	public boolean editInf(String mName, String email, String passwd) {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql="update manalogin set password=?,confirdPassWd=?,email=? where userName=?";
		connection=DBHelper.getConnection();
		try {
			pStatement=connection.prepareStatement(sql);
			pStatement.setString(1, passwd);
			pStatement.setString(2, passwd);
			pStatement.setString(3, email);
			pStatement.setString(4, mName);
			int a=pStatement.executeUpdate();
			if(a>0){
				flag=true;
			//	System.out.println("flag"+flag);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//在DBHelper中关闭连接
		finally {
			DBHelper.closeTwo(pStatement, connection);
		}
		return flag;
	}
	//根据用户名查询用户
	@Override
	public ManagerLogin queryByName(String mName) {
		ManagerLogin mLogin=null;
		String sql="select manaloginId,password,email from manalogin where userName=?";	
		try {
			connection=DBHelper.getConnection();//得到连接
			pStatement=connection.prepareStatement(sql);
			pStatement.setString(1, mName);//给问号赋值
			rSet=pStatement.executeQuery();
			while(rSet.next()){
				mLogin=new ManagerLogin();
				mLogin.setUserName(mName);
				mLogin.setManaloginId(rSet.getInt("manaloginId"));
				mLogin.setPassword(rSet.getString("password"));
				mLogin.setEmail(rSet.getString("email"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBHelper.closeThree(rSet, pStatement, connection);
		}
		//System.out.println(mLogin.getUserName()+"llllllll");
		return mLogin;	
	}
	
	//修改管理员密码
	@Override
	public int editPasswd(int mid, String passwd) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	//查看所有管理员的信息
	@Override
	public Vector<ManagerLogin> queryAllInf() {
		// TODO Auto-generated method stub
		ManagerLogin allInf=null;
		Vector<ManagerLogin> vector=new Vector<ManagerLogin>();
		String sql="select manaloginId,userName,password,email from manalogin";
		Connection conn=DBHelper.getConnection();
		
		try {
			pStatement=conn.prepareStatement(sql);
			rSet=pStatement.executeQuery();
			while(rSet.next()){
				//每次查找到的值存在单独的对象中
				allInf=new ManagerLogin();
				allInf.setManaloginId(rSet.getInt("manaloginId"));
				allInf.setUserName(rSet.getString("userName"));
				allInf.setPassword(rSet.getString("password"));
				allInf.setEmail(rSet.getString("email"));//
				vector.add(allInf);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBHelper.closeThree(rSet, pStatement, conn);
		}
		
		return vector;
	}
	@Override
	//查询数据库中所有用户信息
	public Vector<Users> queryAllUser() {
		// TODO Auto-generated method stub
		Users allUserInf=null;
		Vector<Users> vector=new Vector<Users>();
		String sql="select loginId,userName,password,email from login";
		Connection conn=DBHelper.getConnection();
	
		try {
			pStatement=conn.prepareStatement(sql);
			rSet=pStatement.executeQuery();
			while(rSet.next()){
				
				allUserInf=new Users();
				allUserInf.setLoginId(rSet.getInt("loginId"));
				allUserInf.setUserName(rSet.getString("userName"));
				allUserInf.setPassword(rSet.getString("password"));
				allUserInf.setEmail(rSet.getString("email"));//
				vector.add(allUserInf);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBHelper.closeThree(rSet, pStatement, conn);
		}
		
		return vector;
	}
	
	//管理员查看所有抢购商品信息
	@Override
	public Vector<Products> queryStatusManager() {
		// TODO Auto-generated method stub
		Products rushBuyStatus=null;
		Vector<Products> productStatus=new Vector<Products>();
		String sql="select productsId,productName,productsUrlMain,price,described,productsNum,date from products where status=?";
		Connection conn=DBHelper.getConnection();
		try {
			pStatement=conn.prepareStatement(sql);
			//给问号赋值,status=1时表示为抢购商品
			pStatement.setInt(1, 1);
			rSet=pStatement.executeQuery();
			while(rSet.next()){
				rushBuyStatus=new Products();
				rushBuyStatus.setProductsId(rSet.getInt("productsId"));
				rushBuyStatus.setProductName(rSet.getString("productName"));
				rushBuyStatus.setProductsUrlMain(rSet.getString("productsUrlMain"));
				rushBuyStatus.setPrice(rSet.getString("price"));
				rushBuyStatus.setDescribed(rSet.getString("described"));
				rushBuyStatus.setProductsNum(rSet.getString("productsNum"));
				rushBuyStatus.setDate(rSet.getString("date"));
				
				productStatus.add(rushBuyStatus);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBHelper.closeThree(rSet, pStatement, conn);
		}
		
		
		return productStatus;
	}
	@Override
	public int getPageCount(int pageSize, int rowCount) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public PageObject getPageObject(int curPage, PageObject pageObject, List<Object> listRushBuy) {
		// TODO Auto-generated method stub
		PageObject pObject=SetPageObject.getInstance().setPageObjectData(curPage, pageObject, listRushBuy);
		return pObject;
	}
	@Override
	public boolean deleteManaUser(String userName) {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql="delete from manalogin where userName=?";
		//得到连接
		connection=DBHelper.getConnection();
		//创建ps对象
		try {
			pStatement=connection.prepareStatement(sql);
			pStatement.setString(1, userName);
			int a=pStatement.executeUpdate();
			if(a>0){
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBHelper.closeTwo(pStatement, connection);
		}		
		return flag;
	}
}
