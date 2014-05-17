package com.room.data.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.data.dao.DbApplicationForm;
import com.room.data.dao.DbConnection;
import com.room.data.model.ApplicationForm;
import com.room.data.tools.Helper;
import com.room.data.tools.RandomValidateCode;

public class applicationFormServlet {
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
		} 
		
	}

	private void applicationForm(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		String pageStr=request.getParameter("page").trim();
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		if(username==null||username.equals("")){
			 response.sendRedirect("front/information/error.jsp");
		}else{
			applicationForm.setAdminId(1);
			
		DbConnection conn = new DbConnection();
		dbApplicationForm = new DbApplicationForm(conn);	 
		dbApplicationForm.insertApplicationForm(applicationForm);
		conn.disConnect();
			
	//   response.sendRedirect("front/"+pageStr+".jsp");
	 
		 response.sendRedirect("front/index.jsp");
	 }
	
	}
}
