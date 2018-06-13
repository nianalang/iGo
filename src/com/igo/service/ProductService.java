package com.igo.service;

import java.util.List;

import com.igo.dao.ProductDao;
import com.igo.dao.ProductDaoImp;
import com.igo.pojo.Products;
import com.igo.tag.PageObject;

public class ProductService implements ProductDao {

	ProductDao productDao=new   ProductDaoImp();
	
	//根据商品的id查找商品
	@Override
	public Products queryProductById(int productIds){
		// TODO Auto-generated method stub
		Products products=productDao.queryProductById(productIds);
		return  products;
	}
	//根据输入关键字查询商品列表
	@Override
	public List<Products> queryAll(String keyWord,String keyClass,int status) {
		// TODO Auto-generated method stub	
		//调用dao层获取数据库的内容
		List<Products> list=productDao.queryAll(keyWord,null,status);
		return list;
	}
	//分页显示商品列表
	@Override
	public PageObject getPageObject(int curPage, PageObject pageObject, List<Object> list) {
		// TODO Auto-generated method stub
		PageObject pObject=productDao.getPageObject(curPage, pageObject, list);	
		return pObject;
	}
	//	得到分页数
	@Override
	public int getPageCount(int pageSize,String keyWord,String keyClass) {
		// TODO Auto-generated method stub
		int pageCount=productDao.getPageCount(pageSize, keyWord,keyClass);
		return pageCount;
	}
	//根据输入的时间选择抢购的商品列表
	@Override
	public List<Products> queryAllByTime(String keyWord, String keyClass,String time, int status) {
		List<Products> products=productDao.queryAllByTime(keyWord, keyClass,time, status);
		return  products;
	}
	@Override
	public List<String> queryBySearch(String searchContent) {
		List<String> list=productDao.queryBySearch(searchContent);
		return list;
	}
	//改变商品的已购买数量
	@Override
	public boolean updatePurchasedNum(int productId, int purchasedNum,int productsNum) {
		boolean trueFlag=productDao.updatePurchasedNum(productId, purchasedNum,productsNum);
		return trueFlag;
	}
	@Override
	public List<Products> queryProducts(String keyWord, String keyClass) {
		// TODO Auto-generated method stub
		return productDao.queryProducts(keyWord, keyClass);
	}
	@Override
	public boolean deleteProductById(int productId) {
		// TODO Auto-generated method stub
		return productDao.deleteProductById(productId);
	}
	@Override
	public boolean updateProductById(int productId,int number) {
		// TODO Auto-generated method stub
		return productDao.updateProductById(productId, number);
	}
}
