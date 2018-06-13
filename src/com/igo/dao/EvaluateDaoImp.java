package com.igo.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.igo.pojo.Evaluate;
import com.igo.tag.PageObject;
import com.igo.utils.DBHelper;
import com.igo.utils.SetPageObject;

public class EvaluateDaoImp implements EvaluateDao{
	private Connection connection=null;
	private PreparedStatement pStatement=null;
	private ResultSet rSet=null;
	@Override
	//把输入的评价内容存入表中
	public boolean saveEvaluate(int flower, String textarea,int productId,int loginId) {
		// TODO Auto-generated method stub
		boolean flag=false;
		
		String sql="insert into evaluate(quality,evaluate,product_id,login_id,status) values(?,?,?,?,?)";
		connection=DBHelper.getConnection();
		try {
			pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1, flower);
			pStatement.setString(2, textarea);
			pStatement.setInt(3,productId);
			pStatement.setInt(4,loginId);
			pStatement.setInt(5,0);
			int success=pStatement.executeUpdate();
			if(success>0){			 
				flag= this.updateStatus(productId,1);				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			//关闭数据库连接
			DBHelper.closeTwo(pStatement, connection);
		}
	
		return flag;
	}
	@Override
	//通过商品ID查询status的值
	public int queryByProductId(int productId) {
		// TODO Auto-generated method stub
		int status=0;
		//如果为1表示用户已经评价过
		String sql="select status from evaluate where product_id=?";
		connection=DBHelper.getConnection();
		try {
			pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1, productId);
			rSet=pStatement.executeQuery();
			while(rSet.next()){
				status=rSet.getInt("status");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBHelper.closeThree(rSet, pStatement, connection);
		}
		return status;
	}
	
	
	@Override
	//向数据库中添加用户评价
	public boolean updateStatus(int productId, int status) {
		// TODO Auto-generated method stub
		boolean update=false;
		String sql="update evaluate set status=? where product_id=?";
		connection=DBHelper.getConnection();
		try {
			pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1, status);
			pStatement.setInt(2, productId);
			int uStatus=pStatement.executeUpdate();
			if (uStatus==1) {
				update=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBHelper.closeTwo(pStatement, connection);
		}
		return update;
	}
	@Override
	public ArrayList<Evaluate> evaluate(int status,int productId) {
		// TODO Auto-generated method stub
		ArrayList<Evaluate> list=new ArrayList<Evaluate>();
		Evaluate evaluate=null;
		String sql="select login_id,quality,evaluate from evaluate where status=? and product_id=?";
		connection=DBHelper.getConnection();
		try {
			pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1,status);
			pStatement.setInt(2,productId);
			rSet=pStatement.executeQuery();
			while(rSet.next()){
				evaluate=new Evaluate();
				evaluate.setLogin_id(rSet.getInt("login_id"));
				evaluate.setQuality(rSet.getInt("quality"));
				evaluate.setEvaluate(rSet.getString("evaluate"));
				list.add(evaluate);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBHelper.closeThree(rSet, pStatement, connection);
		}
		return  list;
	}
	@Override
	public int getPageCount(int pageSize, int rowCount) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public PageObject getPageObject(int curPage, PageObject pageObject, List<Object> listEvaluate) {
		// TODO Auto-generated method stub
		PageObject pObject=SetPageObject.getInstance().setPageObjectData(curPage, pageObject, listEvaluate);
		return pObject;
	}
	
}
