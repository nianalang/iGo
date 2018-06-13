package com.igo.service;

import com.igo.dao.UserDao;
import com.igo.dao.UserDaoImp;
import com.igo.pojo.Users;

public class UserService implements UserDao {
	
	UserDao userDaoImp=new UserDaoImp();
	//添加用户
		@Override
		public boolean addUser(Users users ) throws Exception {
			// TODO Auto-generated method stub
			return userDaoImp.addUser(users);
		}
	//修改用户信息
	@Override
	public boolean editInf(String uname,String email,String passwd)  {
		// TODO Auto-generated method stub
		return userDaoImp.editInf(uname, email, passwd);
	}
	//修改用户密码
	@Override
	public int editPasswd(int uid, String passwd) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	//根据用户id，删除用户
	@Override
	public boolean deleteUser(int usertId) {
		// TODO Auto-generated method stub
		return userDaoImp.deleteUser(usertId);
	}
	//根据用户名查询用户
	@Override
	public Users queryByName(String uname){
		// TODO Auto-generated method stub	
		Users users=userDaoImp.queryByName(uname);
		return users;
	}
	//根据用户Email查询用户
	@Override
	public Users queryByEmail(String email) throws Exception {
		// TODO Auto-generated method stub
		Users users=userDaoImp.queryByEmail(email);
		return users;
	}
}
