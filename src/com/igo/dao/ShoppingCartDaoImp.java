package com.igo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.igo.pojo.Shopcarts;
import com.igo.tag.PageObject;
import com.igo.utils.DBHelper;
import com.igo.utils.SetPageObject;

public class ShoppingCartDaoImp implements ShoppingCartDao {
	private Connection connection=null;
	private  PreparedStatement pStatement=null;
	private ResultSet rSet=null;
	
	//根据购物车状态，用户id查询购物车
	@Override
	public List<Shopcarts> getAppointedProducts(int userId, int status){
		List<Shopcarts> list=new ArrayList<Shopcarts>();
		Shopcarts  shopcarts=null;
		String sql = "select shopcartId,productId,shopcartNum from shopcart"
				+ " where usernameId=? and status=?";		
		try {
			connection=DBHelper.getConnection();
			pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1, userId);
			pStatement.setInt(2, status);
			rSet=pStatement.executeQuery();
			while(rSet.next()){
				 shopcarts=new Shopcarts();
				 shopcarts.setShopcartId(rSet.getInt("shopcartId"));
				 shopcarts.setProductId(rSet.getInt("productId"));
				 shopcarts.setShopcartNum(rSet.getInt("shopcartNum"));
				 list.add(shopcarts);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBHelper.closeThree(rSet, pStatement, connection);
		}	
		return list;
	}
	//根据用户id获取所有的商品
	@Override
	public List<String> getAllProducts(int uid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	//根据购物车状态，商品id，用户id查询购物车
	@Override
	public Shopcarts getProductsId(int userId, int productId, int status) {
		Shopcarts shopcarts=new Shopcarts();
		String sql = "select shopcartId,shopcartNum from shopcart where usernameId=? and productId=? and status=?";		
		try {
			connection=DBHelper.getConnection();//得到连接
			pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1,userId);
			pStatement.setInt(2, productId);
			pStatement.setInt(3, status);
			rSet=pStatement.executeQuery();
			while(rSet.next()){				
				shopcarts.setShopcartId(rSet.getInt("shopcartId"));
				shopcarts.setShopcartNum(rSet.getInt("shopcartNum"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}finally {
			//关闭连接
			DBHelper.closeThree(rSet, pStatement, connection);
		}	
		return shopcarts;
	}
	//根据购物车状态，商品id，用户id删除购物车
	@Override
	public boolean deleteProducts(int userId, int productId, int status) {
		boolean flag=false;
		String sql = "delete from  shopcart where usernameId=? and productId=? and status=?";
		try {
			//得到连接
			connection=DBHelper.getConnection();
			pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1, userId);
			pStatement.setInt(2, productId);
			pStatement.setInt(3, status);
			int a=pStatement.executeUpdate();
			if(a>0){
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return  flag;
	}
	//根据用户id，购物车状态删除购物车
	@Override
	public int deleteAll(int uid, int status) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	//添加购物车
	@Override
	public boolean addBuy(int userId, int productId, int shopcartNum)  {
		boolean flag=false;
		String sql="insert into shopcart(usernameId,productId,status,shopcartNum) values(?,?,0,?)";
		try {
			//得到连接
			connection=DBHelper.getConnection();
			pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1, userId);
			pStatement.setInt(2, productId);
			pStatement.setInt(3, shopcartNum);
			int a=pStatement.executeUpdate();
			if (a>0) {
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
	//修改购物车信息
	@Override
	public boolean updatebuy(int shoppingCartId,int shopcartNum,int status)  {
		boolean flag=false;
		String sql="update shopcart set status=?,shopcartNum=? where shopcartId=?";
		try {
			//得到连接
			connection=DBHelper.getConnection();
			pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1, status);
			pStatement.setInt(2, shopcartNum);
			pStatement.setInt(3, shoppingCartId);
			int a=pStatement.executeUpdate();
			if (a>0) {
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
	//更新购物车信息
	@Override
	public boolean updateShopcarts(int productId,int status,int shopcartNum){
		boolean flag=false;
		String sql="update shopcart set status=?,shopcartNum=? where productId=?";
		try {
			//得到连接
			connection=DBHelper.getConnection();
			pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1, status);
			pStatement.setInt(2, shopcartNum);
			pStatement.setInt(3, productId);
			int a=pStatement.executeUpdate();
			if (a>0) {
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
	@Override
	public int getPageCount(int pageSize, int rowCount) {
		// TODO Auto-generated method stub
		return 0;
	}
	//分页显示商品列表
	@Override
	public PageObject getPageObject(int curPage, PageObject pageObject, List<Object> listObject) {
		// TODO Auto-generated method stub
		PageObject pObject=SetPageObject.getInstance().setPageObjectData(curPage, pageObject, listObject);
		return pObject;
	}
	@Override
	public boolean updateNumberShopcarts(int productId, int number) {
		boolean flag=false;
		String sql="update shopcart set shopcartNum=? where productId=?";
		try {
			//得到连接
			connection=DBHelper.getConnection();
			pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1, number);
			pStatement.setInt(2, productId);
			int a=pStatement.executeUpdate();
			if (a>0) {
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
