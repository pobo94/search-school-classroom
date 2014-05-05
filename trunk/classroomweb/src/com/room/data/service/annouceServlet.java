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
import com.room.data.dao.DbConnection;
import com.room.data.model.Announcement;

public class annouceServlet extends HttpServlet {
	
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
			getAnnList(request,response);
		}
	}

	//获取公告列表
	private void getAnnList(HttpServletRequest request,
			HttpServletResponse response) {
		
		List<Announcement> annList=new ArrayList<Announcement>();
		//获取数据
		DbConnection dbconn=new DbConnection();
		DbAnnouncement dbann=new DbAnnouncement(dbconn);
		try {
			annList=dbann.getSortAnnList();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		dbconn.disConnect();
		//显示数据
//		request.setAttribute("annList", annList);
		HttpSession session=request.getSession();
		session.setAttribute("annList", annList);
		try {
//			getServletContext().getRequestDispatcher("/front/share_web/sidebar.jsp").forward(request, response);
			getServletContext().getRequestDispatcher("/front/home.jsp").forward(request, response);
		} catch (ServletException e) {		
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
