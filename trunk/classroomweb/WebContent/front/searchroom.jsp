<%@ page language="java" contentType="text/html; charset=utf-8"pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,com.room.data.dao.*,com.room.data.model.*,com.room.data.tools.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>空教室查询</title>
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<!-- <script src="/classroomweb/jslib/jquery-1.7.2.min.js" type="text/javascript"></script> -->
<link href="/classroomweb/inc/artdlg/skins/blue.css" rel="stylesheet" />
<script src="/classroomweb/inc/artdlg/artDialog.min.js"></script>
<style type="text/css">
#share{
    width:30px;height:80px;
    background:#2d7ad1;float:right;    
    position:fixed !important; top:50%;    
    position:relative; z-index:100; 
    cursor:pointer;
    top:expression(offsetParent.scrollTop+20);right:20px;
    line-height:35px;
    text-align:center;
    font-family:楷体;
    font-size: 16px;
    color:#FFF;
}

#myform{
 font-family:楷体/* Times New Roman */;
 font-size: 16px;
 margin-left: 40px;
 margin-bottom: 20px;
 font-weight:bold;
 color:#2d7ad1;
}
.myselect{
 cursor:pointer;
 position:relative;
 left:-2px;
 top:-2px;
 font-size:12px;
 width:137px;
 height:25px;
 line-height:14px;
 border:1px 2d7ad1;
 color:#909993;

}
.myselect option{
	cursor:pointer;
	height:30px;
    padding-top:5px;
}
ul {
 list-style: none;
}
#faq {
 font-family:宋体/* Times New Roman */;
 font-size: 14px;
 width: 600px;
}
#faq li {
 margin: 10px 0 10px;
 padding: 0 0 5px;
}
#faq dl {
 margin: 0;
 padding:0;
 display:inline;
}
#faq dt {
 font-weight:bold;
 cursor:pointer;
 line-height: 20px;
 padding: 0 0 5px 10px;
 border-bottom:1px #ccc dotted;
 color:#2d7ad1;
}
#faq dd {
 height:50px;
 display:block;
 border:1px #2d7ad1 solid;
 margin:0;
 padding: 5px 0 5px 10px;
 /* background:#CCC/* #E5ECF9 */; */
 line-height: 180%;
 overflow:auto;

}
</style>
<script type="text/javascript">
var lastFaqClick=null;
window.onload=function(){
  var faq=document.getElementById("faq");
  var dls=faq.getElementsByTagName("dl");
  for (var i=0,dl;dl=dls[i];i++){
    var dt=dl.getElementsByTagName("dt")[0];//取得标题
     dt.id = "faq_dt_"+(Math.random()*100);

    
     dt.onclick=function(){
       var p=this.parentNode;//取得父节点
        if (lastFaqClick!=null&&lastFaqClick.id!=this.id){
          var dds=lastFaqClick.parentNode.getElementsByTagName("dd");
          for (var i=0,dd;dd=dds[i];i++)
            dd.style.display='none';
        }
        lastFaqClick=this;
        var dds=p.getElementsByTagName("dd");//取得对应子节点，也就是说明部分
        var tmpDisplay='block';
        if (gs(dds[0],'display')=='block')
          tmpDisplay='none';
        for (var i=0;i<dds.length;i++)
          dds[i].style.display=tmpDisplay;
      }
  }
}

function gs(d,a){
  if (d.currentStyle){
    var curVal=d.currentStyle[a]
  }else{
    var curVal=document.defaultView.getComputedStyle(d, null)[a]
  }
  return curVal;
}

function share(){	
	
	art.dialog({
		title: '分享到',
		width:'100',
		height:'100',
		follow: document.getElementById('share'),
		left: '100%',
	    top: '100%',
	    fixed: true,
	    drag: false,
	    resize: false,
	    padding: 0,
		content:
		'<table bgcolor="white" width="90" height="100"  cellSpacing="0" cellPadding="10" id="mytable" border="0">'+
	    '<tr>'+
		'<td><img src="images/xinlangshare.jpg" alt="image" title="新浪微博" /></td>'+
   		'<td><img src="images/tengxunshare.jpg" alt="image" title="腾讯微博" /></td>'+
   		'</tr>'+
   		'<tr>'+
   			'<td><img src="images/QQshare.jpg" alt="image" title="QQ空间"/></td>'+
   			'<td><img src="images/weixinshare.jpg" alt="image" title="微信" /></td>'+
   		'</tr>'+
   		'<tr>'+
   			'<td><img src="images/doubanshare.jpg" alt="image" title="豆瓣网"/></td>'+
   			'<td><img src="images/huabanshare.jpg" alt="image" title="花瓣网"/></td>'+
   		'</tr></table>'
	}); 
	
}

</script>
</head>
<%
 List<ClassRoom> roomList=(List<ClassRoom>)session.getAttribute("roomList");
 int weekday=(Integer)session.getAttribute("weekday");
 int week=(Integer)session.getAttribute("week");
 ClassRoom room=new ClassRoom();
 String[] strLesson={"1-2节","3-4节","5-6节","7-8节","9-10节"};
 String[] strWeekday={"星期一","星期二","星期三","星期四","星期五"};
 String buildNum="";
 String roomNum="";
 System.out.println("空教室的个数："+roomList.size());
 
%>
<body onload="showLeftTime()">

<div id="templatemo_wrapper">

  <jsp:include page="share_web/sidebar.jsp" flush="true" />
        
</div>
    
    <div id="templatemo_content">
    	
       <jsp:include page="share_web/header.jsp" flush="true">
       		 <jsp:param value="2" name="menu"/> 
       </jsp:include> 
        
       <div class="content_box last" style="float:left;">         	
           <div id="myform" >
           	 <p style="color: red;margin-left: 5px;margin-bottom:2px;">
           	  <img src="images/volume_quiet.png" alt="image" />
                                系统默认为您显示今天所有的空闲教室，您可以通过以下方式自己筛选查询。
             </p> 
			  <form action="/classroomweb/front_roomServlet?action=list" method="post">
			     <select class="myselect" name="week">	
					<%for(int i=1;i<=16;i++) {%>
				        <option value="<%=i%>" <%if(week==i) {%>selected="selected"<%} %>>第<%=i %>周</option>
				     <%} %>
			     </select>
			     <select class="myselect" name="weekday">
					<% for(int j=1;j<=5;j++){ %>
					<option value="<%=j%>"<%if(weekday==j) {%>selected="selected"<%} %>><%=strWeekday[j-1] %></option>
			        <%} %>
			     </select>
			     <select class="myselect" name="buildNum">
			        <option value="A" selected="selected">A教学楼</option>
			        <option value="B">B教学楼</option>
			     </select>
			     &nbsp;&nbsp;<input type="submit" name="mysubmit" value="查询" class="mybutton">&nbsp;&nbsp;
			     <a href="/classroomweb/front_roomServlet?action=list&&buildNum=A&&weekday=2&&week=1">刷新</a>
			     
			  </form>
		</div>

		<ul id="faq">		
			<% for(int j=0;j<5;j++){ int count=0;%>
			  <li>
			    <dl>
			      <dt> <img src="images/marker_rounded_light_blue.png" alt="image" />&nbsp;&nbsp;<%=strLesson[j] %>所有的空教室&nbsp;&nbsp;<img src="images/arrow_state_blue_expanded.png" alt="image" /></dt>
				      <dd>
				      <%for(int i=0;i<roomList.size();i++){ 
				    	  room=roomList.get(i);
				    	  int lesson=room.getLesson();
				    	 
				    	  if(strLesson[(lesson-1)/2].equals(strLesson[j])){
				    		 buildNum=room.getBuildingNum();
				    		 roomNum=room.getRoomNum();
				    		 if(buildNum!=null&&roomNum!=null){
				    			 count++;
				      %>
				      <%=buildNum %><%=roomNum %>|
				      <%
				    		 }
				    	  }
				    	 
				      }
				      %>
				      
				     </dd>
				      <p style="color: red;margin-left: 5px;margin-top:10px;"><img src="images/zoom.png" alt="image" />&nbsp;&nbsp;总计:<%=count %>个</p>
			    </dl>
			  </li>
			<%} %>		 
		 </ul>                      
       </div>
       <div id="share">
       <a href="javascript:void(0)" onclick="share()" style="color:#fff; a hover:text-decoration:none;">分享</a>
       </div>
           
    </div> 
    
    <div class="cleaner"></div>

</div>
 <div id="templatemo_footer_wrapper">
	<jsp:include page="share_web/footer.jsp" flush="true" /> 

</div> 
</body>
</html>
