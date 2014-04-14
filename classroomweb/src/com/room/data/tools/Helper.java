package com.room.data.tools;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Helper {
	
    public static String changeHtml(String source){
		    String changeStr="";
		    changeStr=source.replace("&","&amp;");
		    changeStr=changeStr.replace("<","&lt;");
		    changeStr=changeStr.replace(">","&gt;");
		    changeStr=changeStr.replace("\r","");
		    changeStr=changeStr.replace("\n","");
		    return changeStr;
		    
	}
    
    public static String changeTime(Date date){
    	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	return format.format(date);
    }
    
    public static Date getCurrentDateTime(){
    	 Calendar calendar = Calendar.getInstance();
		 calendar.setTimeInMillis(System.currentTimeMillis());
		 return calendar.getTime();
    }
    
    public static String toChinese(String str){
    	if(str==null){
    		str="";
    	}
    	try {
			str=new String (str.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			str="";
			e.printStackTrace();
			e.printStackTrace();
		}
    	return str;
    }
    
    public static int strToint(String str){
    	if(str.equals("")||str==null){
    		str="0";
    	}
    	int i=0;
    	i=Integer.parseInt(str);
    	return i;
    }
    
    public static String toStr(String str){
    	if(str==null)
    		return "";
    	else
    		return str;
    }
}
