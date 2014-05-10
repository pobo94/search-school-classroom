<%@ page language="java" contentType="text/html; charset=utf-8"pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,com.room.data.dao.*,com.room.data.model.*,com.room.data.tools.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>空教室查询</title>
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />

<style type="text/css">
/* body {
 margin: 5px auto;
} */
#myform{
 font-family:楷体/* Times New Roman */;
 font-size: 16px;
 /* margin-top: 5px; */
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
 border:1px /* #f19005 */ #2d7ad1 solid;
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
<body>

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
			  <form action="searchForm.jsp" method="post">
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
			     <input type="submit" name="mybutton" value="刷新" class="mybutton">
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
             
    </div> 
    
    <div class="cleaner"></div>

</div>
 <div id="templatemo_footer_wrapper">
	<jsp:include page="share_web/footer.jsp" flush="true" /> 

</div> 
</body>
</html>
