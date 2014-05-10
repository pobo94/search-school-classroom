<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
    <%
    	String buildNum=request.getParameter("buildNum");
        String weekday=request.getParameter("weekday");
        String week=request.getParameter("week");
    %>
	<jsp:forward page="/InitServlet?action=init">
  	<jsp:param value="<%=buildNum %>" name="buildNum"/>
  	<jsp:param value="<%=weekday %>" name="weekday"/>
  	<jsp:param value="<%=week %>" name="week"/>
  </jsp:forward>
</body>
</html>