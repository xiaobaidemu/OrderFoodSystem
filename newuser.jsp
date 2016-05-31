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
		height:700px;
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
	
		margin-top: 5px;
		marker-offset:3px;
	}
	img{
		border:0px;
	}
</style>
<script type="text/javascript">
	function newuser(){
		var username = document.form1.username.value;
		var userpwd = document.form1.userpwd.value;
		var auserpwd = document.form1.auserpwd.value;
		var nackname = document.form1.nackname.value;
		var asex = document.form1.sex;
		var breathdaty = document.form1.breathdaty.value;
		var truename = document.form1.truename.value;
		var userid = document.form1.userid.value;
		var usermail = document.form1.usermail.value;
		var sex="";
		for(var i=0;i<asex.length;i++){   
	   		if(asex[i].checked){
		   		sex =  asex[i].value;
		    }
		} 
		if(username==""||userpwd==""||auserpwd==""||nackname==""||sex==""||
		breathdaty==""||truename==""||usermail==""||userid==""){
			alert("加星号项不能为空");
		}
		else if(userpwd!=auserpwd){
			alert("密码不一样！！！");
			document.form1.userpwd.value="";
			document.form1.auserpwd.value="";
		}
		else{
			document.form1.submit();
		}
	}
	function headchange(object){
		document.getElementById("headimg" ).src= "<%=basePath %>images/userimg/"+object+".gif";
	}
</script>
<body>
<center>
<div id="loginbg">
	<div id="login" align="left">
		
	</div>
</div>
<div id="content">
<form action="newuser" name="form1" method="get">
	<table width="90%"  height="100%">
		<tr><td colspan="2"><img src="images/chuangjian.jpg" /></td></tr>
		<tr><td align="right" width="300">用户名：</td><td width="520" align="left"><input type="text"  name="username"/><span style="color: red;">*</span></td></tr>
		<tr><td align="right">密码：</td><td align="left"><input type="password" name="userpwd"/><span style="color: red;">*</span></td></tr>
		<tr><td align="right">确认密码：</td><td align="left"><input type="password" name="auserpwd"/><span style="color: red;">*</span></td></tr>
		<tr><td colspan="2"><img src="images/ziliao.jpg" /></td></tr>
		<tr><td align="right">头像：</td><td align="left">
		<img id="headimg" src="<%=basePath %>images/userimg/user1.gif">
		<select name="head" onchange="headchange(this.value);">
			<option value="user1">头像1</option>
			<option value="user2">头像2</option>
			<option value="user3">头像3</option>
			<option value="user4">头像4</option>
			<option value="user5">头像5</option>
			<option value="user6">头像6</option>
			<option value="user7">头像7</option>
			<option value="user8">头像8</option>
			<option value="user9">头像9</option>
			<option value="user10">头像10</option>
		</select><span style="color: red;">*</span></td></tr>
		<tr><td align="right">昵称：</td><td align="left"><input type="text" name="nackname"/><span style="color: red;">*</span></td></tr>
		<tr><td align="right">性别：</td><td align="left"><input type="radio" id="sex" name="sex" value="男" />男<input type="radio" id="sex" name="sex" value="女" />女<span style="color: red;">*</span></td></tr>
		<tr><td align="right">生日：</td><td align="left"><input type="text" name="breathdaty"/>格式：(1989-09-09)<span style="color: red;">*</span></td></tr>
		<tr><td colspan="2"><img src="images/anquan.jpg" /></td></tr>
		<tr><td align="right">姓名：</td><td align="left"><input type="text" name="truename"/><span style="color: red;">*</span></td></tr>
		<tr><td align="right">身份证：</td><td align="left"><input type="text" name="userid"/><span style="color: red;">*</span></td></tr>
		<tr><td align="right">E-mail：</td><td align="left"><input type="text" name="usermail"/><span style="color: red;">*</span></td></tr>
		<tr><td align="right">联系电话：</td><td align="left"><input type="text" name="userphoto"/></td></tr>
		<tr><td colspan="2" align="center"><a href="javascript:newuser();"><img src="images/btn2.jpg"  /></a></td></tr>
	</table>
</form>
</div>
<div id="dowmbg">
	<div id="dowm">
		
	</div>
</div>
</center>
</body>
</html>

