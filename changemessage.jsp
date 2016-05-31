<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="t.o.bean.userBean" %>
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
		height:500px;
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
		marker-offset:20px;
	}
	img{
		border:0px;
	}
</style>
<script type="text/javascript">
	function changeuser(){
		var nackname = document.form1.nackname.value;
		var breathdaty = document.form1.breathdaty.value;
		var usermail = document.form1.usermail.value;
		if(nackname==""||breathdaty==""||usermail==""){
			alert("加星号项不能为空");
		}
		else{
			document.form1.submit();
		}
	}
	function headchange(object){
		document.getElementById("headimg" ).src= "<%=basePath %>images/userimg/"+object+".gif";
		document.getElementById("headimg" ).style.display = "block";
		if(object==""){
			document.getElementById("headimg" ).style.display = "none";
		}
	}
</script>
<body>
<center>
<div id="loginbg">
	<div id="login" align="left">
		
	</div>
</div>
<div id="content">
<%
	ArrayList<userBean> userList = (ArrayList<userBean>)session.getAttribute("usermessage");
	userBean userbean = userList.get(0);
%>
<form action="changemessage" name="form1" method="post" >
	<table width="60%"  height="100%" >
	<tr><td align="center" colspan="2"><a href="changemessage"><img src="images/btn3.jpg"/></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="pwdchange.jsp"><img src="images/btn4.jpg"/></a></td></tr>
		<tr><td align="center" colspan="2"><img src="images/xgziliao.jpg"/></td></tr>
		<tr><td align="right" width="40%">头像：</td><td align="left">
		<img id="head" src="<%=basePath %>images/userimg/<%=userbean.getUser_img() %>.gif">
		<img id="headimg" src="<%=basePath %>images/userimg/user1.gif" style="display: none">
		<select name="head" onchange="headchange(this.value);">
			<option value="1">请选择</option>
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
		</select></td></tr>
		<tr><td align="right">昵称：</td><td align="left"><input type="text" name="nackname" value="<%=userbean.getUser_naickname() %>"/></td></tr>
		<tr><td align="right">性别：</td><td align="left"><%=userbean.getUser_sex() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="radio" id="sex" name="sex" value="男" />男
			<input type="radio" id="sex" name="sex" value="女" />女</td></tr>
		<tr><td align="right">生日：</td><td align="left"><input type="text" value="<%=userbean.getUser_birthday() %>" name="breathdaty"/>格式：(1989-09-09)</td></tr>
		<tr><td align="right">姓名：</td><td align="left"><%=userbean.getUser_truename() %></td></tr>
		<tr><td align="right">身份证：</td><td align="left"><%=userbean.getUser_idcard() %></td></tr>
		<tr><td align="right">E-mail：</td><td align="left"><input type="text" value="<%=userbean.getUser_email() %>" name="usermail"/></td></tr>
		<tr><td align="right">联系电话：</td><td align="left"><input type="text" value="<%=userbean.getUser_phone() %>" name="userphoto"/></td></tr>
		<tr><td colspan="2" align="center"><a href="javascript:changeuser();"><img src="images/btn5.jpg"/></a></td></tr>
	</table>
</form>
<br/><br/><BR/><br/>
</div>
<div id="dowmbg">
	<div id="dowm">
		
	</div>
</div>
</center>
</body>
</html>
