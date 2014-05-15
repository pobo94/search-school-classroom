<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,com.room.data.dao.*,com.room.data.model.*,com.room.data.tools.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>校友论坛</title>
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/default_blue.css"/>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script language="javascript" src="js/jquery.Sonline.js"></script>
<script type="text/javascript">
$(function(){
	$("body").Sonline({
		Position:"right",//left或right
		Top:200,//顶部距离，默认200px
		Effect:true, //滚动或者固定两种方式，布尔值：true或false
		DefaultsOpen:true, //默认展开：true,默认收缩：false
		Qqlist:"2682038202|客服01,2682038202|客服02,2682038202|客服03,2682038202|客服04,2682038202|客服05" //多个QQ用','隔开，QQ和客服名用'|'隔开
	});
})	
</script>
<style type="text/css">

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

#reply_content {
	width: 650px;	
	border: 1px solid #FCC;
	margin:auto;
}
.fatie{
	height:40px;
	background-color:#C9C;
	margin:0px;
	
}
.fatie_button1{
	margin:10px;
	display:block;
	background-color:#693;
	width:100px;
	height:40px;
	text-align:center;
	line-height:40px;
	cursor:pointer;
}
#tiezi {
	background-color: #F96;
	height: 120px;	
	line-height:60px;
}
#tiezi_left{
	float:left;
	width:120px;
	height:120px;
	text-align:center;
	border-right-style:dotted;
	border-right-width:1px;
	border-right-color:#666;
}
.adminImage{
	margin-top:10px;
	height:85px;
}
.name{
	height:25px;
	line-height:25px;
}
#tiezi_right{
	width:520px;
	float:left;
	height:120px;
}
#tiezi_content{
	margin-top:10px;
	height:85px;
	padding-left:20px;
}
#tiezi_date{
	height:25px;
	line-height:25px;
	padding-left:20px;
	border-top:1px dashed #999;
}
.reply{
	
	height: 130px;
	background-color: #FF9;
	margin-top:20px;
	margin-bottom:20px;
	
}
#pubReply {
	background-color: #C66;
	height: 200px;
}
.floorNum{
	float:left;
	width:120px;
	height: 130px;
	line-height:100px;
	text-align:center;
	border-right:1px dotted;
	border-right-color:#999;
}
.userImage{
	margin-top:10px;
	width:120px;
	height:90px;
	text-align:center;
}
.userName{
	height:30px;
	line-height:30px;
	
}
.floorContent{
	float:left;
	width:520px;
	height: 130px;	
}
#page_content {
	background-color: #CFC;
	height: 40px;
	line-height:40px;
	text-align:center;
}
.huifu_content{
	margin-top:10px;
	height:90px;
	line-height:60px;
	padding-left:20px;
	
}
.huifu_date{
	height: 30px;
	line-height: 30px;
	padding-left: 20px;
	border-top: 1px dashed #66F;
}






.ad_float_left,.ad_float_right{
 	float:right;position:fixed;top:540px;z-index:300;
 }
* html .ad_float_left,* html .ad_float_right{
	 position:absolute;
	 top:expression(offsetParent.scrollTop+350);
}
.ad_float_left{
	right:15px;
}
.ad_float_right{
	right:15px;top:480px;
}
#buttion{outline:0;} 
}
</style>
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
        
			<!-- <a href="tucao_chat.jsp"><img src="images/arrow_large_left.png" alt="返回" />&nbsp;&nbsp;返回列表</a> -->
		    <div id="basic">
			    	<div id="first">
			    	<a href="tucao_chat.jsp"><img src="images/home_green.png" alt="img" />&nbsp;&nbsp;论坛首页&nbsp;&nbsp;&nbsp;&nbsp;</a>
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
				<div class="userImage"><img src="images/touxiang.jpg" /></div>
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
