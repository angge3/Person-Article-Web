package com.appspot.angge3.dao;

import java.util.Date;

import com.appspot.angge3.model.Article;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Transaction;

public class ArticleDao {
	public void insertArticleEntity(String title,long categoryId,String content,Date date,long ownerId) {
		DatastoreService datastore = DatastoreServiceFactory
				.getDatastoreService();
		Transaction txn = datastore.beginTransaction();
		try {
			Entity article = new Entity(Article.KIND_NAME, Article.ANCESTOR_KEY);
			article.setProperty(Article.TITLE,title);
			article.setProperty(Article.CONTENT,content);
			article.setProperty(Article.CATEGORY_ID,categoryId);
			article.setProperty(Article.DATE, date);
			article.setProperty(Article.OWNER_ID, ownerId);
			datastore.put(article);
			txn.commit();
		} finally {
			if (txn.isActive()) {
				txn.rollback();
			}
		}
	}
}
