<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.room.data.model.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>adduser.jsp</title>
<%
	User us = new User();
    int  exist=0;
	String typestr = request.getParameter("type");
	int type = Integer.valueOf(typestr);
	if (type == 0) {
		;

	} else if (type == 1) {
		exist=1;
		us = (User) request.getAttribute("user");

	}
%>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<script type="text/javascript">
	function validate_email(field, alerttxt) {
		with (field) {
			apos = value.indexOf("@");
			dotpos = value.lastIndexOf(".");
			if (apos < 1 || dotpos - apos < 2) {
				alert(alerttxt);
				return false;
			} else {
				return true;
			}
		}
	}
	function validate_chinese(field, alerttxt) {
		if (value != null) {
			alert(alerttxt);
			return false;
		}
	}

	function validate_required(field, alerttxt) {
		with (field) {
			if (value == null || value == "") {
				alert(alerttxt);
				return false;
			} else {
				return true;
			}
		}
	}

	function validate_form(thisform) {
		with (thisform) {
			if (validate_chinese(password, "存在不合法字符!") == false) {
				var x = document.getElementsByName("password");
				for ( var i = 0; i < x.length; i++) {
					if (x.charCodeAt(i) > 255) {
						return false;
					}
				}
			}
			if (validate_required(account, "账号不能为空!") == false) {
				account.focus();
				return false;
			}
			if (validate_required(password, "密码不能为空!") == false) {
				password.focus();
				return false;
			}
			if (validate_email(Email, "不是合法的邮箱地址") == false) {
				Email.focus();
				return false;
			}
		}
	}
</script>
</head>

<body>
	<div id="wrapper">
		<div id="header">
			<table width="100%">
				<tr>
					<td width="5%"></td>
					<%if(exist==1){ %>
					<td>修改页面</td>
					<%}else{ %>
					<td>添加页面</td>
					<%} %>
				</tr>
				<tr>
					<td align="center" colspan="2"><em><font color=#ff0000>带星号内容必须填写</font>
					</em></td>
				</tr>
			</table>
		</div>
		<div id="content">
			<form action="/classroomweb/userServlet?action=saveuser"  onsubmit="return validate_form(this)" method="post">
				<table>					
						<td align="right"><u>账号</u></td>
						<td align="left"><u><input type="text" name="account"
								value="<%= us.getAccount() %>" size="20" maxlength="20" ><font
								color="#ff0000">*</font></u></td>
					</tr>
					<tr>
						<td align="right"><u>密码</u></td>
						<td align="left"><u><input type="text" name="password"
								value="<%= us.getPassWord() %>" size="20" maxlength="20"><font
								color="#ff0000">*</font></u></td>
					</tr>
					<tr>
						<td align="right"><u>姓名</u></td>
						<td align="left"><u><input type="text" name="username"
								value="<%= us.getRealName() %>" size="20" maxlength="20"></u>
						</td>
					</tr>

					<tr>
						<td align="right"><u>性别</u></td>
						<td align="left"><u><select name="gender" id="caseAct"
								style="width: 100px; height: 23px;">
									<option value="0">保密</option>
									<option value="1">男</option>
									<option value="2">女</option>
							</select></u></td>
					</tr>
					<tr>
						<td align="right"><u>手机号码</u></td>
						<td align="left"><u><input type="text" name="mobile"
								value="<%=us.getMobile() %>" size="20" maxlength="20"></u></td>
					</tr>
					<tr>
						<td align="right"><u>邮箱</u></td>
						<td align="left"><u><input type="text" name="Email"
								value="<%=us.getEmail() %>" size="20" maxlength="20"></u></td>
					</tr>
					<tr>
						<td align="right"><u>QQ</u></td>
						<td align="left"><u><input type="text" name="QQ"
								value="<%=us.getQq()%>" size="20" maxlength="20"></u></td>
					</tr>
					<tr>
						<td align="right"><u>状态</u></td>
						<td align="left"><u><input type="text" name="status"
								value="<%=us.getStatus()%>" size="20" maxlength="20"></u></td>
					</tr>
					<tr>
						<td align="right"><u>注册时间</u></td>
						<td align="left"><u><input type="text"
								name="registerTime" value="<%=us.getRegisterTime()%>" size="20"
								maxlength="20"></u></td>
					</tr>

					<tr>
						<td align="right"><u>最后登录时间</u></td>
						<td align="left"><u><input type="text"
								name="LastTime" value="<%=us.getLastTime()%>" size="20"
								maxlength="20"></u></td>
					</tr>
					<tr>
						<td align="right"><u>访问次数</u></td>
						<td align="left"><u><input type="text" name="vistCount"
								value="<%=us.getVistCount()%>" size="20" maxlength="20"></u></td>
					</tr>

					<tr>
						<td align="right"><u><input type="submit" value="确定"></u></td>
						<td align="left"><u><input type="reset" value="重置"></u></td>
					</tr>
				</table>
				<input type="hidden" name="userId" value="<%=us.getUserId()%>">
			</form>
		</div>
	</div>
</body>
</html>
