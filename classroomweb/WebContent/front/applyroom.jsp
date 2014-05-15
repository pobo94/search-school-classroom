<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教室申请</title>
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
            <jsp:param value="3" name="menu"/> 
        </jsp:include>
        
        <div class="content_box last" style="float:left;">         	
            <h2>教室申请</h2>            
        </div>
        
        
        
        
        
        
            
        </div>
    
    <div class="cleaner">
    
    
    
    
    </div>
</div>
<div id="templatemo_footer_wrapper">
	<jsp:include page="share_web/footer.jsp" flush="true" /> 

</div>
    
</body>
</html>
