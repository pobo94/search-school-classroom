package com.room.data.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.room.data.dao.DbBBS_Reply;
import com.room.data.dao.DbBBS_Section;
import com.room.data.dao.DbBBS_Topic;
import com.room.data.dao.DbConnection;
import com.room.data.model.BBS_Reply;
import com.room.data.model.BBS_Section;
import com.room.data.model.BBS_Topic;
import com.room.data.tools.Helper;

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
		}else if(action.equalsIgnoreCase("enter_reply")){
			getReplyList(request,response);
		}else if(action.equalsIgnoreCase("addTopic")){
			addTopic(request,response);
		}
	}
	
	private void addTopic(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		int userId=Helper.strToint(request.getParameter("userId"));//获取用户ID
		int sessionId=Helper.strToint(request.getParameter("myradio"));//获取板块ID
		String biaoti=new String(request.getParameter("biaoti").getBytes("ISO8859_1"),"utf-8");//解决中文乱码
		String content=new String(request.getParameter("mytextarea").getBytes("ISO8859_1"),"utf-8");//解决中文乱码
		Calendar calendar = Calendar.getInstance();
		Date pubTime=calendar.getTime();//获取帖子发布时间
		
		System.out.println("用户ID="+userId);
		System.out.println("板块ID="+sessionId);
		System.out.println("标题="+biaoti);
		System.out.println("内容="+content);
		System.out.println("发表日期="+pubTime);
		
		BBS_Topic topic=new BBS_Topic();
		topic .settUId(userId);
		topic.settSId(sessionId);
		topic.settTopic(biaoti);
		topic.settContents(content);
		topic.settPubTime(pubTime);
		
		DbConnection dbconn=new DbConnection();
		DbBBS_Topic dbTopic=new DbBBS_Topic(dbconn);
		
		DbBBS_Section dbSection=new DbBBS_Section(dbconn);	
		List<BBS_Section> sectionList=new ArrayList<BBS_Section>();
		List<Integer> tCountList=new ArrayList<Integer>();//存放不同板块内帖子总数数列表
		
		sectionList=dbSection.getBBS_SecList(1);
		tCountList=dbTopic.getEachTopicCount();
		System.out.println("板块个数："+sectionList.size());
		
		HttpSession session=request.getSession();
		session.setAttribute("sectionList", sectionList);
		session.setAttribute("tCountList", tCountList);
		
		boolean flag=false;
		try {
			flag = dbTopic.addTopic(topic);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(flag){
			response.sendRedirect("front/tucao_chat.jsp");
		}
		
		
	}

	//获取指定帖子的回复列表
	private void getReplyList(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		int topicId=Helper.strToint(request.getParameter("topicId"));
		int num=Helper.strToint(request.getParameter("num"));
		String userName=request.getParameter("userName");//发帖人
		String userName1=new String(userName.getBytes("ISO8859_1"),"utf-8");//解决中文乱码
		
		DbConnection dbconn=new DbConnection();
		DbBBS_Topic dbTopic=new DbBBS_Topic(dbconn);
		DbBBS_Reply dbreply=new DbBBS_Reply(dbconn);				
		List<BBS_Reply> replyList=new ArrayList<BBS_Reply>();
				
		BBS_Topic topic=dbTopic.getTopic(topicId);//根据帖子ID，获取本贴对象
		
		String name=topic.gettTopic();//帖子的名称
		String content=topic.gettContents();//帖子的内容
		String tPubTime=Helper.changeSimpleTime(topic.gettPubTime());//发帖日期
		
		System.out.println("["+name+"] "+content);
		System.out.println("发表于："+tPubTime);
				
		replyList=dbreply.getReplyList(topicId);
		
		BBS_Reply reply=new BBS_Reply();
		
		for(int m=0;m<replyList.size();m++){
			reply=replyList.get(m);
			String rcontent=reply.getrContent();
			String rTime=Helper.changeTime(reply.getrTime());
			System.out.println((m+1)+"楼回复:");
			System.out.println(rcontent);
			System.out.println(rTime);
		}
		
		HttpSession session=request.getSession();
		session.setAttribute("topic", topic);
		session.setAttribute("replyList", replyList);
		session.setAttribute("num", num);
		session.setAttribute("userName", userName);
		response.sendRedirect("front/tiezi.jsp");
		
		/*try {
			getServletContext().getRequestDispatcher("/front/tiezi.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}*/
		
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
