<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java"
	import="java.util.*,com.room.data.dao.*,com.room.data.model.*,com.room.data.tools.*"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教室申请查看和提交</title>
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
	function clearText(field) {
		if (field.defaultValue == field.value)
			field.value = '';
		else if (field.value == '')
			field.value = field.defaultValue;
	}
</script>
</head>
<body onload="showLeftTime()">
	<%
		String account = request.getParameter("account");
		String password = request.getParameter("password");

		List<ApplicationForm> applicationList = (List<ApplicationForm>) session
				.getAttribute("applicationList");
	//	User user = (User) session.getAttribute("user");

		//		session.setAttribute("user", user);
	%>
	<div id="templatemo_wrapper">

		<jsp:include page="share_web/sidebar.jsp" flush="true" />

	</div>

	<div id="templatemo_content">

		<jsp:include page="share_web/header.jsp" flush="true">
			<jsp:param value="3" name="menu" />
		</jsp:include>

		<div class="content_box last" style="float: left;">	
			<h3><strong>您申请的教室列表如下 &nbsp;&nbsp;<a href="index.jsp">注销登录</a></strong></h3>
			<div id="shenqing_liebiao" style="width:500px;">
			<table border="0" style="margin-top:10px;background-image:url(images/sky.jpg)">
			<tr height="30" >
				<td align="center"  width="50">申请状态</td>
				<td align="center"  width="50">周数</td>
				<td align="center" width="50">教学楼号</td>
				<td align="center" width="50">教室号</td>
				<td align="center" width="50">申请理由</td>
				<td align="center" width="50">开始</td>
				<td align="center" width="50">结束</td>
			</tr>

			 <%
					for (int j = 0; j < applicationList.size(); j++) {
				%>
			<tr height="30">
				<td width="50">
					<%
							if (applicationList.get(j).getResult() == 0) {
						%> <input style="width:100px;" style="width：10px;" name="account" type="text" value="未通过" />
					<%
 	} else {
 %>     <input style="width:50px;" name="account" type="text" value="通过" /> <%
 	}
 %>
				</td>
				<td width="50"><input type="text" style="width:80px;"
					value="<%=applicationList.get(j).getWeek()%>" /></td>

				<td width="50"><input type="text" style="width:80px;"
					value=" <%=applicationList.get(j).getBuildingNum()%>" /></td>

				<td width="50">
				<input type="text"value="<%=applicationList.get(j).getRoomNum()%>"style="width:80px;" />
				</td>


				<td width="50"><input style="width:80px;" type="text"
					value="<%=applicationList.get(j).getReason()%>" /></td>


				<td width="50"><input style="width:80px;" type="text"
					value="第<%=applicationList.get(j).getLessonStart()%>节课" /></td>

				<td width="50"><input style="width:80px;" type="text"
					value="第<%=applicationList.get(j).getLessonEnd()%>节课" /></td>
			</tr>
			<%
					}
				%>
			<tr></tr>
			<tr height="50">
				<td colspan="7"><a href="/classroomweb/front/applyroomsubmit.jsp" />去申请教室</td>
			</tr>
		</table>
		</div>
		</div>
		
	</div>

	<div class="cleaner"></div>
	</div>
	<div id="templatemo_footer_wrapper">
		<jsp:include page="share_web/footer.jsp" flush="true" />

	</div>

</body>
</html>
