package com.igo.dao;

import java.util.List;

import com.igo.pojo.Shopcarts;
import com.igo.tag.PageObject;


public interface ShoppingCartDao {

	//根据购物车状态，用户id查询购物车
	public List<Shopcarts > getAppointedProducts(int userId,int status);
	//根据用户id获取所有的商品
	public List<String> getAllProducts(int uid)throws Exception;
	//根据购物车状态，商品id，用户id查询购物车
	public Shopcarts getProductsId(int userId, int productId, int status);
	//根据购物车状态，商品id，用户id删除购物车
	public boolean deleteProducts(int userId, int productId, int status);
	//根据用户id，购物车状态删除购物车
	public int deleteAll(int uid, int status)throws Exception;
	//添加购物车
	public boolean  addBuy(int userId, int productId, int shopcartNum);
	//修改购物车信息
	public boolean updatebuy(int userId, int productId, int shopcartNum);
	//更新购物车信息
	public boolean updateShopcarts(int productId,int status,int shopcartNum);
	
	public int getPageCount(int pageSize,int rowCount);
	//分页显示商品列表
	public PageObject getPageObject(int curPage,PageObject pageObject,List<Object> listTempProducts);
	//修改已支付的购物车的数量
	public boolean updateNumberShopcarts(int productId, int number);

}