package com.appspot.angge3.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.mail.internet.MimeUtility;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.angge3.business.FileFetcher;
import com.appspot.angge3.model.File;
import com.google.appengine.api.datastore.Blob;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;

public class GetFileServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		long fileId = Long.parseLong(req.getParameter("fileId"));
		try {
			Entity fileEntity = new FileFetcher().getFile(fileId);
			Blob temp = (Blob)fileEntity.getProperty(File.CONTENT);
			String fileName = (String)fileEntity.getProperty(File.TITLE);
			resp.setContentType((String)fileEntity.getProperty(File.CONTENT_TYPE)+";charset=UTF-8");
			fileName = getDownLoadFileName(req,fileName);
			resp.setHeader("Content-Disposition", "attachment;"+fileName);
			resp.getOutputStream().write((temp.getBytes()));
		
		} catch (EntityNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req, resp);
	}
	
	private String getDownLoadFileName(HttpServletRequest request,String filename) {  
        String new_filename = null;  
        try {  
            new_filename = URLEncoder.encode(filename, "UTF8");  
        } catch (UnsupportedEncodingException e1) {  
            e1.printStackTrace();  
        }  
        String userAgent = request.getHeader("User-Agent");  
        // System.out.println(userAgent);  
        String rtn = "filename=\"" + new_filename + "\"";  
        // ���û��UA����Ĭ��ʹ��IE�ķ�ʽ���б��룬��Ϊ�Ͼ�IE����ռ������  
        if (userAgent != null) {  
            userAgent = userAgent.toLowerCase();  
            // IE�������ֻ�ܲ���URLEncoder����  
            if (userAgent.indexOf("msie") != -1) {  
                rtn = "filename=\"" + new_filename + "\"";  
            }  
            // Opera�����ֻ�ܲ���filename*  
            else if (userAgent.indexOf("opera") != -1) {  
                rtn = "filename*=UTF-8''" + new_filename;  
            }  
            // Safari�������ֻ�ܲ���ISO������������  
            else if (userAgent.indexOf("safari") != -1) {  
                try {  
                    rtn = "filename=\""  
                            + new String(filename.getBytes("UTF-8"),  
                                    "ISO8859-1") + "\"";  
                } catch (UnsupportedEncodingException e) {  
                    e.printStackTrace();  
                }  
            }  
            // Chrome�������ֻ�ܲ���MimeUtility�����ISO������������  
            else if (userAgent.indexOf("applewebkit") != -1) {  
                try {  
                    new_filename = MimeUtility  
                            .encodeText(filename, "UTF8", "B");  
                } catch (UnsupportedEncodingException e) {  
                    e.printStackTrace();  
                }  
                rtn = "filename=\"" + new_filename + "\"";  
            }  
            // FireFox�����������ʹ��MimeUtility��filename*��ISO������������  
            else if (userAgent.indexOf("mozilla") != -1) {  
                rtn = "filename*=UTF-8''" + new_filename;  
            }  
        }  
        return rtn;  
    }  
	
}
