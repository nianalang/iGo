package com.igo.service;

import java.util.List;
import java.util.Vector;

import com.igo.dao.ManagerUserDao;
import com.igo.dao.ManagerUserDaoImp;
import com.igo.dao.ProductDao;
import com.igo.dao.ProductDaoImp;
import com.igo.pojo.ManagerLogin;
import com.igo.pojo.Products;
import com.igo.pojo.Users;
import com.igo.tag.PageObject;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class ManagerUserService implements ManagerUserDao{
	
	ManagerUserDao mUserDao=new ManagerUserDaoImp();
	ProductDao productDao=new ProductDaoImp();
	
	public ManagerUserService() {
		// TODO Auto-generated constructor stub
	}
	//添加用户
	@Override
	public boolean addManaUser(ManagerLogin mLogin) {
		// TODO Auto-generated method stub
		return mUserDao.addManaUser(mLogin);
	}
	//修改用户信息
	@Override
	public boolean editInf(String mName, String email, String passwd) {
		// TODO Auto-generated method stub
		return mUserDao.editInf(mName, email, passwd);
		
	}
	//根据用户名查询用户
	@Override
	public ManagerLogin queryByName(String mName) {
		// TODO Auto-generated method stub
		ManagerLogin mLogin=mUserDao.queryByName(mName);
		return mLogin;
		
	}
	@Override
	public int editPasswd(int mid, String passwd) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	//查看所有管理员信息
	public Vector<ManagerLogin> queryAllInf() {
		// TODO Auto-generated method stub
		Vector<ManagerLogin> allInfo=mUserDao.queryAllInf();
		return allInfo;
	}
	@Override
	//查看所有用户信息
	public Vector<Users> queryAllUser() {
		// TODO Auto-generated method stub
		Vector<Users> allUserInfo=mUserDao.queryAllUser();
		return allUserInfo;
	}
	@Override
	//查看所有抢购商品
	public Vector<Products> queryStatusManager() {
		// TODO Auto-generated method stub
		Vector<Products> allRushbuyInf=mUserDao.queryStatusManager();
		return allRushbuyInf;
	}
	@Override
	public int getPageCount(int pageSize, int rowCount) {
		// TODO Auto-generated method stub
		int pageCount=0;
		if(rowCount%pageSize==0){
			pageCount=rowCount/pageSize;
		}else{
			pageCount=rowCount/pageSize+1;
		}	
		return pageCount;	
	}
	@Override
	public PageObject getPageObject(int curPage, PageObject pageObject, List<Object> listRushBuy) {
		// TODO Auto-generated method stub
		return productDao.getPageObject(curPage, pageObject, listRushBuy);
	}
	@Override
	public boolean deleteManaUser(String userName) {
		// TODO Auto-generated method stub
		return mUserDao.deleteManaUser(userName);
	}
	
}
