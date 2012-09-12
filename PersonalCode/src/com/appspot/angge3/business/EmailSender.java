package com.appspot.angge3.business;

import com.appspot.angge3.dao.PasswordResetTokenDao;
import com.appspot.angge3.util.email.MailSenderInfo;
import com.appspot.angge3.util.email.SimpleMailSender;

public class EmailSender {
	public void sendEmail(String toEmail,String resetPasswordToken){
		
		 new PasswordResetTokenDao().insertNewToken(toEmail, resetPasswordToken);
		 MailSenderInfo mailInfo = new MailSenderInfo();   
	     mailInfo.setMailServerHost("smtp.163.com");   
	     mailInfo.setMailServerPort("25");   
	     mailInfo.setValidate(true);   
	     mailInfo.setUserName("angge33@163.com");   
	     mailInfo.setPassword("081251011");
	     mailInfo.setFromAddress("angge33@163.com");   
	     mailInfo.setToAddress(toEmail);   
	     mailInfo.setSubject("Reset your password on Personal Code Web Site");   
	     mailInfo.setContent("Click <a href=\""+"http://localhost:8888/password/resetPassword.jsp?email="+toEmail+"token="+resetPasswordToken+"\">here</a> to reset your password.");   
	     SimpleMailSender sms = new SimpleMailSender();  
	     sms.sendTextMail(mailInfo);
	     sms.sendHtmlMail(mailInfo);
	}
}
