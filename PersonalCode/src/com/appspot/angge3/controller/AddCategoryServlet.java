package com.appspot.angge3.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.angge3.business.CategoryPoster;
import com.google.appengine.api.datastore.Entity;

public class AddCategoryServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(req.getSession().getAttribute("currentUserId")==null){
			resp.sendRedirect("login.jsp");
		}else{
			String categoryName = req.getParameter("categoryName");
			if(categoryName!=null){
				long ownerId = (Long)req.getSession().getAttribute("currentUserId");
				CategoryPoster poster = new CategoryPoster();
				if(poster.isExist(categoryName,(Long)req.getSession().getAttribute("currentUserId"))){
					resp.getWriter().write("-2");
				}else{
					Entity category = poster.insertCategory(categoryName, ownerId);
					List<Entity> allCategoryList = (List<Entity>)req.getSession().getAttribute("allCategoryList");
					allCategoryList.add(category);
					req.getSession().setAttribute("allCategoryList", allCategoryList);
					resp.getWriter().write(category.getKey().getId()+"");
				}
				
			}else{
				resp.getWriter().write("-1");
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req,resp);
	}
	
}
