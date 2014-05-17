<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户注册</title>
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div id="templatemo_wrapper">
		<jsp:include page="share_web/sidebar.jsp" flush="true" />
	</div>

	<div id="templatemo_content">

		<jsp:include page="share_web/header.jsp" flush="true">
			<jsp:param value="3" name="menu" />
		</jsp:include>

		<div class="content_box last" style="float: left;">
			<h2>用户注册</h2>
			<p>
			<form method="post"  action="/classroomweb/userServlet?action=adduser">
			<table>
				<tr>
					<th>用户名：</th>
					<th><input name="username"  type="text" size="30" value=""/></th>
				</tr>
				<tr>
					<td>密码:</td>
					<td><input name="password"  type="text" size="30" value=""/></td>
				</tr>
				
				<tr>
					<td><input type="submit" value="提交"/></td>
					<td><input type="reset"  value="重置"/></td>
				</tr>
				
				
			</table>
           </form>

			</p>

		</div>



	</div>

	<div class="cleaner"></div>
	</div>
	<div id="templatemo_footer_wrapper">
		<jsp:include page="share_web/footer.jsp" flush="true" />

	</div>



</body>


</html>