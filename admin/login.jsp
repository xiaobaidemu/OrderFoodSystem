<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% session.setAttribute("adminName",null); %>
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
<LINK href="admin/css/admin.css" type="text/css" rel="stylesheet">
</head>
<script type="text/javascript">
	function change(){
		document.validate.src = "admin/validate.jsp";
	}
	function check(){
		var name = document.getElementById("name").value;
		var pass = document.getElementById("pass").value;
		var validate = document.getElementById("validate").value;
		if(name==""||pass==""){
			alert("用户名，密码不能为空！！！");
		}
		else if(validate==""){
			alert("验证码不能为空！！！");
		}
		else{
			showHint();
		}
	}
	
	var xmlHttp;

	function showHint() {
		var str = document.getElementById("validate").value;
		if (str.length == 0) {
			//innerHTML  id内的HTML代码
			document.getElementById("txtHint").innerHTML = "";
			return false;
		}

		xmlHttp = GetXmlHttpObject();

		if (xmlHttp == null) {
			alert("您的浏览器不支持AJAX！");
			return false;
		}

		var url = "adminvalidate?q=" + str;
		//发送一个请求后，客户端无法确定什么时候会完成这个请求，所以需要用事件机制来捕获请求的状态，XMLHttpRequest对象提供了onreadyStateChange事件实现这一功能。这类似于回调函数的做法。
		//onreadyStateChange事件可指定一个事件处理函数来处理XMLHttpRequest对象的执行结果，
		xmlHttp.onreadystatechange = stateChanged;
		xmlHttp.open("GET", url, true);
		xmlHttp.send(null);
	}

	function stateChanged() {
		if (xmlHttp.readyState == 4) {
			if(xmlHttp.responseText=="错误"){
				alert("验证码错误");
				document.validate.src = "admin/validate.jsp";
				document.getElementById("pass").value = "";
				document.getElementById("validate").value = "";
			}
			if(xmlHttp.responseText=="正确"){
				document.form1.action = "adminLoad";
				document.form1.submit();
			}
			//document.getElementById("txtHint").innerHTML = xmlHttp.responseText;
		}
	}

	function GetXmlHttpObject() {
		var xmlHttp = null;
		try {
			// Firefox, Opera 8.0+, Safari
			xmlHttp = new XMLHttpRequest();
		} catch (e) {
			// Internet Explorer
			try {
				xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
		return xmlHttp;
	}
</script>
<BODY>
<TABLE height="100%" cellSpacing="0" cellPadding="0" width="100%" bgColor="#002779" border="0">
  <TR>
    <TD align="middle">
      <TABLE cellSpacing="0" cellPadding="0" width="468" border="0">
        <TR>
          <TD><IMG height="23" src="admin/images/login_1.jpg" width="468"></TD></TR>
        <TR>
          <TD><IMG height="147" src="admin/images/login_2.jpg" width="468"></TD>
   	</TR></TABLE>
      <TABLE cellSpacing="0" cellPadding="0" width="468" bgColor="#ffffff" border="0">
        <TR>
          <TD width="16"><IMG height="125" src="admin/images/login_3.jpg" width="16"></TD>
          <TD align="middle">
          <FORM name="form1" action="" method="post">
            <TABLE cellSpacing="0" cellPadding="0" width="230">
              <TR height="25">
                <TD>用户名</TD>
                <TD><INPUT style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" maxLength="30" size="24" id="name" name="name"></TD></TR>
              <TR height="25">
                <TD>密        码</TD>
                <TD><INPUT style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" type="password" maxLength="30" size="24" id="pass" name="pass"></TD></TR>
                 <TR height="25">
                <TD>验证码</TD>
                <TD><INPUT style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" maxLength="30" size="8" id="validate" name="validate">
                <img src="admin/validate.jsp" name="validate"/><a href="javascript:change();">看不清楚？</a>
                </TD></TR>
              <TR height="25">
                <TD colspan="2" align="center"><INPUT type="button" value="登&nbsp;&nbsp;&nbsp;&nbsp;录" onclick="check();">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重&nbsp;&nbsp;&nbsp;&nbsp;置"/></TD></TR>
              </TABLE>
             </FORM>
            </TD>
          <TD width="16"><IMG height="125" src="admin/images/login_4.jpg" width="16"></TD>
     </TR></TABLE>
      <TABLE cellSpacing="0" cellPadding="0" width="468" border="0">
        <TR>
          <TD><IMG height="16" src="admin/images/login_5.jpg" width="468"></TD>
        </TR>
      </TABLE>
   </TD></TR></TABLE>
   </BODY>
    </HTML>