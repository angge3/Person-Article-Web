package com.appspot.angge3.business;

import java.util.List;

import com.appspot.angge3.dao.CategoryDao;
import com.appspot.angge3.model.Article;
import com.appspot.angge3.model.Category;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.datastore.Query.SortDirection;

public class CategoryFetcher {
	public String getNameById(long categoryId) throws EntityNotFoundException{
		CategoryDao categoryDao = new CategoryDao();
		Entity category = categoryDao.getCategoryById(categoryId);
		return (String)category.getProperty(Category.NAME);
	}
	
	public List<Entity> getAllCategoryByOwnerId(long ownerId){
		CategoryDao categoryDao = new CategoryDao();
		return categoryDao.getAllCategoryByOwnerId(ownerId);
	}
}
