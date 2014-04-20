<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理页面</title>
<script src="js/prototype.lite.js" type="text/javascript"></script>
<script src="js/moo.fx.js" type="text/javascript"></script>
<script src="js/moo.fx.pack.js" type="text/javascript"></script>
<link href='css/left.css' rel='stylesheet' type='text/css' />
</head>


<body>
<table width="100%" height="280" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB">
  <tr>
    <td width="182" valign="top"><div id="container">
    
      <h1 class="type"><a href="javascript:void(0)">后台首页界面</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="right.jsp" target="main">后台首页</a></li>
        </ul>
      </div>
      <h1 class="type"><a href="javascript:void(0)">网站模块管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="index.jsp" target="main">用户管理</a></li>
          <li><a href="index.jsp" target="main">管理员管理</a></li>
          <li><a href="roomManage/Index.jsp" target="main">教室管理</a></li>
          <li><a href="index.jsp" target="main">公告管理</a></li>
          <li><a href="index.jsp" target="main">吐槽管理</a></li>
          <li><a href="index.jsp" target="main">应用管理</a></li>
          <li><a href="index.jsp" target="main">图片管理</a></li>
        </ul>
      </div>
      <h1 class="type"><a href="javascript:void(0)">栏目内容管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
		  <li><a href="index.jsp" target="main">信息管理</a></li>
        </ul>
      </div>
      <h1 class="type"><a href="javascript:void(0)">注册用户管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="index.jsp" target="main">会员管理</a></li>
          <li><a href="index.jsp" target="main">留言管理</a></li>
          <li><a href="index.jsp" target="main">回复管理</a></li>
          <li><a href="index.jsp" target="main">订单管理</a></li>
          <li><a href="index.jsp" target="main">举报管理</a></li>
          <li><a href="index.jsp" target="main">评论管理</a></li>
        </ul>
      </div>
    </div>
        <h1 class="type"><a href="javascript:void(0)">其它参数管理</a></h1>
      <div class="content">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
            </tr>
          </table>
        <ul class="MM">
            <li><a href="index.jsp" target="main">管理设置</a></li>
          <li><a href="index.jsp" target="main">主机状态</a></li>
          <li><a href="index.jsp" target="main">攻击状态</a></li>
          <li><a href="index.jsp" target="main">登陆记录</a></li>
          <li><a href="index.jsp" target="main">运行状态</a></li>
          <li><a href="index.jsp" target="main">管理链接</a></li>
        </ul>
      </div>
      </div>
      
        <script type="text/javascript">
		var contents = document.getElementsByClassName('content');
		var toggles = document.getElementsByClassName('type');
	
		var myAccordion = new fx.Accordion(
			toggles, contents, {opacity: true, duration: 400}
		);
		myAccordion.showThisHideOpen(contents[0]);
	</script>
        </td>
  </tr>
</table>
</body>
</html>
