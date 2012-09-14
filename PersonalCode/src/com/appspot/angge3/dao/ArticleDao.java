package com.appspot.angge3.dao;

import java.util.Date;
import java.util.List;

import com.appspot.angge3.model.Article;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.CompositeFilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.datastore.Query.SortDirection;
import com.google.appengine.api.datastore.Text;
import com.google.appengine.api.datastore.Transaction;

public class ArticleDao {
	public void insertArticleEntity(String title,long categoryId,Text content,Date date,long ownerId) {
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
	
	public void updateArticleEntity(String title,long categoryId,Text content,Date date,long ownerId,long articleId) {
		DatastoreService datastore = DatastoreServiceFactory
				.getDatastoreService();
		Transaction txn = datastore.beginTransaction();
		try {
			Entity article = new Entity(KeyFactory.createKey(Article.ANCESTOR_KEY,Article.KIND_NAME,articleId));
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
	
	public List<Entity> getArticlesByOwnerId(long ownerId,int offset,int limitNum){
		DatastoreService datastore = DatastoreServiceFactory
				.getDatastoreService();
		Query q = new Query(Article.KIND_NAME).addSort(Article.DATE,SortDirection.DESCENDING);
		q.setAncestor(Article.ANCESTOR_KEY);
		q.setFilter(new FilterPredicate(Article.OWNER_ID,
				Query.FilterOperator.EQUAL, ownerId));
		PreparedQuery pq = datastore.prepare(q);
		return pq.asList(FetchOptions.Builder.withLimit(limitNum).offset(offset));
	}
	
	public List<Entity> getArticlesByOwnerIdAndCategoryId(long ownerId,long categoryId,int offset,int limitNum){
		DatastoreService datastore = DatastoreServiceFactory
				.getDatastoreService();
		Query q = new Query(Article.KIND_NAME).addSort(Article.DATE,SortDirection.DESCENDING);
		q.setAncestor(Article.ANCESTOR_KEY);
		q.setFilter(CompositeFilterOperator.and(
				new FilterPredicate(Article.OWNER_ID,Query.FilterOperator.EQUAL, ownerId),
				new FilterPredicate(Article.CATEGORY_ID,Query.FilterOperator.EQUAL, categoryId)
		));
		PreparedQuery pq = datastore.prepare(q);
		return pq.asList(FetchOptions.Builder.withLimit(limitNum).offset(offset));
	}
	
	public List<Entity> getArticlesByOwnerIdAndCategoryId(long ownerId,long categoryId){
		DatastoreService datastore = DatastoreServiceFactory
				.getDatastoreService();
		Query q = new Query(Article.KIND_NAME);
		q.setAncestor(Article.ANCESTOR_KEY);
		q.setFilter(CompositeFilterOperator.and(
				new FilterPredicate(Article.OWNER_ID,Query.FilterOperator.EQUAL, ownerId),
				new FilterPredicate(Article.CATEGORY_ID,Query.FilterOperator.EQUAL, categoryId)
		));
		PreparedQuery pq = datastore.prepare(q);
		return pq.asList(FetchOptions.Builder.withDefaults());
	}
	
	public void deleteArticleById(long articleId){
		DatastoreService datastore = DatastoreServiceFactory
				.getDatastoreService();
		Transaction txn = datastore.beginTransaction();
		try{
			datastore.delete(KeyFactory.createKey(Article.ANCESTOR_KEY, Article.KIND_NAME, articleId));
			txn.commit();
		}finally{
			if (txn.isActive()) {
				txn.rollback();
			}
		}
	}
	
	public Entity getArticleById(long articleId) throws EntityNotFoundException{
		DatastoreService datastore = DatastoreServiceFactory
				.getDatastoreService();
		return datastore.get(KeyFactory.createKey(Article.ANCESTOR_KEY, Article.KIND_NAME, articleId));
	}
}
