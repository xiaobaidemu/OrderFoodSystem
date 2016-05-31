<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="t.o.bean.orderlisBean" %>
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
  <script type="text/javascript">
  	function changenum(object){
  		var foodnum = document.getElementById(object).value;
  		window.location.href="<%=basePath%>orderchangeshow?foodno="+object+"&foodnum="+foodnum;
  	}	
  	function deletefood(object){
  		window.location.href="<%=basePath%>orderchangeshow?food="+object;
  	}	
  	function change(){
  		window.location.href="<%=basePath%>orderchangeshow?change=1";
  	}
  </script>
  <body>
  <form action="">
  	<table border="1" width="700">
  		<tr><td>订单编号：<%=session.getAttribute("orderno") %></td></tr>
  		<tr><td>食物编号</td><td>食物名称</td><td>食物份数</td><td>食物价钱</td><td>用户权限</td></tr>
    <% 
    	ArrayList<orderlisBean> orderList = (ArrayList<orderlisBean>)session.getAttribute("olist");
    	int size = orderList.size();
    	orderlisBean obean =null;
    	for(int i=0;i<size;i++){
    		obean = orderList.get(i);  			
	    %>
		    <tr><td><%=obean.getFoodno() %></td>
		    <td><%=obean.getFoodname() %></td>
		    <td><input type="text" id="<%=obean.getFoodno() %>" value="<%=obean.getFoodtime() %>" size="8"/></td><td><%=obean.getFoodtime() %>份/<%=obean.getFoodprice() %>元</td>
		    <td><input type="button" name="<%=obean.getFoodno() %>" value="修改数量" onclick="changenum(this.name);"/>
		    <input type="button" name="<%=obean.getFoodno() %>" value="删除" onclick="deletefood(this.name);"/></td>
		    </tr>
	    <%
    	}
    	
    %>
    <tr><td colspan="5">总价：<%=session.getAttribute("allprice") %>元<input type="button" value="确定" onclick="change();"/></td></tr>
    </table>
  </form>
  </body>
</html>
