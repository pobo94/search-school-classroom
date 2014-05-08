<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>index</title>
</head>
<body>
  <%-- <jsp:forward page="/annouceServlet?action=init?buildNum='A'&&weekday=3&&week=1"></jsp:forward> --%>
  <jsp:forward page="/InitServlet?action=init">
  	<jsp:param value="A" name="buildNum"/>
  	<jsp:param value="2" name="weekday"/>
  	<jsp:param value="1" name="week"/>
  </jsp:forward>
</body>
</html>