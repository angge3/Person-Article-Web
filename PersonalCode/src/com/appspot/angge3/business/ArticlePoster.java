package com.appspot.angge3.business;

import java.util.Date;

import com.appspot.angge3.dao.ArticleDao;

public class ArticlePoster {
	public void postArticle(String title,long categoryId,String content,Date date,long ownerId){
		ArticleDao articleDao = new ArticleDao();
		articleDao.insertArticleEntity(title, categoryId, content, date, ownerId);
	}
}
