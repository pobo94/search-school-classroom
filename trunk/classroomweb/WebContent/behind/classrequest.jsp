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
		List<ApplicationForm> applicationList = (List<ApplicationForm>) session
				.getAttribute("applicationList");
		DbConnection conn = new DbConnection();
		DbUser dbuser = new DbUser(conn);
	%>
	<div id="templatemo_wrapper"></div>
	<div id="templatemo_content">


		<div class="content_box last" style="float: left;">
			<h2>教室申请查看</h2>
			<table>
				<tr>
					<td>申请状态</td>
					<td>申请人</td>
					<td>周数</td>
					<td>教学楼号</td>
					<td>教室号</td>
					<td>申请理由</td>
					<td>开始</td>
					<td>结束</td>
					<td>选项</td>
				</tr>

				<%
					for (int j = 0; j < applicationList.size(); j++) {
				%>
				<tr>
					<td >
						<%
							if (applicationList.get(j).getResult() == 0) {
						%> <input style="" name="account" type="text" value="未通过" /> <%
 	} else {
 %> <input name="account" type="text" value="通过" /> <%
 	}
 %>
					</td>
					<td ><input type="text"
						value="<%=dbuser.getUserNameById(applicationList.get(j)
						.getUserId())%>" /></td>
					<td width="100"><input type="text"
						value="<%=applicationList.get(j).getWeek()%>" /></td>

					<td><input type="text"
						value=" <%=applicationList.get(j).getBuildingNum()%>" /></td>

					<td><input type="text"
						value="<%=applicationList.get(j).getRoomNum()%>" /></td>


					<td ><input type="text"
						value="<%=applicationList.get(j).getReason()%>" /></td>


					<td ><input type="text"
						value="第<%=applicationList.get(j).getLessonStart()%>节课" /></td>

					<td ><input type="text"
						value="第<%=applicationList.get(j).getLessonEnd()%>节课" /></td>

					<td width="100">
						<a href="/classroomweb/applicationFormServlet?action=managerRequest&id=<%=applicationList.get(j).getApplyId()%>">
						<%if (applicationList.get(j).getResult() == 0) {%>通过<%} else {%>未通过<%}%></a> 
					</td>
				</tr>
				<%
					}
				%>
			</table>

		</div>
	</div>

	<div class="cleaner"></div>
	</div>
	<div id="templatemo_footer_wrapper"></div>

</body>
</html>
