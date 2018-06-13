package com.igo.dao;

import java.util.List;
import java.util.Vector;

import com.igo.pojo.ManagerLogin;
import com.igo.pojo.Products;
import com.igo.pojo.Users;
import com.igo.tag.PageObject;


public interface ManagerUserDao {
		
		//删除用户
		public boolean deleteManaUser(String userName);
		//添加用户
		public boolean addManaUser(ManagerLogin mLogin);
		//修改用户信息
		public boolean editInf(String mName,String email,String passwd) ;
		//根据用户名查询用户
		public ManagerLogin queryByName(String mName);
		//修改用户密码
		public int editPasswd(int mid,String passwd)throws Exception ;
		//管理员页面
		//查看所有管理员信息
		public Vector<ManagerLogin> queryAllInf();
		//查看所有用户信息
		public Vector<Users> queryAllUser();
		//查看所有抢购商品
		public Vector<Products> queryStatusManager();
		
		public int getPageCount(int pageSize,int rowCount);
		public PageObject getPageObject(int curPage,PageObject pageObject,List<Object> listRushBuy);
}
