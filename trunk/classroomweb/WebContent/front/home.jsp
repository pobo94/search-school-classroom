<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,com.room.data.dao.*,com.room.data.model.*,com.room.data.tools.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<!-- <link href="templatemo_style.css" rel="stylesheet" type="text/css" /> -->
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="/classroomweb/jslib/jquery-1.4.min.js"></script>
<script type="text/javascript">
	$(function(){
		 var index = 0;
		 var timer;
		 $(".imgID li").mouseover(function(){
			index  =   $(".imgID li").index(this);
			animateImg(index);
		 }).eq(0).mouseover();	
		 $('.main').hover(function(){
				 clearInterval(timer);
			 },function(){
				 timer = setInterval(function(){
					animateImg(index)
					index++;
					if(index==$(".imgID > li").length){index=0;}
				  } , 2000);
		 }).trigger("mouseleave");
	})
	function animateImg(index){
			var divh = $(".content .main").height();
			$(".imgarea").stop(true,false).animate({top : -divh*index+"px"},1000); 
			/* $(".imgarea").stop(true,false).animate({left:'-=166px'},1000); */
			$(".imgID li").removeClass("active")
				.eq(index).addClass("active");
	}
</script>
<style type="text/css">
	.content{float:left;}
	.content .main {
	   
	    margin-top:30px;
		margin-bottom:10px;
		/* width:335px; 
		height:264px; */ 
		width:550px; 
		height:300px;
		overflow:hidden;
		position:relative;
	}
	.content .imgarea,.content .imgID{
		position:absolute;
	}
	.content .imgarea li{ 
		list-style:none;
		display:inline;
	}
	.content .imgarea img{ 
		width:550px; 
		height:295px;
		display:block;
		border:0px;
	}
	.content .imgID{ 
		right:5px; 
		bottom:0px;
	}
	.content .imgID li{
		float: left;
		color: #069;
		text-align: center;
		line-height: 16px;
		width: 18px;
		height: 18px;
		font-family: Arial;
		font-size: 12px;
		cursor: pointer;
		overflow: hidden;
		margin: 3px 1px;
		border: 1px solid #069;
		background-color: #fff;
	}
	.content .imgID li.active{
		color: #fff;
		line-height: 16px;
		width: 16px;
		height: 16px;
		font-size: 14px;
		margin: 3px 1px;
		border: 1px solid #069;
		background-color: #069;
		font-weight: bold;
	}
</style>

</head>
<body>
<%
	List<Announcement> annList=(List<Announcement>)session.getAttribute("annList");
	session.setAttribute("annList",annList);
%>
<div id="templatemo_wrapper">
 <jsp:include page="share_web/sidebar.jsp" flush="true" />     
</div>
    
    <div id="templatemo_content">
    
        <jsp:include page="share_web/header.jsp" flush="true">  
            <jsp:param value="1" name="menu"/> 
        </jsp:include>
       
        <div class="content_box" style="float:left;">
        	
            <h2>欢迎访问"快人一步"教室查询网站</h2>
            <div class="content_box_inner">
                <div class="image_wrapper image_fl"><img src="images/templatemo_image_05.jpg" alt="image" /></div>
                <p align="justify">你有精美图片，我有实用消息；</p>
                <p align="justify">你有笑话万千，我有吐槽连连；</p>
                <p align="justify">你有阡陌纵横，我有曲径通幽；</p>
                <p align="justify">知识未动，教室先行；</p>
                <p align="justify">快人一步，伴你学成；</p>
                <div class="cleaner"></div>
            </div>
            
        </div>
        
         <div class="content_box last" style="float:left;">
           <div class="col_w280">
                	<h3>最近活动</h3>
                	
           <div class="content">
			  <div class="main" >
			    <ul class="imgarea" >
			      <li><a href="#"><img src="images/bg_0.jpg" /></a></li>
			      <li><a href="#"><img src="images/bg_1.jpg"/></a></li>
			      <li><a href="#"><img src="images/bg_2.jpg"/></a></li>
			      <li><a href="#"><img src="images/bg_3.jpg"/></a></li>
			    </ul>
			    <ul class="imgID" >
			      <li>1</li>
			      <li>2</li>
			      <li>3</li>
				  <li>4</li>
			    </ul>
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
