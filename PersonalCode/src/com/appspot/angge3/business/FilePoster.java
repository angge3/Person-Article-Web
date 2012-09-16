package com.appspot.angge3.business;

import com.appspot.angge3.dao.FileDao;

public class FilePoster {
	public long uploadFile(String title,byte[] content,String contentType){
		return new FileDao().insertFileEntity(title,content,contentType);
	}
}
