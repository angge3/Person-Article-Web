package com.appspot.angge3.util;

import java.util.Stack;

public class DigestConvertor {
	public static String completeDigest(String srcDigest){
		Stack<String> s = new Stack<String>();
		int first1 = srcDigest.indexOf("<");
		int first2 = srcDigest.indexOf("</");
		while(first1!=-1&&first2!=-1){
			if(first1<first2){
				int end = srcDigest.indexOf(">",first1);
				if(end==-1){
					srcDigest = srcDigest.substring(0,first1);
					break;
				}else{
					String temp = srcDigest.substring(first1+1,end);
					if(temp!="br"){
						s.push(temp);
					}
					first1 = srcDigest.indexOf("<", end);
					first2 = srcDigest.indexOf("</",end);
				}
			}else{
				int end = srcDigest.indexOf(">", first2);
				if(end==-1){
					srcDigest = srcDigest.substring(0, first2);
					break;
				}else{
					s.pop();
					first1 = srcDigest.indexOf("<",end);
					first2 = srcDigest.indexOf("</",end);
				}
			}
		}

		if(first1!=-1){
			String tailStr = srcDigest.substring(first1);
			int lt = tailStr.indexOf("<");
			int gt = tailStr.indexOf(">");
			while(lt!=-1&&gt!=-1){
				String temp = tailStr.substring(lt+1,gt);
				s.push(temp);
				lt = tailStr.indexOf("<",gt+1);
				gt = tailStr.indexOf(">",gt+1);
			}
			if(lt!=-1){
				tailStr = tailStr.substring(0,lt);
			}
			srcDigest = srcDigest.substring(0,first1)+tailStr;
		}
		while(!s.isEmpty()){
			srcDigest+="</"+s.pop()+">";
		}
		return srcDigest;
	}
}
