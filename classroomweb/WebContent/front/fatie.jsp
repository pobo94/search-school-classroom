<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,com.room.data.dao.*,com.room.data.model.*,com.room.data.tools.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/fatie.css" type="text/css" rel="stylesheet">
<title>发帖</title>
<script type="text/javascript">
	function check(){
		
		//以下是帖子标题不为空
		if (document.form.biaoti.value == "")
		{
		//alert("用户名不能为空,请您输入!");
		document.getElementById("info_biao").innerHTML="帖子标题不能为空";
		return false;
		}
		//以下是帖子长度限制
		if(document.form.biaoti.value.length<3||document.form1.biaoti.value.length>20){ 
			//alert("用户名长度必须在3-20位之间！"); 
			document.getElementById("info_biao").innerHTML="帖子标题度必须在3-20位之间！";
			return false; 
		} 

	}
</script>
</head>
<%
	int userId=Helper.strToint(request.getParameter("userId"));
    String account=request.getParameter("account");
/*     System.out.println("用户Id="+userId); */
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
            <img style="height:20px;width:20px;" src="images/attention.png" alt="img" />
            <font size="2" color="red">您好<%=account %>，请不要恶意发帖，不要发表非法言论。</font> 
            <a href="tucao_chat.jsp"><img src="images/home_green.png" alt="img" />&nbsp;&nbsp;论坛首页&nbsp;&nbsp;&nbsp;&nbsp;</a>  	
            <div id="wrapper">	
            
				  <form  name="form" id="form" action="/classroomweb/luntanServlet?action=addTopic" method="post" >	
				    <input type="hidden" value="<%=userId%>" name="userId">
					<div id="session">
						<label><strong>论坛板块：</strong></label>
						<input type="radio" value='1' name="myradio" class="myradio">教学楼区
						<input type="radio" value='2' name="myradio" class="myradio">图书馆区
						<input type="radio" value='3' name="myradio" class="myradio">食堂宿舍区
						<label id="info_session"></label>
					</div>
					<div id="biaoti">
						<label ><strong>标题：</strong></label>
						<input type="text" value="最多输入20个字" name="biaoti" id="mytext" emptyInfo="字段不能为空！">
					    <div id="info_biaoti"></div>
					</div>
					<div id="content">
						<textarea id="mytextarea" name="mytextarea" rows="18" cols="63" class="required"></textarea>
						<div id="info_biaoti"></div>			
					</div>
					<div id="sure">						
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