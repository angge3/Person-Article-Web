package com.appspot.angge3.business;

import java.io.UnsupportedEncodingException;
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

public class EmailSender {
	public void sendEmail(String toEmail,String resetPasswordToken) throws UnsupportedEncodingException{
		
		 new PasswordResetTokenDao().insertNewToken(toEmail, resetPasswordToken);
		 Properties props = new Properties();
		 Session session = Session.getDefaultInstance(props, null);
		 String msgBody = "Click <a href=\""+"http://localhost:8888/password/setNewPassword.jsp?email="+toEmail+"&token="+resetPasswordToken+"\">here</a> to reset your password.";
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
