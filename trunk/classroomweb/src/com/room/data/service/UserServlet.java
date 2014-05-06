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
import com.room.data.dao.DbUser;
import com.room.data.model.ClassRoom;
import com.room.data.model.User;
import com.room.data.tools.Helper;
import com.room.data.tools.RandomValidateCode;

public class UserServlet extends HttpServlet {

	private DbUser dbUser = null;
	private User user = null;
	private int page_size = 20;

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
			action = "userlist";
		} else if (action.equalsIgnoreCase("login")) {
			login(request, response);
		} else if (action.equalsIgnoreCase("random")) {
			random(request, response);
		} else if (action.equalsIgnoreCase("userlist")) {
			userlist(request, response);
		} else if (action.equalsIgnoreCase("adduser")) {
			adduser(request, response);
		}
	}

	private void adduser(HttpServletRequest request,
			HttpServletResponse response) {
		

	}

	private void userlist(HttpServletRequest request,
			HttpServletResponse response) {

		int page = Helper.strToint(request.getParameter("page"));// 当前页
		System.out.println("page=" + page);
		int rowCount = 0;// user普通用户在表中总的数据行
		int pageCount = 0;// 总页数
		List<User> userList = new ArrayList<User>();

		DbConnection conn = new DbConnection();
		dbUser = new DbUser(conn);
		userList = dbUser.getUserList(userList, page, page_size);
		rowCount = dbUser.countAll();

		conn.disConnect();
		if (rowCount % page_size != 0) {
			pageCount = rowCount / page_size + 1;
		} else {
			pageCount = rowCount / page_size;
		}

		request.setAttribute("user_count", rowCount);
		request.setAttribute("user_page", page);
		request.setAttribute("user_pagesize", page_size);
		request.setAttribute("user_allpage", pageCount);
		request.setAttribute("userList", userList);

		try {
			getServletContext().getRequestDispatcher(
					"/behind/userManage/UserList.jsp").forward(request,
					response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void random(HttpServletRequest request, HttpServletResponse response) {
		response.setContentType("image/jpeg");// 设置相应类型,告诉浏览器输出的内容为图片
		response.setHeader("Pragma", "No-cache");// 设置响应头信息，告诉浏览器不要缓存此内容
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expire", 0);
		RandomValidateCode randomValidateCode = new RandomValidateCode();
		randomValidateCode.getRandcode(request, response);// 输出图片方法

	}

	private void login(HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		HttpSession session = request.getSession();
		String random = (String) session.getAttribute("RANDOMVALIDATECODEKEY");
		System.out.println(random);
		if (random == null) {
			response.sendRedirect("behind/login.jsp");

		} else {

			String rd = request.getParameter("random");

			if (random.equalsIgnoreCase(rd)) {
				String account = request.getParameter("username");
				String pssword = request.getParameter("password");

				DbConnection conn = new DbConnection();
				dbUser = new DbUser(conn);
				user = dbUser.getUserByAccount(account);

				conn.disConnect();
				if (pssword.equals(user.getPassWord())) {
					response.sendRedirect("behind/home.jsp");
				} else {
					response.sendRedirect("behind/login.jsp");
				}
			}
		}
	}

	// private void deleteAllRoom(HttpServletRequest request,
	// HttpServletResponse response) {
	//
	// String[] strRoomIds = request.getParameterValues("checkbox");
	//
	// DbConnection dbconn=new DbConnection();
	// DbClassRoom dbroom= new DbClassRoom(dbconn);
	// dbroom.deleteAll(strRoomIds);
	// dbconn.disConnect();
	// try {
	// response.sendRedirect("/behind/roomManage/Index.jsp");
	// } catch (IOException e) {
	//
	// e.printStackTrace();
	// }
	//
	// }
	//
	// private void deleteRoom(HttpServletRequest request,
	// HttpServletResponse response) {
	//
	// int roomId = Helper.strToint(request.getParameter("roomId"));
	// DbConnection conn = new DbConnection();
	// DbClassRoom dbroom = new DbClassRoom(conn);
	// dbroom.deleteRoom(roomId);
	// conn.disConnect();
	//
	// try {
	// PrintWriter out = response.getWriter();
	// out.println("删除成功");
	// } catch (IOException e1) {
	// e1.printStackTrace();
	// }
	// }
	//
	// private void saveRoom(HttpServletRequest request,
	// HttpServletResponse response) throws UnsupportedEncodingException {
	//
	// request.setCharacterEncoding("UTF-8");
	// System.out.println(request.getParameter("adminId"));
	// classroom.setAdminId(Helper.strToint(request.getParameter("adminId")));
	// classroom.setRoomNum(request.getParameter("roomNum"));
	// if(request.getParameter("buildNum")=="A楼"){
	// classroom.setBuildingNum("A");
	// }else if(request.getParameter("bulidNum")=="B楼"){
	// classroom.setBuildingNum("B");
	// }else if(request.getParameter("bulidNum")=="X楼"){
	// classroom.setBuildingNum("X");
	// }else if(request.getParameter("bulidNum")=="D楼"){
	// classroom.setBuildingNum("D");
	// }
	// classroom.setIsEmpty(Helper.strToint(request.getParameter("isEmpty")));
	// if(request.getParameter("lesson")=="1-2节"){
	// classroom.setLesson(1);
	// }else if(request.getParameter("lesson")=="3-4节"){
	// classroom.setLesson(3);
	// }else if(request.getParameter("lesson")=="5-6节"){
	// classroom.setLesson(5);
	// }else if(request.getParameter("lesson")=="7-8节"){
	// classroom.setLesson(7);
	// }else if(request.getParameter("lesson")=="9-10节"){
	// classroom.setLesson(9);
	// }
	// classroom.setDay(Helper.strToint(request.getParameter("day")));
	// classroom.setWeek(Helper.strToint(request.getParameter("week")));
	// classroom.setTerm(request.getParameter("term"));
	// int type=Helper.strToint(request.getParameter("type"));
	//
	// DbConnection dbconn=new DbConnection();
	// DbClassRoom dbroom=new DbClassRoom(dbconn);
	// boolean flag=false;
	// if(type==0){
	// flag=dbroom.insertRoom(classroom);
	// System.out.println("添加结果："+flag);
	// }else{
	//
	// System.out.println("roomId="+request.getParameter("roomId"));
	// classroom.setRoomId(Helper.strToint(request.getParameter("roomId")));
	// flag=dbroom.updateRoom(classroom);
	// System.out.println("更新结果："+flag);
	// }
	// dbconn.disConnect();
	// try {
	// getServletContext().getRequestDispatcher("/behind/roomManage/Index.jsp").forward(request,
	// response);
	// } catch (ServletException e) {
	// e.printStackTrace();
	// } catch (IOException e) {
	// e.printStackTrace();
	// }
	//
	// }
	//
	// private void operateRoom(HttpServletRequest request,
	// HttpServletResponse response) {
	// //type:1--编辑教室；0--添加教室
	// int type=Helper.strToint(request.getParameter("type"));
	// if(type==1){
	// int roomId=Helper.strToint(request.getParameter("roomId"));
	// DbConnection dbconn=new DbConnection();
	// dbRoom=new DbClassRoom(dbconn);
	// classroom=dbRoom.getClassRoom(roomId);
	//
	// request.setAttribute("type", type);
	// request.setAttribute("classroom", classroom);
	// }else{
	// request.setAttribute("type", type);
	// }
	//
	// try {
	// getServletContext().getRequestDispatcher("/behind/roomManage/RoomEdit.jsp").forward(request,
	// response);
	// } catch (ServletException e) {
	// e.printStackTrace();
	// } catch (IOException e) {
	// e.printStackTrace();
	// }
	//
	// }
	//
	// private void list(HttpServletRequest request, HttpServletResponse
	// response) {
	//
	// int page=Helper.strToint(request.getParameter("page"));//当前页
	// System.out.println("page="+page);
	// int rowCount=0;//教室表中总的数据行
	// int pageCount=0;//总页数
	// List<ClassRoom> roomList=new ArrayList<ClassRoom>();
	//
	// DbConnection db = new DbConnection();
	// dbRoom=new DbClassRoom(db);
	// roomList=dbRoom.getRoomList(roomList, page, page_size);
	// rowCount=dbRoom.countAll();
	//
	// db.disConnect();
	//
	// if(rowCount%page_size!=0){
	// pageCount=rowCount/page_size+1;
	// }else{
	// pageCount=rowCount/page_size;
	// }
	//
	// request.setAttribute("room_count", rowCount);
	// request.setAttribute("room_page", page);
	// request.setAttribute("room_pagesize", page_size);
	// request.setAttribute("room_allpage", pageCount);
	// request.setAttribute("roomList", roomList);
	//
	// try {
	// getServletContext().getRequestDispatcher("/behind/roomManage/RoomList.jsp").forward(request,
	// response);
	// } catch (ServletException e) {
	// e.printStackTrace();
	// } catch (IOException e) {
	// e.printStackTrace();
	// }
	//
	// }
	//

}