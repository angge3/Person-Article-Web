package com.appspot.angge3.dao;

import com.appspot.angge3.model.User;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.CompositeFilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.datastore.Transaction;

public class UserDao {
	public Entity getEntityByEmailAndPassword(String email,
			String passwordDigest) {
		DatastoreService datastore = DatastoreServiceFactory
				.getDatastoreService();
		Query q = new Query(User.KIND_NAME);
		q.setAncestor(User.ANCESTOR_KEY);
		q.setFilter(CompositeFilterOperator.and(new FilterPredicate(
				User.USER_EMAIL, Query.FilterOperator.EQUAL, email),
				new FilterPredicate(User.PASSWORD,
						Query.FilterOperator.EQUAL, passwordDigest)));
		PreparedQuery pq = datastore.prepare(q);
		return pq.asSingleEntity();// if no match return null
	}

	public Entity getEntityByEmail(String email) {
		DatastoreService datastore = DatastoreServiceFactory
				.getDatastoreService();
		Query q = new Query(User.KIND_NAME);
		q.setAncestor(User.ANCESTOR_KEY);
		q.setFilter(new FilterPredicate(User.USER_EMAIL,
				Query.FilterOperator.EQUAL, email));
		PreparedQuery pq = datastore.prepare(q);
		return pq.asSingleEntity();
	}

	public void insertUserEntity(String email, String passwordDigest) {
		DatastoreService datastore = DatastoreServiceFactory
				.getDatastoreService();
		Transaction txn = datastore.beginTransaction();
		try {
			Entity user = new Entity(User.KIND_NAME, User.ANCESTOR_KEY);
			user.setProperty(User.USER_EMAIL,email);
			user.setProperty(User.PASSWORD, passwordDigest);
			datastore.put(user);
			txn.commit();
		} finally {
			if (txn.isActive()) {
				txn.rollback();
			}
		}
	}
}
