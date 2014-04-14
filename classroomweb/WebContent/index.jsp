<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="">
上传文件<input type="file">
得到<input type="text">
</form>
<p>

站点真实路径：<%=application.getRealPath("/")%>
</p>
<p>
服务器版本：<%=application.getServerInfo()%>
</p>

</body>
</html>