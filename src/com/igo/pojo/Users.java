package com.igo.pojo;

public class Users {
	private int loginId; //用户id
	private String userName;//用户名
	private String password ;//用户密码
	private String confirdPassWd;//用户确认密码
	private String email ;//电子邮件
	private String address;//地址
	public int getLoginId() {
		return loginId;
	}
	public void setLoginId(int loginId) {
		this.loginId = loginId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirdPassWd() {
		return confirdPassWd;
	}
	public void setConfirdPassWd(String confirdPassWd) {
		this.confirdPassWd = confirdPassWd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}
