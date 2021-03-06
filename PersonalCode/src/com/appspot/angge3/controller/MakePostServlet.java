package com.appspot.angge3.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.angge3.business.ArticlePoster;
import com.google.appengine.api.datastore.Text;

public class MakePostServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String title = req.getParameter("title");
		long categoryId = Long.parseLong((req.getParameter("category")));
		Text content = new Text(req.getParameter("content"));
		ArticlePoster poster = new ArticlePoster();
		poster.postArticle(title, categoryId, content, new Date(), (Long)(req.getSession().getAttribute("currentUserId")));
		resp.sendRedirect("./post/allPosts.jsp");
	}
	
}
