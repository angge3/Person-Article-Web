package com.appspot.angge3.business;

import com.appspot.angge3.dao.CategoryDao;
import com.appspot.angge3.model.Category;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;

public class CategoryFetcher {
	public String getNameById(long categoryId) throws EntityNotFoundException{
		CategoryDao categoryDao = new CategoryDao();
		Entity category = categoryDao.getCategoryById(categoryId);
		return (String)category.getProperty(Category.NAME);
	}
}
