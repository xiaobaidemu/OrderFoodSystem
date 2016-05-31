<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="t.o.bean.carBean" %>
<%@page import="t.o.bean.foodBean"%>
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
	font-family: "黑体";
		font-size: 18px;
		font-style: italic;
		font-weight: bold;
		color: #7e8901;
}
	table{
		margin-top: 20px;
	}
	#zj{
		font-weight: bold;
		color: red;
		font-size: 15px;
	}
</style>
<script type="text/javascript">
	function changenum(object){
		window.location.href="shoppingcar?food_no="+object.name+"&foodnum="+document.getElementById(object.name).value;
	}
	function deletefood(object){
		window.location.href="shoppingcar?delete_no="+object.name;
	}
	function deleteall(){
		window.location.href="shoppingcar?deleteall=yes";
	}
	function deleteall(){
		window.location.href="shoppingcar?deleteall=yes";
	}
	function define(){
		var zj = document.getElementById("zj").firstChild.nodeValue;
		window.location.href="shoppingcar?define="+zj;
	}
	function carcolor(){
		var a = document.getElementsByTagName("tr");
		var size = a.length;
		for(var i=0;i<size;i++){
			if(a[i].id == "foodlist" && i%2==0){
				a[i].style.backgroundColor = "#f4cd7f";
			}
		}
	}
</script>
	<body onload="carcolor();">
	<center>
	<div id="loginbg">
		<div id="login" >
		</div>
	</div>
	<div id="content">
	<table width="800px" height="30">
	<tr><td colspan="4" ><img src="images/carhead.jpg" width="800px"/></td></tr>
	<tr><td align="center" width="25%">食物名称</td>
	<td align="center" width="25%">数量</td><td align="center" width="25%">价钱</td>
	<td align="center" width="25%">用户权限</td></tr> 
		<%
			Map cart = (Map)session.getAttribute("cart");
			double total = 0;
		
			if(cart == null || cart.size() == 0){
				out.println("<tr id='foodlist' ><td align='center' colspan='4'>菜单当前为空</tr></td><tr><td colspan='4' align='center'>");
			}
			else{
				//Map<String, foodorderBean>String就是Map的名称
				//获取Map中所有的项的名称
				Set foodorderBeans = cart.keySet();
				//toArray返回一个Object类型的数组
				Object[] isbn = foodorderBeans.toArray();
				int num;
				int size = cart.size();
				float[] zprice = new float[size]; 
				String foodname;
				//double subtotal;
					for(int i = 0; i < size; i++){
						carBean carBean = (carBean)cart.get(isbn[i]);
						foodBean foodBean = carBean.getFoodbean();
						num = carBean.getQuantity();
						foodname = foodBean.getFood_name();
						%>
							<tr id="foodlist"><td align="center"><a href="foodmessage?no=<%=foodBean.getFood_no() %>" target="_blank"><%=foodname %></a></td>
							<td align="center">数量：<input type="text" name="foodnum" id="<%=foodBean.getFood_no() %>" value="<%=num %>" size="6"></td>
							<td align="center"><%=num %>份:<% zprice[i]=Float.valueOf(foodBean.getFood_price())*num; out.print(zprice[i]); %>元</td>
							<td align="center"><input type="button" name="<%=foodBean.getFood_no() %>" value="修改数量" onclick="changenum(this);"/>
							&nbsp;&nbsp;&nbsp;<input type="button" name="<%=foodBean.getFood_no() %>" value="删除" onclick="deletefood(this);"/></td></tr>
					<%
					}
					%>
					<tr><td colspan="4"><img src="images/line.JPG" width="800px"/></td></tr>
					<tr><td colspan="4" align="center"><%
					out.print("总价：");
					float zj = 0;
					for(int i = 0; i < size; i++){
						zj = zj + zprice[i];
					}
					out.print("<label id='zj'>"+zj+"</label>元");
				}
   		%>
   		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   		<input type="button" value="确定" onclick="define();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   		<input type="button" value="清空订单" onclick="deleteall();"></td></tr>
   		</table>
		</div>
		</center>
	</body>
</html>
