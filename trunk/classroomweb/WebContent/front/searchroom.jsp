<%@ page language="java" contentType="text/html; charset=utf-8"pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,com.room.data.dao.*,com.room.data.model.*,com.room.data.tools.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>空教室查询</title>
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
</head>

<style type="text/css">
body {
 margin: 30px auto;
}
#myform{
 font-size: 12px;
 margin-top: 20px;
 margin-left: 40px;
 margin-bottom: 20px;
}
ul {
 list-style: none;
}
#faq {
 font-size: 14px;
 width: 600px;
}
#faq li {
 margin: 30px 0 10px;
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
 padding: 0 0 5px 22px;
 border-bottom:1px #ccc dotted;
}
#faq dd {
 display:block;
 margin:0;
 padding: 5px 0 5px 20px;
 background:#E5ECF9;
 line-height: 180%;

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


<body>

<div id="templatemo_wrapper">

  <jsp:include page="share_web/sidebar.jsp" flush="true" />
        
</div>
    
    <div id="templatemo_content">
    	
       <jsp:include page="share_web/header.jsp" flush="true">
       		 <jsp:param value="2" name="menu"/> 
       </jsp:include> 
        
       <div class="content_box" style="float:left;">         	
              
           <div id="myform" >
  <form>
     <select>
	<option class="week" value="0" name="week" select="selected" >选择周数</option>
        <option class="week" value="1" name="week">1</option>
        <option class="week" value="2" name="week">2</option>
	<option class="week" value="3" name="week">3</option>
	<option class="week" value="4" name="week">4</option>
	<option class="week" value="5" name="week">5</option>
     </select>
     <select>
	<option class="week" value="0" name="day" select="selected" >选择星期</option>
        <option class="week" value="1" name="day">星期一</option>
        <option class="week" value="2" name="day">星期二</option>
	<option class="week" value="3" name="day">星期三</option>
	<option class="week" value="4" name="day">星期四</option>
	<option class="week" value="5" name="day">星期五</option>
        <option class="week" value="5" name="dayk">星期六</option>
	<option class="week" value="5" name="day">星期日</option>
     </select>
     <select>
        <option class="week" value="1" name="build_room" select="selected">A教学楼</option>
        <option class="week" value="2" name="build_room">B教学楼</option>
     </select>
     &nbsp;&nbsp;<input type="submit" name="mysubmit" value="查询" class="mybutton">&nbsp;&nbsp;
     <input type="submit" name="mybutton" value="刷新" class="mybutton">
  </form>
</div>

<ul id="faq">
  <li>
    <dl>
      <dt>1-2节所有的空教室</dt>
      <dd>A103|A106|A109|A203</dd>
    </dl>
  </li>
   <li>
    <dl>
      <dt>3-4节所有的空教室</dt>
      <dd>A103|A106|A109|A203</dd>
    </dl>
  </li>
 <li>
    <dl>
      <dt>5-6节所有的空教室</dt>
      <dd>A103|A106|A109|A203</dd>
    </dl>
  </li>
  <li>
    <dl>
      <dt>7-8节所有的空教室</dt>
      <dd>A103|A106|A109|A203</dd>
    </dl>
  </li>
  <li>
    <dl>
      <dt>9-10节所有的空教室</dt>
      <dd>A103|A106|A109|A203</dd>
    </dl>
  </li>
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
