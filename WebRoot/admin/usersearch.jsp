<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="t.o.bean.userBean" %>
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
	function search(){
		var searchtext = document.getElementById("searchtext").value;
		if(searchtext==""){
			alert("查询信息不能为空！！！");
		}
		else{
			document.form1.action="userchange";
			document.form1.submit();
			
		}
	}
	function change(object){
  			window.open("userchange?user_name=" + object.id); 
	}
	function searchall(){
		window.location.href="<%=basePath %>userchange";
	}
	function deletea(object){
	  	if (confirm('确定删除'+object.id)){
	  		window.location.href="<%=basePath %>userchange?delete="+object.id;
	  	}
	}
</script>
<body>
<TABLE cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
  <TR height="28">
    <TD background="admin/images/title_bg1.jpg">当前位置: >>修改用户资料</TD></TR>
  <TR>
    <TD bgColor="#b1ceef" height="1"></TD></TR>
  </TABLE>
	<form name="form1" action="" method="get">
	<table border="1" width="700">
		<tr><td colspan="3" align="center">
			用户查找：
			<select id="usersearch" name="usersearch">
				<option value="user_no">用户名</option>
				<option value="user_name">用户昵称</option>
			</select>
			<input type="text" id="searchtext" name="searchtext"/>
			<input type="button" value="查找" onclick="search();" /></td>
			<td width="25%"><input type="button" value="查找全部" onclick="searchall();" />
		</td></tr>
		<tr><td width="25%">用户名</td><td>用户昵称</td><td>真实姓名</td><td>管理权限</td></tr>
		<tr height="350"><td colspan="4" valign="top">
		<table width="100%" border="1">
			<% 
				response.setCharacterEncoding("utf-8");
			   	ArrayList<userBean> userList = (ArrayList<userBean>)session.getAttribute("userList");
			   	int size = userList.size();
		    	userBean userbean;
			   	for(int i=0;i<size;i++){
		    	userbean = userList.get(i);
		    %>
		    <tr>
		    	<td width="25%"><a href="userchange?user_name=<%=userbean.getUser_name() %>" target="_blank"><%=userbean.getUser_name() %></a></td>
		    	<td width="25%"><%=userbean.getUser_naickname() %></td>
		    	<td width="25%"><%=userbean.getUser_truename() %></td>
		    	<td width="25%" align="center">
					<input type="button" id="<%=userbean.getUser_name() %>" value="修改" onclick="change(this);" >
					<input type="button" id="<%=userbean.getUser_name() %>" value="删除" onclick="deletea(this);">
				</td>
	    	</tr>
			<%
				}
			%>
		</table>
		</td></tr>
		<tr><td colspan="4"><%=session.getAttribute("str") %></td></tr>
	</table>
	</form>
</body>
</html>
