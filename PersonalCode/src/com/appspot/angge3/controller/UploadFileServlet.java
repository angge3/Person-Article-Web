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
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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
		
		

		//���������ϴ����ļ���չ��
		HashMap<String, String> extMap = new HashMap<String, String>();
		extMap.put("image", "gif,jpg,jpeg,png,bmp");
		extMap.put("flash", "swf,flv");
		extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
		extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");

		//����ļ���С
		long maxSize = 1000000;

		resp.setContentType("text/html; charset=UTF-8");

		if(!ServletFileUpload.isMultipartContent(req)){
			resp.getOutputStream().println(getError("��ѡ���ļ���"));
			return;
		}
		
		String dirName = req.getParameter("dir");

		FileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("UTF-8");
		List items = null;
		try {
			items = upload.parseRequest(req);
		} catch (FileUploadException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Iterator itr = items.iterator();
		while (itr.hasNext()) {
			Object temp =  itr.next();
			FileItem item = (FileItem)temp;
			String fileName = item.getName();
			long fileSize = item.getSize();
			InputStream stream = item.getInputStream();
			if (!item.isFormField()) {
				//����ļ���С
				if(item.getSize() > maxSize){
					resp.getOutputStream().println(getError("�ϴ��ļ���С�������ơ�"));
					return;
				}
				//�����չ��
				String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
				if(!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)){
				    resp.getOutputStream().println(getError("�ϴ��ļ���չ���ǲ��������չ����\nֻ����" + extMap.get(dirName) + "��ʽ��"));
					return;
				}

				long fileId = 0;
				try{
					BufferedReader reader = new BufferedReader(new InputStreamReader(stream));
					String content = "";
					String line = "";
					while((line = reader.readLine())!=null){
						content+=line;
					}
					System.out.println(content);
					fileId = new FilePoster().uploadFile(fileName,content);
				}catch(Exception e){
					resp.getOutputStream().println(getError("�ϴ��ļ�ʧ�ܡ�"));
					return;
				}

				JSONObject obj = new JSONObject();
				obj.put("error", 0);
				obj.put("url", "/getFile?fileId="+fileId);
				resp.getOutputStream().println(obj.toString());
			}
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(req,resp);
	}

}
