<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,com.room.data.dao.*,com.room.data.model.*,com.room.data.tools.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>校友论坛</title>
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/tiezi.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/default_blue.css"/>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script language="javascript" src="js/jquery.Sonline.js"></script>
<script language="javascript" src="js/kefu.js"></script>
<script language="javascript" src="js/mylogin.js"></script>
<script language="javascript" src="js/validate_replyForm.js"></script>
</head>
<%
    DbConnection dbconn=new DbConnection();
    DbBBS_Reply dbreply=new DbBBS_Reply(dbconn);
    
    String secName=(String)session.getAttribute("secName");//获取板块名称
    BBS_Topic topic=(BBS_Topic)session.getAttribute("topic");//获取帖子对象
    int num=(Integer)session.getAttribute("num");//获取帖子对应的回复数量
    String topicUser=(String)session.getAttribute("topicUser");//获取发帖人的名字
    
	List<BBS_Reply> replyList=(List<BBS_Reply>)session.getAttribute("replyList");//获取帖子对应的回复列表
	if(topic==null||replyList==null){
		response.sendRedirect("front/index.jsp");
	}
	
	User user = (User) session.getAttribute("user");
	int userId=0;
	if(user==null){
		System.out.println("用户为空");
	}
	
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
        
            <div id="loginInformation">
        	   		<%if(user==null){ %>
        	   		   <font size="2" color="green">Hi,欢迎您，您还没有登录！&nbsp;&nbsp;&nbsp;&nbsp;</font>
        	   			<a href="javascript:void(0)" id="tiezi" onclick="test(this)"><img src="images/contact_blue.png" alt="img" />&nbsp;&nbsp;登录</a>
        	   			<a href="#">|立即注册&nbsp;&nbsp;</a>
        	   		<%}else{ userId=user.getUserId();%>
        	   		<font size="2" color="green">你好：<%=user.getAccount() %>，欢迎登录！&nbsp;&nbsp;&nbsp;&nbsp;</font>
        	   		<%} %>
        	   </div>
		    <div id="basic">
			    	<div id="first">
			    	<img src="images/star_full.png" alt="" />&nbsp;<%=secName%><!-- 所属板块名称 -->&nbsp;&nbsp;&nbsp;&nbsp;
			    	<a href="tucao_chat.jsp"><img src="images/home_green.png" alt="img" />&nbsp;&nbsp;&nbsp;&nbsp;返回列表&nbsp;&nbsp;&nbsp;&nbsp;</a>
			    	<a href="javascript:void(0)" onclick="window.external.AddFavorite(location.href, document.title)"><img src="images/add.png" alt="img" />&nbsp;&nbsp;&nbsp;&nbsp;加入收藏夹&nbsp;&nbsp;&nbsp;&nbsp;</a>
			   
			    	<%if(user==null){ %> 
			    	<a onclick="alert('对不起，您还未登陆，无权发帖！')" style="cursor:pointer;">
				    	<img src="images/documents_edit.png" alt="img" />&nbsp;&nbsp;&nbsp;&nbsp;我要发帖
				     </a>
			    	<%}else{ %>
			    	 <a href="fatie.jsp?userId=<%=user.getUserId()%>&&account=<%=user.getAccount() %>" style="cursor:pointer;">
				    	<img src="images/documents_edit.png" alt="img" />&nbsp;&nbsp;&nbsp;&nbsp;我要发帖
				      </a>
			    	<%} %>
			    	</div>			       
			</div>				
        	<div id="reply_content">
				<div id="tiezi">
					<%
						String name=topic.gettTopic();
					    String topic_content=topic.gettContents();
					    String topic_date=Helper.changeTime(topic.gettPubTime());
					%>
					<div id="tiezi_left">
						<div class="adminImage"><img src="images/touxiang.jpg" /></div>
						<div class="name"><%=topicUser%>&nbsp;&nbsp;&nbsp;&nbsp;回复：<%=num %></div>
					</div>
					<div id="tiezi_right">
						<div id="tiezi_content"><%=name %>&nbsp;&nbsp;<%=topic_content%></div>
						<div id="tiezi_date">楼主&nbsp;&nbsp;发帖日期：<%=topic_date%>
						<a href="#pubReply" style="padding-left:50px;">回复</a></div>
					</div>				
				</div>
				<%for(int i=0;i<replyList.size();i++){
					BBS_Reply reply=replyList.get(i);
					int replyUserID=reply.getrUId();
					String replyAccount=dbreply.getReplyUser(replyUserID);
					String replyContent=reply.getrContent();
					String replyDate=Helper.changeTime(reply.getrTime());
				%>
				<div class="reply">
					<div class="floorNum">
						<div class="userImage"><img src="images/touxiang.jpg" /></div>
						<div class="userName"><%=i+1%>楼&nbsp;&nbsp;&nbsp;<%=replyAccount %></div>
					</div>
					<div class="floorContent">
						<div class="huifu_content">
							<%=replyContent%>
						</div>
						<div class="huifu_date">
						回复于：<%=replyDate%>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;沙发
						</div>
					</div>
				</div>
				<%} %>
				
				<%-- <div id="page_content"> 
				       [第一页]&nbsp;&nbsp;[上一页]
						[下一页]&nbsp;&nbsp;[最后一页 ]
						Go<select style="width:70px;">
						<%for(int i=1;i<5;i++){ %>
						<option value="<%=i%>"><%=i%></option>
						<%} %>
						</select><input type="submit" value="跳转" />
				</div> --%>
				<div id="pubReply">
					<div class="pubReply_left">
				        <div class="userImage"><img src="images/touxiang.jpg" /></div>
					</div>	
					<div class="pubReply_right" >
						 <div style="margin-top:5px; font:10px;">
						 温馨提示：请您不要恶意回复，回复内容不要包括非法信息。
						 <a href="javascript:void(0)" id="tiezi" onclick="test(this)">登录|立即注册</a>
						 </div>
						 <div style="font:10px;color:red;"id="textareaMark"></div>
						 <form action="/classroomweb/luntanServlet?action=addReply" method="post" onsubmit="return validate_form(this)">
						 
							 <input type="hidden" value="<%=topic.gettSId() %>" name="sectionId" /><!-- 板块D -->
							 <input type="hidden" value="<%=topic.gettId() %>" name="topicId" /><!-- 帖子ID -->
							 <input type="hidden" value="<%=topicUser %>" name="topic_user" /><!-- 发帖人 -->
							 <input type="hidden" value="<%=userId%>" id="userId" name="userId" /><!-- 登录用户ID -->
							 <input type="hidden" value="<%=secName%>" name="secName" /><!-- 板块名字 -->
					       	 <textarea id="mytextarea" name="mytextarea" rows="13" cols="63" id="mytextarea" onfocus="focusTextarea()" onblur="blurTextarea()"></textarea>
					       	 <div style="margin-top:5px; font:10px;">
					       	 	<input type="submit" class="submit_btn" name="submit" id="submit" value="发表回复" />
				                <input type="reset" class="submit_btn" name="reset" id="reset" value="清空内容" />	
					       	 </div>
				       	 </form>
					</div>					
				</div>
			</div>
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
    
    <div class="cleaner"><input type= /></div>
</div>

<div id="templatemo_footer_wrapper">
	<jsp:include page="share_web/footer.jsp" flush="true" /> 
</div>
    
</body>
</html>
