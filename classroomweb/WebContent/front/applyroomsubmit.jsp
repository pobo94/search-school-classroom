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
		<div class="content_box_inner" style="float: left;">
			<div id="biaotou" style="padding-left:200px;">
			<h3><strong>请认真填写教室申请信息</strong></h3>
			</div>			
		</div>
		<div class="cleaner"></div>
		<div class="content_box last" style="float: left;">
			<div id="shen_qing_biao" style="margin-left:140px;width:400px;">
				<form method="post"
					action="/classroomweb/applicationFormServlet?action=applicationForm">
					<table width="400" cellspacing="10" style="margin-top:10px;background-image:url(images/sky.jpg)">		
						<tr height="40px;">
							<td align="right" width="50">申请人：</td>
							<td>
							<input style="width:150px;" name="account" type="text" size="30"value="<%=user.getAccount()%>" />
							</td>
						</tr>
		
						<tr height="40px;">
							<td align="right" width="50">申请周数：</td>
							<td><select class="myselect" name="week" style="width:150px;">
								<%for(int i=1;i<=22;i++){ %>
									<option value="<%=i %>" ><%=i %></option>
								<%} %>	
							</select>
							</td>
						</tr>		
						<tr height="40px;">
							<td align="right" width="50">教学楼号：</td>
							<td><select class="myselect" name="buildNum" style="width:150px;">
									<option value="A" selected="selected">A教学楼</option>
									<option value="B">B教学楼</option>
							</select></td>
						</tr>		
						<tr height="40px;">
							<td align="right" width="50">教室号：</td>
							<td><select class="myselect" name="roomNum" style="width:150px;">
									<%
										for (int i = 0; i < roomlist.size(); i++) {
									%>
									<option value="<%=roomlist.get(i)%>"><%=roomlist.get(i)%></option>
									<%
										}
									%>
							</select>
							</td>
						</tr>		
						<tr height="40px;">
							<td align="right" width="50">申请理由：</td>
							<td><input style="width:150px;" name="reason" type="text" size="30" value="" /></td>
						</tr>
						<tr height="40px;">
							<td width='150' align="right" width="50">教室申请开始：</td>
							<td><select class="myselect" name="lessonstart" style="width:150px;">
									<%for(int i=1;i<=9;i++){ %>
									<option value="<%=i%>">第<%=i%>节课</option>
									<%} %>
							</select>
							</td>
						</tr>
						<tr height="40px;">
							<td width='120' align="right" width="50">教室申请结束：</td>
							<td><select class="myselect" name="lessonend" style="width:150px;">
									<%for(int i=1;i<=9;i++){ %>
									<option value="<%=i%>">第<%=i%>节课</option>
									<%} %>
							</select>
							</td>
						</tr>
						<tr height="40px;">
							<td align="right" width="50"><input type="submit" value="提交" /></td>
							<td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重置" /></td>
						</tr>
					</table>
				</form>
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
