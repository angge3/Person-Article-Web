package com.appspot.angge3.business;

import java.util.Date;

import com.appspot.angge3.dao.PasswordResetTokenDao;
import com.appspot.angge3.model.PasswordResetToken;
import com.google.appengine.api.datastore.Entity;

public class TokenValidator {
	public boolean validateToken(String tokenStr,String email){
		PasswordResetTokenDao tokenDao = new PasswordResetTokenDao();
		Entity tokenEntity = tokenDao.getTokenByTokenstrAndEmail(tokenStr, email);
		if(tokenEntity==null){
			return false;
		}
		
		long begin = (Long)tokenEntity.getProperty(PasswordResetToken.BEGIN_DATE);
		long now = new Date().getTime();
		if(now-begin>3600000){
			tokenDao.updateToken((String)tokenEntity.getProperty(PasswordResetToken.EMAIL),(String)tokenEntity.getProperty(PasswordResetToken.TOKEN) , (Long)tokenEntity.getProperty(PasswordResetToken.BEGIN_DATE), false, tokenEntity.getKey().getId());
			return false;
		}else{
			return true;
		}
	}
}
