package com.igo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.igo.pojo.Products;
import com.igo.tag.PageObject;
import com.igo.utils.DBHelper;
import com.igo.utils.SetPageObject;

public class ProductDaoImp implements ProductDao {

	private Connection connection=null;
	private PreparedStatement pStatement=null;
	private ResultSet rSet=null;
	
	//根据商品的id查找商品
	@Override
	public Products queryProductById(int productId){
		Products products=new Products();
		String sql = "select productName,productsUrlMain,productsUrlOne,"
				+ "productsUrlTwo,productsUrlThree,productsUrlFour,productsUrlFive,productsUrlSix,price,"
				+ "described,productsNum,purchasedNum from products where productsId=?";
		try {
			connection=DBHelper.getConnection();
			pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1,productId);
			rSet=pStatement.executeQuery();
			while(rSet.next()){
				products.setProductsId(productId);
				products.setProductName(rSet.getString("productName"));		
				products.setProductsUrlMain(rSet.getString("productsUrlMain"));			
				products.setProductsUrlOne(rSet.getString("productsUrlOne"));
				products.setProductsUrlTwo(rSet.getString("productsUrlTwo"));
				products.setProductsUrlThree(rSet.getString("productsUrlThree"));
				products.setProductsUrlFour(rSet.getString("productsUrlFour"));
				products.setProductsUrlFive(rSet.getString("productsUrlFive"));
				products.setProductsUrlSix(rSet.getString("productsUrlSix"));
				products.setPrice(rSet.getString("price"));
				products.setDescribed(rSet.getString("described"));	
				products.setProductsNum(rSet.getString("productsNum"));//库存数量
				products.setPurchasedNum(rSet.getString("purchasedNum"));//已购买数量
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBHelper.closeThree(rSet, pStatement, connection);
		}
		return  products;
	}
	
	
	
	//根据输入关键字查询商品列表
	@Override
	public List<Products> queryAll(String keyWord,String keyClass,int status)  {
		// TODO Auto-generated method stub
		List<Products> list=new ArrayList<Products>();
		Products products=null;
		String sql="select productsId,productName,productsUrlMain,productsUrlOne,productsUrlTwo,"
				+ "productsUrlThree,productsUrlFour,productsUrlFive,productsUrlSix,price,described from"
				+ " products where productName=? and status=?";
		if(keyClass!=null&&!"".equals(keyClass)){
			sql="";//查询商品详细信息
		}
		//得到连接
		connection=DBHelper.getConnection();
		try {
			pStatement=connection.prepareStatement(sql);
			pStatement.setString(1, keyWord);
			pStatement.setInt(2, status);
			rSet=pStatement.executeQuery();
			while(rSet.next()){
				products=new Products();
				products.setProductsId(rSet.getInt("productsId"));
				products.setProductName(rSet.getString("productName"));
				products.setProductsUrlMain(rSet.getString("productsUrlMain"));
				products.setProductsUrlOne(rSet.getString("productsUrlOne"));
				products.setProductsUrlTwo(rSet.getString("productsUrlTwo"));
				products.setProductsUrlThree(rSet.getString("productsUrlThree"));
				products.setProductsUrlFive(rSet.getString("productsUrlFour"));
				products.setProductsUrlFive(rSet.getString("productsUrlFive"));
				products.setProductsUrlSix(rSet.getString("productsUrlSix"));
				products.setPrice(rSet.getString("price"));
				products.setDescribed(rSet.getString("described"));
				list.add(products);
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally	{
			//关闭连接
			DBHelper.closeThree(rSet, pStatement, connection);
		}
		return list;
	}


	//查询分页条数
	@Override
	public int getPageCount(int pageSize,String keyWord ,String keyClass) {
		// TODO Auto-generated method stub
		int pageCount=0;
		int rowCount=0;
		//查询数据库有多少条数据
		String sql = "select count(*) from products where productName='"+keyWord+"'";
		if(keyClass!=null){
			sql = "select count(*) from products where types  like '%"+keyWord+"%'";
		}
		if(keyClass!=null&&"2".equals(keyClass)){
			sql = "select count(*) from products where kinds='"+keyWord+"'";
		}
		try {
			//连接数据库
			connection=DBHelper.getConnection();
			//得到pStatement对象
			pStatement=connection.prepareStatement(sql);
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
			DBHelper.closeThree(rSet, pStatement, connection);
		}
		return pageCount;
	}

	//分页显示商品列表
	@Override
	public PageObject getPageObject(int curPage, PageObject pageObject, List<Object> listObject) {
		// TODO Auto-generated method stub
		PageObject pObject=SetPageObject.getInstance().setPageObjectData(curPage, pageObject, listObject);
		return pObject;
		
	}


	//根据输入的时间选择抢购的商品列表
	@Override
	public List<Products> queryAllByTime(String keyWord,String keyClass, String time, int status) {	
		List<Products> list=new ArrayList<Products>();
		Products products=null;
		String sql="select productsId,productName,productsUrlMain,productsUrlOne,productsUrlTwo,"
				+ "productsUrlThree,productsUrlFour,productsUrlFive,productsUrlSix,price,described,productsNum "
				+ "from products where productName=? and status=? and date=?";
		if(keyClass!=null&&!"".equals(keyClass)){
			sql="";//查询商品详细信息
		}
		//得到连接
		connection=DBHelper.getConnection();
		//System.out.println(connection+"connection");
		try {
			pStatement=connection.prepareStatement(sql);
			pStatement.setString(1, keyWord);
			pStatement.setInt(2, status);
			pStatement.setString(3, time);
			
			rSet=pStatement.executeQuery();
			while(rSet.next()){
				products=new Products();
				products.setProductsId(rSet.getInt("productsId"));
				products.setProductName(rSet.getString("productName"));
				products.setProductsUrlMain(rSet.getString("productsUrlMain"));
				products.setPrice(rSet.getString("price"));
				products.setDescribed(rSet.getString("described"));		
				products.setProductsUrlOne(rSet.getString("productsUrlOne"));
				products.setProductsUrlTwo(rSet.getString("productsUrlTwo"));
				products.setProductsUrlThree(rSet.getString("productsUrlThree"));
				products.setProductsUrlFour(rSet.getString("productsUrlFour"));
				products.setProductsUrlFive(rSet.getString("productsUrlFive"));
				products.setProductsUrlSix(rSet.getString("productsUrlSix"));
				products.setProductsNum(rSet.getString("productsNum"));
				list.add(products);
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//System.out.println(pStatement);
		}finally	{
			//关闭连接
			DBHelper.closeThree(rSet, pStatement, connection);
		}
		/*for(int i=0;i<list.size();i++){
			Products products2=list.get(i);
			System.out.println(products2.getProductsUrlMain()+"kkk");
		}*/
		return list;
	}


	//根据输入额内容模糊查询数据
	@Override
	public List<String> queryBySearch(String searchContent) {
		List<String> list=new ArrayList<String>();
		String sql="select * from products where types like '%"+searchContent+"%'";	
		try {
			//得到连接
			connection=DBHelper.getConnection();
			pStatement=connection.prepareStatement(sql);
			rSet=pStatement.executeQuery();
			while(rSet.next()){
				 list.add(rSet.getString("types"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();	
		}finally {
			DBHelper.closeThree(rSet, pStatement, connection);
		}		
		return list;
	}


	//改变商品的已购买数量
	@Override
	public boolean updatePurchasedNum(int productId, int purchasedNum,int productsNum) {
		boolean trueFlag=false;
		String sql="update products set purchasedNum=?,productsNum=? where productsId=?";
		try {
			//得到连接
			connection=DBHelper.getConnection();
			pStatement=connection.prepareStatement(sql);
			//给问号赋值
			pStatement.setInt(1, purchasedNum);
			pStatement.setInt(2, productsNum);
			pStatement.setInt(3, productId);
			int a=pStatement.executeUpdate();
			if(a>0){
				trueFlag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return trueFlag;
	}



	@Override
	public List<Products> queryProducts(String keyWord, String keyClass) {
		// TODO Auto-generated method stub
		List<Products> list=new ArrayList<Products>();
		Products products=null;
		String	sql=null;
	/*	String sql="select productsId,productName,productsUrlMain,productsUrlOne,productsUrlTwo,"
				+ "productsUrlThree,productsUrlFour,productsUrlFive,productsUrlSix,price,described"
				+ "from products where types='"+keyWord+"'";*/
	
			sql="select productsId,productName,productsUrlMain,productsUrlOne,productsUrlTwo,"
					+ "productsUrlThree,productsUrlFour,productsUrlFive,productsUrlSix,price,described "
					+ "from products where types like '%"+keyWord+"%'";
			
		try {
			connection=DBHelper.getConnection();
			pStatement=connection.prepareStatement(sql);
			rSet=pStatement.executeQuery();
			while(rSet.next()){
				products=new Products();
				products.setProductsId(rSet.getInt("productsId"));
				products.setProductName(rSet.getString("productName"));
				products.setProductsUrlMain(rSet.getString("productsUrlMain"));
				products.setPrice(rSet.getString("price"));
				products.setDescribed(rSet.getString("described"));		
				products.setProductsUrlOne(rSet.getString("productsUrlOne"));
				products.setProductsUrlTwo(rSet.getString("productsUrlTwo"));
				products.setProductsUrlThree(rSet.getString("productsUrlThree"));
				products.setProductsUrlFour(rSet.getString("productsUrlFour"));
				products.setProductsUrlFive(rSet.getString("productsUrlFive"));
				products.setProductsUrlSix(rSet.getString("productsUrlSix"));
				list.add(products);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return list;
	}
	@Override
	public boolean deleteProductById(int productId) {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql="delete from products where productsId=?";
		//得到连接
		connection=DBHelper.getConnection();
		//创建ps对象
		try {
			pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1, productId);
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



	@Override
	public boolean updateProductById(int productId,int number) {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql="update products set productsNum=? where productsId=?";
		//得到连接
		connection=DBHelper.getConnection();
		//创建ps对象
		try {
			pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1, number);
			pStatement.setInt(2, productId);
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
