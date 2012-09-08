package com.appspot.angge3.business;

import com.appspot.angge3.dao.UserDao;
import com.google.appengine.api.datastore.Entity;

public class UserInfoFetcher {
	public Entity getUserByEmail(String email){
		UserDao userDao = new UserDao();
		Entity user = userDao.getEntityByEmail(email);
		return user;
	}
}
