package com.appspot.angge3.dao;

import java.util.Date;

import com.appspot.angge3.model.PasswordResetToken;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Transaction;
import com.google.appengine.api.datastore.Query.CompositeFilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;

public class PasswordResetTokenDao {
	public void insertNewToken(String email,String tokenStr){
		DatastoreService datastore = DatastoreServiceFactory
				.getDatastoreService();
		Transaction txn = datastore.beginTransaction();
		try {
			Entity token = new Entity(PasswordResetToken.KIND_NAME, PasswordResetToken.ANCESTOR_KEY);
			token.setProperty(PasswordResetToken.EMAIL,email);
			token.setProperty(PasswordResetToken.TOKEN,tokenStr);
			token.setProperty(PasswordResetToken.BEGIN_DATE,new Date().getTime());
			token.setProperty(PasswordResetToken.VALID, true);
			datastore.put(token);
			txn.commit();
		} finally {
			if (txn.isActive()) {
				txn.rollback();
			}
		}
	}
	
	public Entity getTokenByTokenstrAndEmail(String tokenStr,String email){
		DatastoreService datastore = DatastoreServiceFactory
				.getDatastoreService();
		Query q = new Query(PasswordResetToken.KIND_NAME);
		q.setAncestor(PasswordResetToken.ANCESTOR_KEY);
		q.setFilter(CompositeFilterOperator.and(
				new FilterPredicate(PasswordResetToken.TOKEN,Query.FilterOperator.EQUAL, tokenStr),
				new FilterPredicate(PasswordResetToken.EMAIL,Query.FilterOperator.EQUAL, email),
				new FilterPredicate(PasswordResetToken.VALID,Query.FilterOperator.EQUAL, true)
		));
		PreparedQuery pq = datastore.prepare(q);
		return pq.asSingleEntity();
	}
	
	public void updateToken(String email,String tokenStr,long beginDate,boolean valid,long id){
		DatastoreService datastore = DatastoreServiceFactory
				.getDatastoreService();
		Transaction txn = datastore.beginTransaction();
		try {
			Entity token = new Entity(PasswordResetToken.KIND_NAME, id,PasswordResetToken.ANCESTOR_KEY);
			token.setProperty(PasswordResetToken.EMAIL,email);
			token.setProperty(PasswordResetToken.TOKEN,tokenStr);
			token.setProperty(PasswordResetToken.BEGIN_DATE,beginDate);
			token.setProperty(PasswordResetToken.VALID, valid);
			datastore.put(token);
			txn.commit();
		} finally {
			if (txn.isActive()) {
				txn.rollback();
			}
		}
	}
}
