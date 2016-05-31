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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link rel="stylesheet" type="text/css" href="<%=basePath%>css/all.css">
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
		width:1000px;
		height:500px;
	}
	#dowmbg{
		width:100%;
		height:170px;
		background-image: url(images/footerbg.jpg);
	}
	#dowm{
		width:1000px;
		height:170px;
		background-image: url(images/footerbg.jpg);
	}
	#foodhead{
		background-image: url(images/cechazhao.jpg);
	}
	table{
	
		margin-top: 50px;
	}
	img{
		border:0px;
	}
</style>
<script type="text/javascript">
	function searchfood(){
		var foodsearch = document.form2.foodsearch.value;
		if(foodsearch==""){
			alert("搜索信息不能为空！！！");
		}
		else{
			document.form2.submit();
		}
	}
	function addcar(object){
		//window.location.href("shoppingcar?food_no=" + object.id);
		window.location.href = "shoppingcar?food_no=" + object.id;
	}
</script>
<body>
<center>
<div id="loginbg">
	<div id="login" align="left">
		
	</div>
</div>
<div id="content">
<table width="70%" height="453" >
				<tr height="45"><td id="foodhead" align="right">
				<form action="allfood" name="form2">菜色搜索：<input type="text" name="foodsearch"/>
				<input type="button" value="搜索" onclick="searchfood();"/></form></td></tr>
				<tr><td valign="top">
				<br/><br/>
				<table style="margin-top: 0px;" align="center"><tr>
				<%!int sizea = 0; %>
				<% 
						response.setCharacterEncoding("utf-8");
				    	ArrayList<foodBean> foodList = (ArrayList<foodBean>)session.getAttribute("foodList");
				    	sizea = foodList.size();
				    	if(sizea == 0){
				    	%>
				    	<td>没有搜索到您要的食物！！！</td>
				    	<%
				    	}
				    	else{
				    	foodBean foodbean;
				    	for(int i=0;i<sizea;i++){
				    		foodbean = foodList.get(i);
				 %>
				 <td height="80" width="100"><a href="foodmessage?no=<%=foodbean.getFood_no() %>" target="_self"><img src="images/foodimg/<%=foodbean.getFood_no() %>.jpg" width="90" height="68"/></a></td>
					<td width="140"><a href="foodmessage?no=<%=foodbean.getFood_no() %>" target="_self"><%=foodbean.getFood_name() %></a><br/>价格：<%=foodbean.getFood_price() %>元<br/>
						<input type="button" id="<%=foodbean.getFood_no() %>" value="加入购物车" onclick="addcar(this);">
					</td>
				 	<%if(i%3==2){out.print("</tr><tr>");}
				 } }
				 %>
				</tr></table></td></tr>
			</table>
			<table style="margin-top: 0px;" width="95%" ><br/><BR/><tr><td align="center"><%=session.getAttribute("str") %><br/><br/><br/><br/><br/></td></tr></table>
</div>
<div id="dowmbg">
	<div id="dowm">
		
	</div>
</div>
</center>
</body>
</html>
