package com.appspot.angge3.business;

import java.util.Iterator;
import java.util.List;

import com.appspot.angge3.dao.ArticleDao;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;

public class ArticleFetcher {
	public List<Entity> getArticlesByOwnerId(long ownerId,int offset,int limitNum){
		ArticleDao articleDao = new ArticleDao();
		return articleDao.getArticlesByOwnerId(ownerId, offset, limitNum);
	}
	
	public List<Entity> getArticlesByOwnerIdAndCategoryId(long ownerId,long categoryId,int offset,int limitNum){
		ArticleDao articleDao = new ArticleDao();
		return articleDao.getArticlesByOwnerIdAndCategoryId(ownerId, categoryId,offset, limitNum);
	}
	
	public int getArticlesCountByOwnerIdAndCategoryId(long ownerId,long categoryId){
		ArticleDao articleDao = new ArticleDao();
		return articleDao.getArticlesByOwnerIdAndCategoryId(ownerId, categoryId).size();
	}
	
	public Entity getArticleById(long articleId) throws EntityNotFoundException{
		ArticleDao articleDao = new ArticleDao();
		return articleDao.getArticleById(articleId);
	}
	
	public Entity getNextArticle(long currentArticleId,long ownerId){
		ArticleDao articleDao = new ArticleDao();
		List<Entity> articleListAsc = articleDao.getAllArticlesByOwnerIdAsc(ownerId);
		Iterator<Entity> itr = articleListAsc.iterator();
		while(itr.hasNext()){
			Entity temp = itr.next();
			if(temp.getKey().getId()==currentArticleId){
				if(itr.hasNext()){
					return itr.next();
				}else{
					return null;
				}
			}
		}
		return null;
	}
	
	public Entity getPriorArticle(long currentArticleId,long ownerId){
		ArticleDao articleDao = new ArticleDao();
		List<Entity> articleListDesc = articleDao.getAllArticlesByOwnerIdDesc(ownerId);
		Iterator<Entity> itr = articleListDesc.iterator();
		while(itr.hasNext()){
			Entity temp = itr.next();
			if(temp.getKey().getId()==currentArticleId){
				if(itr.hasNext()){
					return itr.next();
				}else{
					return null;
				}
			}
		}
		return null;
	}
}
