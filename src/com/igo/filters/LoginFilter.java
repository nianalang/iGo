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
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
public class LoginFilter implements Filter {

	String filterName = "";// 得到过滤器名

	/**
	 * Default constructor.
	 */
	public LoginFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * 释放过滤器中使用的资源
	 */
	public void destroy() {
		System.out.println("请求销毁");
	}

	/**
	 * ServletRequest 客户端的request 请求 ServletResponse 客户端的response 请求 FilterChain
	 * 过滤器链对象
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		// 将ServletRequest对象强转为HttpServletRequest对象
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		// 得到session对象
		HttpSession session = req.getSession();
		// 从session中取出用户名
		String userName = (String) session.getAttribute("userName");
		// 请求过滤
		System.out.println("请求被" + filterName + "过滤");
		if (userName == null) {
			// 用户名为空，跳转到登录界面
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		} else {
			// 既可以将请求传递给下一个链对象，又可以返回客户端，还可以重定向
			chain.doFilter(req, resp);
		}
	}

	/**
	 * 初始化过滤器， fConfig可以得到过滤器中初始化参数的配置信息
	 * 
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		// 得到过滤器名
		filterName = fConfig.getFilterName();
		System.out.println("过滤器名" + filterName);
	}
}
