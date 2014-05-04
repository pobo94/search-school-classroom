<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>对话框练习</title>

<link href="/classroomweb/inc/artdlg/skins/blue.css" rel="stylesheet" />
<script src="/classroomweb/inc/artdlg/artDialog.min.js"></script>
<!-- <script src="/classroomweb/front/js/popup.js"></script> -->
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

	function test(){
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
		    '<form action="index.jsp" method="post"><center>'+
		    '<p><label>账号</label>：<input class="myinput" type="text" value="" ><lable class="labright">立即注册</label></p>'+
		    '<p><label>密码：<input class="myinput" type="password" value="" ><lable class="labright" >忘记密码</label></p>'+
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
</head>
<body>
<input type="button" onclick="test();"value="测试"> 
<img alt="QQ登录" src="/classroomweb/front/images/qq_login_logo.png">
<img alt="新浪微博登录" src="/classroomweb/front/images/sinaweibo_login_logo.png">
</body>
</html>