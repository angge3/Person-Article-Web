package com.appspot.angge3.dao;

import com.appspot.angge3.model.Category;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.KeyFactory;

public class CategoryDao {
	public Entity getCategoryById(long categoryId) throws EntityNotFoundException {
		DatastoreService datastore = DatastoreServiceFactory
				.getDatastoreService();
		Entity category = datastore.get(KeyFactory.createKey(Category.KIND_NAME,categoryId));
		return category;
	
	}
}
