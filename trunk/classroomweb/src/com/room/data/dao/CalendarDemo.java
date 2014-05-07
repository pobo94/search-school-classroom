package com.room.data.dao;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.room.data.tools.Helper;

public class CalendarDemo {

	public static void main(String[] args) {
		
		Calendar calendar=Calendar.getInstance();
		//Date date=calendar.getTime();
		calendar.set(2014, 4, 5);
		//格式日期显示的样式
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
		System.out.println(format.format(calendar.getTime()));
		
		///获取日期中对应的年月日时分秒
		int year =calendar.get(Calendar.YEAR); 
		int month=calendar.get(Calendar.MONTH)+1; 
		int day =calendar.get(Calendar.DAY_OF_MONTH); 
		int hour =calendar.get(Calendar.HOUR_OF_DAY); 
		int minute =calendar.get(Calendar.MINUTE); 
		int seconds =calendar.get(Calendar.SECOND);
		
		//显示一个星期中的七天对应的值：
		System.out.println("星期日："+Calendar.SUNDAY);
		System.out.println("星期一："+Calendar.MONDAY);
		System.out.println("星期二："+Calendar.TUESDAY);
		System.out.println("星期三："+Calendar.WEDNESDAY);
		System.out.println("星期四："+Calendar.THURSDAY);
		System.out.println("星期五："+Calendar.FRIDAY);
		System.out.println("星期六："+Calendar.SATURDAY);
		System.out.println("星期"+calendar.get(Calendar.DAY_OF_WEEK));
		
		//显示日期中对应的年月日时分秒及星期
		System.out.println("年："+year);
		System.out.println("月："+month);
		System.out.println("日："+day);
		System.out.println("时："+hour);
		System.out.println("分："+minute);
		System.out.println("秒："+seconds);
		System.out.println("年："+Calendar.WEEK_OF_YEAR);

		//Date dt=new Date();
		String weekDay=getWeekOfDate(calendar.getTime());
		System.out.println("今天是："+weekDay);
		
		Date date=Helper.getCurrentDateTime();
		String weekDay1=getWeekOfDate(date);
		System.out.println("当前日期为："+weekDay1);
	}
	
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
