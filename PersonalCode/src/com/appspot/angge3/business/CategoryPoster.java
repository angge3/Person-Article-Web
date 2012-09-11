package com.appspot.angge3.business;

import com.appspot.angge3.dao.CategoryDao;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;

public class CategoryPoster {
	public Entity insertCategory(String categoryName,long ownerId){
		CategoryDao categoryDao = new CategoryDao();
		return categoryDao.insertCategory(categoryName,ownerId);
	}
	public Entity updateCategory(String newName,long categoryId) throws EntityNotFoundException{
		CategoryDao categoryDao = new CategoryDao();
		return categoryDao.updateCategory(newName, categoryId);
	}
	public boolean deleteCategory(long categoryId){
		CategoryDao categoryDao = new CategoryDao();
		return categoryDao.deleteCategoryById(categoryId);
	}
}
