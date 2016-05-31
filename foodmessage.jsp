<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="t.o.bean.foodBean" %>
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
		margin-top:10px;
		background-image: url(images/10.jpg);
	}
	.STYLE1 {
		font-family: "楷体";
		font-size: 15px;
		font-weight: bold;
	}
	.STYLE2 {
	font-family: "新宋体";
	font-size: 18px;
	font-style: italic;
	font-weight: bold;
	color: #7e8901;
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
    	ArrayList<foodBean> foodList = (ArrayList<foodBean>)request.getAttribute("foodmessage");
    	foodBean foodbean = foodList.get(0);
    %>
    	<table height="90%" width="95%" ><tr>
    	<td valign="top"><img src="<%=basePath %>images\foodimg\<%=foodbean.getFood_no()%>.jpg" width="250"></td>
    	<td valign="top">
    		<table width="100%" style="margin-top: 0">
    			<tr><td height="40" colspan="2"><span class="STYLE2">菜色介绍</span></td></tr>
    			<tr><td height="20" width="60">菜色名称：</td><td><span class="STYLE1"><%=foodbean.getFood_name() %></span></td></tr>
    			<tr><td height="20">菜色编号：</td><td><%=foodbean.getFood_no() %></td></tr>
    			<tr><td height="20">菜色主厨：</td><td><%=foodbean.getFood_cook() %></td></tr>
    			<tr><td height="20">菜色价格：</td><td><%=foodbean.getFood_price() %>元</td></tr>
    			<tr><td height="20">菜色类别：</td><td><%=foodbean.getFood_type() %></td></tr>
    			<tr><td valign="top" height="20">菜色简介：</td><td valign="top"><%=foodbean.getFood_synopsis() %></td></tr>
    			<tr><td valign="top" height="20">备注：</td><td><%=foodbean.getFood_remark()%></td></tr>
    			<tr><td colspan="2"><br/><br/><input id="<%=foodbean.getFood_no() %>" type="button" value="放入购物车" onclick="addcar(this);"/></td></tr>
    		</table>
    	</td>
    	</tr></table>
	</div>
	</center>
</body>
</html>

