package com.appspot.angge3.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;


import com.appspot.angge3.business.FilePoster;



public class UploadFileServlet extends HttpServlet{

	private String getError(String message) {
		JSONObject obj = new JSONObject();
		obj.put("error", 1);
		obj.put("message", message);
		return obj.toString();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		

		//定义允许上传的文件扩展名
		HashMap<String, String> extMap = new HashMap<String, String>();
		extMap.put("image", "gif,jpg,jpeg,png,bmp");
		extMap.put("flash", "swf,flv");
		extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
		extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");

		//最大文件大小
		long maxSize = 1000000;

		resp.setContentType("text/html; charset=UTF-8");

		if(!ServletFileUpload.isMultipartContent(req)){
			resp.getOutputStream().println(getError("Please select file."));
			return;
		}
		
		String dirName = req.getParameter("dir");
	
		ServletFileUpload upload = new ServletFileUpload();
		upload.setHeaderEncoding("UTF-8");
		FileItemIterator items = null;
		try {
			items = upload.getItemIterator(req);
			while (items.hasNext()) {
				
				Object temp =  items.next();
				FileItemStream item = (FileItemStream)temp;
				
				String fileName = item.getName();
				InputStream stream = item.openStream();
				if (!item.isFormField()) {
					byte content[] = IOUtils.toByteArray(stream);
					//检查文件大小
					if(content.length > maxSize){
						resp.getOutputStream().println(getError("File is too large."));
						return;
					}
					//检查扩展名
					String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
					if(!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)){
					    resp.getOutputStream().println(getError("File type unsupported.\nOnly support " + extMap.get(dirName) + " files."));
						return;
					}

					long fileId = new FilePoster().uploadFile(fileName, content,item.getContentType());
					

					JSONObject obj = new JSONObject();
					obj.put("error", 0);
					obj.put("url", "/getFile?fileId="+fileId);
					resp.getOutputStream().println(obj.toString());
				}
			
			}
		} catch (FileUploadException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			resp.getOutputStream().println(getError("Upload File Error."));
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req,resp);
	}

}
