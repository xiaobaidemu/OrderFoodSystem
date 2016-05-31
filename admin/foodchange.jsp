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
    
    <title>绿丰花园时尚餐厅后台管理系统e</title>
    
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
		function seeimg(){              
	  		if(document.getElementById("file").value!=""){                      
		  		document.getElementById("imgdisplay").src=document.getElementById("file").value;             
		  		document.getElementById("imgdisplay").style.display="block";   
		  	}
		  	else{
		  		document.getElementById("imgdisplay").style.display="none";             
		  	}                  
	  	}
	  	function back(){
	  		window.location.href("foodchange");
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
    <TD bgColor="#b1ceef" height="1"></TD></TR>
    </TABLE>
    <%
    	ArrayList<foodBean> foodList = (ArrayList<foodBean>)session.getAttribute("foodchange");
    	int size = foodList.size();
    	String food_no = request.getParameter("foodno");
    	foodBean foodbean;
    	for(int i=0;i<size;i++){
    		foodbean = foodList.get(i);
    		if(foodbean.getFood_no().equals(food_no)){
    %>
    		<form name="form1" action="foodchange" enctype= "multipart/form-data" method="post">
    			<table>
    				<tr><td><span style="color: red;">*</span>食物编号：</td><td>
    					<input type="text" name="food_no" value="<%=foodbean.getFood_no() %>" readonly="true"/><span style="color: red;">(自动生成)</span>
    				</td></tr>
    				<tr><td><span style="color: red;">*</span>食物名称：</td><td>
    					<input type="text" id="food_name" name="food_name" value="<%=foodbean.getFood_name() %>"/>
    				</td></tr>
    				<tr><td><span style="color: red;">*</span>食物图片：</td><td>
    					 <img alt="" src="<%=basePath %>/images/foodimg/<%=foodbean.getFood_no() %>.jpg"  width="200">
    					 <img id="imgdisplay" style="display:none;" width="200"/>
    					 <input type="file" id="file" name="file" onchange="seeimg();"/><br/>
    					 <span style="color: red;">（图片更新后，要刷新才能看到更新图片。不更新可以不填）</span>
    				</td></tr>
    				<tr><td><span style="color: red;">*</span>食物类型：</td><td><%=foodbean.getFood_type() %><% session.setAttribute("food_type",foodbean.getFood_type()); %>
    					<select name="food_type" id="food_type" ><option>--请选择--</option><option>中餐</option><option>西餐</option><option>糕点</option><option>招牌菜</option><option>饮品</option><option>小吃</option></select>
    					<span style="color: red;">（不更新可以不选）</span>
    				</td></tr>
    				<tr><td><span style="color: red;">*</span>主厨：</td><td>
    					<input type="text" id="food_cook" name="food_cook" value="<%=foodbean.getFood_cook() %>"/>
    				</td></tr>
    				<tr><td><span style="color: red;">*</span>食物价格：</td><td>
    					<input type="text" id="food_price" name="food_price" value="<%=foodbean.getFood_price() %>"/>
    				</td></tr>
    				<tr><td><span style="color: red;">*</span>食物简介：</td><td>
    					<textarea cols="80" rows="4" id="food_synopsis" name="food_synopsis" id="food_synopsis"><%=foodbean.getFood_synopsis() %></textarea>
    				</td></tr>
    				<tr><td>备注：</td><td>
    					<textarea cols="80" rows="4"  name="food_remark" id="food_remark"><%=foodbean.getFood_remark() %></textarea>
    				</td></tr>
    				<tr><td colspan="2">
    					<input type="button" value="修改" onclick="check();"><input type="button" value="返回" onclick="back();">
    				</td></tr>
    			</table>
    		</form>
   				
    <%
    			break;
    		}
    	}
    %>
</body>
</html>