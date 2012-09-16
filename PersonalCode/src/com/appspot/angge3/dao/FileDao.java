package com.appspot.angge3.dao;

import com.appspot.angge3.model.File;
import com.google.appengine.api.datastore.Blob;
import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Transaction;

public class FileDao {
	public long insertFileEntity(String fileName,String content){
		DatastoreService datastore = DatastoreServiceFactory
				.getDatastoreService();
		Transaction txn = datastore.beginTransaction();
		long id = 0;
		try {
			Entity file = new Entity(File.KIND_NAME, File.ANCESTOR_KEY);
			file.setProperty(File.CONTENT, new Blob(content.getBytes()));
			file.setProperty(File.TITLE, fileName);
			datastore.put(file);
			txn.commit();
			id =  file.getKey().getId();
		} finally {
			if (txn.isActive()) {
				txn.rollback();
				id = 0;
			}
		}
		
		return id;
	}
	
	public Entity getFileEntity(long fileId) throws EntityNotFoundException{
		DatastoreService datastore = DatastoreServiceFactory
				.getDatastoreService();
		return datastore.get(KeyFactory.createKey(File.ANCESTOR_KEY, File.KIND_NAME, fileId));
	}
}
