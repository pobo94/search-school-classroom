package com.room.data.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.data.dao.DbClassRoom;
import com.room.data.dao.DbConnection;
import com.room.data.model.ClassRoom;
import com.room.data.tools.Helper;


public class front_roomServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String action=request.getParameter("action");
		if(action==null||action.equals("")){
			action="list";
		}else if(action.equals("list")){
			getRoomList(request,response);
		}
	}

	private void getRoomList(HttpServletRequest request,
			HttpServletResponse response) {
		
		DbConnection dbconn=new DbConnection();
		String buildNum=request.getParameter("buildNum");
		int weekday=Helper.strToint(request.getParameter("weekday"));
		int week=Helper.strToint(request.getParameter("week"));
		System.out.println("buildNum="+buildNum);
		System.out.println("weekday="+weekday);
		System.out.println("week="+week);
		List<ClassRoom> roomList=new ArrayList<ClassRoom>();
		
		DbClassRoom dbRoom=new DbClassRoom(dbconn);
		roomList=dbRoom.getCurDayEmptyRoom(buildNum, weekday, week);
		
		HttpSession session=request.getSession();
		session.setAttribute("roomList", roomList);
		session.setAttribute("buildNum", buildNum);
		session.setAttribute("weekday", weekday);
		session.setAttribute("week", week);
		try {
			response.sendRedirect("front/searchroom.jsp");
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}

}
