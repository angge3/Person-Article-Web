package com.appspot.angge3.business;

import java.util.Date;

import com.appspot.angge3.dao.ArticleDao;
import com.google.appengine.api.datastore.Text;

public class ArticlePoster {
	public void postArticle(String title,long categoryId,Text content,Date date,long ownerId){
		ArticleDao articleDao = new ArticleDao();
		articleDao.insertArticleEntity(title, categoryId, content, date, ownerId);
	}
	
	public void deleteArticle(long articleId){
		ArticleDao articleDao = new ArticleDao();
		articleDao.deleteArticleById(articleId);
	}
	
	public void updateArticle(String title,long categoryId,Text content,Date date,long ownerId,long articleId){
		ArticleDao articleDao = new ArticleDao();
		articleDao.updateArticleEntity(title, categoryId, content, date, ownerId, articleId);
		
	}
}
