<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,com.room.data.dao.*,com.room.data.model.*,com.room.data.tools.*"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教室申请</title>
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
<body>
	<%
		String account = request.getParameter("account");
		String password = request.getParameter("password");
		
		List<String> roomlist=(List<String>) session.getAttribute("roomlist");
		User user = (User) session.getAttribute("user");

		String[] strLesson = { "1-2节", "3-4节", "5-6节", "7-8节", "9-10节" };
		String[] strWeekday = { "星期一", "星期二", "星期三", "星期四", "星期五" };
		String buildNum = "";
		String roomNum = "";
	%>
	<div id="templatemo_wrapper">

		<jsp:include page="share_web/sidebar.jsp" flush="true" />

	</div>

	<div id="templatemo_content">

		<jsp:include page="share_web/header.jsp" flush="true">
			<jsp:param value="3" name="menu" />
		</jsp:include>

		<div class="content_box last" style="float: left;">
			<h2>教室申请</h2>
		</div>

		<p>
		<form method="post"
			action="/classroomweb/applicationFormServlet?action=applicationForm">
			<table>
				<tr>
					<td>申请人：</td>
					<td><input name="account" type="text" size="30"
						value="<%=user.getAccount()%>" /></td>
				</tr>
				<tr>
					<td>教学楼号：</td>
					<td><select class="myselect" name="buildNum">
							<option value="A" selected="selected">A教学楼</option>
							<option value="B">B教学楼</option>
					</select></td>
				</tr>

				<tr>
					<td>教室号：</td>
					<td><select class="myselect" name="roomNum">
							<% for (int i=0;i<roomlist.size();i++){ %>
							<option value="<%=roomlist.get(i)%>"><%=roomlist.get(i)%></option>
							<%} %>
					</select></td>
				</tr>


			</table>

		</form>
		</p>





	</div>

	<div class="cleaner"></div>
	</div>
	<div id="templatemo_footer_wrapper">
		<jsp:include page="share_web/footer.jsp" flush="true" />

	</div>

</body>
</html>
