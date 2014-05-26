<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>错误提示</title>
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<%response.setHeader("refresh", "3;URL=/classroomweb/front/index.jsp");// %>	
	<div id="templatemo_wrapper">    
     <jsp:include page="share_web/sidebar.jsp" flush="true" />        
     </div>
    
    <div id="templatemo_content">
    	
       <jsp:include page="share_web/header.jsp" flush="true">  
            <jsp:param value="3" name="menu"/> 
        </jsp:include>
        
        <div class="content_box last" style="float:left;">         	
            <h2>错误提示</h2>
            <p>
                       输入的用户名或密码有误，3秒钟后将自动跳转到首页，你也可以手动点击
               <a href="/classroomweb/front/index.jsp">首页</a>
       
       </p> 
                    
        </div>
        
        
                
        </div>
    
<div class="cleaner"></div>
</div>
<div id="templatemo_footer_wrapper">
	<jsp:include page="share_web/footer.jsp" flush="true" /> 

</div>
	
	

</body>


</html>