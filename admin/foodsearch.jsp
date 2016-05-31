<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="t.o.bean.foodBean" %>
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
    	function searchf(){
	    	var foodtype = document.getElementById("foodtype").value;
	    	var food = document.getElementById("foodsearch").value;
	    	if(food==""){
	    		alert("查找信息不能为空！！！");
	    	}
	    	else{
	    		document.form1.action =  "<%=basePath %>foodchange";  
	    		document.form1.submit();
	    	}
    	}
    	function searchfood(object){
    		window.location.href="<%=basePath %>foodchange?food_type="+object.id;
    	}
    	function change(object){
  			window.location.href="foodchange?foodno=" + object.id; 
	  	}
	  	function deletea(object){
	  		if (confirm('确定删除'+object.id)){
	  			window.location.href="<%=basePath %>foodchange?delete="+object.id;
	  		}
	  	}
    </script>
<body>
<TABLE cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
  <TR height="28">
    <TD background="admin/images/title_bg1.jpg">当前位置: >>修改食物</TD></TR>
  <TR>
    <TD bgColor="#b1ceef" height="1"></TD></TR>
</TABLE>
    <form name="form1" action="" method="get">
		<table border="1" width="700" align="center">
			<tr><td colspan="8">
				食物查找：
				<select name="foodtype" id="foodtype">
					<option value="food_name">食物名称</option>
					<option value="food_no">食物编号</option>
				</select>
				<input type="text" name="foodsearch" id="foodsearch" />
				<input type="button" value="查找" onclick="searchf();" />
			</td></tr>
			<!--  <tr>
				<td align="center">查找</td>
				<td align="center" name="all" id="all" onclick="searchfood(this);">全部</td>
				<td align="center" name="my" id="my" onclick="searchfood(this);">招牌</td>
				<td align="center" name="china" id="china" onclick="searchfood(this);">中餐</td>
				<td align="center" name="abroad" id="abroad" onclick="searchfood(this);">西餐</td>
				<td align="center" name="nosh" id="nosh" onclick="searchfood(this);">小吃</td>
				<td align="center" name="cake" id="cake" onclick="searchfood(this);">糕点</td>
				<td align="center" name="drink" id="drink" onclick="searchfood(this);">饮品</td>
			</tr>
			-->
			<tr><td align="center" colspan="2">食物编号</td><td align="center"  colspan="2">食物名称</td><td align="center"  colspan="2">食物类型</td><td align="center"  colspan="2">管理权限</td></tr>
			<tr><td colspan="8" valign="top">
				<table width="100%" border="1">
					<% 
						response.setCharacterEncoding("utf-8");
				    	ArrayList<foodBean> foodList = (ArrayList<foodBean>)session.getAttribute("foodList");
				    	int size = foodList.size();
				    	foodBean foodbean;
				    	for(int i=0;i<size;i++){
				    		foodbean = foodList.get(i);
				    %>
				    <tr>
	    	<td width="25%"><a href="foodchange?foodno=<%=foodbean.getFood_no() %>" ><%=foodbean.getFood_no() %></a></td>
	    	<td width="25%"><%=foodbean.getFood_name() %></td>
	    	<td width="25%"><%=foodbean.getFood_type() %></td>
	    	<td width="25%" align="center">
				<input type="button" id="<%=foodbean.getFood_no() %>" value="修改" onclick="change(this);" >
				<input type="button" id="<%=foodbean.getFood_no() %>" value="删除" onclick="deletea(this);">
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