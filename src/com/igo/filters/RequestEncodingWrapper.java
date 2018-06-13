package com.igo.filters;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

/**
 * Servlet Filter implementation class RequestEncodingWrapper
 */
public class RequestEncodingWrapper extends HttpServletRequestWrapper {

	String encoding = "";

	public RequestEncodingWrapper(HttpServletRequest request) {
		super(request);
		// TODO Auto-generated constructor stub
	}

	public RequestEncodingWrapper(HttpServletRequest request, String encoding) {
		super(request);
		this.encoding = encoding;
	}

	// 重写getParameter方法
	public String getParameter(String name) {
		String value = getRequest().getParameter(name);
		// 将参数值进行编码转换
		try {
			if (value != null && !"".equals(value)) {
				value = new String(value.trim().getBytes("ISO-8859-1"), encoding);
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return value;

	}
}
