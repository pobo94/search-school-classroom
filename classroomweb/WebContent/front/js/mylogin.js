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