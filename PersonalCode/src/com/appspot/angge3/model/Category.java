package com.appspot.angge3.model;

import com.google.appengine.api.datastore.*;

public final class Category {
	public static final Key ANCESTOR_KEY = KeyFactory.createKey("Categorys", "categorys");
	public static final String KIND_NAME = "Category";
	public static final String NAME = "name";
	public static final String OWNER_ID = "ownerId";
}
