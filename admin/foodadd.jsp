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
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'foodadd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	</head>
	<link rel="stylesheet" type="text/css" href="admin/css/admin.css"">
	<script type="text/javascript">
			function seeimg(){              
	  		if(document.getElementById("file").value!=""){                      
		  		document.getElementById("imgdisplay").src=document.getElementById("file").value;             
		  		document.getElementById("imgdisplay").style.display="block";   
		  	}
		  	else{
		  		document.getElementById("imgdisplay").style.display="none";             
		  	}                  
	  	}
	  	function check(){
	  		var food_name = document.getElementById("food_name").value;
	  		var food_img = document.getElementById("file").value;
	  		var food_type = document.getElementById("food_type").value;
	  		var food_price = document.getElementById("food_price").value;
	  		var food_cook = document.getElementById("food_cook").value;
	  		var food_synopsis = document.form1.food_synopsis.value;

	  		if(food_name=="")
	  		alert("食物名称不能为空！！");
	  		else if(food_img=="")
	  		alert("食物图片不能为空！！");
	  		else if(food_type=="--请选择--")
	  		alert("食物类型不能为空！！");
	  		else if(food_price=="")
	  		alert("食物价格不能为空！！");
	  		else if(food_cook=="")
	  		alert("主厨不能为空！！");
	  		else if(food_synopsis==""){
	  			alert("食物简介不能为空！！");
	  		}
	  		else{
	  			document.form1.submit();
	  		}
	  	}
	</script>
<body>
	<TABLE cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
  <TR height="28">
    <TD background="admin/images/title_bg1.jpg">当前位置: >>添加食物</TD></TR>
  <TR>
    <TD bgColor="#b1ceef" height="1"></TD>
    </TR>
  </TABLE>
  <form name="form1" action="foodadd" enctype= "multipart/form-data" method="post">
	  <table border="1" width="700" align="center">
	  	<tr><td colspan="2">食物信息填写</td></tr>
		<tr><td> <span style="color: red;">*</span>食物编号：</td><td><input type="text" name="food_no" id="food_no" value="<%=randomno.foodno() %>" readonly= "true" /><span style="color: red;">(自动生成)</span></td></tr>
		<tr><td><span style="color: red;">*</span>食物名称：</td><td><input type="text" name="food_name" id="food_name" /></td></tr>
		<tr><td><span style="color: red;">*</span>食物图片：</td><td><img id="imgdisplay" style="display:none;" width="200"/><input type="file" id="file" name="file" onchange="seeimg();"/></td></tr>
		<tr><td><span style="color: red;">*</span>食物类型：</td><td><select name="food_type" id="food_type" ><option value="--请选择--">--请选择--</option><option>中餐</option><option>西餐</option><option>糕点</option><option>招牌菜</option><option>饮品</option><option>小吃</option></select></td></tr>
		<tr><td><span style="color: red;">*</span>食物价格：</td><td><input type="text" name="food_price" id="food_price" /></td></tr>
		<tr><td><span style="color: red;">*</span>主厨：</td><td><input type="text" name="food_cook" id="food_cook" /></td></tr>
		<tr><td><span style="color: red;">*</span>食物简介：</td><td><textarea cols="80" rows="4" name="food_synopsis" id="food_synopsis"></textarea></td></tr>
		<tr><td>备注：</td><td><textarea cols="80" rows="4"  name="food_remark" id="food_remark"></textarea></td></tr>
		<tr><td colspan="2"><input type="button" value="提交" onclick="check();"/><input type="reset"/></td></tr>
	  </table>
  </form>
</body>
</html>
