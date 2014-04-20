package com.room.data.service;

import java.io.IOException;
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
	private int page_size=10;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response){
		
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response){		
		
			try {
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html;charset=utf-8");
				String action=request.getParameter("action");
				System.out.println("acti6on为："+action);
				
				if (action == null) {
					action = "list";
				}
				if(action.equalsIgnoreCase("list")){
					list(request,response);
				}
			
			} catch (UnsupportedEncodingException e) {
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
		System.out.println("====================================================");
		roomList=dbRoom.getRoomList(roomList, page, page_size);
		System.out.println("roomList长度="+roomList.size());
		rowCount=dbRoom.countAll();
		System.out.println("rowCount="+rowCount);
		
		db.disConnect();
		
		if(rowCount%page_size!=0){
			pageCount=rowCount/page_size;
		}else{
			pageCount=rowCount/page_size+1;
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