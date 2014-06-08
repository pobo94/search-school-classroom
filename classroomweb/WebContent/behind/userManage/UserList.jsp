<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,com.room.data.dao.*,com.room.data.model.*,com.room.data.tools.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户管理</title>
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
  	 var url="/classroomweb/userServlet?action=delete"+"&roomId="+roomId;
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
	
	var checkbox = document.getElementsByName("checkbox");
	var j = 0;
	for ( var i = 0; i < checkbox.length; i++) {
		if (checkbox[i].checked) {
			j++;
		}
	}
	if (j == 0) {
		alert("请选择删除对象！");
	} else {
		
		var url="/classroomweb/userServlet?action=deleteAll";
		if(confirm("确定要删除所选中的用户吗？")){
			 $.get(url,function(data,status){
		  			
				     table.deleteRow(trNode.rowIndex);
			  });
		}
}
}
</script>
</head>
<%
	List<User> userList=(ArrayList<User>)request.getAttribute("userList");
    int pageNum=(Integer)request.getAttribute("user_page");//当前页
    int pageSize=(Integer)request.getAttribute("user_pagesize");//每页显示的个数
    int pageCount=(Integer)request.getAttribute("user_allpage");//所有页数
    int userCount=(Integer)request.getAttribute("user_count");//所有用户的个数
    User user=null;
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
    	<a href="/classroomweb/behind/userManage/UserEdit.jsp?type=0">添加用户</a>&nbsp;&nbsp;&nbsp;&nbsp;
    	<a href="javaScript:void(0)" onclick="batch_add()">批量添加</a>&nbsp;&nbsp;&nbsp;&nbsp;
    	<a href="javaScript:void(0)" onclick="batch_del()">批量删除</a>&nbsp;&nbsp;&nbsp;&nbsp;
    	<a href="javaScript:void(0)" onclick="location.href='/classroomweb/userServlet?action=list&page=1'">刷新</a>&nbsp;&nbsp;&nbsp;&nbsp;
    	</td>
    	<td align="right">
    	查询用户：<input type="text"
						name="selectAccound" id="selectAccound" value="用户名"
						
						onfocus="if(this.value=='用户名') this.value='';"
						onblur="if(this.value=='') {this.value='用户名';}" />&nbsp;&nbsp;
						<input type=submit name="selectBtn1" value="搜索" class="button"
						onclick="location.href='/classroomweb/userServlet?action=searchlist'" /> 
						<input class="button" type="button" name="selectAllBtn" value="全部"
						onclick="location.href='/classroomweb/userServlet?action=userlist&page=1'" />
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
  	 <td align="center">昵称</td>
  	 <td align="center">密码</td>
  	 <td align="center">真实姓名</td>
  	 <td align="center">性别</td>
  	 <td align="center">qq</td>
  	 <td align="center">邮箱</td>
  	 <td align="center">电话</td>
  	 <td align="center">状态</td>
  	 <td align="center">注册时间</td>
  	 <td align="center">最后登入时间</td>
  	 <td align="center">访问次数</td>	 
  	 <td align="center">操作</td>
  	 </tr>  	 
  	 
  	 <%if(userList==null||userList.size()==0){ %>
  	 <tr>
  	 	<td colspan="9">很抱歉，用户表中还没有数据</td>
  	 </tr>
  	 <%}else{ 
  	 		for(int i=0;i<userList.size();i++){
  	 			
  	 		  user=userList.get(i);
  	 		  
  	 		  int uid=user.getUserId();
  	 		  String userId=String.valueOf(uid);
  	 		  String account=user.getAccount();
  	 		  String password=user.getPassWord();
  	 		  String realname=user.getRealName();
  	 		  int gender=user.getGender();
  	 		  String qq=user.getQq(); 
  	 		
  	 		  String email=user.getEmail();
  	 		  String mobile=user.getMobile();
  	 		  int status=user.getStatus();
  	 		  Date register=user.getRegisterTime();
  	 		  Date lastTime=user.getLastTime();
  	 		  int visitCount=user.getVistCount();
  	 	   	 %>
  	 <tr height=30 bgcolor="#FFFFFF" onMouseOver="this.bgColor='#CDE6FF'" onMouseOut="this.bgColor='#FFFFFF'">
  	 	<td align="center"><input type="checkbox" name="checkbox" value="<%=userId%>"></td>
  	 	<td align="center"><%=account %></td>
  	 	<td align="center"><%=password %></td>
  	 	<td align="center"><%=realname %></td>
  	 	<%if(gender==0){ %>
  	 	   <td align="center">保密</td>
  	 	<%}else if(gender==1){ %>
	 	   <td align="center">男</td>
	 	<%} else if(gender==2){ %>
	 	   <td align="center">女</td>
	 	<%} %>	 	
  	 	<td align="center"><%=qq %></td>
  	 	<td align="center"><%=email %></td>
  	 	<td align="center"><%=mobile %></td>
  	 	<%if(status==1){ %>
  	 	   <td align="center">正常</td>
  	 	<%}else if(status==2){ %>
  	 	   <td align="center">锁定</td>
  	 	<%}else if(status==3){ %>
  	 	   <td align="center">已删除</td>
  	 	<%}%>  	 	
  	 	<td align="center"><%=register %></td>
  	 	<td align="center"><%=lastTime %></td>
  	 	<td align="center"><%=visitCount %></td>
  	 	<td align="center"><a href="/classroomweb/userServlet?action=add&type=1&userId=<%=userId%>">编辑</a>
  	 	<a href="javaScript:void(0)" onclick="delRoom(this);" id="<%=user.getUserId()%>">删除</a></td>
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
   			  共<%=userCount%>条记录，每页<%=pageSize%>条记录，
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