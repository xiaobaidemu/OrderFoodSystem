<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="t.o.bean.orderBean" %>
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
		var ordersearch = document.getElementById("searchtext").value;
		if(ordersearch==""){
			alert("查询信息不能为空！！！");
		}
		else{
			document.form1.action="orderchange";
			document.form1.submit();
			
		}
	}
	function change(object){
  			window.location.href="orderchange?order_no=" + object.id; 
	}
	function searchall(){
		window.location.href="<%=basePath %>orderchange";
	}
	function deletea(object){
	  	if (confirm('确定删除'+object.id)){
	  		window.location.href="<%=basePath %>orderchange?delete="+object.id;
	  	}
	}
	function state(object){
  			window.location.href="orderchange?ok=" + object.id; 
	}
	function bb(){
		var a = document.getElementsByTagName("input");
		var size = a.length;
		for(var i=0;i<size;i++){
			if(a[i].name=="完成"){
				a[i].disabled="disabled";
			}
		}
	}
</script>
<body onload="bb();">
<TABLE cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
  <TR height="28">
    <TD background="admin/images/title_bg1.jpg">当前位置: >>修改订单</TD></TR>
  <TR>
    <TD bgColor="#b1ceef" height="1"></TD></TR>
</TABLE>
	<form name="form1" action="" method="get">
	<table border="1" width="700">
		<tr><td colspan="8">
			订单查找：
			<select name="search_type" id="search_type">
				<option value="order_no">订单编号</option>
				<option value="order_user">用户姓名</option>
				<option value="order_state">状态</option>
			</select>
			<input type="text" name="searchtext" id="searchtext" />
			<input type="button" value="查找" onclick="search();"/>
			<input type="button" value="查找 全部" onclick="searchall();"/>
		</td></tr>
		<tr><td>订单编号</td><td>用户名称</td><td width="25%">状态</td><td>管理权限</td></tr>
		<tr><td colspan="8" valign="top">
		<table width="100%" border="1">
			<% 
				response.setCharacterEncoding("utf-8");
			   	ArrayList<orderBean> orderList = (ArrayList<orderBean>)session.getAttribute("orderList");
			   	int size = orderList.size();
		    	orderBean orderbean;
			   	for(int i=0;i<size;i++){
		    	orderbean = orderList.get(i);
		    %>
		    <tr>
		    	<td width="25%"><a href="orderchange?order_no=<%=orderbean.getOrder_no() %>"><%=orderbean.getOrder_no() %></a></td>
		    	<td width="25%"><%=orderbean.getOrder_user() %></td>
		    	<td width="25%"><%=orderbean.getOrder_state() %></td>
		    	<td width="25%" align="center" id="power">
		    		<input type="button" id="<%=orderbean.getOrder_no() %>"  name="<%=orderbean.getOrder_state() %>" value="完成" onclick="state(this);">&nbsp;&nbsp;
					<input type="button" id="<%=orderbean.getOrder_no() %>"  name="<%=orderbean.getOrder_state() %>" value="修改" onclick="change(this);" >&nbsp;&nbsp;
					<input type="button" id="<%=orderbean.getOrder_no() %>"  name="<%=orderbean.getOrder_state() %>" value="删除" onclick="deletea(this);">
				</td>
				 
	    	</tr>
			<%
				}
			%>
		</table>
		</td></tr>
		<tr><td colspan="8"><%=session.getAttribute("str") %></td></tr>
	</table>
	</form>
</body>
</html>