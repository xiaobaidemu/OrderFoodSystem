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
    <SCRIPT src="admin/js/Clock.js" type="text/javascript"></SCRIPT>
<BODY>
<TABLE cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
  <TR height="28">
    <TD background="admin/images/title_bg1.jpg">当前位置: >>管理员首页</TD></TR>
  <TR>
    <TD bgColor="#b1ceef" height="1"></TD></TR>
  <TR height="20">
    <TD background="admin/images/shadow_bg.jpg"></TD></TR></TABLE>
<TABLE cellSpacing="0" cellPadding="0" width="90%" align="center" border="0">
  <TR height="100">
    <TD align="middle" width="100"><IMG height="100" src="admin/images/admin_p.gif" width="90"></TD>
    <TD width="60">&nbsp;</TD>
    <TD>
      <TABLE height="100" cellSpacing="0" cellPadding="0" width="100%" border="0">
        
        <TR>
          <TD> <SPAN id="clock"></SPAN>
          <SCRIPT type="text/javascript"> var clock = new Clock(); clock.display(document.getElementById("clock"));</SCRIPT></TD></TR>
        <TR>
          <TD style="FONT-WEIGHT: bold; FONT-SIZE: 16px"><%=session.getAttribute("adminName") %></TD></TR>
        <TR>
          <TD>欢迎进入网站管理中心！</TD></TR></TABLE></TD></TR>
  <TR>
    <TD colSpan="3" height="10"></TD></TR></TABLE>
<TABLE cellSpacing="0" cellPadding="0" width="95%" align="center" border="0">
  <TR height="20">
    <TD></TD></TR>
  <TR height="22">
    <TD style="PADDING-LEFT: 20px; FONT-WEIGHT: bold; COLOR: #ffffff" 
    align="middle" background="admin/images/title_bg2.jpg"></TD></TR>
  <TR bgColor="#ecf4fc" height="12">
    <TD></TD></TR>
  <TR height="20">
    <TD></TD></TR></TABLE>

    </BODY>
    </HTML>
