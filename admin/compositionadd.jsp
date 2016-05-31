<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="t.o.bean.randomno" %>
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
<script type="text/javascript" src="..\fckeditor\fckeditor.js"></script>
<script type="text/javascript" src="..\My97DatePicker\WdatePicker.js"></script>
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
	     window.onload = function(){
       		var oFCKeditor = new FCKeditor( 'content' ) ;
        	oFCKeditor.BasePath = "<%=basePath%>/fckeditor/" ;
        	oFCKeditor.Height = 500 ; // 400 pixels 
        	oFCKeditor.Width= 650;
        	oFCKeditor.ReplaceTextarea() ;      
        }     
        function check(){
        	var o_no = document.getElementById("c_no").value;
        	var o_title = document.getElementById("c_title").value;
        	var o_type = document.getElementById("c_type").value;
        	var o_date = document.getElementById("d12").value;
        	var content =FCKeditorAPI.GetInstance("content").GetXHTML();
        	if(o_title==""){
        		alert("文章标题不能为空！！");
        	}
        	else if(o_type==""){
        		alert("文章类型未选择！！");
        	}
        	else if(o_date==""){
        		alert("日期不能为空！！");
        	}
        	else if(content==""){
        		alert("内容不能为空！！");
        	}
        	else{
        		document.form1.submit();
        	}
        }
	</script>
<body>
<TABLE cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
  <TR height="28">
    <TD background="admin/images/title_bg1.jpg">当前位置: >>添加文章</TD></TR>
  <TR>
    <TD bgColor="#b1ceef" height="1"></TD></TR>
    </TABLE>
    <form name="form1" action="compositionadd" method="get">
	<table border="1" width="800">
		<tr><td><span style="color: red;">*</span>文章编号：</td><td><input type="text" id="c_no" name="c_no" value="<%=randomno.comno() %>" readonly="true" /><span style="color: red;">(自动生成)</span></td></tr>
		<tr><td><span style="color: red;">*</span>文章标题:</td><td><input type="text" id="c_title" name="c_title" /></td></tr>
		<tr><td><span style="color: red;">*</span>文章类型</td><td><select id="c_type" name="c_type"><option>--请选择--</option><option value="news">消息</option><option value="health">饮食健康</option></select></td></tr>
		<tr><td><span style="color: red;">*</span>录入日期：</td><td><input name="c_date" id="d12" type="text" readonly="readonly"/>
		<img onclick="WdatePicker({el:$dp.$('d12')})" src="My97DatePicker/skin/datePicker.gif" width="16" height="22" align="absmiddle"></td></tr>
		<tr><td><span style="color: red;">*</span>文章内容：</td><td><textarea id="content" name="content" ></textarea></td></tr>
		<tr><td colspan="2"><input type="button" value="提交" onclick="check();" /><input type="reset" /></td></tr>
	</table>
	</form>
</body>
</html>

