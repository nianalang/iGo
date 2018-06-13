package com.igo.service;

import java.util.ArrayList;
import java.util.List;

import com.igo.dao.EvaluateDao;
import com.igo.dao.EvaluateDaoImp;
import com.igo.pojo.Evaluate;
import com.igo.tag.PageObject;

public class EvaluateService implements EvaluateDao{
	
	//调用dao层实现方法
	EvaluateDao evaluateDao=new EvaluateDaoImp();
	@Override
	public boolean saveEvaluate(int flower, String textarea, int productId, int loginId) {
		// TODO Auto-generated method stub
		return evaluateDao.saveEvaluate(flower, textarea, productId, loginId);
	}
	@Override
	public int queryByProductId(int productId) {
		// TODO Auto-generated method stub
		return evaluateDao.queryByProductId(productId);
	}
	@Override
	public boolean updateStatus(int productId, int status) {
		// TODO Auto-generated method stub
		return evaluateDao.updateStatus(productId, status);
	}
	@Override
	public ArrayList<Evaluate> evaluate(int status,int productId) {
		// TODO Auto-generated method stub
		return evaluateDao.evaluate(status,productId);
	}
	
	public int getPageCount(int pageSize,int rowCount){
		int pageCount=0;
		if(rowCount%pageSize==0){
			pageCount=rowCount/pageSize;
		}else{
			pageCount=rowCount/pageSize+1;
		}	
		return pageCount;	
	}
	@Override
	public PageObject getPageObject(int curPage, PageObject pageObject, List<Object> listEvaluate) {
		// TODO Auto-generated method stub
		return evaluateDao.getPageObject(curPage, pageObject, listEvaluate);
	}

}
