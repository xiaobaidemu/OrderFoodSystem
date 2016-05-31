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
    
    <title>My JSP 'userchange.jsp' starting page</title>
    
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


<body>
<%
	String user_name = request.getParameter("user_name");
	ArrayList<userBean> userList = (ArrayList<userBean>)session.getAttribute("userchange");
	int size = userList.size();
	userBean userbean;
	for(int i=0;i<size;i++){
		userbean = userList.get(i);
		if(userbean.getUser_name().equals(user_name)){
%>		
		<form action="userchange">
			<table border="1">
				<tr><td>用户头像：</td><td><%=userbean.getUser_img() %></td></tr>
				<tr><td>用户名：</td><td><input type="text" name="username" value="<%=userbean.getUser_name() %>" readonly="true" /></td></tr>
				<tr><td>密码：</td><td><input type="text" name="userpwd" value="<%=userbean.getUser_pwd() %>"/></td></tr>
				<tr><td>昵称：</td><td><%=userbean.getUser_naickname() %></td></tr>
				<tr><td>生日：</td><td><%=userbean.getUser_birthday() %></td></tr>
				<tr><td>性别：</td><td><%=userbean.getUser_sex() %></td></tr>
				<tr><td>真实姓名：</td><td><%=userbean.getUser_truename() %></td></tr>
				<tr><td>身份证：</td><td><%=userbean.getUser_idcard() %></td></tr>
				<tr><td>电话：</td><td><%=userbean.getUser_phone() %></td></tr>
				<tr><td>电子邮箱：</td><td><%=userbean.getUser_email() %></td></tr>
				<tr><td colspan="2"><input type="submit" /></td></tr>
			</table>
		</form>	
<%			
		}
	}
%>
</body>
</html>
