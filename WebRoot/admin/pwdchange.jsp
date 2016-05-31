<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	if(session.getAttribute("adminName")==null){
	response.getWriter().write("<script language='JavaScript'>" +
			"window.open('login.jsp',target='_top');" + 
			"</script>"
			);
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>绿丰花园时尚餐厅后台管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
<LINK href="admin/css/admin.css" type="text/css" rel="stylesheet">
<script type="text/javascript">
	function change(){
		var old = document.getElementById("old").value;
		var news = document.getElementById("news").value;
		var again = document.getElementById("again").value;
		if(news==""||old==""){
			alert("密码不能为空！！！");
		}
		else if(news==again){
			window.location.href="pwdchange?old="+old+"&news="+news;
		}
		else{
			alert("修改密码不一样！！！");
		}
	}
</script>
<body>
<TABLE cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
  <TR height="28">
    <TD background="admin/images/title_bg1.jpg">当前位置: >>修改密码</TD></TR>
  <TR>
    <TD bgColor="#b1ceef" height="1"></TD></TR>
 </TABLE>
	<form name="form1" action="" method="post"></form>
	<table border="1" width="400">
	<form action="" method="get">
		<tr><td colspan="2">管理员修改密码</td></tr>
		<tr><td width="20%">原密码：</td><td><input type="password" id="old" name="old" /></td></tr>
		<tr><td>新密码：</td><td><input type="password" name="news" id="news" /></td></tr>
		<tr><td>确认密码：</td><td><input type="password" name="again" id="again" /></td></tr>
		<tr><td colspan="2"><input type="button" value="提交" onclick="change();" /><input type="reset" /></td></tr>
	</form>
	</table>
</body>
</html>
