package com.igo.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.igo.pojo.Products;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class DBHelper {
	private static Connection connection=null;
	private static PreparedStatement pStatement=null;
	private static ResultSet rSet=null;
	private static String driver="";
	private static String URL="";//连接数据库的url
	private static String userName="";//用户名
	private static String passWord="";//密码
	private static Properties properties=null;
	//使用静态代码块加载驱动
	static{
		properties=new Properties();
		try {
			//获取sqlhelper.properties的目录
			properties.load(DBHelper.class.getClassLoader().getResourceAsStream("sqlhelper.properties"));
			driver=properties.getProperty("driver");
			URL=properties.getProperty("URL");
			userName=properties.getProperty("userName");;
			passWord=properties.getProperty("passWord");
			//System.out.println(	userName+"kkkk"+passWord);
			//加载驱动
			Class.forName(driver);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//加载驱动
	public static Connection getConnection(){
		try {
			connection=DriverManager.getConnection(URL, userName, passWord);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
	
	/*分页内容
	 * pageNow 当前页面所在的页数 ，有服务器提供
	 * pageCount  总共有多少页，计算得出
	 * rowCount 一共有多少条记录，由数据库取出
	 * pageSize  一页显示多少数据
	 * 
	 *  keyWord：按名称查询
	 *  
	 * KeyClass：按种类查询
	 */
/*
	public static int getPageCount(int pageSize,String keyWord,String KeyClass){
		int pageCount=0;
		int rowCount=0;
		//查询数据库有多少条数据
		String sql = "select count(*) from person where productName=?";
		if(KeyClass!=null&&!"".equals(KeyClass)){
			sql="select count(*) from person where kinds =?";
		}
		try {
			//连接数据库
			connection=getConnection();
			//得到pStatement对象
			pStatement=connection.prepareStatement(sql);
			pStatement.setString(1, keyWord);
			rSet=pStatement.executeQuery();
			while(rSet.next()){
				rowCount=rSet.getInt(1);
			}		
			if(rowCount%pageSize==0){
				pageCount=rowCount/pageSize;
			}else{
				pageCount=rowCount/pageSize+1;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//关闭连接
			closeThree(rSet, pStatement, connection);
		}
		return pageCount;
	}
	
	//查询数据
	public static  ArrayList<	Pruducts> getPageSizeData(int pageNow,int pageSize,String keyWord,String KeyClass){
		ArrayList<Pruducts> aList=new ArrayList<Pruducts>();
		Object object=null;
		String sql = "select *from person limit " + pageSize * (pageNow - 1) + "," + pageSize+" where productName=? ";
		if(KeyClass!=null&&!"".equals(KeyClass)){
			sql="select *from person limit " + pageSize * (pageNow - 1) + "," + pageSize+" where kinds =?";
		}	
		try {
			//得到连接
			connection=getConnection();
			//得到pStatement对象
			pStatement=connection.prepareStatement(sql);
			pStatement.setString(1, keyWord);
			rSet=pStatement.executeQuery();
			while(rSet.next()){
				//object =new Object();
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
		
	}
	*/
	
	
	//关闭两个连接
	public static void closeTwo(PreparedStatement pStatement,Connection connection){
		if(pStatement!=null){
			try {
				pStatement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			pStatement=null;
		}
		if(connection!=null){
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			connection=null;
		}
	}
	//关闭三个连接
	public static void closeThree(ResultSet rSet,PreparedStatement pStatement,Connection connection){
		if(rSet!=null){
			try {
				rSet.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			rSet=null;
		}
		if(pStatement!=null){
			try {
				pStatement.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			pStatement=null;
		}
		if(connection!=null){
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			connection=null;
		}
	}
}
