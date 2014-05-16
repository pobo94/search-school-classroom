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
					<div id="tiezi_left">
						<div class="adminImage"><img src="images/touxiang.jpg" /></div>
						<div class="name">贴主：妮妮</div>
					</div>
					<div id="tiezi_right">
						<div id="tiezi_content">图书馆高大尚得得得</div>
						<div id="tiezi_date">发帖日期：2014-5-15日<a href="#" style="padding-left:50px;">回复</a></div>
					</div>				
				</div>
				<div class="reply">
					<div class="floorNum">
						<div class="userImage"><img src="images/touxiang.jpg" /></div>
						<div class="userName">小飞</div>
					</div>
					<div class="floorContent">
						<div class="huifu_content">
							是啊，我也这么觉得。
						</div>
						<div class="huifu_date">
						回复于：2014-5-18日
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;沙发
						</div>
					</div>
				</div>
				<div class="reply">
					<div class="floorNum">
						<div class="userImage"><img src="images/touxiang.jpg" /></div>
						<div class="userName">小雨</div>
					</div>
					<div class="floorContent">
						<div class="huifu_content">
							同感。
						</div>
						<div class="huifu_date">
						回复于：2014-5-16日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;沙发
						</div>
					</div>
				</div>
				<div class="reply">
					<div class="floorNum">
						<div class="userImage"><img src="images/touxiang.jpg" /></div>
						<div class="userName">小雨</div>
					</div>
					<div class="floorContent">
						<div class="huifu_content">
							同感。
						</div>
						<div class="huifu_date">
						回复于：2014-5-16日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;沙发
						</div>
					</div>
				</div>
				<div class="reply">
					<div class="floorNum">
						<div class="userImage"><img src="images/touxiang.jpg" /></div>
						<div class="userName">小雨</div>
					</div>
					<div class="floorContent">
						<div class="huifu_content">
							同感。
						</div>
						<div class="huifu_date">
						回复于：2014-5-16日&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;沙发
						</div>
					</div>
				</div>
				<div id="page_content"> 
						[上一页]&nbsp;&nbsp;[下一页 ] 
						<%for(int i=1;i<5;i++){ %>
						[<%=i %>]
						<%} %>
						.....[8]
				</div>
				<div class="fatie">
					<div class="fatie_button1">
						发帖
					</div>
				</div>
				<div id="pubReply">
					<div class="pubReply_left">
				        <div class="userImage"><img src="images/touxiang.jpg" /></div>
					</div>	
					<div class="pubReply_right">
				       	 回复内容
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
