<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>设置</title>
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
    	
       <div id="templatemo_menu" style="float:left;">
			<ul>
                <li><a href="index.jsp" >首页</a></li>
                <li><a href="setting.jsp" class="current">设置与反馈</a></li>
            </ul>    	
	        <div class="cleaner"></div> 
      </div> <!-- end of templatemo_menu -->
        
        <div class="content_box" style="float:left;">
        	
            <h2> Partners</h2>
            <div class="content_box_inner">

            <div class="partner_box">
                <div class="image_wrapper float_l"><a href="http://www.flashmo.com/"><img src="images/flashmo.jpg" alt="image" /></a></div>
                <div class="ss_right">
                    <h3>Flash Templates</h3>
                    <p>Mauris vestibulum felis eget tortor. Praesent mattis varius quam. Vestibulum ullamcorper ipsum nec augue. Vestibulum auctor odio eget ante.</p>
                    <ul class="tmo_list">
                        <li>Sed nec eros egestas nisl </li>
                        <li>Morbi sed nulla ac est cursus </li>
                        <li>Curabitur ullamcorper nibh </li>
                        <li>Pellentesque adipiscing </li>   
                    </ul>
                    <div class="btn_more image_fr"><a href="#">More</a></div>
                </div>                    
                <div class="cleaner"></div>
            </div>
            
            <div class="partner_box">
                <div class="image_wrapper float_l"><a href="http://www.templatemo.com/page/1"><img src="images/templatemo.jpg" alt="image" /></a></div>
                <div class="ss_right">
                    <h3>Free CSS Templates</h3>
                    <p>Nunc commodo, magna pharetra semper vehicula, dui ligula feugiat elit, et euismod nunc orci ut libero. Etiam sodales massa vel metus. Mauris et elit quis mauris aliquet luctus.</p>
                    <ul class="tmo_list">
                        <li>Sed nec eros egestas nisl </li>
                        <li>Morbi sed nulla ac est cursus </li>
                        <li>Curabitur ullamcorper nibh </li>
                        <li>Pellentesque adipiscing </li>   
                    </ul>
                    <div class="btn_more image_fr"><a href="#">More</a></div>            
                </div>
                <div class="cleaner"></div>
            </div>
            
            <div class="partner_box">
                <div class="image_wrapper float_l"><a href="http://www.koflash.com/"><img src="images/koflash.jpg" alt="image" /></a></div>
                <div class="ss_right">
                	<h3>Flash Web Gallery</h3>
                    <p>Etiam fringilla vestibulum nulla. Suspendisse venenatis. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>
                    <ul class="tmo_list">
                        <li>Sed nec eros egestas nisl </li>
                        <li>Morbi sed nulla ac est cursus </li>
                        <li>Curabitur ullamcorper nibh </li>
                        <li>Pellentesque adipiscing </li>   
                    </ul>
                    <div class="btn_more image_fr"><a href="#">More</a></div>     
                </div>
                <div class="cleaner"></div>
            </div>
                
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
