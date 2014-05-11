<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>校友论坛</title>
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
</script>

<style type="text/css">
#content {
	margin: auto;
	width: 650px;
	
}
#basic {
	height: 50px;
	/* background:#FCF; */
}
#first {
	height: 20px;
	font-family:Verdana, Geneva, sans-serif;
	font-size:14px;
}
#second {
	margin-top:5px;
	height: 20px;
	font-family:Verdana, Geneva, sans-serif;
	font-size:14px;
}
.session{
	height: 300px;
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
.session1{
	height: 220px;
	margin-top: 10px;
	margin-bottom: 10px;
	border: 1px solid #CCC;
	font-family:Verdana, Geneva, sans-serif;
	font-size:14px;
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
	/* background:url(images/yusan.jpg) */
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
        	<div id="content">
	<div id="basic">
    	<div id="first">
    	<img src="images/home_green.png" alt="img" />&nbsp;&nbsp;论坛首页&nbsp;&nbsp;&nbsp;&nbsp;
    	<img src="images/add.png" alt="img" />&nbsp;&nbsp;添加收藏&nbsp;&nbsp;
    	<img src="images/contact_blue.png" alt="img" />&nbsp;&nbsp;登录|立即注册&nbsp;&nbsp;
    	<img src="images/documents_edit.png" alt="img" />&nbsp;我要发帖
    	</div>
        <div id="second"><img src="images/group_green.png" alt="img" />&nbsp;&nbsp;今日访问量：13|昨日访问量：71|帖子：3168937|会员：457163</div>
    </div>
    <div class="session">
    	<div class="Stitle">
    	<span style="float:left;margin-left:5px;"><img src="images/star_full.png" alt="" />&nbsp;&nbsp;web开发</span>
    	<span style="float:right;padding-right:5px;"><img src="images/female.png" alt="img" />分区版主：妮妮</span>
    	</div>
        <div class="topic">
          <table width="650" height="230">
          	<tr >
            	<td class="1colum" align="center"><img style="width:20px;height:20px;" src="images/comments_reply.png" alt="img" /></td>
                <td class="2colum" align="center">jsp开发</td>
                <td class="3coloum" align="center"><img src="images/document_a4.png" alt="" />&nbsp;&nbsp;帖子总数：30</td>
            </tr>
            <tr>
            	<td class="1colum" align="center"><img style="width:20px;height:20px;" src="images/comments_reply.png" alt="img" /></td>
                <td class="2colum" align="center">Asp开发</td>
                <td class="3colum" align="center"><img src="images/document_a4.png" alt="" />&nbsp;&nbsp;帖子总数：30</td>
            </tr>
            <tr>
            	<td class="1colum" align="center"><img style="width:20px;height:20px;" src="images/comments_reply.png" alt="img" /></td>
                <td class="2colum" align="center">PHP开发</td>
                <td class="3colum" align="center"><img src="images/document_a4.png" alt="" />&nbsp;&nbsp;帖子总数：30</td>
            </tr>
            <tr>
            	<td class="1colum" align="center"><img style="width:20px;height:20px;" src="images/comments_reply.png" alt="img" /></td>
                <td class="2colum" align="center">Ajax开发</td>
                <td class="3colum" align="center"><img src="images/document_a4.png" alt="" />&nbsp;&nbsp;帖子总数：30</td>
            </tr>
            <tr>
            	<td class="1colum" align="center"><img style="width:20px;height:20px;" src="images/comments_reply.png" alt="img" /></td>
                <td class="2colum" align="center">其他技术开发</td>
                <td class="3colum" align="center"><img src="images/document_a4.png" alt="" />&nbsp;&nbsp;帖子总数：30</td>
            </tr>
          </table>
          <div class="conclude">&nbsp;&nbsp;<img src="images/arrow_large_right.png" alt="img" />&nbsp;&nbsp;板块介绍：欢迎进入"WEB开发"世界，互相交流，互相学习。</div>
        </div>
    </div>
    <div class="session1" >
    	<div class="Stitle">
    	<span style="float:left;margin-left:5px;"><img src="images/star_full.png" alt="" />&nbsp;&nbsp;开发语言工具</span>
    	<span style="float:right;padding-right:5px;"><img src="images/male.png" alt="img" />分区版主：秋雨无痕</span>
    	</div>
        <div class="topic">
          <table width="650" height="150">
          	<tr>
            	<td class="1colum" align="center"><img style="width:20px;height:20px;" src="images/comments_reply.png" alt="img" /></td>
                <td class="2colum" align="center">java程序语言</td>
                <td class="3colum" align="center"><img src="images/document_a4.png" alt="" />&nbsp;&nbsp;帖子总数：30</td>
            </tr>
            <tr>
            	<td class="1colum" align="center"><img style="width:20px;height:20px;" src="images/comments_reply.png" alt="img" /></td>
                <td class="2colum" align="center">C#程序语言</td>
                <td class="3colum" align="center"><img src="images/document_a4.png" alt="" />&nbsp;&nbsp;帖子总数：30</td>
            </tr>
            <tr>
            	<td class="1colum" align="center"><img style="width:20px;height:20px;" src="images/comments_reply.png" alt="img" /></td>
                <td class="2colum" align="center">C程序语言</td>
                <td class="3colum" align="center"><img src="images/document_a4.png" alt="" />&nbsp;&nbsp;帖子总数：30</td>
            </tr>
          </table>
           <div class="conclude" >&nbsp;&nbsp;<img src="images/arrow_large_right.png" alt="img" />&nbsp;&nbsp;板块介绍：欢迎进入"开发语言"世界，互相交流，互相学习。</div>
        </div>
    </div>
    <div class="session1">
    	<div class="Stitle">
    	<span style="float:left;margin-left:5px;"><img src="images/star_full.png" alt="" />&nbsp;&nbsp;数据库技术</span>
    	<span style="float:right;padding-right:5px;"><img src="images/female.png" alt="img" />分区版主:闹闹</span>
    	</div>
        <div class="topic">
          <table width="650" height="150">
          	<tr>
            	<td class="1colum" align="center"><img style="width:20px;height:20px;" src="images/comments_reply.png" alt="img" /></td>
                <td class="2colum" align="center">MySql数据库</td>
                <td class="3colum" align="center"><img src="images/document_a4.png" alt="" />&nbsp;&nbsp;帖子总数：30</td>
            </tr>
            <tr>
            	<td class="1colum" align="center"><img style="width:20px;height:20px;" src="images/comments_reply.png" alt="img" /></td>
                <td class="2colum" align="center">Oracle数据库</td>
                <td class="3colum" align="center"><img src="images/document_a4.png" alt="" />&nbsp;&nbsp;帖子总数：30</td>
            </tr>
            <tr>
            	<td class="1colum" align="center"><img style="width:20px;height:20px;" src="images/comments_reply.png" alt="img" /></td>
                <td class="2colum" align="center">SqlServer数据库</td>
                <td class="3colum" align="center"><img src="images/document_a4.png" alt="" />&nbsp;&nbsp;帖子总数：30</td>
            </tr>
          </table>
           <div class="conclude">&nbsp;&nbsp;<img src="images/arrow_large_right.png" alt="img" />&nbsp;&nbsp;板块介绍：欢迎进入"数据库"世界，互相交流，互相学习。</div>
        </div>
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
