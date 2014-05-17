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

  #textarea{
       border:1px solid #999;
       font-size:12px;
       font-family: Verdana, Arial, Helvetica, sans-serif;
       padding:1px;
       width:400px;
       height:100px;
       overflow:auto;
       width:100%;
       text-align:left;
       padding:5px;
       
}
  
</style>
<script type="text/javascript">

	function test(){
		art.dialog({
			 content: 
				 '<form><table width="400" border="1"><tr height="30"><td>标题：</td><td><input type="text"/></td></tr>'+
				 '<tr height="30"><td>内容：</td><td><input type="textarea" id="textarea" wrap="physical" ></td></tr>'+
				 '<tr height="30"><td colspan="2"><input type="button" value="提交"/></td></tr>'+
				 '</table></form>'

		});
		
	}
</script>
</head>
<body>
<input type="button" onclick="test();"value="发帖"> 
</body>
</html>