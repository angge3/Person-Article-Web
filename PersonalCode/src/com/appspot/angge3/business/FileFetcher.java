package com.appspot.angge3.business;

import com.appspot.angge3.dao.FileDao;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;

public class FileFetcher {
	public Entity getFile(long fileId) throws EntityNotFoundException{
		FileDao fileDao = new FileDao();
		return fileDao.getFileEntity(fileId);
	}
}
