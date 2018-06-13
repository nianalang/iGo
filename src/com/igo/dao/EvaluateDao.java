package com.igo.dao;

import java.util.ArrayList;
import java.util.List;

import com.igo.pojo.Evaluate;
import com.igo.tag.PageObject;

public interface EvaluateDao {//EvaluateDao
	public boolean saveEvaluate(int flower,String textarea,int productId,int loginId);
	public int queryByProductId(int productId);
	//评论后把status的值改为1
	public boolean updateStatus(int productId,int status);
	public ArrayList<Evaluate> evaluate(int status,int productId);
	public int getPageCount(int pageSize,int rowCount);
	public PageObject getPageObject(int curPage,PageObject pageObject,List<Object> listEvaluate);
}
