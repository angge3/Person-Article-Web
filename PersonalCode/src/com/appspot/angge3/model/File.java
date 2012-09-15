package com.appspot.angge3.model;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

public final class File {
	public static final Key ANCESTOR_KEY = KeyFactory.createKey("Files", "files");
	public static final String KIND_NAME = "File";
	public static final String CONTENT = "content";
}
