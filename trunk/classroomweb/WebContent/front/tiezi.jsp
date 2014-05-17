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

<link href="ueditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet"/>
<link href="ueditor/themes/default/css/button.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="ueditor/third-party/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8" src="ueditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="ueditor/umeditor.min.js"></script>
<script type="text/javascript" src="ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<%
    BBS_Topic topic=(BBS_Topic)session.getAttribute("topic");
    int num=(Integer)session.getAttribute("num");
	List<BBS_Reply> replyList=(List<BBS_Reply>)session.getAttribute("replyList");
	if(topic==null||replyList==null){
		response.sendRedirect("front/index.jsp");
	}
	
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
		    <div id="basic">
			    	<div id="first">
			    	<a href="tucao_chat.jsp"><img src="images/home_green.png" alt="img" />&nbsp;&nbsp;返回列表&nbsp;&nbsp;&nbsp;&nbsp;</a>
			    	<a href="javascript:void(0)" onclick="window.external.AddFavorite(location.href, document.title)"><img src="images/add.png" alt="img" />&nbsp;&nbsp;加入收藏夹&nbsp;&nbsp;</a>
			    	<a href="#"><img src="images/contact_blue.png" alt="img" />&nbsp;&nbsp;登录</a><a href="#">|立即注册&nbsp;&nbsp;</a>
			    	<a href="#"><img src="images/documents_edit.png" alt="img" />&nbsp;我要发帖</a>
			    	</div>			       
			</div>				
        	<div id="reply_content">
				<div class="fatie">
					<div class="fatie_button1">
						发帖
					</div>
					
				</div>
				<div id="tiezi">
					<%
						String name=topic.gettTopic();
					    String topic_content=topic.gettContents();
					    String topic_date=Helper.changeTime(topic.gettPubTime());
					%>
					<div id="tiezi_left">
						<div class="adminImage"><img src="images/touxiang.jpg" /></div>
						<div class="name">妮妮 &nbsp;&nbsp;&nbsp;&nbsp;回复：<%=num %></div>
					</div>
					<div id="tiezi_right">
						<div id="tiezi_content"><%=name %>&nbsp;&nbsp;<%=topic_content%></div>
						<div id="tiezi_date">楼主&nbsp;&nbsp;发帖日期：<%=topic_date%>
						<a href="#pubReply" style="padding-left:50px;">回复</a></div>
					</div>				
				</div>
				<%for(int i=0;i<replyList.size();i++){
					BBS_Reply reply=replyList.get(i);
					String replyContent=reply.getrContent();
					String replyDate=Helper.changeTime(reply.getrTime());
				%>
				<div class="reply">
					<div class="floorNum">
						<div class="userImage"><img src="images/touxiang.jpg" /></div>
						<div class="userName"><%=i+1%>楼&nbsp;&nbsp;&nbsp;小飞</div>
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
				
				<div id="page_content"> 
				       [第一页]&nbsp;&nbsp;[上一页]
						[下一页]&nbsp;&nbsp;[最后一页 ]
						Go<select style="width:70px;">
						<%for(int i=1;i<5;i++){ %>
						<option value="<%=i%>"><%=i%></option>
						<%} %>
						</select><input type="submit" value="跳转" />
				</div>
				<div id="pubReply">
					<div class="pubReply_left">
				        <div class="userImage"><img src="images/touxiang.jpg" /></div>
					</div>	
					<div class="pubReply_right">
				       	 <script type="text/plain" id="myEditor" style="width:525px;height:200px;overflow:auto;">
   							 回复之前请先<a href="#" style="cursor:pointer;">登录</a>
						</script>
						 <div id="btns">
						    <table>
						        <tr>
						        <td>
						        <button class="btn" onclick="getContentTxt()">获得纯文本</button>&nbsp;
						        <button class="btn" onclick="hasContent()">判断是否有内容</button>
						        </td>
						        </tr>
						    </table>
						 </div>
						<script type="text/javascript" charset="utf-8" src="ueditor/index.js"></script>
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
    
    <div class="cleaner"></div>
</div>

<div id="templatemo_footer_wrapper">
	<jsp:include page="share_web/footer.jsp" flush="true" /> 
</div>
    
</body>
</html>
