package com.appspot.angge3.business;

import com.appspot.angge3.dao.UserDao;
import com.appspot.angge3.util.MD5;
import com.google.appengine.api.datastore.Entity;

public class UserValidator {
	public  boolean validate(String email,String password){
		UserDao userDao = new UserDao();
		Entity user = userDao.getEntityByEmailAndPassword(email,MD5.md(password));
		return user!=null;
	}
	public  boolean validateEmail(String email){
		UserDao userDao = new UserDao();
		Entity user = userDao.getEntityByEmail(email);
		return user!=null;
	}
}
