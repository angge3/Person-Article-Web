package com.appspot.angge3.business;

import java.util.Date;

import com.appspot.angge3.dao.ArticleDao;
import com.google.appengine.api.datastore.Text;

public class ArticlePoster {
	public void postArticle(String title,long categoryId,Text content,Date date,long ownerId){
		ArticleDao articleDao = new ArticleDao();
		articleDao.insertArticleEntity(title, categoryId, content, date, ownerId);
	}
}
