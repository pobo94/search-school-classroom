<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

	   <script type="text/javascript">

function weekOfYear(year, month, day){ 
	 // year 年 
	// month 月 
	// day 日 
	// 每周从周日开始 
	var date1 = new Date(year, 0, 1); 
	 var date2 = new Date(year, month-1, day, 1); 
	 var dayMS = 24*60*60*1000; 
	 var firstDay = (7-date1.getDay())*dayMS; 
	 var weekMS = 7*dayMS; 
	 date1 = date1.getTime(); 
	 date2 = date2.getTime(); 
	 //return Math.ceil((date2-date1-firstDay)/weekMS)+1; 
	 alert(Math.ceil((date2-date1-firstDay)/weekMS)+1-9);
	 } 
</script>
</head>
<body>
	<%
		Calendar cal=Calendar.getInstance();
		cal.setTime(new Date());
		int year=cal.get(Calendar.YEAR);
		int month=cal.get(Calendar.MONTH)+1;
		int day=cal.get(Calendar.DAY_OF_MONTH);
	
	%>
	<input type="button" onclick="weekOfYear(<%=year%>, <%=month %>, <%=day%>)">
</body>
</html>