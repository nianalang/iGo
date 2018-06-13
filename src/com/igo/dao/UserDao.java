package com.igo.dao;

import com.igo.pojo.Users;

public interface UserDao {
	//添加用户
	public boolean addUser(Users users)throws Exception;
	//修改用户信息
	public boolean editInf(String uname,String email,String passwd) ;
	//修改用户密码
	public int editPasswd(int uid,String passwd)throws Exception ;
	//根据用户id，删除用户
	public boolean deleteUser(int usertId) ;
	//根据用户名查询用户
	public Users queryByName(String uname);
	//根据用户Email查询用户
	public Users queryByEmail(String email) throws Exception;

}

