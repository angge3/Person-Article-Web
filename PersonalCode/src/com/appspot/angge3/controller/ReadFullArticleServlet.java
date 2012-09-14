package com.appspot.angge3.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.angge3.business.ArticleFetcher;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;

public class ReadFullArticleServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		long articleId = Long.parseLong(req.getParameter("articleId"));
		try {
			Entity article = new ArticleFetcher().getArticleById(articleId);
			Entity nextArticle = new ArticleFetcher().getNextArticle(articleId, (Long)req.getSession().getAttribute("currentUserId"));
			if(nextArticle!=null){
				req.getSession().setAttribute("nextArticle", nextArticle);
			}
			Entity priorArticle = new ArticleFetcher().getPriorArticle(articleId, (Long)req.getSession().getAttribute("currentUserId"));
			if(priorArticle!=null){
				req.getSession().setAttribute("priorArticle", priorArticle);
			}
			req.getSession().setAttribute("article", article);
			resp.sendRedirect("./post/readFullArticle.jsp");
		} catch (EntityNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}

}
