package com.appspot.angge3.model;

import com.google.appengine.api.datastore.*;

public final class Article {
	public static final Key ANCESTOR_KEY = KeyFactory.createKey("Articles", "articles");
	public static final String KIND_NAME = "Article";
	public static final String TITLE = "title";
	public static final String CONTENT = "content";
	public static final String DATE = "date";
	public static final String OWNER_ID = "ownerId";
	public static final String CATEGORY_ID = "categoryId";
}
