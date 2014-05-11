<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,com.room.data.dao.*,com.room.data.model.*,com.room.data.tools.*"%>
<%

	List<Announcement> annList=(List<Announcement>)session.getAttribute("annList");
	Announcement announcement=new Announcement();
	Date dt=new Date();
%>

<link href="../front/templatemo_style.css" rel="stylesheet" type="text/css" />


<div id="templatemo_sidebar">   
	<div id="site_title">
           <a href="http://www.hevttc.edu.cn/" target="blank"><img src="images/xiaohui.jpg"  alt="logo" />
	    <h4></h4>
           <h3><strong>河北科技师范学院</strong></h3></a>
        </div> <!-- end of site_title --> 
        
        <div class="sidebar_box">
        	
        	<h3><strong>科师教室动态</strong></h3>
        	<h6>&nbsp;&nbsp;<%=Helper.changeTime(Helper.getCurrentDateTime()) %>&nbsp;&nbsp;<%=Helper.getWeekOfDate(dt) %></h6>
        	<div class="sidebar_content">
        	
        	<marquee  direction="up" width="255" height="370"  loop="-1" vspace="6" hspace="6" scrollamount="4" scrolldelay="1" id="pu"
			   onmousemove="pu.stop()" onmouseout="pu.start()">
				
				<ul id="news_box">
				<%
				 for(int i=0;i<annList.size();i++){
					announcement=annList.get(i);
					String content=announcement.getContent();
					String pubTime=Helper.changeTime(announcement.getPubTime());
				%>
                	<li>
                    	<h6><--------------公告<%=i+1%>--------------></h6>
                  		<p><%=content %></p>
                  		<p>发布时间：<%=pubTime %>&nbsp;&nbsp;<%=Helper.getWeekOfDate(announcement.getPubTime()) %></p>
                    </li>
                    <%} %>
                    
                </ul>
               </marquee>
            </div>
            
        </div>   
         <div class="sidebar_box">
        	
        	<a href="contact.jsp"><h3><strong>联系我们</strong></h3></a>
                <a href="about.jsp"><h3><strong>关于我们</strong></h3></a>
                <a href="help.jsp"><h3><strong>帮助</strong></h3></a>
        </div>
        <div class="sidebar_box last">
        	<a href="setting.jsp"><h3><strong>设置与反馈<strong></h3></a>
        </div>