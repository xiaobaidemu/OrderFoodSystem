<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="t.o.bean.compositionBean" %>
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
  </head>
  
  <body>
  <TABLE cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
  <TR height="28">
    <TD background="admin/images/title_bg1.jpg">当前位置: >>检查文章</TD></TR>
  <TR>
    <TD bgColor="#b1ceef" height="1"></TD></TR>
    </TABLE><br/>
    <%
    	compositionBean combean = (compositionBean)request.getAttribute("comaddshow");
    	out.print(combean.getC_no()+"<br>");
    	out.print(combean.getC_title()+"<br>");
    	out.print(combean.getC_type()+"<br>");
    	out.print(combean.getC_date()+"<br>");
    	out.print(combean.getC_c()+"<br>");
    %>
    <a href="admin/compositionadd.jsp" >返回</a>
  </body>
</html>
