package com.room.data.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.room.data.dao.DbClassRoom;
import com.room.data.dao.DbConnection;
import com.room.data.model.ClassRoom;
import com.room.data.tools.Helper;





public class roomServlet extends HttpServlet {
	
	private DbClassRoom dbRoom = null;
	private ClassRoom classroom=null;
	private int page_size=10;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response){
		
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response){		
		
			try {
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html;charset=utf-8");
				String action=request.getParameter("action");
				System.out.println("action为："+action);
				
				if (action == null) {
					action = "list";
				}else if(action.equalsIgnoreCase("list")){
					list(request,response);
				}else if(action.equalsIgnoreCase("operate")){
					operateRoom(request,response);
				}else if(action.equalsIgnoreCase("save")){
					saveRoom(request,response);
				}else if(action.equalsIgnoreCase("delete")){
					deleteRoom(request,response);
				}else if(action.equalsIgnoreCase("deleteAll")){
					deleteAllRoom(request,response);
				}
			
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			

     }

	private void deleteAllRoom(HttpServletRequest request,
			HttpServletResponse response) {

        String[] strRoomIds = request.getParameterValues("checkbox");
		
		DbConnection dbconn=new DbConnection();
		DbClassRoom dbroom= new DbClassRoom(dbconn); 
		dbroom.deleteAll(strRoomIds);
		dbconn.disConnect();		
		try {
			response.sendRedirect("/behind/roomManage/Index.jsp");
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
	}

	private void deleteRoom(HttpServletRequest request,
			HttpServletResponse response) {
		
		int roomId = Helper.strToint(request.getParameter("roomId"));
		DbConnection conn = new DbConnection();
		DbClassRoom dbroom = new DbClassRoom(conn);
		dbroom.deleteRoom(roomId);
		conn.disConnect();
		
		try {
			PrintWriter	out = response.getWriter();
			out.println("删除成功");
		} catch (IOException e1) {
			e1.printStackTrace();
		}
	}

	private void saveRoom(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		
		request.setCharacterEncoding("UTF-8");
		System.out.println(request.getParameter("adminId"));
		classroom.setAdminId(Helper.strToint(request.getParameter("adminId")));
		classroom.setRoomNum(request.getParameter("roomNum"));
		if(request.getParameter("buildNum")=="A楼"){
			classroom.setBuildingNum("A");
		}else if(request.getParameter("bulidNum")=="B楼"){
			classroom.setBuildingNum("B");
		}else if(request.getParameter("bulidNum")=="X楼"){
			classroom.setBuildingNum("X");
		}else if(request.getParameter("bulidNum")=="D楼"){
			classroom.setBuildingNum("D");
		}
		classroom.setIsEmpty(Helper.strToint(request.getParameter("isEmpty")));
		if(request.getParameter("lesson")=="1-2节"){
			classroom.setLesson(1);
		}else if(request.getParameter("lesson")=="3-4节"){
			classroom.setLesson(3);
		}else if(request.getParameter("lesson")=="5-6节"){
			classroom.setLesson(5);
		}else if(request.getParameter("lesson")=="7-8节"){
			classroom.setLesson(7);
		}else if(request.getParameter("lesson")=="9-10节"){
			classroom.setLesson(9);
		}
		classroom.setDay(Helper.strToint(request.getParameter("day")));
		classroom.setWeek(Helper.strToint(request.getParameter("week")));
		classroom.setTerm(request.getParameter("term"));		
		int type=Helper.strToint(request.getParameter("type"));
		
		DbConnection dbconn=new DbConnection();
		DbClassRoom dbroom=new DbClassRoom(dbconn);
		boolean flag=false;
		if(type==0){
			flag=dbroom.insertRoom(classroom);
			System.out.println("添加结果："+flag);
		}else{
			
			System.out.println("roomId="+request.getParameter("roomId"));
			classroom.setRoomId(Helper.strToint(request.getParameter("roomId")));
			flag=dbroom.updateRoom(classroom);
			System.out.println("更新结果："+flag);
		}
		dbconn.disConnect();
		try {
			getServletContext().getRequestDispatcher("/behind/roomManage/Index.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	private void operateRoom(HttpServletRequest request,
			HttpServletResponse response) {
		//type:1--编辑教室；0--添加教室
		int type=Helper.strToint(request.getParameter("type"));
		if(type==1){
			int roomId=Helper.strToint(request.getParameter("roomId"));
			DbConnection dbconn=new DbConnection();
			dbRoom=new DbClassRoom(dbconn);
			classroom=dbRoom.getClassRoom(roomId);
			
			request.setAttribute("type", type);
			request.setAttribute("classroom", classroom);
		}else{
			request.setAttribute("type", type);
		}
		
		try {
			getServletContext().getRequestDispatcher("/behind/roomManage/RoomEdit.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	private void list(HttpServletRequest request, HttpServletResponse response) {
		
		int page=Helper.strToint(request.getParameter("page"));//当前页
		System.out.println("page="+page);
		int rowCount=0;//教室表中总的数据行
		int pageCount=0;//总页数
		List<ClassRoom> roomList=new ArrayList<ClassRoom>();
		
		DbConnection db = new DbConnection();
		dbRoom=new DbClassRoom(db);
		roomList=dbRoom.getRoomList(roomList, page, page_size);
		rowCount=dbRoom.countAll();
		
		db.disConnect();
		
		if(rowCount%page_size!=0){
			pageCount=rowCount/page_size+1;
		}else{
			pageCount=rowCount/page_size;
		}
		
		request.setAttribute("room_count", rowCount);
		request.setAttribute("room_page", page);
		request.setAttribute("room_pagesize", page_size);
		request.setAttribute("room_allpage", pageCount);
		request.setAttribute("roomList", roomList);
		
		try {
			getServletContext().getRequestDispatcher("/behind/roomManage/RoomList.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
}