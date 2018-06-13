package com.igo.tag;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class PageObject {

	private final int DEFAULT_PAGE_SIZE = 10;// 默认显示记录数

	private final int DEFAULT_CUR_SIZE = 1;// 默认当前页

	private List data;// 数据列表

	private int pageSize;// 显示记录数

	private int pageCount;// 总页数

	private int curPage;// 当前页

	public int getCurPage() {//获得当前页
		if (curPage < DEFAULT_CUR_SIZE) {
			curPage = DEFAULT_CUR_SIZE;
		}
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public List getData() {
		return data;
	}

	public void setData(List data) {
		this.data = data;
	}

	public int getPageCount() {//获得页数
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getPageSize() {
		if (pageSize < 1) {
			pageSize = DEFAULT_PAGE_SIZE;
		}
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}

