package com.appspot.angge3.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.angge3.business.EmailSender;
import com.appspot.angge3.util.MD5;

public class SendEmailServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String toEmail = req.getParameter("toEmail");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		new EmailSender().sendEmail(toEmail, MD5.md(toEmail+sdf.format(new Date())));
		resp.getWriter().write("1");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}

	
}
