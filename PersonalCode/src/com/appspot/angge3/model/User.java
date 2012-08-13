package com.appspot.angge3.model;

import com.google.appengine.api.datastore.*;

public final class User {
	public static final Key ANCESTOR_KEY = KeyFactory.createKey("Users","users");
	public static final String KIND_NAME = "User";
	public static final String USER_EMAIL = "userEmail";
	public static final String PASSWORD = "password";
}
