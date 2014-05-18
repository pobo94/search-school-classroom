<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>联系我们</title>
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
</head>
<body onload="showLeftTime()">

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
        	
            
            <div class="content_box_inner">
          
               <h3><strong><img src="images/tag_violet.png" alt="imge" />&nbsp;科师小团队时刻准备着为您服务!</strong></h3>
                <p><font size="3" color="purple">通过以下两种方式您可以我们取得联系：</font></p>
				<p><font size="3" color="purple">——电联，我们有固定的客服人员将与您实时沟通。</font></p>
  				<p><font size="3" color="purple">——发送邮件，我们的工作人员每天定期会查看邮箱，与您联系。</font></p>
                
                <div class="cleaner"></div>
            </div>
            
        </div>
        
         <div class="content_box">
                
            <div class="col_w280">
 		    <h3><strong><img src="images/smartphone_iphone.png" alt="imge" />&nbsp;电话联系</strong></h3>
 		    <table border="0" cellspacing="7" width="300">
 		    <tr>
 		    	<td><font size="3" color="purple">王伟娟</font></td>
 		    	<td><font size="3" color="purple">手机:18233581896</font></td>
 		    </tr>
 		    <tr>
 		    	<td><font size="3" color="purple">程禄元</font></td>
 		    	<td><font size="3" color="purple">手机:18233581665</font></td>
 		    </tr>
 		    </table>
              
            </div>
            
            <div class="cleaner"></div>
        </div>
        
        <div class="content_box last">
        	<div id="contact_form">
                <h3><strong><img src="images/mail_dark_right.png" alt="" />&nbsp;发送邮件</strong></h3>
                
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
