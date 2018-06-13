package com.igo.dao;

import java.util.List;

import com.igo.pojo.Products;
import com.igo.tag.PageObject;


public interface ProductDao {
		//改变商品的已购买数量
		public boolean updatePurchasedNum(int productId,int purchasedNum,int productsNum);
		//根据pageSize将产品分类
		public int getPageCount(int pageSize,String keyWord,String keyClass );
		//根据商品的id查找商品
		public Products queryProductById(int productId);
		//根据输入关键字查询商品列表
		public List<Products> queryAll(String keyWord,String keyClass,int status);
		//分页显示商品列表
		public PageObject getPageObject(int curPage,PageObject pageObject,List<Object> listObject);
		//根据输入的时间选择抢购的商品列表
		public List<Products> queryAllByTime(String keyWord,String keyClass,String time,int status);
		//根据输入的内容模糊查询数据
		public List<String> queryBySearch(String searchContent);
		//根据输入额内容模糊查询商品信息
		public List<Products> queryProducts(String keyWord,String keyClass);
		//删除一件产品
		public boolean deleteProductById(int productId);
		//修改库存
		public boolean updateProductById(int productId,int number);
		
}
