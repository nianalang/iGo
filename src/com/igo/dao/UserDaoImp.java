package com.igo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.igo.pojo.Users;
import com.igo.utils.DBHelper;

public class UserDaoImp implements UserDao {

	private Connection connection=null;
	private PreparedStatement pStatement=null;
	private ResultSet rSet=null;
	//添加用户
	@Override
	public boolean addUser(Users users)  {
			boolean flag=false;
			String sql = "insert into login values(null,?,?,?,?)";
			connection = DBHelper.getConnection();
			if(connection == null) {
				System.out.println("获取链接失败");
				return  flag;
			}
			try {
			//创建ps对象
			pStatement=connection.prepareStatement(sql);
			pStatement.setString(1, users.getUserName());
			pStatement.setString(2, users.getPassword());
			pStatement.setString(3, users.getPassword());
			pStatement.setString(4, users.getEmail());
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
	//修改用户信息
	@Override
	public boolean  editInf(String uname, String email,String passwd) {
		// TODO Auto-generated method stub
		boolean flag=false;
		String sql="update login set password=?,confirdPassWd=?,email=? where userName=?";
		connection=DBHelper.getConnection();
		try {
			pStatement=connection.prepareStatement(sql);
			pStatement.setString(1, passwd);
			pStatement.setString(2, passwd);
			pStatement.setString(3, email);
			pStatement.setString(4, uname);
			int a=pStatement.executeUpdate();
			if(a>0){
				flag=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//在DBHelper中关闭连接
		finally {
			DBHelper.closeTwo(pStatement, connection);
		}
		return flag;
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
		boolean flag=false;
		String sql="delete from login where loginId=?";
		//得到连接
		connection=DBHelper.getConnection();
		//创建ps对象
		try {
			pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1, usertId);
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
	//根据用户名查询用户
	@Override
	public Users queryByName(String userName)  {
	
		Users users=null;
		String sql="select *from login where userName=?";
		//得到连接
		connection=DBHelper.getConnection();
		//创建ps对象
		try {
			pStatement=connection.prepareStatement(sql);
			pStatement.setString(1, userName);
			rSet=pStatement.executeQuery();
			while(rSet.next()){
				//将从数据库里取出的值存放在users中
				users=new Users();
				users.setLoginId(rSet.getInt("loginId"));
				users.setUserName(rSet.getString("userName"));
				users.setPassword(rSet.getString("password"));
				users.setConfirdPassWd(rSet.getString("confirdPassWd"));
				users.setEmail(rSet.getString("email"));
				//users.setAddress(rSet.getString("address"));
			}	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBHelper.closeThree(rSet, pStatement, connection);
		}		
		return users;
	}
	//根据用户Email查询用户
	@Override
	public Users queryByEmail(String email) throws Exception {
		Users users=null;
		String sql="select *from login where email=?";
		//创建ps对象
				try {
					//得到连接
					connection=DBHelper.getConnection();
					pStatement=connection.prepareStatement(sql);
					pStatement.setString(1, email);
					rSet=pStatement.executeQuery();
					while(rSet.next()){
						//将从数据库里取出的值存放在users中
						users=new Users();
						users.setLoginId(rSet.getInt("loginId"));
						users.setUserName(rSet.getString("userName"));
						users.setPassword(rSet.getString("password"));
						users.setConfirdPassWd(rSet.getString("confirdPassWd"));
						users.setEmail(rSet.getString("email"));
					}	
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {
					DBHelper.closeThree(rSet, pStatement, connection);
				}		
		return  users;
	}
}
