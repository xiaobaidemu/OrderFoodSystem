<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="t.o.bean.CommentBean" %>
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
    
    <title>My JSP 'commentsearch.jsp' starting page</title>
    
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
    	function searchcmt(){
	    	var foodtype = document.getElementById("foodtype").value;
	    	var food = document.getElementById("cmtsearch").value;
	    	if(food==""){
	    		alert("查找信息不能为空！！！");
	    	}
	    	else{
	    		document.form1.action =  "<%=basePath %>Commentchange";  
	    		document.form1.submit();
	    	}
    	}
    	function searchakindofcmt(object){
    		window.location.href="<%=basePath %>Commentchange?food_type="+object.id;
    	}

	  	function deletea(object){
	  		if (confirm('确定删除这条评论吗')){
	  			window.location.href="<%=basePath %>Commentchange?delete="+object.id;
	  		}
	  	}
    </script>
  <body>
    <TABLE cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
  <TR height="28">
    <TD background="admin/images/title_bg1.jpg">当前位置: >>查看评论</TD></TR>
  <TR>
    <TD bgColor="#b1ceef" height="1"></TD></TR>
</TABLE>
    <form name="form1" action="" method="get">
		<table border="1" width="700" align="center">
			<tr><td colspan="10">
				评论查找：
				<select name="foodtype" id="foodtype">
					<option value="food_name">食物名称</option>
					<option value="food_no">食物编号</option>
				</select>
				<input type="text" name="cmtsearch" id="cmtsearch" />
				<input type="button" value="查找" onclick="searchcmt();" />
			</td></tr>

			<tr><td align="center" width="20%">食品名称</td><td align="center"  width="20%">评论者</td><td align="center"  width="20%">评论内容</td><td align="center"  width="20%">评论时间</td><td align="center"  width="20%">管理权限</td></tr>
			<tr><td colspan="10" valign="top">
				<table width="100%" border="1">
					<% 
						response.setCharacterEncoding("utf-8");
				    	ArrayList<CommentBean> cmtList = (ArrayList<CommentBean>)session.getAttribute("cmtList");
				    	int size = cmtList.size();
				    	CommentBean cmtBean;
				    	for(int i=0;i<size;i++){
				    		cmtBean = cmtList.get(i);
				    %>
				    <tr>
	    				<td width="20%"><%=cmtBean.getFoodName() %></a></td>
	    				<td width="20%"><%=cmtBean.getUserName() %></td>
	    				<td width="20%"><%=cmtBean.getContent() %></td>
	    				<td width="20%"><%=cmtBean.getCmtdate().substring(0, 16) %></td>
	    				<td width="20%" align="center">
				<input type="button" id="<%=cmtBean.getCommentId() %>" value="删除" onclick="deletea(this);">
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
