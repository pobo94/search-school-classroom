<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,com.room.data.tools.*"%>
<%
	int menu=Helper.strToint(request.getParameter("menu"));
%>
<link href="../front/templatemo_style.css" rel="stylesheet" type="text/css" />
<div id="templatemo_menu" style="float:left;">
			<ul>
                <li><a href="index.jsp" <%if(menu==1){ %>class="current"<%} %>>首页</a></li>
                <li><a href="searchroom.jsp" <%if(menu==2){ %>class="current"<%} %>>空教室查询</a></li>
                <li><a href="applyroom.jsp" <%if(menu==3){ %>class="current"<%} %>>教室申请</a></li>
                <li><a href="tucao_chat.jsp" <%if(menu==4){ %>class="current"<%} %>>校友吐槽</a></li>
                <li><a href="app_recommended.jsp" <%if(menu==5){ %>class="current"<%} %>>精品应用</a></li>              
            </ul>    	
	        <div class="cleaner"></div> 
</div> <!-- end of templatemo_menu -->