package com.igo.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// * Servlet Filter implementation class EncodeFilter

public class EncodeFilter implements Filter {

	// 获取字符编码
	private String encoding = "";
	// 获取过滤器名
	private String filterName = "";

	public EncodeFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		// 分别对请求和响应进行编码设置
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		// 请求过滤
		System.out.println("请求被" + filterName + "过滤");
		// 如果请求的是get,则用请求包装器，否则直接编码
		if ("GET".equals(req.getMethod())) {
			// 调用请求封装器
			req = new RequestEncodingWrapper(req, encoding);
		} else {
			request.setCharacterEncoding(encoding);
		}
		response.setCharacterEncoding(encoding);
		chain.doFilter(req, res);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// 获取过滤器名
		filterName = fConfig.getFilterName();
		// 获取初始化参数值
		encoding = fConfig.getInitParameter("ENCODING");
		if (encoding == null || "".equals(encoding)) {
			encoding = "UTF-8";
		}
		System.out.println("encoding=" + encoding);
	}
}
