<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>精品应用</title>
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/appRecommend.css" rel="stylesheet" type="text/css"/>
</head>
<body onload="showLeftTime()">

<div id="templatemo_wrapper">
  <jsp:include page="share_web/sidebar.jsp" flush="true" />       
</div>
    
    <div id="templatemo_content">    	
       <jsp:include page="share_web/header.jsp" flush="true">
       		 <jsp:param value="5" name="menu"/> 
       </jsp:include>         
        <div class="content_box last" style="float:left;">     	
            <div id="appTitle">
            	<img src="images/appTitle.png" alt="img" />
            </div>
            <div id="appWrapper" >
              <div class="applist">
              
              	<div class="tubiao">
              	<a href="http://weixin.qq.com" target="blank"><img src="images/application/weixin.jpg" alt="image" title="微信-是一种生活态度" /></a>
              	</div>              	
              	<div class="tubiao_name">微信聊天</div>  
              	<div class="describe" >
              		<font>快捷输入、实时沟通、随时分享、大屏阅读，微信电脑版。</font>
              	</div> 
              	<div class="download" >
              		<a href="http://weixin.qq.com" target="blank"
              		onmouseover="document.getElementById('bg1').src='images/application/download2.jpg'"
              		onmouseout="document.getElementById('bg1').src='images/application/download1.jpg'"
              		><img id="bg1" src="images/application/download1.jpg" alt="image" title="下载" />
              		</a>
              	</div>             
              </div> 
              
              <div class="applist">
              	<div class="tubiao">
              	<a href="http://www.yixin.im" target="blank"><img src="images/application/yixin.jpg" alt="image" title="易信-让沟通更有兴趣" /></a>
              	</div>
              	<div class="tubiao_name">易信聊天</div>  
              	<div class="describe" >
              		<font>一款能够真正免费聊天的即时通讯软件，免费海量贴图表情及免费短信及电话留言。</font>
              	</div> 
              	<div class="download" >
              		<a href="http://www.yixin.im" target="blank"
              		onmouseover="document.getElementById('bg2').src='images/application/download2.jpg'"
              		onmouseout="document.getElementById('bg2').src='images/application/download1.jpg'"
              		>
              		<img id="bg2" src="images/application/download1.jpg" alt="image" title="下载" />
              		</a>
              	</div>                 
              </div>
              
               <div class="applist">
              	<div class="tubiao">
              	<a href="http://download.feixin.10086.cn" target="blank"><img src="images/application/feixin.jpg" alt="image" title="飞信" style="background:white;"/></a>
              	</div> 
              	<div class="tubiao_name">飞信聊天</div>  
              	<div class="describe" >
              		<font>免费从PC给手机发短信，不受任何限制，随时随地与好友开始语聊，并享受超低语聊资费。</font>
              	</div> 
              	<div class="download" >
              		<a href="http://download.feixin.10086.cn" target="blank" 
              		onmouseover="document.getElementById('bg3').src='images/application/download2.jpg'"
              		onmouseout="document.getElementById('bg3').src='images/application/download1.jpg'"
              		>
              		<img id="bg3" src="images/application/download1.jpg" alt="image" title="下载" />
              		</a>
              	</div>                
              </div>
              
              <div class="applist">
              	<div class="tubiao">
              	<a href="http://cidian.youdao.com/" target="blank"><img src="images/application/youdao.jpg" alt="image" title="有道词典"  /></a>
              	</div> 
              	  <div class="tubiao_name">有道词典</div>  
              	<div class="describe" >
              		<font>免费中英文翻译软件。完美结合了互联网在线词典和桌面词典的优势。</font>
              	</div> 
              	<div class="download" >
              		<a href="http://cidian.youdao.com/" target="blank"
              		onmouseover="document.getElementById('bg4').src='images/application/download2.jpg'"
              		onmouseout="document.getElementById('bg4').src='images/application/download1.jpg'"
              		>
              		<img id="bg4" src="images/application/download1.jpg" alt="image" title="下载" />
              		</a>
              	</div>              
              </div>
              
              <div class="applist">
              	<div class="tubiao">
              	<a href="http://cp.iciba.com/" target="blank"><img src="images/application/jinshan.jpg" alt="image" title="金山词霸"  /></a>
              	</div> 
              	<div class="tubiao_name">金山词霸</div>  
              	<div class="describe" >
              		<font>一款适用于个人用户的免费翻译软件。提供真人语音，屏幕取词等功能。</font>
              	</div> 
              	<div class="download" >
              		<a href="http://cp.iciba.com/" target="blank" 
              		onmouseover="document.getElementById('bg5').src='images/application/download2.jpg'"
              		onmouseout="document.getElementById('bg5').src='images/application/download1.jpg'"
              		>
              		<img id="bg5" src="images/application/download1.jpg" alt="image" title="下载" />
              		</a>
              	</div>                
              </div> 
              
              <div class="applist">
              	<div class="tubiao">
              	<a href="http://dl.pconline.com.cn/download/90616.html" target="blank"><img src="images/application/dw.jpg" alt="image" title="Dreamweaver8"  /></a>
              	</div> 
              	<div class="tubiao_name">Dreamweaver</div>  
              	<div class="describe" >
              		<font>一个可视化的网页设计和网站管理工具，支持最新的Web技术。</font>
              	</div> 
              	<div class="download" >
              		<a href="http://dl.pconline.com.cn/download/90616.html" target="blank" 
              		onmouseover="document.getElementById('bg6').src='images/application/download2.jpg'"
              		onmouseout="document.getElementById('bg6').src='images/application/download1.jpg'"
              		>
              		<img id="bg6" src="images/application/download1.jpg" alt="image" title="下载" />
              		</a>
              	</div>                
              </div>  
              
              <div class="applist">
              	<div class="tubiao">
              	<a href="http://www.downxia.com/downinfo/3560.html" target="blank"><img src="images/application/ps.jpg" alt="image" title="photoshop cs3"  /></a>
              	</div> 
              	<div class="tubiao_name">photoshop</div>  
              	<div class="describe" >
              		<font>此图片处理工具是电影、视频和多媒体领域相关专业人士的最好选择。</font>
              	</div> 
              	<div class="download" >
              		<a href="http://www.downxia.com/downinfo/3560.html" target="blank" 
              		onmouseover="document.getElementById('bg7').src='images/application/download2.jpg'"
              		onmouseout="document.getElementById('bg7').src='images/application/download1.jpg'"
              		>
              		<img id="bg7" src="images/application/download1.jpg" alt="image" title="下载" />
              		</a>
              	</div>                
              </div>         
            </div>
     
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
