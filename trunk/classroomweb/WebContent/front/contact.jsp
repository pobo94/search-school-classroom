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
    	
       <div id="templatemo_menu" style="float:left;">
			<ul>
                <li><a href="index.jsp" >首页</a></li>
                <li><a href="contact.jsp" class="current">联系我们</a></li>
            </ul>    	
	        <div class="cleaner"></div> 
      </div> <!-- end of templatemo_menu -->
        
        <div class="content_box" style="float:left;">
        	
            <h2>联系我们</h2>
            <div class="content_box_inner">
            
            <div class="image_wrapper image_fl"><img src="images/templatemo_image_04.jpg" alt="image 4" /></div>
            
                <p>科师小团队时刻准备着为您服务!!!</p>
                <p>通过以下两种方式您可以我们取得联系：</p>
		<p>——电联，我们有固定的客服人员将与您实时沟通。</p>
  		<p>——发送邮件，我们的工作人员每天定期会查看邮箱，与您联系。</p>
                
                <div class="cleaner"></div>
            </div>
            
        </div>
        
         <div class="content_box">
                
            <div class="col_w280">
 		<h4>电话联系</h4>
                <h3>位置一</h3>
                河北科技师范学院, <br />
                信息管理与信息系统11级6号楼102<br />
                王伟娟<br />
                <br />
                Tel: 010-090-1230<br />
                Fax: 010-090-4560
            </div>
            <div class="col_w280 last">
                <h3>位置二</h3>
                河北科技师范学院, <br />
                 信息管理与信息系统11级6号楼106<br />
                程禄元<br />
                <br />
                Tel: 020-080-4400<br />
                Fax: 020-080-7700
            </div>
            
            <div class="cleaner"></div>
        </div>
        
        <div class="content_box last">
        	<div id="contact_form">
                <h4>发送邮件</h4>
                
                	<form method="post" name="contact" action="#">
        
                         <label for="author">姓名:</label> <input type="text" id="author" name="author" class="required input_field" />
                         <label for="email">邮箱:</label> <input type="text" id="email" name="email" class="validate-email required input_field" />
                                
                         <label for="phone">电话:</label> <input type="text" name="phone" id="phone" class="input_field" />
                         <label for="text">内容:</label> <textarea id="text" name="text" rows="0" cols="0" class="required"></textarea>

                         <br />
                         <input type="submit" class="submit_btn" name="submit" id="submit" value="发送" />
                         <input type="reset" class="submit_btn" name="reset" id="reset" value="清空" />
                            
                    </form>
                            
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
