package com.roxy.maven.dinner.intercetor;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 登录拦截器
 */
public class UserIntercetor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//判断session中是否保存有已登录用户的信息
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")!=null){
			return true;//session中保存有登录用户的信息，则返回true，正常访问用户需要访问的资源
		}
		//如果未登录，则跳转到登录页面
		response.sendRedirect(request.getContextPath()+"/WEB-INF/user/login.jsp");
		return false;
	}
	
}
