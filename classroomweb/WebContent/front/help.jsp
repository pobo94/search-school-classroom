<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>帮助</title>
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
    
    <div id="templatemo_content" >
    	
        <div id="templatemo_menu" style="float:left;">
			<ul>
                <li><a href="index.jsp" >首页</a></li>
                <li><a href="contact.jsp" class="current">帮助</a></li>
            </ul>    	
	        <div class="cleaner"></div> 
      </div> <!-- end of templatemo_menu -->
        
        <div class="content_box" style="float:left;">
        	
            <h2> 我们的公司</h2>
            <div class="content_box_inner">
                <div class="image_wrapper image_fl"><img src="images/templatemo_image_03.jpg" alt="image" /></div>
              
                <p><em>Nullam at erat ipsum, quis tincidunt mauris. Nunc sit amet sapien eget eros iaculis hendrerit quis a enim. Vestibulum at leo ante, vel auctor velit.</em></p>
                <p>Aenean dolor mi, malesuada eget consequat tristique, tempor vehicula ligula. Ut quis nibh orci, fermentum consequat est. Proin porta congue enim, a interdum mi hendrerit quis. Donec lacus sem, egestas vitae posuere in, pulvinar ac nisi. Nullam eu metus libero, et pretium massa. Sed neque purus, placerat quis tempor nec, ullamcorper ut urna. Vivamus eget lorem risus, eget dapibus eros euismod ultricies.</p>
                <div class="btn_more image_fr"><a href="#">More</a></div>
                
                <div class="cleaner"></div>
            </div>
            
        </div>
        
         <div class="content_box last" style="float:left;">
                
               <h2>我们的团队</h2>
               <div class="content_box_inner">
                    <p align="justify">Fusce sed quam magna. Aliquam erat volutpat. Vestibulum scelerisque blandit luctus. Sed ornare elit eu erat eleifend vel commodo dolor feugiat. Sed cursus nibh eget felis mattis sodales. Etiam at neque nec tellus posuere auctor.   Donec nunc neque, pulvinar a, vestibulum eget, luctus id, orci. Pellentesque elementum enim a augue.</p>
                    <div class="tmo_list_r">
                        <ul class="tmo_list">
                            <li>Morbi sed nulla</li>
                            <li>Curabitur ullamcorper</li>
                            <li>Pellentesque adipiscing</li>
                            <li>Cras rutrum ullamcorper</li>
                            <li>Sed nec eros</li>
                            <li>Morbi sed nulla</li>
                      </ul>
                 </div>
                    <div class="tmo_list_r">
                        <ul class="tmo_list tmo_list_r">
                            <li>Sed nec eros</li>
                            <li>Morbi sed nulla</li>
                            <li>Morbi sed nulla</li>
                            <li>Curabitur ullamcorper</li>
                            <li>Pellentesque adipiscing</li>
                            <li>Cras rutrum ullamcorper</li>
                        </ul>
                    </div>
                    <div class="cleaner"></div>
                    <div class="btn_more float_r"><a href="#">More</a></div>
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
