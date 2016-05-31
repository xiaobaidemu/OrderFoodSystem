<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="t.o.bean.orderBean" %>
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
		margin-top:10px;
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
	#zj{
		color: red;
		font-size: 15px;
	}
</style>
<script type="text/javascript">
	function ordercolor(){
		var a = document.getElementsByTagName("tr");
		var size = a.length;
		for(var i=0;i<size;i++){
			if(a[i].id == "orderlist" && i%2==1){
				a[i].style.backgroundColor = "#f4cd7f";
			}
		}
	}
</script>
	<body onload="ordercolor();">
	<center>
	<div id="loginbg">
		<div id="login" >
		</div>
	</div>
	<div id="content">
	<table width="80%">
	<tr><td colspan="3" ><img src="images/ckorder.jpg"/></td></tr>
	<tr><td><table width="100%"  style="border:2px #f4cd7f solid;">
	<tr><td width="">订单号</td><td>订单状态</td><td>订单物品</td></tr>
	<%
		ArrayList<orderBean> orderList = (ArrayList<orderBean>)session.getAttribute("ordershow");
		orderBean orderbean;
		if(orderList.size()==0){
			%><tr id="orderlist"><td colspan="5" align="center">没有订单</td></tr><%
		}
		else{
			int size = orderList.size();
			for(int i = 0;i<size;i++){
				orderbean = orderList.get(i);
				String food = orderbean.getOrder_food();
				String newfood = "";
				newfood = newfood+food.substring(0,food.indexOf("元")+1)+"<br>";
				while(food.indexOf(";")!=-1){
					food = food.substring(food.indexOf("元")+1,food.lastIndexOf("元")+1);
					if(food.indexOf(";")==-1){
						newfood = newfood+food.substring(0,food.indexOf("元")+1);
					}else
					newfood = newfood+food.substring(0,food.indexOf("元")+1)+"<br>";
				}
				%>
					<tr id="orderlist"><td><%=orderbean.getOrder_no() %></td><td><%=orderbean.getOrder_state() %></td>
					<td><%=newfood %></td></tr>
				<%
			}
		}
	%></table></td></tr>
   		</table>
   		<br/><br/><br/>
		</div>
		</center>
	</body>
</html>
