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

  </head>
    <LINK href="admin/css/admin.css" type="text/css" rel="stylesheet">
    <script type="text/javascript">
	function search(){
		var ordersearch = document.getElementById("searchtext").value;
		if(ordersearch==""){
			alert("查询信息不能为空！！！");
		}
		else{
			document.form1.action="compositionchange";
			document.form1.submit();
			
		}
	}
	function change(object){
  			window.location.href="compositionchange?com_no=" + object.id; 
	}
	function searchall(){
		window.location.href="<%=basePath %>compositionchange";
	}
	function deletea(object){
	  	if (confirm('确定删除'+object.id)){
	  		window.location.href="<%=basePath %>compositionchange?delete="+object.id;
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
	<form action="" name="form1">
	<table border="1" width="700">
		<tr><td colspan="8">
			文章查找：
			<select name="search_type">
				<option value="com_no">文章编号</option>
				<option value="com_title">文章标题</option>
			</select>
			<input type="text" name="searchtext" id="searchtext" />
			<input type="button" value="查找" onclick="search();" />
			<input type="button" value="查找全部" onclick="searchall();" />
		</td></tr>
		<tr><td>文章编号</td><td>文章标题</td><td>管理权限</td></tr>
		<tr height="350"><td colspan="3" valign="top">
			<table width="100%" border="1">
			<% 
				response.setCharacterEncoding("utf-8");
			   	ArrayList<compositionBean> compositionList = (ArrayList<compositionBean>)session.getAttribute("compositionList");
			   	int size =compositionList.size();
		    	compositionBean compositionbean;
			   	for(int i=0;i<size;i++){
		    	compositionbean = compositionList.get(i);
		    %>
		   	<tr>
		    	<td width="25%"><a href="compositionchange?com_no=<%=compositionbean.getC_no() %>" ><%=compositionbean.getC_no() %></a></td>
		    	<td width="25%"><%=compositionbean.getC_title() %></td>
		    	<td width="25%" align="center" id="power">
					<input type="button" id="<%=compositionbean.getC_no() %>" value="修改" onclick="change(this);" >&nbsp;&nbsp;
					<input type="button" id="<%=compositionbean.getC_no() %>" value="删除" onclick="deletea(this);">
				</td>
				 
	    	</tr>
			<%
				}
			%>
		</table>
		</td></tr>
		<tr><td colspan="3"><%=session.getAttribute("str") %></td></tr>
	</table>
	</form>
</body>
</html>

