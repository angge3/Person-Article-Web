package com.appspot.angge3.business;

import com.appspot.angge3.dao.UserDao;
import com.appspot.angge3.util.MD5;
import com.google.appengine.api.datastore.Entity;

public class UserRegister {
	public Entity registerUser(String email,String password){
		UserDao userDao = new UserDao();
		return userDao.insertUserEntity(email, MD5.md(password));
	}
	public void updateUser(long userId,String email,String password){
		UserDao userDao = new UserDao();
		userDao.updateUserEntity(userId,email, MD5.md(password));
	}
}
