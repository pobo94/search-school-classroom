<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>伸缩与展开的jQuery面板</title>

<style type="text/css">

	
</style>
<script src="/classroomweb/jslib/jquery-1.7.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){

		var scrollDiv = document.createElement('div');

		$(scrollDiv).attr('id', 'toTop').appendTo('body');

		$('#toTop').hide();

		$(window).scroll(function () {

		    if ($(document).scrollTop() != 0) {

		        $('#toTop').fadeIn();

		    } else {

		        $('#toTop').fadeOut();

		    }

		});

		$('#toTop').click(function () {

		    $(window).scrollTop(0);

		});
	});
</script>
</head>
<body>
<input style="margin-top:600px;" type="button"  id="toTop" value="置顶">
</body>
</html>