package com.appspot.angge3.business;

import java.util.List;

import com.appspot.angge3.dao.ArticleDao;
import com.google.appengine.api.datastore.Entity;

public class ArticleFetcher {
	public List<Entity> getArticlesByOwnerId(long ownerId,int offset,int limitNum){
		ArticleDao articleDao = new ArticleDao();
		return articleDao.getArticlesByOwnerId(ownerId, offset, limitNum);
	}
	public int getArticlesCountByOwnerIdAndCategoryId(long ownerId,long categoryId){
		ArticleDao articleDao = new ArticleDao();
		return articleDao.getArticlesByOwnerIdAndCategoryId(ownerId, categoryId).size();
	}
}
