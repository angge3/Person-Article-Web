package com.appspot.angge3.model;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

public class PasswordResetToken {
	public static final Key ANCESTOR_KEY = KeyFactory.createKey("Tokens", "tokens");
	public static final String KIND_NAME = "Token";
	public static final String EMAIL = "email";
	public static final String TOKEN = "token";
	public static final String BEGIN_DATE = "beginDate";
	public static final String VALID = "valid";
}
