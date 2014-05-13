package com.room.data.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.room.data.dao.DbBBS_Reply;
import com.room.data.dao.DbBBS_Section;
import com.room.data.dao.DbBBS_Topic;
import com.room.data.dao.DbConnection;
import com.room.data.model.BBS_Section;
import com.room.data.model.BBS_Topic;

public class luntanServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String action=request.getParameter("action");
		if(action==null||action==""){
			action="list";
		}else if(action.equalsIgnoreCase("list")){
			getLunTanList(request,response);
		}
	}

	private void getLunTanList(HttpServletRequest request,
			HttpServletResponse response) {
		
		DbConnection dbconn=new DbConnection();
		DbBBS_Section dbSection=new DbBBS_Section(dbconn);
		
		List<BBS_Section> sectionList=new ArrayList<BBS_Section>();
		//获取板块列表
		sectionList=dbSection.getBBS_SecList(1);
		request.setAttribute("sectionList", sectionList);
		
		try {
			getServletContext().getRequestDispatcher("/front/tucao_chat.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}

}
