package com.appspot.angge3.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.angge3.dao.ArticleDao;
import com.google.appengine.api.datastore.Entity;

public class AllPostServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		long ownerId = (Long)req.getSession().getAttribute("currentUserId");
		int page = Integer.parseInt(req.getParameter("page"));
		int limitNum = Integer.parseInt(req.getParameter("limitNum"));
		ArticleDao articleDao = new ArticleDao();
		List<Entity> postsList = articleDao.getArticlesByOwnerId(ownerId, (page-1)*limitNum, limitNum);
		req.getSession().setAttribute("postsList", postsList);
		resp.sendRedirect("./post/allPosts.jsp");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req,resp);
	}
	
}
