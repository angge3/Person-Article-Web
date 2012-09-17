package com.appspot.angge3.business;

import com.appspot.angge3.dao.PasswordResetTokenDao;
import com.appspot.angge3.model.PasswordResetToken;
import com.google.appengine.api.datastore.Entity;

public class TokenPoster {
	public void updateToken(String email,String token,boolean valid){
		PasswordResetTokenDao passwordResetDao = new PasswordResetTokenDao();
		Entity tokenEntity = passwordResetDao.getTokenByTokenstrAndEmail(token, email);
		passwordResetDao.updateToken(email, token, (Long)tokenEntity.getProperty(PasswordResetToken.BEGIN_DATE), valid, tokenEntity.getKey().getId());
	}
}		
