package com.appspot.angge3.business;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.appspot.angge3.dao.PasswordResetTokenDao;
import com.google.appengine.api.datastore.Entity;

public class EmailSender {
	public void sendEmail(String toEmail,String resetPasswordToken) throws UnsupportedEncodingException{
		
		PasswordResetTokenDao passwordResetTokenDao = new PasswordResetTokenDao();
		Entity temp = passwordResetTokenDao.getTokenByEmail(toEmail);
		if(temp==null){
			passwordResetTokenDao.insertNewToken(toEmail, resetPasswordToken);
		}else{
			passwordResetTokenDao.updateToken(toEmail, resetPasswordToken, new Date().getTime(), true, temp.getKey().getId());
		}
		
		 Properties props = new Properties();
		 Session session = Session.getDefaultInstance(props, null);
		 String msgBody = "Click <a href=\""+"http://angge3.appspot.com/setNewPassword?email="+toEmail+"&token="+resetPasswordToken+"\">here</a> to reset your password.";
		 try {
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress("angge3@gmail.com", "Personal Code Admin"));
			msg.addRecipient(Message.RecipientType.TO,new InternetAddress(toEmail));
			Multipart mainPart = new MimeMultipart();   
		    BodyPart html = new MimeBodyPart();   
		    html.setContent(msgBody, "text/html; charset=utf-8");   
		    mainPart.addBodyPart(html);   
		    msg.setContent(mainPart); 
			msg.setSubject("Reset your password on Personal Code Web Site");
			Transport.send(msg);
			
		} catch (AddressException e) {
				e.printStackTrace();
		} catch (MessagingException e) {
				e.printStackTrace();
		}
		;
	}
}
