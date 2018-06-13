package com.igo.utils;

import java.util.ArrayList;
import java.util.List;

import com.igo.pojo.TempProducts;
import com.igo.tag.PageObject;

public class SetPageObject {

	private SetPageObject(){};
	private static SetPageObject instance=null;
	//获得SetPageObject实例
	public static SetPageObject getInstance(){
		if(instance==null){
			instance = new SetPageObject();
		}
		return instance;
	}
	/**
	 * 
	 * @param curPage 当前页数
	 * @param pageObject  封装当前页数的对象
	 * @param listObject 从数据库取出的所有数据对象
	 * @return
	 */
	public PageObject setPageObjectData(int curPage,PageObject pageObject,
			List<Object> listObject){		
 		List<Object> list = new ArrayList<Object>();
 		int size=listObject.size();
 		list =setObjectData( list, size,curPage,listObject, pageObject);//设置每页的数据	
 		pageObject.setData(list);//放数据
 		return pageObject;
	}
	//返回添加的数据
	private List<Object> setObjectData(List<Object> targetlist,int size,int curPage,
			List<Object> listObject,PageObject pageObject){
		//每页应显示的量  当前页数*每页显示的大小(1*10     2*10)
		int count = pageObject.getCurPage() * pageObject.getPageSize();
		if (curPage == 1) {// 当前页是第一页
			targetlist=addData( count, size, 0,targetlist,listObject);
		} else {
			int start = (pageObject.getCurPage() - 1)* pageObject.getPageSize();
			targetlist=addData( count,size, start,targetlist,listObject);
		}
		return targetlist;
	}
	//添加数据
	private List<Object> addData(int count,int size,int start,List<Object> list,List<Object> listObject){
		if (count > size) {// 首页的总量小于 要显示的量;
			for (int i = start; i < size; i++) {
				list.add(listObject.get(i));
			}
		} else {
			for (int i = start; i < count; i++) {
				list.add(listObject.get(i));
			}
		}
		return list;
	}
}
