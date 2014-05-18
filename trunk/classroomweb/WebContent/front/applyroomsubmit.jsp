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
<body>
	<%
		String account = request.getParameter("account");
		String password = request.getParameter("password");

		List<String> roomlist = (List<String>) session
				.getAttribute("roomlist");
		User user = (User) session.getAttribute("user");

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
			<h2>教室申请提交</h2>
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
					<td>申请与第</td>
					<td><select class="myselect" name="week">
							<option value="1" selected="selected">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
							<option value="11">12</option>
							<option value="13">13</option>
							<option value="14">14</option>
							<option value="15">15</option>
							<option value="16">16</option>
							<option value="17">17</option>
							<option value="18">18</option>
							<option value="19">19</option>
							<option value="20">20</option>
							<option value="21">21</option>
							<option value="22">22</option>
					</select>周</td>
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
							<%
								for (int i = 0; i < roomlist.size(); i++) {
							%>
							<option value="<%=roomlist.get(i)%>"><%=roomlist.get(i)%></option>
							<%
								}
							%>
					</select></td>
				</tr>


				<tr>
					<td>申请理由：</td>
					<td><input name="reason" type="text" size="30" value="" /></td>
				</tr>
				<tr>
					<td width='150'>申请教室开始于第：</td>
					<td><select class="myselect" name="lessonstart">
							<option value="1" selected="selected">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
					</select>节课</td>
				</tr>
				<tr>
					<td width='120'>结束于第：</td>
					<td><select class="myselect" name="lessonend">
							<option value="1" selected="selected">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
					</select>节课</td>
				</tr>
				<tr>
					<td><input type="submit" value="提交" /></td>
					<td><input type="reset" value="重置" /></td>
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
