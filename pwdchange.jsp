<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>绿丰花园时尚餐厅</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/all.css">
  </head>
<style type="text/css">
	body{
		margin:0px;
		padding:0px;
		background-color:#f4e7bd;
	}
	#loginbg{
		width:100%;
		height:166px;
		background-image:url(images/top.jpg);
	}
	#login{
		width:1000px;
		height:166px;
		background-image:url(images/12.jpg);
	}
	#content{
		width:1000px;
		height:300px;
	}
	#dowmbg{
		width:100%;
		height:170px;
		background-image: url(images/footerbg.jpg);
	}
	#dowm{
		width:1000px;
		height:170px;
		background-image: url(images/footerbg.jpg);
	}
	table{
	
		margin-top: 40px;
		marker-offset:3px;
	}
	img{
		border:0px;
	}
</style>
<script type="text/javascript">
	function changepwd(){
		var oldpwd = document.form1.oldpwd.value;
		var newpwd = document.form1.newpwd.value;
		var anewpwd = document.form1.anewpwd.value;
		if(oldpwd==""||newpwd==""||anewpwd==""){
			alert("星号项不能为空！！！");
		}
		else if(newpwd != anewpwd){
			alert("新密码与确定密码不一样！！！");
		}
		else{
			document.form1.submit();
		}
	}
</script>
<body>
<center>
<div id="loginbg">
	<div id="login" align="left">
		
	</div>
</div>
<div id="content" align="center">
<form action="changemessage" name="form1" method="post">
	<table width="60%" >
		<tr><td align="center" colspan="2"><a href="changemessage"><img src="images/btn3.jpg"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="pwdchange.jsp"><img src="images/btn4.jpg"/></a></td></tr>
		<tr><td align="center" colspan="2"><img src="images/xgmima.jpg"/><br/><br/></td></tr>
		<tr><td width="45%" align="right">原密码：</td><td><input type="password" name="oldpwd"/><span style="color: red;">*</span></td></tr>
		<tr><td align="right">新密码：</td><td><input type="password" name="newpwd"/><span style="color: red;">*</span></td></tr>
		<tr><td align="right">确认密码：</td><td><input type="password" name="anewpwd"/><span style="color: red;">*</span></td></tr>
		<tr><td colspan="2" align="center"><br/><a href="javascript:changepwd();"><img src="images/btn5.jpg"/></a></td></tr>
	</table>
</form>
</div>
<!-- div id="dowmbg">
	<div id="dowm">
		
	</div>
</div-->
</center>
</body>
</html>
