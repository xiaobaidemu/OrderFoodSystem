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

  <LINK href="admin/css/admin.css" type="text/css" rel="stylesheet">
	</HEAD>
	<FRAMESET border=0 frameSpacing=0 rows="60, *" frameBorder=0>
		  <FRAME name=header src="admin/header.jsp" frameBorder=0 noResize scrolling=no>
		<FRAMESET cols="170, *">
			<FRAME name=menu src="admin/menu.html" frameBorder=0 noResize>
			<FRAME name=main src="admin/main.jsp" frameBorder=0 noResize scrolling=yes>
		</FRAMESET>
	</FRAMESET>
	<noframes>
	</noframes>
</html>
