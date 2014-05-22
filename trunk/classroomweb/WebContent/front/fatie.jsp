<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,com.room.data.dao.*,com.room.data.model.*,com.room.data.tools.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/fatie.css" type="text/css" rel="stylesheet">
<title>发帖</title>
</head>
<%
	int userId=Helper.strToint(request.getParameter("userId"));
    String account=request.getParameter("account");
    System.out.println("用户Id="+userId);
%>
<body onload="showLeftTime()">

<div id="templatemo_wrapper">
  <jsp:include page="share_web/sidebar.jsp" flush="true" />       
</div>

 <div id="templatemo_content">    	
       <jsp:include page="share_web/header.jsp" flush="true">
       		 <jsp:param value="4" name="menu"/> 
       </jsp:include>         
       <div class="content_box last" style="float:left;"> 
            <img src="images/attention.png" alt="" />
            <font size="3" color="red"><strong>您好<%=account %>，请您不要恶意发帖，不要发表非法言论。</strong>  </font> 
            <a href="tucao_chat.jsp"><img src="images/home_green.png" alt="img" />&nbsp;&nbsp;论坛首页&nbsp;&nbsp;&nbsp;&nbsp;</a>  	
            <div id="wrapper">	
            
				  <form action="/classroomweb/luntanServlet?action=addTopic" method="post">	
				    <input type="hidden" value="<%=userId%>" name="userId">
					<div id="session">
						<label><strong>论坛板块：</strong></label>
						<input type="radio" value='1' name="myradio" class="myradio">教学楼区
						<input type="radio" value='2' name="myradio" class="myradio">图书馆区
						<input type="radio" value='3' name="myradio" class="myradio">食堂宿舍区
						<font color="red">*必选</font>
					</div>
					<div id="biaoti">
						<label><strong>标题：</strong></label>
						<input type="text" value="最多输入20个字" name="biaoti" class="mytext"><font color="red">*必填</font>
					</div>
					<div id="content">
						<textarea id="mytextarea" name="mytextarea" rows="18" cols="63" class="required"></textarea>			
					</div>
					<div id="sure">	
						<font color="red">*必填</font>					
						<input type="submit" class="submit_btn" name="submit" id="submit" value="发表帖子" />
			            <input type="reset" class="submit_btn" name="reset" id="reset" value="清空内容" />								 
					</div>
				</form>  
				  
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