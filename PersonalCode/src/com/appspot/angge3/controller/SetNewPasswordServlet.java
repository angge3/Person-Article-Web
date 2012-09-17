package com.appspot.angge3.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.angge3.business.TokenPoster;
import com.appspot.angge3.business.TokenValidator;
import com.appspot.angge3.business.UserInfoFetcher;
import com.appspot.angge3.business.UserRegister;
import com.google.appengine.api.datastore.Entity;

public class SetNewPasswordServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String tokenStr = req.getParameter("token");
		String email = req.getParameter("email");
		if(tokenStr == null||email==null){
			resp.sendRedirect("./login.jsp");
		}else{
			if(new TokenValidator().validateToken(tokenStr, email)){
				resp.sendRedirect("./password/setNewPassword.jsp?token="+tokenStr+"&email="+email);
			}else{
				resp.sendRedirect("./errorInfo/errorInfo.jsp?errorTitle=Password reset url overdue&errorContent=Password reset url is overdue. Please get password reset url again.");
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = req.getParameter("email");
		String newPass = req.getParameter("newPassword");
		String token = req.getParameter("token");
		Entity user = new UserInfoFetcher().getUserByEmail(email);
		new UserRegister().updateUser(user.getKey().getId(), email, newPass);
		new TokenPoster().updateToken(email, token, false);
		resp.getWriter().write("1");
	}
	
}
