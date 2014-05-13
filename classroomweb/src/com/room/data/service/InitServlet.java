package com.room.data.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.data.dao.DbAnnouncement;
import com.room.data.dao.DbBBS_Section;
import com.room.data.dao.DbBBS_Topic;
import com.room.data.dao.DbClassRoom;
import com.room.data.dao.DbConnection;
import com.room.data.model.Announcement;
import com.room.data.model.BBS_Section;
import com.room.data.model.ClassRoom;
import com.room.data.tools.Helper;

public class InitServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String action=request.getParameter("action");
		if(action==null||action.equals("")){
			action="init";
		}else if(action.equals("init")){
			getInitData(request,response);
		}
	}

	
	private void getInitData(HttpServletRequest request,
			HttpServletResponse response) {
		
		DbConnection dbconn=new DbConnection();
		//获取公告列表
		List<Announcement> annList=new ArrayList<Announcement>();	
		DbAnnouncement dbann=new DbAnnouncement(dbconn);
		try {
			annList=dbann.getSortAnnList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//获取教室列表
		String buildNum=request.getParameter("buildNum");
		int weekday=Helper.strToint(request.getParameter("weekday"));
		int week=Helper.strToint(request.getParameter("week"));
		System.out.println("buildNum="+buildNum);
		System.out.println("weekday="+weekday);
		System.out.println("week="+week);
		List<ClassRoom> roomList=new ArrayList<ClassRoom>();
		
		DbClassRoom dbRoom=new DbClassRoom(dbconn);
		roomList=dbRoom.getCurDayEmptyRoom(buildNum, weekday, week);
		
		
		//获取论坛板块列表
		DbBBS_Section dbSection=new DbBBS_Section(dbconn);	
		DbBBS_Topic dbTopic=new DbBBS_Topic(dbconn);
		List<BBS_Section> sectionList=new ArrayList<BBS_Section>();
		List<Integer> tCountList=new ArrayList<Integer>();//存放不同板块内帖子总数数列表
		
		sectionList=dbSection.getBBS_SecList(1);
		tCountList=dbTopic.getEachTopicCount();
		System.out.println("板块个数："+sectionList.size());
		
		dbconn.disConnect();
		//显示数据
		HttpSession session=request.getSession();
		session.setAttribute("annList", annList);
		session.setAttribute("roomList", roomList);
		session.setAttribute("buildNum", buildNum);
		session.setAttribute("weekday", weekday);
		session.setAttribute("week", week);
		session.setAttribute("sectionList", sectionList);
		session.setAttribute("tCountList", tCountList);
		try {

			getServletContext().getRequestDispatcher("/front/home.jsp").forward(request, response);
		} catch (ServletException e) {		
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
