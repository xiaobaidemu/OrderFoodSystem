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
  <script type="text/javascript" src="fckeditor\fckeditor.js"></script>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'compositionchange.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <LINK href="admin/css/admin.css" type="text/css" rel="stylesheet">
  </head>
   <script type="text/javascript">
	     window.onload = function(){
       		var oFCKeditor = new FCKeditor('changecontent') ;
        	oFCKeditor.BasePath = "<%=basePath%>/fckeditor/" ;
        	oFCKeditor.Height = 500 ; // 400 pixels 
        	oFCKeditor.Width= 650;
        	oFCKeditor.ReplaceTextarea() ;      
        }     
		function check(){

        	var content =FCKeditorAPI.GetInstance("changecontent").GetXHTML();
        	if(content==""){
        		alert("内容不能为空！！");
        	}
        	else{
        		document.form1.submit();
        	}
        }
        function back(){
        	window.location.href("compositionchange");
        }
	</script>
  <body>
  <TABLE cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
  <TR height="28">
    <TD background="admin/images/title_bg1.jpg">当前位置: >>修改文章</TD></TR>
  <TR>
    <TD bgColor="#b1ceef" height="1"></TD></TR>
    </TABLE>
    <%
    	String com_no = (String)request.getAttribute("com_no");
    	ArrayList<compositionBean> comList = (ArrayList<compositionBean>)session.getAttribute("comchange");
   		int size = comList.size();
   		compositionBean combean;
   		for(int i=0;i<size;i++){
   			combean = comList.get(i);
   			if(combean.getC_no().equals(com_no)){
   	%>
   	<form name="form1" action="compositionchange" method="get">
	   	<table width="800" border="1">
	   		<tr><td>编号：</td><td><%=combean.getC_no() %></td></tr>
			<% session.setAttribute("com_no",combean.getC_no()); %>
	   		<tr><td>标题：</td><td><%=combean.getC_title() %></td></tr>
	  	 	<tr><td>类型：</td><td><%=combean.getC_type() %></td></tr>
	  	 	<tr><td>时间：</td><td><%=combean.getC_date() %></td></tr>
	  	 	<tr><td>内容：</td><td><textarea id="changecontent" name="changecontent"><%=combean.getC_c() %></textarea></td></tr>
   			<tr><td colspan="2"><input type="button" value="修改" onclick="check();"/>
   			<input type="button" value="返回" onclick="back();"/></td></tr>
   		</table>
   	</form>
   	<%
   				break;
   			}
   		}
   
    %>
  </body>
</html>
