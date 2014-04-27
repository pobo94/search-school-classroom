<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,com.room.data.dao.*,com.room.data.model.*,com.room.data.tools.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>教室管理</title>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.0.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="behind/css/roomList.css"> -->
<style type="text/css">

a:link {
	text-decoration: none;
}

a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}

#room_top {
	background-color: #EAEFF3;
	height: 40px;
	line-height:40px;
	border-bottom-style: solid 1px;
}
#conetent {
	background-color: #FFC;
	
}
</style>

<script type="text/javascript">
	
function selectAll(myform) {// 全选
		
		var x = document.getElementById("SelectAllHidden");
		if (x.value == 1) {
			for (var i = 0; i < myform.elements.length; i++) {
				if (myform.elements[i].type == "checkbox") {
					myform.elements[i].checked = true;
				}
			}
			x.value = 0;
		} else {
			for (i = 0; i < myform.elements.length; i++) {
				if (myform.elements[i].type == "checkbox") {
					myform.elements[i].checked = false;
				}
			}
			x.value= 1;
		}
	}

function delRoom(node){ 
	
	 alert("删除教室");
  	 var roomId=node.id;
  	 var url="/classroomweb/roomServlet?action=delete"+"&roomId="+roomId;
  	 var trNode=node.parentNode.parentNode;
  	 var table=document.getElementById("room_table");
  	  
  	 if(confirm("确定要删除吗？")){
  		  $.get(url,function(data,status){
  			
  			     table.deleteRow(trNode.rowIndex);
  		  });
  		  
  	  }
    }
    
function batch_del(){//批量删除
	alert("1！");
	
	var my_checkbox = document.getElementsByName("my_checkbox");
	var j = 0;
	for ( var i = 0; i < my_checkbox.length; i++) {
		if (my_checkbox[i].checked) {
			j++;
		}
	}
	if (j == 0) {
		alert("请选择删除对象！");
	} else {
		
		var url="/classroomweb/roomServlet?action=deleteAll";
		if(confirm("确定要删除所选中的教室吗？")){
			 $.get(url,function(data,status){
		  			
				     table.deleteRow(trNode.rowIndex);
			  });
		}
}
}
</script>
</head>
<%
	List<ClassRoom> roomList=(ArrayList<ClassRoom>)request.getAttribute("roomList");
    int pageNum=(Integer)request.getAttribute("room_page");//当前页
    int pageSize=(Integer)request.getAttribute("room_pagesize");//每页显示的个数
    int pageCount=(Integer)request.getAttribute("room_allpage");//所有页数
    int roomCount=(Integer)request.getAttribute("room_count");//所有教室个数
    ClassRoom classroom=null;
%>

<body>
<div id="wrapper">

<form action="" id="myform" name="myform" method="post">
  <div id="room_top">
  	
  	<!-- <form action="" name="top_form" id="top_form" method="post"> -->
  	
    <table cellSpacing=0 cellPadding=0 width="100%" border=0>
    <tr height=20 >
    	<td>&nbsp;&nbsp;&nbsp;&nbsp;
    	<input type="hidden" id=SelectAllHidden value=1> 
    	<a href="javaScript:void(0)" onclick="selectAll(myform)">全选</a>&nbsp;&nbsp;&nbsp;&nbsp;
    	<a href="/classroomweb/roomServlet?action=operate&&type=0">添加教室</a>&nbsp;&nbsp;&nbsp;&nbsp;
    	<a href="javaScript:void(0)" onclick="batch_add()">批量添加</a>&nbsp;&nbsp;&nbsp;&nbsp;
    	<a href="javaScript:void(0)" onclick="batch_del()">批量删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
    	<a href="javaScript:void(0)" onclick="location.href='Index.jsp'">刷新</a>&nbsp;&nbsp;&nbsp;&nbsp;
    	</td>
    	<td align="right">
    	查询空教室：<input type="text"
						name="selectBuildNum" id="selectBuildNum" value="教室号/教学楼号"
						
						onfocus="if(this.value=='教室号/教学楼号') this.value='';"
						onblur="if(this.value=='') {this.value='教室号/教学楼号';}" />&nbsp;&nbsp;
						<input type=submit name="selectBtn1" value="搜索" class="button"
						onclick="selectBtn(thisform)" /> 
						<input class="button" type="button" name="selectAllBtn" value="全部"
						onclick="location.href='Index.jsp'" />
    	</td>
    </tr>
    </table>
  <!--   </form> -->
  </div>
  <div id="conetent">
  <!-- <form action="" id="content_form" name="content_form" method="post"> -->
  	<table id="room_table" width="100%" border="0" cellSpacing=0 cellPadding=3>
  	 <tr height=40>
  	 <td align="center">选择</td>
  	 <td align="center">教室号</td>
  	 <td align="center">教学楼</td>
  	 <td align="center">教室状态</td>
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
  	 		for(int i=0;i<roomList.size();i++){
  	 			
  	 		  classroom=roomList.get(i);
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
  	 <tr height=30 bgcolor="#FFFFFF" onMouseOver="this.bgColor='#CDE6FF'" onMouseOut="this.bgColor='#FFFFFF'">
  	 	<td align="center"><input type="checkbox" name="my_checkbox" value="<%=roomId%>"></td>
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
  	 	<td align="center">星期<%=day %></td>
  	 	<td align="center">第<%=week %>周</td>
  	 	<td align="center"><%=term %>学期</td>
  	 	<td align="center"><a href="/classroomweb/roomServlet?action=operate&&type=1&&roomId=<%=roomId%>">编辑</a>
  	 	|<a href="javaScript:void(0)" onclick="delRoom(this);" id="<%=classroom.getRoomId()%>">删除</a></td>
  	 </tr>
	<%
  	 	}
  	 }
	%> 	
  	</table>
  
   		<table id="foot_table" width="100%" height="30" border="0" align="center">
   		<tr>
   			<td align="center">
   			<input type="hidden" value=<%=pageCount%> id="pageCount">
   			  共<%=roomCount%>条记录，每页<%=pageSize%>条记录，
   			    当前第:<%=pageNum%>/<%=pageCount %>页
   				<a href="/classroomweb/roomServlet?action=list&&page=1">首页</a>&nbsp;&nbsp;
   				<% if(pageNum==1){ %> 
   				<a>上一页</a>&nbsp;&nbsp;
				 <%}else{ %> 
				<a href="/classroomweb/roomServlet?page=<%=pageNum-1%>&&action=list">上一页</a>&nbsp;&nbsp;
				 <%} %>
				<% if(pageNum==pageCount){ %> 
				 <a>下一页</a>&nbsp;&nbsp;
				 <%}else{ %> 
				<a href="/classroomweb/roomServlet?page=<%=pageNum+1%>&&action=list">下一页</a>&nbsp;&nbsp;
				 <%} %> 
				<a href="/classroomweb/roomServlet?page=<%=pageCount%>&&action=list">尾页</a>
				<input type="text" id="jumppage" value=1 style="width:3"> 
				<input type="button" value="跳转" onclick="jumpPage(myform)" name="jump" class="button">  			
   			</td>
   		</tr>   			
   		</table> 	
   </div>
   </form>
</div>
</body>
</html>