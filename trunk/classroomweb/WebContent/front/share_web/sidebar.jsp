<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page language="java"
	import="java.util.*,com.room.data.dao.*,com.room.data.model.*,com.room.data.tools.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	List<Announcement> annList = (List<Announcement>) session
			.getAttribute("annList");
	Announcement announcement = new Announcement();
	Date dt = new Date();
%>

<link href="/classroomweb/front/templatemo_style.css" rel="stylesheet"
	type="text/css" />
<script language="javascript" type="text/javascript">
<!--
//获得当前时间,刻度为一千分一秒
var initializationTime=(new Date()).getTime();
function showLeftTime()
{
var now=new Date();
var year=now.getYear();
var month=now.getMonth();
var day=now.getDate();
var hours=now.getHours();
var minutes=now.getMinutes();
var seconds=now.getSeconds();
document.all.show.innerHTML=""+year+"年"+(month+1)+"月"+day+"日 "+hours+":"+minutes+":"+seconds+"";
//一秒刷新一次显示时间
var timeID=setTimeout(showLeftTime,1000);
}
//-->
</script>

<div id="templatemo_sidebar">
	   <div id="site_title">
		<a href="http://www.hevttc.edu.cn/">
		<img src="<%=basePath%>/front/images/xiaohui.jpg" alt="logo" />
		</a>	
		<a href="searchroom.jsp" >
			<img src="<%=basePath%>/front/images/quna.png" alt="logo" title="快速查询" />
		</a>				
	   </div>
	<!-- end of site_title -->

	<div class="sidebar_box">
        <a href="http://www.hevttc.edu.cn/" target="self"><h3><strong style="cursor:pointer;color:blue;">河北科技师范学院</strong></h3></a>
		<h3><strong style="cursor:pointer;color:blue;">科师教室动态公告</strong></h3>
		<h6><font color="black"><label id="show">显示时间的位置</label><%=Helper.getWeekOfDate(dt)%></font></h6>
		<div class="sidebar_content">

			<marquee direction="up" width="255" height="370" loop="-1" vspace="6"
				hspace="6" scrollamount="4" scrolldelay="1" id="pu"
				onmousemove="pu.stop()" onmouseout="pu.start()">

				<ul id="news_box">
					<%
						for (int i = 0; i < annList.size(); i++) {
							announcement = annList.get(i);
							String content = announcement.getContent();
							String pubTime = Helper.changeTime(announcement.getPubTime());
					%>
					<li>
						<h6>
							<--------------公告<%=i + 1%>-------------->
						</h6>
						<p><%=content%></p>
						<p>
							发布时间：<%=pubTime%>&nbsp;&nbsp;<%=Helper.getWeekOfDate(announcement.getPubTime())%></p>
					</li>
					<%
						}
					%>

				</ul>
			</marquee>
		</div>

	</div>
	<div class="sidebar_box last">

		<a href="contact.jsp"><h3><strong style="cursor:pointer;color:blue;">联系我们</strong></h3></a> 
		<a href="about.jsp"><h3><strong style="cursor:pointer;color:blue;">关于我们</strong></h3></a> 
		<a href="help.jsp"><h3><strong style="cursor:pointer;color:blue;">点击帮助</strong></h3></a>
		<a href="timescroll/shi_jian_zhou.html"><h3><strong style="cursor:pointer;color:blue;">网站时间轴</strong></h3></a>
		
	</div>