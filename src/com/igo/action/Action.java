package com.igo.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
	* 业务操作的接口类
	*/
	public interface Action {
		public String execute(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException;
}
