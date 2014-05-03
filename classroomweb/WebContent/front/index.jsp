<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,com.room.data.tools.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<!-- <link href="templatemo_style.css" rel="stylesheet" type="text/css" /> -->
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
        
         <div class="content_box last">
                
                <div class="col_w280">
                	<h3>最近项目</h3>
                    <div class="image_wrapper"><img src="images/templatemo_image_02.jpg" alt="image" /></div>
                	<p><em>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</em></p>
                    <p align="justify">Cras tortor urna, adipiscing at mollis sit amet, suscipit quis ipsum. Maecenas bibendum interdum quam at vestibulum. Suspendisse ipsum massa, congue vitae gravida in, lacinia nec ante. Sed cursus nibh eget felis mattis sodales. Etiam at neque nec tellus posuere auctor.</p>
                    <div class="cleaner"></div>
                	<div class="btn_more image_fr"><a href="#">More</a></div>
                </div>
                <div class="col_w280 last">
                	<h3>新增服务</h3>
                    <p align="justify">Donec nunc neque, pulvinar a, vestibulum eget, luctus id, orci. Pellentesque elementum enim a augue. Nunc sit amet sapien eget eros iaculis hendrerit quis a enim.</p>
                    
                	<ul class="tmo_list">
                        <li>Sed nec eros egestas nisl</li>
                        <li>Morbi sed nulla ac est cursus</li>
                        <li><a href="#">Curabitur ullamcorper nibh</a></li>
                        <li>Pellentesque adipiscing</li>   
                        <li>Morbi sed nulla ac est cursus</li>
                        <li><a href="#">Curabitur ullamcorper nibh</a></li>                     
                    </ul>
	                <div class="cleaner"></div>
    	            <div class="btn_more image_fr"><a href="#">More</a></div>
                </div>
                <div class="cleaner"></div>
            </div>
            
        </div>
    <div class="cleaner"></div>    
</div>
    
    


<div id="templatemo_footer_wrapper">
	<jsp:include page="share_web/footer.jsp" flush="true" />
</div>
   
</body>
</html>
