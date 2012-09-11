package com.appspot.angge3.dao;

import java.util.List;

import com.appspot.angge3.model.Category;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.datastore.Transaction;

public class CategoryDao {
	public Entity getCategoryById(long categoryId) throws EntityNotFoundException {
		DatastoreService datastore = DatastoreServiceFactory
				.getDatastoreService();
		Entity category = datastore.get(KeyFactory.createKey(Category.ANCESTOR_KEY,Category.KIND_NAME,categoryId));
		return category;
	
	}
	
	public Entity insertCategory(String name,long ownerId){
		DatastoreService datastore = DatastoreServiceFactory
				.getDatastoreService();
		Transaction txn = datastore.beginTransaction();
		Entity category = null;
		try {
			category = new Entity(Category.KIND_NAME, Category.ANCESTOR_KEY);
			category.setProperty(Category.NAME,name);
			category.setProperty(Category.OWNER_ID, ownerId);
			datastore.put(category);
			txn.commit();
		} finally {
			if (txn.isActive()) {
				txn.rollback();
			}
		}
		return category;
	}
	
	public Entity updateCategory(String newName,long categoryId) throws EntityNotFoundException{
		Entity oldCategory = getCategoryById(categoryId);
		DatastoreService datastore = DatastoreServiceFactory
				.getDatastoreService();
		Transaction txn = datastore.beginTransaction();
		Entity category = null;
		try {
			category = new Entity(Category.KIND_NAME,categoryId, Category.ANCESTOR_KEY);
			category.setProperty(Category.NAME,newName);
			category.setProperty(Category.OWNER_ID,oldCategory.getProperty(Category.OWNER_ID) );
			datastore.put(category);
			txn.commit();
		} finally {
			if (txn.isActive()) {
				txn.rollback();
			}
		}
		return category;
	}
	
	public List<Entity> getAllCategoryByOwnerId(long ownerId){
		DatastoreService datastore = DatastoreServiceFactory
				.getDatastoreService();
		Query q = new Query(Category.KIND_NAME);
		q.setAncestor(Category.ANCESTOR_KEY);
		q.setFilter(new FilterPredicate(Category.OWNER_ID,
				Query.FilterOperator.EQUAL, ownerId));
		PreparedQuery pq = datastore.prepare(q);
		return pq.asList(FetchOptions.Builder.withDefaults());
	}
	
	public boolean deleteCategoryById(long categoryId){
		DatastoreService datastore = DatastoreServiceFactory
				.getDatastoreService();
		Transaction txn = datastore.beginTransaction();
		try {
			datastore.delete(KeyFactory.createKey(Category.ANCESTOR_KEY, Category.KIND_NAME, categoryId));
			txn.commit();
		} finally {
			if (txn.isActive()) {
				txn.rollback();
				return false;
			}
		}
		return true;
	}
}
