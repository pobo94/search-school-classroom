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
    //修改日期显示格式
    public static String changeTime(Date date){
    	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	return format.format(date);
    }
    
  //修改日期显示格式
    public static String changeSimpleTime(Date date){
    	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
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
    //字符串转换为整型
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
    //获取当前日期中的星期
    public static String getWeekOfDate(Date dt) {
        String[] weekDays = {"星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"};
        Calendar cal = Calendar.getInstance();
        cal.setTime(dt);

        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
        if (w < 0)
            w = 0;

        return weekDays[w];
    }
}
