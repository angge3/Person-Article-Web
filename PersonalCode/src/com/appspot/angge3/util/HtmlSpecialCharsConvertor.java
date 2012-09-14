package com.appspot.angge3.util;

public class HtmlSpecialCharsConvertor {
	public static String htmlspecialchars(String str){
		str = str.replaceAll("&", "&amp;");
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		str = str.replaceAll("\"", "&quot;");
		return str;
	}
}
