<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>精品应用</title>
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
function clearText(field)
{
	if (field.defaultValue == field.value) field.value = '';
	else if (field.value == '') field.value = field.defaultValue;
}
</script>
</head>
<body>

<div id="templatemo_wrapper">
  <jsp:include page="share_web/sidebar.jsp" flush="true" />       
</div>
    
    <div id="templatemo_content">    	
       <jsp:include page="share_web/header.jsp" flush="true">
       		 <jsp:param value="5" name="menu"/> 
       </jsp:include>         
        <div class="content_box last" style="float:left;">     	
            <h2>应用推荐</h2>
            <div id="myform" >                       
           <p>
           <a href="http://www.super.cn/"> <img src="images/application/chaojikechengbiao.PNG" alt="image" />  超级课程表下载 </a>
           </p>  
            
           <p>
           <a href="http://cidian.youdao.com/multi.html"> <img src="images/application/youdao.PNG" alt="image" />有道词典下载 </a>
           </p>   
           <p>
           <a href="http://download.feixin.10086.cn/pc/new.html"> <img src="images/application/feixin.PNG" alt="image" />飞信下载 </a>
           </p>  
            
           <p>
           <a href="http://weixin.qq.com/cgi-bin/readtemplate?uin=&stype=&promot"> <img src="images/application/weixin.PNG" alt="image" />微信下载 </a>
           </p> 
           
            <p>
           <a href="http://im.qq.com/download/pc.shtml"> <img src="images/application/qq.PNG" alt="image" />QQ下载 </a>
           </p> 
           
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
