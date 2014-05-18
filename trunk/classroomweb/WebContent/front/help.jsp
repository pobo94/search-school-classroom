<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>帮助</title>
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
</head>
<body onload="showLeftTime()">

<div id="templatemo_wrapper">
	<jsp:include page="share_web/sidebar.jsp" flush="true" />        
</div>
    
    <div id="templatemo_content" >
    	
        <div id="templatemo_menu" style="float:left;">
			<ul>
                <li><a href="index.jsp" >首页</a></li>
                <li><a href="contact.jsp" class="current">帮助</a></li>
            </ul>    	
	        <div class="cleaner"></div> 
      </div> <!-- end of templatemo_menu -->
        
        <div class="content_box" style="float:left;">
        	
            <h2> 教室查询说明<img src="images/hot.png" alt="" /></h2>
            <div class="content_box_inner">
             <!--    <div class="image_wrapper image_fl"><img src="images/templatemo_image_03.jpg" alt="image" /></div> -->
              
              	<p>(1)您每次进入的时候系统默认为您显示当天内A楼所有的空闲教室。</p>
                <p>(2)如果您想要查询其它日期或教学楼内的空闲教室，您可以借助我们的搜索框进行搜索。</p>
                <p>(3)您可以借助页面右侧的"分享"将自己查询到的空闲教室信息，进行分享。</p>
                
                <div class="cleaner"></div>
            </div>
            
        </div>
        <div class="content_box" style="float:left;">
        	
            <h2> 教室申请说明<img src="images/hot.png" alt="" /></h2>
            <div class="content_box_inner">
             <!--    <div class="image_wrapper image_fl"><img src="images/templatemo_image_03.jpg" alt="image" /></div> -->
              
              	<p>温馨提示：请您自觉，合理的申请教室，如若恶意申请教室您的申请资格将作废。</p>
                <p>(1)不管您是学生还是教师，请您在申请教室前登录您的账号信息(还没有账号信息的，请及时注册)，登录成功后，请按照要求填写或选择相关信息。</p>
                <p>(2)教室申请被提交后，我们会根据教室使用情况及其他要求对您的申请进行审核，条件符合我们会及时提醒您申请成功。</p>
                <p>(3)如果申请失败，您可以参考其他的空闲教室继续申请。</p>
                
                <div class="cleaner"></div>
            </div>
            
        </div>
        
        <div class="content_box" style="float:left;">
        	
            <h2> 精品应用下载<img src="images/tuijian.png" alt="" /></h2>
            <div class="content_box_inner">
               <!--  <div class="image_wrapper image_fl"><img src="images/templatemo_image_05.jpg" alt="image" /></div> -->
              
                <p>(1)在精品应用页面，你可以看到一些常用的软件。通过我们这个平台，您可以根据自己的喜好选择下载。</p>
                <p>(2)需要提醒的是在下载前，您需要已经登录账号。</p>                
                <div class="cleaner"></div>
            </div>
            
        </div>
        
         <div class="content_box last" style="float:left;">
                
               <h2>论坛使用说明</h2>
               <div class="content_box_inner">
                  <!-- <div class="image_wrapper image_fl"><img src="images/templatemo_image_01.jpg" alt="image" /></div> -->
                   <p>(1)进入校友论坛页面后，您可以选择浏览不同板块的帖子，或者相关回复信息。</p>
                    <p>(2)如果您想要发帖，跟帖或者回帖，您需要登录账号信息，没有的及时注册。</p>
                    
                    
                    <div class="cleaner"></div>
                    
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
