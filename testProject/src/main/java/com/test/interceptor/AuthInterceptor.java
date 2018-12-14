package com.test.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger Logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession(); 
		
		if(session.getAttribute("login") == null) {
			Logger.info("current member is not logined");
			saveDest(request);	// 가려고 했던 페이지 저장
			response.sendRedirect("/");
			return false;
		}
		return true;
	}
	
	// LoginInterceptor --> login 후 원래 가려던 페이지로 이동해주는 기능
	private String saveDest(HttpServletRequest req) {
		String uri = req.getRequestURI();
		String query = req.getQueryString();
		
		if (query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}
		if (req.getMethod().equals("GET")) {
			Logger.info("dest : " + (uri+query));
			System.out.println("dest : " + (uri+query));
			req.getSession().setAttribute("dest", uri+query);
		}
		return uri+query;
	}

}
