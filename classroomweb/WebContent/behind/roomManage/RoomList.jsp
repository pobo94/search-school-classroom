<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,com.room.data.dao.*,com.room.data.model.*,com.room.data.tools.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>教室管理</title>
<link rel="stylesheet" type="text/css" href="/behind/css/roomList.css">
</head>
<%
	List<ClassRoom> roomList=(ArrayList<ClassRoom>)request.getAttribute("roomList");
    int pageNum=(Integer)request.getAttribute("room_page");//当前页
    int pageSize=(Integer)request.getAttribute("room_pagesize");//每页显示的个数
    int pageCount=(Integer)request.getAttribute("room_allpage");//所有页数
    int roomCount=(Integer)request.getAttribute("room_count");//所有页数
    ClassRoom classroom=null;
%>

<body>
<div id="wrapper">
  <div id="room_top">
    <ul class="menu">
    <li class="list"><a href="#">添加</a></li>
    <li class="list"><a href="#">批量添加</a></li>
    <li class="list"><a href="#">批量删除</a></li>
    </ul>
  </div>
  <div id="conetent">
  <form action="" id="myform" name="myform" method="post">
  	<table id="room_table" width="100%" border="1">
  	 <tr>
  	 <td align="center">ddd</td>
  	 <td align="center">教室号</td>
  	 <td align="center">教学楼</td>
  	 <td align="center">是否为空</td>
  	 <td align="center">课节</td>
  	 <td align="center">星期</td>
  	 <td align="center">周数</td>
  	 <td align="center">学期</td>
  	 <td align="center">操作</td>
  	 </tr>  	 
  	 
  	 <%if(roomList==null||roomList.size()==0){ %>
  	 <tr>
  	 	<td colspan="9">很抱歉，教室表中还没有数据</td>
  	 </tr>
  	 <%}else{ 
  	 
  	 	for(int i=0;i<roomCount;i++){
  	 			
  	 		  classroom=roomList.get(i);
  	 		  //int roomId=classroom.getRoomId();
  	 		  int adminId=classroom.getAdminId();
  	 		  String roomNum=classroom.getRoomNum();
  	 		  String buildingNum=classroom.getBuildingNum();
  	 		  int isEmpty=classroom.getIsEmpty();
  	 		  int lessonNum=classroom.getLesson();
  	 		  int day=classroom.getDay();
  	 		  int week=classroom.getWeek();
  	 		  String term=classroom.getTerm();  
  	 		  
  	 		  String roomId=String.valueOf(classroom.getRoomId());
  	 	  
  	 %>
  	 <tr>
  	 	<td align="center"><input type="checkbox" name="choose" value="<%=roomId%>"></td>
  	 	<td align="center"><%=roomNum %></td>
  	 	<td align="center"><%=buildingNum %></td>
  	 	<%if(isEmpty==0){ %>
  	 	   <td align="center">空</td>
  	 	<%}else{ %>
  	 	   <td align="center">已占</td>
  	 	<%} %>
  	 	<%if(lessonNum==1){ %>
  	 	   <td align="center">1-2节</td>
  	 	<%}else if(lessonNum==3){ %>
  	 	   <td align="center">3-4节</td>
  	 	<%}else if(lessonNum==5){ %>
  	 	   <td align="center">5-6节</td>
  	 	<%}else if(lessonNum==7){ %>
  	 	   <td align="center">7-8节</td>
  	 	<%}else if(lessonNum==9) {%>
  	 	   <td align="center">9-10节</td>
  	 	<%} %>
  	 	<td>星期<%=day %></td>
  	 	<td>第<%=week %>周</td>
  	 	<td><%=term %>学期</td>
  	 	<td><a href="#">编辑</a>|<a href="#">删除</a></td>
  	 </tr>
	<%
  	 	}
  	 }
	%> 	
  	</table>
  	</form>
  </div>
  
   <div id="room_foot">
   <form action="" name="foot_form" id="foot_form">
   		<table id="foot_table" width="100%" height="30" border="1" align="center">
   		<tr>
   			<td align="center">
   				<a href="behind/classroom/roomServlet?page=1&&action=list">首页</a>&nbsp;&nbsp;
   				<% if(pageNum==1){ %> 
   				<a href="behind/classroom/roomServlet?page=1&&action=list">上一页</a>&nbsp;&nbsp;
				 <%}else{ %> 
				<a href="behind/classroom/roomServlet?page=<%=pageNum-1%>&&action=list">上一页</a>&nbsp;&nbsp;
				 <%} %>
				<% if(pageNum==pageCount){ %> 
   				<a href="behind/classroom/roomServlet?page=<%=pageCount%>&&action=list">下一页</a>&nbsp;&nbsp;
				 <%}else{ %> 
				<a href="behind/classroom/roomServlet?page=<%=pageNum-1%>&&action=list">下一页</a>&nbsp;&nbsp;
				 <%} %> 
				<a href="behind/classroom/roomServlet?page=<%=pageCount%>&&action=list">尾页</a>
				
   				
   			</td>
   		</tr>
   			
   		</table>
   </form>
   	
   </div>
</div>
</body>
</html>