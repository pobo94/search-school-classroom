<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,com.room.data.dao.*,com.room.data.model.*,com.room.data.tools.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>校友论坛</title>
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/luntan.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/default_blue.css"/>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script language="javascript" src="js/jquery.Sonline.js"></script>
<script language="javascript" src="js/kefu.js"></script>
</head>
<%
	DbConnection dbconn=new DbConnection();
	List<BBS_Section> sectionList=(List<BBS_Section>)session.getAttribute("sectionList");
	List<Integer> tCountList=(List<Integer>)session.getAttribute("tCountList");
	List<String> saNameList=new ArrayList<String>();//版块管理者名字列表
	List<BBS_Topic> topicList=new ArrayList<BBS_Topic>();
	DbBBS_Topic dbTopic=new DbBBS_Topic(dbconn);
	DbBBS_Reply dbreply=new DbBBS_Reply(dbconn);
	DbSectionAdmin dbseAdmin=new DbSectionAdmin(dbconn);
	DbUser dbuser=new DbUser(dbconn);
	
	saNameList=dbseAdmin.getSANames();
	int total_tieze=dbTopic.getCountAll();
	%>
<body onload="showLeftTime()">


	<div id="templatemo_wrapper">
	
	  <jsp:include page="share_web/sidebar.jsp" flush="true" />
	        
	</div>
    
    <div id="templatemo_content">
    	
       <jsp:include page="share_web/header.jsp" flush="true">
       		 <jsp:param value="4" name="menu"/> 
       </jsp:include> 
        
        <div class="content_box last" style="float:left; margin-top:0px;">
        	<div id="main">
				<div id="basic">
			    	<div id="first">
			    	<a href="tucao_chat.jsp"><img src="images/home_green.png" alt="img" />&nbsp;&nbsp;论坛首页&nbsp;&nbsp;&nbsp;&nbsp;</a>
			    	<!-- <a href="#"><img src="images/add.png" alt="img" />&nbsp;&nbsp;添加收藏&nbsp;&nbsp;</a> -->
			    	<a href="javascript:void(0)" onclick="window.external.AddFavorite(location.href, document.title)"><img src="images/add.png" alt="img" />&nbsp;&nbsp;加入收藏夹&nbsp;&nbsp;</a>
			    	<a href="#"><img src="images/contact_blue.png" alt="img" />&nbsp;&nbsp;登录</a><a href="#">|立即注册&nbsp;&nbsp;</a>
			    	<a href="#"><img src="images/documents_edit.png" alt="img" />&nbsp;我要发帖</a>
			    	</div>
			        <div id="second"><img src="images/group_green.png" alt="img" />&nbsp;&nbsp;今日访问量：13|&nbsp;&nbsp;昨日访问量：71|&nbsp;&nbsp;帖子：<%=total_tieze %>|&nbsp;&nbsp;会员：457163</div>
			    </div>
        <%
    		for(int i=0;i<sectionList.size();i++){
    			
    			BBS_Section section=sectionList.get(i);
    			int secId=section.getsId();//获取板块编号
    			String secName=section.getsName();//获取板块名称
    			String secStatement=section.getsStatement();//获取板块描述
    			int total=tCountList.get(i);//帖子数
    			String section_admin=saNameList.get(i);
    			
    			System.out.println(secName+"      "+secStatement+"   帖子总数："+total);   			
    			topicList=dbTopic.getList(secId);//根据板块Id,获取该版内的帖子列表   			
    	%>
        <div class="session">
	    	<div class="Stitle">
	    	<span style="float:left;margin-left:5px;"><img src="images/star_full.png" alt="" />&nbsp;&nbsp;<%=secName %></span>
	    	<span style="float:left;margin-left:70px;">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/documents.png" alt="" />&nbsp;&nbsp;帖子总数：<%=total%></span>
	    	<span style="float:right;padding-right:5px;"><img src="images/female.png" alt="img" />&nbsp;&nbsp;分区版主：<%=section_admin %></span>
	    	</div>
	        <div class="topic">
	          <table width="650" >
	          	<%
	          		for(int j=0;j<topicList.size();j++){
	          			
	    				BBS_Topic bbs_topic=topicList.get(j);
	    				int topicId=bbs_topic.gettId();//获取帖子ID
	    				String topicName=bbs_topic.gettTopic();//获取帖子名称；    				
	    				int num=dbreply.getReplyCount(topicId);//根据帖子ID获取每个帖子对应的回复数
	    				int userId=bbs_topic.gettUId();
	    				String userName=dbuser.getUserNameById(topicId, userId);//发帖子人名字
	    				
	    				System.out.println("    帖子"+(j+1)+"  "+topicName+"   回复总数："+num);
	          	%>
	          	<tr height="40">
	            	<td width="150" ><img style="width:20px;height:20px;margin-left:40px;" src="images/comments_reply.png" alt="img" /></td>
	                <td width="350" align="left">
	                <a href="/classroomweb/luntanServlet?action=enter_reply&&topicId=<%=topicId %>&&num=<%=num %>&&userName=<%=userName %>" 
	                style="disply:none;margin-left:10px; color:purple ;"><%=topicName %></a></td>
	                <td width="150" align="center"><img src="images/document_a4.png" alt="" />&nbsp;&nbsp;回复总数：<%=num %></td>
	            </tr>
	            <%} %>
	          </table>
	          <div class="conclude">&nbsp;&nbsp;<img src="images/arrow_large_right.png" alt="img" />&nbsp;&nbsp;板块介绍：欢迎进入<%=secName %>板块</div>
	        </div>
       </div>
      <% }%>
      <%dbconn.disConnect(); %>
      
     <!--  返回顶部，底部快速标签 -->
       <p><a  id="buttom"></a></p>
	   <div class="ad_float_right ad_couplebanner">
	      <a href="#top"><img src="images/up-026.png" title="返回顶部" width="48" height="48" border="0" /></a>
	   </div>
	   <div class="ad_float_left ad_couplebanner">
	      <a href="#buttom"><img src="images/down-026.png" title="回到底部" width="48" height="48" border="0" /></a>
	   </div>
	 <!--  end -->
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
