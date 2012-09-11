package com.appspot.angge3.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.angge3.business.CategoryPoster;
import com.google.appengine.api.datastore.EntityNotFoundException;

public class UpdateCategoryServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String newName = req.getParameter("newName");
		long categoryId = Long.parseLong(req.getParameter("categoryId"));
		CategoryPoster poster = new CategoryPoster();
		try {
			poster.updateCategory(newName, categoryId);
			resp.getWriter().write("1");
		} catch (EntityNotFoundException e) {
			// TODO Auto-generated catch block
			resp.getWriter().write("-1");
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req,resp);
	}
	
}
