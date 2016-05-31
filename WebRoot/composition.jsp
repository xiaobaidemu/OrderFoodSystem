<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="t.o.bean.compositionBean" %>

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
<link rel="stylesheet" type="text/css" href="css/all.css">
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
		width:800px;
		height:450px;
		margin-top:20px;
		marker-offset: 20px;
	}
	.STYLE1 {
		font-family: "楷体";
		font-size: 15px;
		font-weight: bold;
	}
	.STYLE2 {
	font-family: "新宋体";
	font-size: 18px;
	font-weight: bold;
	color: #000000;
}
	table{
		margin-top: 20px;
	}
</style>
<script type="text/javascript">
	function addcar(object){
		//window.location.href("shoppingcar?food_no=" + object.id);
		window.location.href = "shoppingcar?food_no=" + object.id;
	}
</script>
<body>
<center>
<div id="loginbg">
	<div id="login" >
	</div>
</div>
	<div id="content">
	<%
    	    	ArrayList<compositionBean> comList = (ArrayList<compositionBean>)request.getAttribute("commessage");
    			compositionBean combean = comList.get(0);
    %>
    	<table height="90%" width="95%"   >
    		<tr height="20"><td align="center"><span class="STYLE2 "><%=combean.getC_title() %></span></td></tr>
    		<tr height="20"><td align="center">类型：<%=combean.getC_type() %>（<%=combean.getC_date() %>）</td></tr>
    		<tr height="20"><td><HR style="border:1 dashed #000" width="100%" color="#987cb9" SIZE="1"></td></tr>
    		<tr><td valign="top"><%=combean.getC_c() %></td></tr>
    	</table>
	</div>
	</center>
  </body>
</html>
