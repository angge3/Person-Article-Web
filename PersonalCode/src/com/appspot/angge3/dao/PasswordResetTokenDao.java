package com.appspot.angge3.dao;

import java.util.Date;

import com.appspot.angge3.model.PasswordResetToken;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Transaction;

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
}
