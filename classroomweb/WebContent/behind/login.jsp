<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>网站管理员登陆</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #1D3647;
}
-->
</style>
<script language="JavaScript">
function correctPNG()
{
    var arVersion = navigator.appVersion.split("MSIE")
    var version = parseFloat(arVersion[1])
    if ((version >= 5.5) && (document.body.filters)) 
    {
       for(var j=0; j<document.images.length; j++)
       {
          var img = document.images[j]
          var imgName = img.src.toUpperCase()
          if (imgName.substring(imgName.length-3, imgName.length) == "PNG")
          {
             var imgID = (img.id) ? "id='" + img.id + "' " : ""
             var imgClass = (img.className) ? "class='" + img.className + "' " : ""
             var imgTitle = (img.title) ? "title='" + img.title + "' " : "title='" + img.alt + "' "
             var imgStyle = "display:inline-block;" + img.style.cssText 
             if (img.align == "left") imgStyle = "float:left;" + imgStyle
             if (img.align == "right") imgStyle = "float:right;" + imgStyle
             if (img.parentElement.href) imgStyle = "cursor:hand;" + imgStyle
             var strNewHTML = "<span " + imgID + imgClass + imgTitle
             + " style=\"" + "width:" + img.width + "px; height:" + img.height + "px;" + imgStyle + ";"
             + "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader"
             + "(src=\'" + img.src + "\', sizingMethod='scale');\"></span>" 
             img.outerHTML = strNewHTML
             j = j-1
          }
       }
    }    
}
window.attachEvent("onload", correctPNG);
</script>

<script type="text/javascript">
	function refresh(obj) {
		obj.src = "/classroomweb/userServlet?action=random&" + Math.random();
	}
	
	function validate_required(field,alerttxt)
	{
		
	  if (value==null||value=="")
	    {
	    alert(alerttxt);
	    return false;
	    } else  {
		  return true;
		  }
	} 
	

	function validate_form(thisform)
	{
	with (thisform)
	  {
	  if (validate_required(username,"账号不能为空!")==false) {
		  username.focus();
	    return false;
	    }
	   if (validate_required(password,"密码不能为空!")==false) {
	    password.focus();
	    return false;
	    }
	   if (validate_required(random,"请输入正确的验证码!")==false) {
		    random.focus();
		    return false;
		    }	   
	}
	}
	</script>

<link href="images/skin.css" rel="stylesheet" type="text/css">
</head>

<body>
<table width="100%" height="166" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="42" valign="top"><table width="100%" height="42" border="0" cellpadding="0" cellspacing="0" class="login_top_bg">
      <tr>
        <td width="1%" height="21">&nbsp;</td>
        <td height="42">&nbsp;</td>
        <td width="17%">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg">
      <tr>
        <td width="49%" align="right"><table width="91%" height="532" border="0" cellpadding="0" cellspacing="0" class="login_bg2">
            <tr>
              <td height="138" valign="top"><table width="89%" height="427" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="149">&nbsp;</td>
                </tr>
                <tr>
                  <td height="80" align="right" valign="top"><img src="images/logo.png" width="319" height="68"></td>
                </tr>
                <tr>
                  <td height="198"  valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="35%">&nbsp;</td>
                      <td height="25" colspan="2" class="left_txt" align="left"><p>1- 科师小团队，由在校大学生组成...</p></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td height="25" colspan="2" class="left_txt" align="left"><p>2- 一站通式的整合方式，方便用户使用...</p></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td height="25" colspan="2" class="left_txt" align="left"><p>3- 强大的后台系统，管理内容易如反掌...</p></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                      <td width="30%" height="40" align="left"><img src="images/icon-demo.gif" width="16" height="16"><a href="#"class="left_txt3"> 使用说明</a> </td>
                      <td width="35%" align="left"><img src="images/icon-login-seaver.gif" width="16" height="16"><a href="#" class="left_txt3"> 在线客服</a></td>
                    </tr>
                  </table></td>
                </tr>
              </table></td>
            </tr>
            
        </table></td>
        
        <td width="1%" >&nbsp;</td>
        <td width="50%" valign="bottom"><table width="100%" height="59" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="4%">&nbsp;</td>
              <td width="96%" height="38" align="left"><span class="login_txt_bt">登陆信息网后台管理</span></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td height="21"><table cellSpacing="0" cellPadding="0" width="100%" border="0" id="table211" height="328">
                  <tr>
                    <td height="164" colspan="2" align="middle">
                    
                    
                    
                    <form name="myform"  onsubmit="return validate_form(this)" action="/classroomweb/userServlet?action=login" method="post">
                       
                        <table cellSpacing="0" cellPadding="0" width="100%" border="0" height="143" id="table212">
                          <tr>
                            <td width="13%" height="38" class="top_hui_text" align="left">
                            <span class="login_txt">管理员：&nbsp;&nbsp; </span></td>
                            <td height="38" colspan="2" class="top_hui_text" align="left">
                            <input name="username" type=text class="editbox4" value="" size="20">                            </td>
                          </tr>
                          <tr>
                            <td width="13%" height="35" class="top_hui_text" align="left">
                            <span class="login_txt"> 密 &nbsp;码： &nbsp;&nbsp; </span></td>
                            <td height="35" colspan="2" class="top_hui_text" align="left">
                            <input class="editbox4" type="password" size="20" name="password">
                              <img src="images/luck.gif" width="19" height="18"> </td>
                          </tr>
                          <tr>
                            <td width="13%" height="35" class="top_hui_text" align="left">
                            <span class="login_txt">验证码：</span></td>
                            <td height="35" colspan="2" class="top_hui_text" align="left">
                            
                            <input class=wenbenkuang name="random" type=text value="" maxLength=4 size=10>
                            
                            <img title="点击更换" onclick="javascript:refresh(this);"
                            src="/classroomweb/userServlet?action=random"alt="" width="75" height="24" />
                            
                              </td>
                          </tr>
                          <tr>
                             
                             <td width="13%" height="35" class="top_hui_text" align="center">
                             <input name="Submit" type="submit" class="button" id="Submit" value="登 陆"></td>
                            <td height="35" colspan="2" class="top_hui_text" align="left">
                            <input name="cs" type="reset" class="button" id="cs" value="取 消" onClick="showConfirmMsg1()"></td>
                        
                          </tr>
                        </table>
                        <br>
                    </form>
                   </td>
                  </tr>
                  <tr>
                    <td width="433" height="164" align="right" valign="bottom">
                    <img src="images/login-wel.gif" width="242" height="138"></td>
                    <td width="57" align="right" valign="bottom">&nbsp;</td>
                  </tr>
              </table></td>
            </tr>
          </table>
          </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="20"><table width="100%" border="0" cellspacing="0" cellpadding="0" class="login-buttom-bg">
      <tr>
        <td align="center"><span class="login-buttom-txt">Copyright &copy; 2009-2010 www.865171.cn</span></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>