package com.igo.service;

import java.util.List;

import com.igo.dao.ShoppingCartDao;
import com.igo.dao.ShoppingCartDaoImp;
import com.igo.pojo.Shopcarts;
import com.igo.tag.PageObject;

public class ShoppingCartService implements ShoppingCartDao{
	//获取操作数据库实例
	ShoppingCartDao shoppingCartDao= new  ShoppingCartDaoImp();
	//根据购物车状态，用户id查询购物车
	@Override
	public List<Shopcarts> getAppointedProducts(int userId, int status) {
		List<Shopcarts> arrayList= shoppingCartDao.getAppointedProducts(userId, status);
		return arrayList;
	}
	//根据用户id获取所有的商品
	@Override
	public List<String> getAllProducts(int uid) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	//根据购物车状态，商品id，用户id查询购物车ProductService
	@Override
	public Shopcarts getProductsId(int userId, int productId, int status){
		// TODO Auto-generated method stub
		Shopcarts shopcarts=shoppingCartDao.getProductsId(userId, productId, status);
		return  shopcarts;
	}
	//根据购物车状态，商品id，用户id删除购物车
	@Override
	public boolean  deleteProducts(int userId, int productId, int status){
		boolean flag=shoppingCartDao.deleteProducts(userId, productId, status);
		return flag;
	}
	//根据用户id，购物车状态删除购物车
	@Override
	public int deleteAll(int uid, int status) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	/**
	 * userId 用户id
	 * productId 产品id
	 * shopcartNum 要添加的产品数量
	 */
	//添加购物车
	@Override
	public boolean  addBuy(int userId, int productId, int shopcartNum)  {	
		//将商品加入购物车
		boolean flag=shoppingCartDao.addBuy(userId,  productId, shopcartNum);
		return flag;
	}
	/**
	 * shoppingCartId 已购买过的商品id
	 * shopcartNum 修改过的产品数量
	 * status 当前购物车状态
	 */
	//修改购物车信息
	@Override
	public boolean updatebuy(int shoppingCartId,int shopcartNum,int status){
		boolean flag=shoppingCartDao.updatebuy(shoppingCartId, shopcartNum, status);
		return flag;
	}
	//更新购物车信息
	@Override
	public boolean updateShopcarts(int productId,int status,int shopcartNum){
		// TODO Auto-generated method stub
		boolean flag=shoppingCartDao.updateShopcarts(productId, status, shopcartNum);
		return  flag;
	}
	public int getPageCount(int pageSize,int rowCount){
		int pageCount=0;
		if(rowCount%pageSize==0){
			pageCount=rowCount/pageSize;
		}else{
			pageCount=rowCount/pageSize+1;
		}	
		return pageCount;	
	}
	//分页显示商品列表
	@Override
	public PageObject getPageObject(int curPage, PageObject pageObject, List<Object> listObject) {
		// TODO Auto-generated method stub
		PageObject pObject=shoppingCartDao.getPageObject(curPage, pageObject , listObject);
		return pObject;
	}
	@Override
	public boolean updateNumberShopcarts(int productId, int number) {
		// TODO Auto-generated method stub
		return shoppingCartDao.updateNumberShopcarts(productId, number);
	}	
}
