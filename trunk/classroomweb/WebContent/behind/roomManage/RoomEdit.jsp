<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="com.room.data.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>操作教室</title>
</head>
<%

	int type=(Integer)request.getAttribute("type");
    ClassRoom classroom=null;
    if(type==1){
    	classroom=(ClassRoom)request.getAttribute("classroom");
    }
%>
<body>
<div><p align="right"><a href="javascript:history.back(1)">返回</a></p></div>

	<form action="/classroomweb/roomServlet?action=save&&type=<%=type%>" method="post" name="theform">
	    
	    <%if(type==1) {%>
		<input type="hidden" name="roomId" id="roomId" value=<%=classroom.getRoomId() %>>
		<%}%>
		
		<table align="center" style="width: 500px;border: solid #EAEFF4 2px;">
		<tr height=50 bgcolor="#EAEFF3">
		   <td colspan="2" align="center"><%if(type==0){ %> 添加教室<%}else if(type==1){ %>编辑教室<%} %>
		   </td>
		</tr>
		
		<tr height=40>
		<td align="right"><label id="nameColum">管理员ID：</label></td>
		<%if(type==0) {%>
		<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="adminId" id="adminId" value=""></td>
		<%}else{ %>
		<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="adminId" id="adminId" value=<%=classroom.getAdminId() %> readonly="readonly"></td>
		<%} %>
		</tr>
		<tr height=40>
		<td align="right"><label id="nameColum">教室号：</label></td>
		<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <%if(type==0){ %>
		    <input type="text" name="roomNum" id="roomNum" value="">
		    <%}else{ %>
		    <input type="text" name="roomNum" id="roomNum" value=<%=classroom.getRoomNum() %> readonly="readonly">
		    <%} %>
		</td>
		</tr>
		
		<tr height=40>
		<td align="right"><label id="nameColum">教学楼：</label></td>
		<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <%if(type==0){ %>
		    <select name="buildNum" id="buildNum" style="width:155px">
		    <option  value="" selected="selected">请选择教学楼</option>
		    <option  value="A" >A楼</option>
		    <option  value="B" >B楼</option>
		    <option  value="X" >X楼</option>
		    <option value="D" >D楼</option>
		    </select>
		    <%}else if(type==1){%>
		    <input type="text" name="buildNum" id="buildNum" value="<%=classroom.getBuildingNum()%>楼" readonly="readonly">
			<%} %>
		</td>
		</tr>
		<tr height=40>
		<td align="right"><label id="nameColum">教室状态：</label></td>
		<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 <%if(type==0){ %>
		    <select name="isEmpty" id="isEmpty" style="width:155px">
		    <option selected="selected" >请选择</option>
		    <option  value="0" >教室空闲</option>
		    <option value="1" >教室已占</option>
		    </select>
		    <%}else if(type==1){ if(classroom.getIsEmpty()==0){%>
		    <select name="isEmpty" id="isEmpty">
		    <option >请选择</option>
		    <option value="0" selected="selected" >教室空闲</option>
		    <option value="1" >教室已占</option>
		    </select>
			<%}else { %>
			<select name="isEmpty" id="isEmpty" style="width:155px"> 
		    <option >请选择</option>
		    <option value="0" >教室空闲</option>
		    <option value="1" selected="selected" >教室已占</option>
		    </select>
		    <%
		      }
		    } 
		    %>
		</td>
		</tr>
		<tr height=40>
		<td align="right"><label id="nameColum">课节：</label></td>
		<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%if(type==0){ %>
			<select name="lesson" id="lesson" style="width:155px">
			<option value="0"selected="selected" >请选择</option>
		    <option value="1">1-2节</option>
		    <option value="3">3-4节</option>
		    <option value="5">5-6节</option>
		    <option value="7">7-8节</option>
		    <option value="9">9-10节</option>
		    </select>
		    <%}else if(type==1){%>
		    <input name="lesson" id="lesson" type="text" value="<%=classroom.getLesson()%>-<%=classroom.getLesson()+1%>节" readonly="readonly">
		    <%} %>
		</td>
		</tr>
		
		<tr height=40>
		<td align="right"><label id="nameColum">星期：</label></td>
		<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		   <%if(type==0){ %>
		   <select name="day" id="day" style="width:155px">
		    <option value="1"selected="selected" >请选择</option>
		    <option value="1" >1</option>
		    <option value="2" >2</option>
		    <option value="3" >3</option>
		    <option value="4" >4</option>
		    <option value="5" >5</option>
		    <option value="4" >6</option>
		    <option value="5" >7</option>
		    </select>
		    <%}else if(type==1){ %>
		     <input name="day" id="day" type="text" value="<%=classroom.getDay()%>" readonly="readonly">
		    <%}%>
		</td>
		</tr>
		
		<tr height=40>
		<td align="right"><label id="nameColum" >周数：</label></td>
		<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%if(type==0){ %>
			<input type="text" name="week" id="week" value="">
			<%}else { %>
			<input type="text" name="week" id="week" value=<%=classroom.getWeek() %>>
			<%} %>
		</td>
		</tr>
		
		<tr height=40>
		<td align="right"><label id="nameColum">学期：</label></td>
		<td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<%if(type==0){ %>
			<input type="text" name="term" id="term" value="">
			<%}else { %>
			<input type="text" name="term" id="term" value=<%=classroom.getTerm() %>>
			<%} %>
		</td>
		</tr>
		
		<tr height=40>
		<td align="right">
			<input type="submit" name="ok" value="确定">
		</td>
		<td align="left">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" name="cancel" value="取消">
		</td>
		</tr>
		</table>
	</form>

</body>
</html>