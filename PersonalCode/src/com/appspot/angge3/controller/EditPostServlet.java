package com.appspot.angge3.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.angge3.business.ArticleFetcher;
import com.appspot.angge3.business.ArticlePoster;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.Text;

public class EditPostServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		long articleId = Long.parseLong(req.getParameter("articleId"));
		ArticleFetcher fetcher = new ArticleFetcher();
		try {
			Entity article = fetcher.getArticleById(articleId);
			req.getSession().setAttribute("currentArticle", article);
			resp.sendRedirect("./post/editPost.jsp");
		} catch (EntityNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String title = req.getParameter("title");
		long articleId = Long.parseLong(req.getParameter("articleId"));
		long categoryId = Long.parseLong((req.getParameter("category")));
		Text content = new Text(req.getParameter("content"));
		ArticlePoster poster = new ArticlePoster();
		poster.updateArticle(title, categoryId, content, new Date(),  (Long)(req.getSession().getAttribute("currentUserId")), articleId);
		resp.sendRedirect("./post/allPosts.jsp");
	}
	
}
