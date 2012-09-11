package com.appspot.angge3.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.angge3.business.CategoryFetcher;
import com.google.appengine.api.datastore.Entity;

public class AllCategoryServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(req.getSession().getAttribute("currentUserId")==null){
			resp.sendRedirect("./login.jsp");
		}else{
			CategoryFetcher fetcher = new CategoryFetcher();
			long ownerId = (Long)req.getSession().getAttribute("currentUserId");
			List<Entity> allCategoryList = fetcher.getAllCategoryByOwnerId(ownerId);
			req.getSession().setAttribute("allCategoryList", allCategoryList);
			resp.sendRedirect("./category/manageCategory.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req,resp);
	}

}
