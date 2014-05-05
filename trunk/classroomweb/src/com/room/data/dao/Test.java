package com.room.data.dao;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.room.data.model.Announcement;

public class Test {

	public static void main(String[] args) {
		
		DbConnection dbconn=new DbConnection();
		DbAnnouncement dbann=new DbAnnouncement(dbconn);
		Announcement announcement=null;
		List<Announcement> annlist=null;
//		//查看公告列表；
//		try {
//			annlist=dbann.getAnnList();
//			System.out.println("<table>");
//			 for (int i = 0; i < annlist.size(); i++) {
//				announcement=annlist.get(i);
//				System.out.println("<tr>");
////				System.out.println("<td>"+announcement.getAnnounceId()+"</td>");
//				System.out.println("<td>"+(i+1)+"</td>");
//				System.out.println("<td>"+announcement.getContent()+"</td>");
//				System.out.println("<td>"+announcement.getPubTime()+"</td>");
//				System.out.println("</tr>");
//				
//			}
//			 System.out.println("</table>"); 
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}finally{
//			dbconn.disConnect();
//		}
	
		
//		查看排序后的公告列表，限制条数
		try {
			System.out.println("<table>");
			annlist=dbann.getSortAnnList();
			for(int i=0;i<annlist.size();i++){
				announcement=annlist.get(i);
				if(announcement==null){
					return ;
				}
				System.out.println("<tr>");
				System.out.println("<td>"+(i+1)+"</td>");
				System.out.println("<td>"+announcement.getContent()+"</td>");
				System.out.println("<td>"+announcement.getPubTime()+"</td>");
				System.out.println("</tr>");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		//添加公告
//		Announcement announcement=new Announcement();
//		int adminId=1;
//		String content="X楼516因信息专业实习第10-13周被使用";
//		Calendar calendar = Calendar.getInstance();
//		announcement.setPubTime(calendar.getTime());
//		announcement.setAdminId(adminId);
//		announcement.setContent(content);
//		try {
//			dbann.insertAnnounce(announcement);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		
//		所有公告条数
//		int count=0;
//		try {
//			count=dbann.getCountAnn();
//		} catch (SQLException e) {
//			
//			e.printStackTrace();
//		}
//		dbconn.disConnect();
//		System.out.println("公告条数为："+count);

	}

}
