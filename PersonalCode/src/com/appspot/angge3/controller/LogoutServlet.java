package com.appspot.angge3.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		req.getSession().invalidate();
		Cookie cookie = new Cookie("email", null); 
		cookie.setMaxAge(0);
		resp.addCookie(cookie); 
		cookie = new Cookie("password",null);
		cookie.setMaxAge(0);
		resp.addCookie(cookie);
		resp.sendRedirect("./login.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req,resp);
	}
	
}
