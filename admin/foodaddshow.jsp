<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="t.o.bean.*" %>
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
    
    <title>My JSP 'foodaddshow.jsp' starting page</title>
    
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
    <TD background="admin/images/title_bg1.jpg">当前位置: >>修改文章</TD></TR>
  <TR>
    <TD bgColor="#b1ceef" height="1"></TD></TR>
    </TABLE><br/>
    <% 
    	foodBean foodbean = (foodBean)request.getAttribute("foodaddshow");
    %>
    <%=foodbean.getFood_no()%><br/>
    <%=foodbean.getFood_name()%><br/>
    <img alt="" src="<%=basePath %>/images/foodimg/<%=foodbean.getFood_no() %>.jpg"  width="200" height="150"><br/>
    <%=foodbean.getFood_type()%><br/>
    <%=foodbean.getFood_price()%><br/>
    <%=foodbean.getFood_cook()%><br/>
    <%=foodbean.getFood_synopsis()%><br/>
    <%=foodbean.getFood_remark()%>
  </body>
</html>
