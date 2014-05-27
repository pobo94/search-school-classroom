var count=0;
var num=0;
function checkRadio(){   
    var o1=document.getElementsByName('myradio');   
    for(var i=0;i<o1.length;i++)   
    {   
        if(o1[i].checked){
        	count++;
        }   
    } 
    return count;
}   
function validate_myform(myform){
	num=checkRadio();
	if(num==0){
		alert("很抱歉，您还没有选择板块，不能发表帖子！");
		return false;
	}
	for(var i=0;i<myform.elements.length;i++){
		if(myform.elements[i].type=="text"){
			if(myform.elements[i].name=="biaoti"){
				if(myform.elements[i].value==""){
					alert("很抱歉，您还没有填写帖子标题，不能发表帖子！");
					return false;
				 }
		  	}
		}
		else if(myform.elements[i].type=="textarea"){
			if(myform.elements[i].value==""){
				alert("很抱歉，您还没有填写帖子内容，不能发表帖子！");
				return false;
			 }
	  	}
	}	
	return true;
}

function focusBiaoTi(){
	 var strBiaoTi=document.getElementById("mytext"); 
	 if(strBiaoTi.value.equals("最多输入20个字符")){
		document.getElementById("mytext").innerHTML="";
	 }
}
function blureBiaoTi(){
	var strBiaoTi=document.getElementById("mytext"); 
	 if(strBiaoTi.value==""){
		 strBiaoTi.innerHTML="最多输入20个字符";
	 }
}