package com.appspot.angge3.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.appspot.angge3.business.FileFetcher;
import com.appspot.angge3.model.File;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Blob;
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
			resp.setContentType((String)fileEntity.getProperty(File.CONTENT_TYPE));
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
	
}
