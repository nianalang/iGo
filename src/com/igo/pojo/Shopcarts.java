package com.igo.pojo;

public class Shopcarts {
	
	private int shopcartId=0;//购物车id
	private int usernameId;//商品id
	private int productId;//用户id
	private int shopcartNum;//物品的数量
	private int status;//1：已付款；0：未付款
	public int getShopcartId() {
		return shopcartId;
	}
	public void setShopcartId(int shopcartId) {
		this.shopcartId = shopcartId;
	}
	public int getUsernameId() {
		return usernameId;
	}
	public void setUsernameId(int usernameId) {
		this.usernameId = usernameId;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	public int getShopcartNum() {
		return shopcartNum;
	}
	public void setShopcartNum(int shopcartNum) {
		this.shopcartNum = shopcartNum;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
