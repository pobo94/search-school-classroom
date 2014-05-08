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
import com.room.data.dao.DbClassRoom;
import com.room.data.dao.DbConnection;
import com.room.data.model.Announcement;
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
		List<ClassRoom> roomList=new ArrayList<ClassRoom>();
		
		DbClassRoom dbRoom=new DbClassRoom(dbconn);
		roomList=dbRoom.getCurDayEmptyRoom(buildNum, weekday, week);
		dbconn.disConnect();
		

		//显示数据
		HttpSession session=request.getSession();
		session.setAttribute("annList", annList);
		session.setAttribute("roomList", roomList);
		try {

			getServletContext().getRequestDispatcher("/front/home.jsp").forward(request, response);
		} catch (ServletException e) {		
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
