package com.room.data.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.data.dao.DbApplicationForm;
import com.room.data.dao.DbClassRoom;
import com.room.data.dao.DbConnection;
import com.room.data.dao.DbManager;
import com.room.data.dao.DbUser;
import com.room.data.model.*;
import com.room.data.tools.Helper;

public class applicationFormServlet extends HttpServlet {
	private DbApplicationForm dbApplicationForm = null;
	private ApplicationForm applicationForm = null;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getParameter("action");
		System.out.println("action为：" + action);

		if (action == null) {
			action = "applicationForm";
		} else if (action.equalsIgnoreCase("applicationForm")) {
			applicationForm(request, response);
		} else if (action.equalsIgnoreCase("classrequest")) {
			classrequest(request, response);
		}else if (action.equalsIgnoreCase("managerRequest")) {
			managerRequest(request, response);
		}

	}

	private void managerRequest(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();	
		String id=request.getParameter("id");
		Manager manager=(Manager) session.getAttribute("manager");
		
		DbConnection conn = new DbConnection();
		DbApplicationForm dbApplicationForm = new DbApplicationForm(conn);
		ApplicationForm applicationForm = new ApplicationForm();
		
		applicationForm.setAdminId(manager.getAdminId());
		applicationForm.setResult(1);
		applicationForm.setApplyId(Helper.strToint(id));	
		dbApplicationForm.updateByApplyId(applicationForm);
		classrequest(request,response);
		
	}

	private void classrequest(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		HttpSession session = request.getSession();
		Manager manager = new Manager();
		manager = (Manager) session.getAttribute("manager");

		DbConnection conn = new DbConnection();
		DbApplicationForm dbApplicationForm = new DbApplicationForm(conn);
//		ApplicationForm applicationForm = new ApplicationForm();
		List<ApplicationForm> applicationList = dbApplicationForm
				.getListByResult(0);

		conn.disConnect();
		session.setAttribute("applicationList", applicationList);

		response.sendRedirect("behind/classrequest.jsp");

	}

	private void applicationForm(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		System.out.println(user.getAccount() + user.getUserId());
		String buildNum = request.getParameter("buildNum");
		String roomNum = request.getParameter("roomNum");
		String reason = request.getParameter("reason");
		String lessonstart = request.getParameter("lessonstart");
		String lessonend = request.getParameter("lessonend");
		String week = request.getParameter("week");

		DbConnection conn = new DbConnection();
		dbApplicationForm = new DbApplicationForm(conn);

		applicationForm = new ApplicationForm();

		applicationForm.setUserId(user.getUserId());
		applicationForm.setBuildingNum(buildNum);
		applicationForm.setRoomNum(roomNum);
		applicationForm.setReason(reason);
		applicationForm.setLessonStart(Helper.strToint(lessonstart));
		applicationForm.setLessonEnd(Helper.strToint(lessonend));
		applicationForm.setWeek(Helper.strToint(week));
		applicationForm.setResult(0);

		dbApplicationForm.insertApplicationForm(applicationForm);
		conn.disConnect();

		response.sendRedirect("front/information/addApplicationForm.jsp");
	}

}
