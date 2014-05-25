//输入内容框获取焦点
function focusTextarea(){
	    var userId=document.getElementById("userId").value;
	    var textarea=document.getElementById("mytextarea").value;
		var textareaMark=document.getElementById("textareaMark");
	    if(userId==0){
	    	textareaMark.innerHTML="很抱歉，您还没用登录，现在无权发表回复。"+'\n'+"请您登录后在回复楼主！";
	    }else{	
		if(textarea.length>=0){
			textareaMark.innerHTML="最多回复200个字符";
		 }
	    }	
}
//输入内容框失去焦点
function blurTextarea(){
	var userId=document.getElementById("userId").value;
	var textarea=document.getElementById("mytextarea").value;
	var textareaMark=document.getElementById("textareaMark");
	
	if(userId==0){
		textareaMark.innerHTML="";
	}else{
		if(textarea.length<1||textarea.length>200){
			if(textarea.length==0){
				textareaMark.innerHTML="您回复的内容不能为空";
			}else{
				textareaMark.innerHTML="很抱歉：您回复的内容不能超过200个字符";	
			}
		}else{
			  var count=200-textarea.length;
			  textareaMark.innerHTML="亲，您还可以输入"+count+"字符！";		
		}
	}
}

function validate_textarea(field)
{
with (field)
  {
   if (value==null||value==""){
	  alert("您回复的内容不能为空");return false;
	 }
   else{
	   if(value.length>200){
	 	  alert("标题不能超过200个字符");
	 	  return false;
	   }else{ return true;}
    }
  } 
}

function validate_form(thisform)
{
with (thisform)
  {
  var textareaMark=document.getElementById("textareaMark");
  var userId=document.getElementById("userId").value;
  if(userId==0){
	  textareaMark.innerHTML="很抱歉，您还没用登录，现在无权发表回复。"+'\n'+"请您登录后在回复楼主！";
	  return false;
  }else{
	  if (validate_textarea(mytextarea)==false)
	    {mytextarea.focus();return false;}
    }
  } 
}