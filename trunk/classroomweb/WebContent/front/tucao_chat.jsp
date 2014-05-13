<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,com.room.data.dao.*,com.room.data.model.*,com.room.data.tools.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>校友论坛</title>
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
</script>

<style type="text/css">
#main {
	margin: auto;
	width: 650px;
	
}
#basic {
	height: 50px;
	/* background:#FCF; */
}
#first {
	height: 20px;
	font-family:宋体/* Verdana, Geneva, sans-serif */;
	font-size:14px;
}
#second {
	margin-top:5px;
	height: 20px;
	font-family:Verdana, Geneva, sans-serif;
	font-size:14px;
}
.session{
	/* height: 300px; */
	margin-top: 10px;
	margin-bottom: 10px;
	border: 1px solid #CCC;
	font-family:Verdana, Geneva, sans-serif;
	font-size:14px;
}
.Stitle{
	height:40px;
	line-height:40px;
	background:#6CC;
	font-family:Verdana, Geneva, sans-serif;
	font-size:14px;
	 
}
.conclude{
	margin-top: 8px;
	border-top-style: solid;
	border-top-width: 1px;
	border-top-color: #CCC;
	background-color: #AD8DAB;
	font-family:Verdana, Geneva, sans-serif;
	font-size:14px;
	background:#6CC;
}
.1colum{
	width:100px;
	
}
.2colum{
	width:450px;
	
}
.3colum{
	width:100px;
	
}
table{
	font-family:宋体;
	font-size:14px;
}


.ad_float_left,.ad_float_right{
 	float:right;position:fixed;top:300px;z-index:300;
 }
* html .ad_float_left,* html .ad_float_right{
	 position:absolute;
	 top:expression(offsetParent.scrollTop+350);
}
.ad_float_left{
	right:15px;
}
.ad_float_right{
	right:15px;top:240px;
}
#buttion{outline:0;} 
}
</style>
</head>
<%
DbConnection dbconn=new DbConnection();
List<BBS_Section> sectionList=(List<BBS_Section>)session.getAttribute("sectionList");
List<Integer> tCountList=(List<Integer>)session.getAttribute("tCountList");
DbBBS_Topic dbTopic=new DbBBS_Topic(dbconn);
DbBBS_Reply dbreply=new DbBBS_Reply(dbconn);
List<BBS_Topic> topicList=new ArrayList<BBS_Topic>();
%>
<body>


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
			    	<a href="#"><img src="images/home_green.png" alt="img" />&nbsp;&nbsp;论坛首页&nbsp;&nbsp;&nbsp;&nbsp;</a>
			    	<a href="#"><img src="images/add.png" alt="img" />&nbsp;&nbsp;添加收藏&nbsp;&nbsp;</a>
			    	<a href="#"><img src="images/contact_blue.png" alt="img" />&nbsp;&nbsp;登录</a><a href="#">|立即注册&nbsp;&nbsp;</a>
			    	<a href="#"><img src="images/documents_edit.png" alt="img" />&nbsp;我要发帖</a>
			    	</div>
			        <div id="second"><img src="images/group_green.png" alt="img" />&nbsp;&nbsp;今日访问量：13|昨日访问量：71|帖子：3168937|会员：457163</div>
			    </div>
        <%
    		for(int i=0;i<sectionList.size();i++){
    			
    			BBS_Section section=sectionList.get(i);
    			int secId=section.getsId();//获取板块编号
    			String secName=section.getsName();//获取板块名称
    			String secStatement=section.getsStatement();//获取板块描述
    			int total=tCountList.get(i);//帖子数
    			
    			System.out.println(secName+"      "+secStatement+"   帖子总数："+total);   			
    			topicList=dbTopic.getList(secId);//根据板块Id,获取该版内的帖子列表   			
    	%>
        <div class="session">
	    	<div class="Stitle">
	    	<span style="float:left;margin-left:5px;"><img src="images/star_full.png" alt="" />&nbsp;&nbsp;<%=secName %></span>
	    	<span style="float:left;margin-left:5px;">&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/documents.png" alt="" />&nbsp;&nbsp;帖子总数：<%=total%></span>
	    	<span style="float:right;padding-right:5px;"><img src="images/female.png" alt="img" />&nbsp;&nbsp;分区版主：妮妮</span>
	    	</div>
	        <div class="topic">
	          <table width="650" >
	          	<%
	          		for(int j=0;j<topicList.size();j++){
	          			
	    				BBS_Topic bbs_topic=topicList.get(j);
	    				int topicId=bbs_topic.gettId();//获取帖子ID
	    				String topicName=bbs_topic.gettTopic();//获取帖子名称；    				
	    				int num=dbreply.getReplyCount(topicId);//根据帖子ID获取每个帖子对应的回复数
	    				
	    				System.out.println("    帖子"+(j+1)+"  "+topicName+"   回复总数："+num);
	          	%>
	          	<tr height="40">
	            	<td class="1colum" align="center"><img style="width:20px;height:20px;" src="images/comments_reply.png" alt="img" /></td>
	                <td class="2colum" align="center"><%=topicName %></td>
	                <td class="3coloum" align="center"><img src="images/document_a4.png" alt="" />&nbsp;&nbsp;帖子总数：<%=num %></td>
	            </tr>
	            <%} %>
	          </table>
	          <div class="conclude">&nbsp;&nbsp;<img src="images/arrow_large_right.png" alt="img" />&nbsp;&nbsp;板块介绍：欢迎进入<%=secName %>世界，互相交流，互相学习。</div>
	        </div>
       </div>
      <% }%>
      <%dbconn.disConnect(); %>
       <p><a  id="buttom"></a></p>
	   <div class="ad_float_right ad_couplebanner">
	      <a href="#top"><img src="images/up-026.png" title="返回顶部" width="48" height="48" border="0" /></a>
	   </div>
	   <div class="ad_float_left ad_couplebanner">
	      <a href="#buttom"><img src="images/down-026.png" title="回到底部" width="48" height="48" border="0" /></a>
	   </div>
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
