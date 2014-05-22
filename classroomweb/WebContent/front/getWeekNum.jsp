<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>获取当前周数</title>

<script type="text/javascript">
	function getYearWeek(date){  
    var date2=new Date(date.getFullYear(), 0, 1);  
    var day1=date.getDay();  
    if(day1==0) day1=7;  
    var day2=date2.getDay();  
    if(day2==0) day2=7;  
    d = Math.round((date.getTime() - date2.getTime()+(day2-day1)*(24*60*60*1000)) / 86400000);
    alert(Math.ceil(d /7)+1-9);
    //return Math.ceil(d /7)+1-9;
    //document.getElementById("week").innerHTML=Math.ceil(d /7)+1-9;
    
    
    var today;
    today = new Date();
    document.getElementById("week").innerHTML = Math.ceil(d /7)+1-9;
} 
</script>
</head>
<body onload=" Date date=new Date();getYearWeek(date);">
	
	<div id="week">week</div>
	<a href="timescroll/shi_jian_zhou.html">shijian</a>

</body>
</html>