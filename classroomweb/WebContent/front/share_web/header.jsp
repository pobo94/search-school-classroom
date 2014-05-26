<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page language="java" import="java.util.*,com.room.data.tools.*"%>
<%

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

int menu=Helper.strToint(request.getParameter("menu"));
%>
<link href="/classroomweb/front/templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="/classroomweb/inc/artdlg/skins/blue.css" rel="stylesheet" />
<script src="/classroomweb/inc/artdlg/artDialog.min.js"></script>
<style type="text/css">

  .labright{
  	font-size:13px;color:#2d7ad1;padding:4px;
  }
  .myinput{
  	width:10em; padding:4px;
  }
  .mybtn{
  	width:75px;height:30px;
  }
  #other{
  	margin-left:25px;
  }
  .other_login{
  	margin-left:20px;
  }
</style>
<script type="text/javascript">

	function test(btn){
		
		var page=btn.id;
		//alert("要跳转的页面为："+page);
		art.dialog({
			id:'msg',
			title:'请首先登录您的账号',
			lock: true,
		    background: '#ffffff', // 背景色
		    opacity: 0.7,	// 透明度		    
		    width:350,
			height:240,
			fixed:true,
			drag:false,
			resize:false,
			
		    content:
		    '<form action="/classroomweb/userServlet?action=frontlogin&&page='+page+'" method="post"><center>'+
		    '<p><label>账号</label>：<input class="myinput"  name="username" type="text" value="" ><lable class="labright">立即注册</label></p>'+
		    '<p><label>密码：<input class="myinput" type="password" name="password" value="" ><lable class="labright" >忘记密码</label></p>'+
		    '<form action="/classroomweb/userServlet?action=frontlogin&&page='+page+'" method="post"><center>'+
		    '<p><label>账号</label>：<input class="myinput"  name="username" type="text" value="" ><lable class="labright"><a href="/classroomweb/front/addUser.jsp">立即注册</a></label></p>'+
		    '<p><label>密码：<input class="myinput" type="password" name="password" value="" ><lable class="labright" >忘记密码</label></p>'+
		    '<p><input type="checkbox" id="checkbox" ><label class="labright" >记住密码</label>'+
		    '&nbsp;&nbsp;<input type="checkbox" id="checkbox" ><label class="labright">自动登录</label></p>'+
		    '<p><input type="submit" value="登录" class="mybtn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="取消" class="mybtn"></p>'+
		    '<p align="left"><lable id="other">使用其他账号登录</label></p>'+
		    '<img alt="QQ登录" src="/classroomweb/front/images/qq_login_logo.png" class="other_login">'+
            '<img alt="新浪微博登录" src="/classroomweb/front/images/sinaweibo_login_logo.png" class="other_login">'+
		    '</center></form>',		
		}); 
		
	}
</script>

<div id="templatemo_menu" style="float:left;">
			<ul>
                <li><a href="home.jsp" <%if(menu==1){ %>class="current"<%} %>>首页</a></li>
                <li><a href="searchroom.jsp"  <%if(menu==2){ %>class="current"<%} %>>空教室查询</a></li>
                <li><a href="javascript:void(0)" id="applyroom" onclick="test(this)" <%if(menu==3){ %>class="current"<%} %>>教室申请</a></li>
                <li><a href="tucao_chat.jsp" <%if(menu==4){ %>class="current"<%} %>>校友论坛</a></li>
                <li><a href="app_recommended.jsp" <%if(menu==5){ %>class="current"<%} %>>精品应用</a></li>                      
            </ul>    	
	        <div class="cleaner"></div> 
</div> <!-- end of templatemo_menu -->