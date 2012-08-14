package com.appspot.angge3.business;

import com.appspot.angge3.dao.UserDao;
import com.appspot.angge3.util.MD5;

public class UserRegister {
	public void registerUser(String email,String password){
		UserDao userDao = new UserDao();
		userDao.insertUserEntity(email, MD5.md(password));
	}
}
