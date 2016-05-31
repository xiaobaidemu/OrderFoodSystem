<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="t.o.bean.foodBean" %>
<%@page import="t.o.bean.DBfood" %>
<%@page import="t.o.bean.compositionBean" %>
<%@page import="t.o.bean.DBcomposition"%>
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
</head>
<link rel="stylesheet" type="text/css" href="css/all.css">
<link rel="stylesheet" type="text/css" href="css/my.css">
<script type="text/javascript">
	function chechload(){
		if("<%=session.getAttribute("userName") %>"!="null"){
			document.getElementById("afterload").style.display = "block";
			document.getElementById("userload").style.display = "none";
		}
		if("<%=session.getAttribute("carsize") %>"!="null"){
			document.getElementById("carsize").firstChild.nodeValue = "<%=session.getAttribute("carsize") %>";
		}
	}
	function oload(){
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
	function outload(){
		window.location.href("userload?outload=1");
		//document.getElementById("afterload").style.display = "none";
		//document.getElementById("userload").style.display = "block";
	}
	function change(){
		document.validate.src = "validate.jsp";
	}
	function show(object){
		alert(object);
	}
	///////////////////////////////
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
				document.form1.action = "userload";
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
	function addcar(object){
		//window.location.href("shoppingcar?food_no=" + object.id);
		window.location.href = "shoppingcar?food_no=" + object.id;
	}
	function lookcar(){
		window.location.href = "shopingcar.jsp"
	}
	function lookorder(){
		window.open("ordershow");
	}
	function changemessage(){
		window.open("changemessage");
	}
	function goo(){
		var str = document.getElementById("go").value;
		window.location.href("foodlist?foodtype=nosh&ToPage="+str);
	}
	function searchfood(){
		var foodsearch = document.form2.foodsearch.value;
		if(foodsearch==""){
			alert("搜索信息不能为空！！！");
		}
		else{
			document.form2.submit();
		}
	}
</script>
<body onload="chechload();">
<center>
<div id="loginbg">
	<div id="login" align="left">
		<div id="menu">
			<ul>
				<li><a href="index.jsp">首页</a></li>
				<li><a href="foodlist?foodtype=my">招牌</a></li>
				<li><a href="foodlist?foodtype=china">中餐</a></li>
				<li><a href="foodlist?foodtype=abroad">西餐</a></li>
				<li><a href="foodlist?foodtype=cake">糕点</a></li>
				<li><a href="foodlist?foodtype=nosh">小吃</a></li>
				<li><a href="foodlist?foodtype=drink">饮品</a></li>
			</ul>
		</div>
	</div>
</div>
<div id="content">
	<div id="left" >
		<div id="userload" align="center" style="font-size: 13px;">
		<form name="form1" action="" method="post">
			<table width="95%">
				<tr><td colspan="2"><font size="2"><span class="STYLE1">用户登录</span></font></td>
				</tr>
				<tr height="15"><td width="40" align="right"><font size="2">用户名</font></td><td align="left"><font size="2"><INPUT style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" maxLength="30" size="13" id="name" name="name"></font>&nbsp;&nbsp;&nbsp;<a href="newuser.jsp" target="_blank">马上注册</a></td></tr>
				<tr height="15"><td align="right"><font size="2">密&nbsp;&nbsp;码</font></td><td align="left"><font size="2"><INPUT style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" type="password" maxLength="30" size="13" id="pass" name="pass"></font>&nbsp;&nbsp;&nbsp;<a href="getbackpwd.jsp" target="_blank">忘记密码</a></td></tr>
				<tr height="15"><td align="right"><font size="2">验证码</font></td><td align="left"><font size="2"><INPUT style="BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-BOTTOM: #000000 1px solid" maxLength="30" size="4" id="validate" name="validate"><img src="admin/validate.jsp" name="validate"/><a href="javascript:change();">	看不清楚？</a></font></td></tr>
				<tr><td colspan="2" align="center"><font size="2"><input type="button" width="15" value="登录" onclick="oload();"></font></td></tr>
			</table>
			</form>
	  </div>
		<div id="afterload" align="center" >
			<table width="95%" >
				<tr><td colspan="2" ><span class="STYLE1">登录成功</span></td></tr>
				<tr height="50"><td width="28%"><img src="<%=basePath %>/images/userimg/<%=session.getAttribute("userimg") %>.gif" width="50" height="50"/></td><td align="center">欢迎进入点餐系统！<br>尊敬的<label id="carsie" style="color:highlight; font-size: 14px;"><%=session.getAttribute("nackname") %></label>用户，您好！</td></tr>
				<tr><td colspan="2" align="center"><input type="button" value="查看购物车" onclick="lookcar();">购物车中有<label id="carsize" style="color: red;font-size: 18px;">0</label>件</td></tr>
				<tr><td colspan="2" align="center"><input type="button" value="查看订单" onclick="lookorder();" /><input type="button" value="修改资料" onclick="changemessage();" />
				<input type="button" value="注销" onclick="outload();" /></td></tr>
			</table>
		</div>
		<div id="hotfood">
			<table width="95%">
				<tr><td><span class="STYLE1">最新推出</span></td><td align="right"><a href="allfood" target="_blank">more</a></td></tr>
				<%! int size = 0;String sql = null;foodBean foodbean;compositionBean combean; %>
				<%
					sql = "select * from t_o_Food order by o_foodId desc limit 5";
					ArrayList<foodBean> hotfoodList = new ArrayList<foodBean>();
					hotfoodList = DBfood.getfm(sql);
					size = hotfoodList.size();
					for(int i=0;i<size;i++){
						foodbean = hotfoodList.get(i);
				%>
					<tr height="96">
					<td width="100"><a href="foodmessage?no=<%=foodbean.getFood_no() %>" target="_blank"><img src="images/foodimg/<%=foodbean.getFood_no() %>.jpg" width="100" height="80"/></a></td>
					<td><a href="foodmessage?no=<%=foodbean.getFood_no() %>" target="_blank"><%=foodbean.getFood_name() %></a><br/>价格：<%=foodbean.getFood_price() %>元<br/>
						<input type="button" id="<%=foodbean.getFood_no() %>" value="加入购物车" onclick="addcar(this);">
					</td>
					</tr>
				<%
					}
				%>
			</table>
		</div>
	</div>
	<div id="center" align="left">
		<div id="health" align="center">
			<table width="95%" width="95%">
				<tr><td width="30%"><img src="images/tishi.jpg" height="140" /></td><td>
					<table width="100%" height="100%"><tr>
						<%
					sql = "select * from t_o_Com where o_cType = '健康'";
					ArrayList<compositionBean> comList = new ArrayList<compositionBean>();
					comList = DBcomposition.getcm(sql);
					size = comList.size();
					int row = 0;
					if(size<=10){
						for(int i=size-1;i>=0;i--){
						row++;
							combean = comList.get(i);
				%>
							<td>·</td><td><a href="composition?news=<%=combean.getC_no() %>" target="_blank"><%=combean.getC_title() %></a></td>
				<%if(row%2==0){out.print("</tr><tr>");}}}
				else{
					for(int i=size-1;i>=size-10;i--){
					row++;
							combean = comList.get(i);
				%>
							<td>·</td><td><a href="composition?news=<%=combean.getC_no() %>" target="_blank"><%=combean.getC_title() %></a></td>
				<%if(row%2==0){out.print("</tr><tr>");}}
				} %>
					</tr></table>
			</td></tr>
			</table>
		</div>
		<div id="showfood" align="center">
			<table width="95%" height="453" >
				<tr><td align="left" height="33"><span class="STYLE1">饮品</span><br></td>
				<td align="right">
				<form action="allfood" target="_self" name="form2">菜色搜索：<input type="text" name="foodsearch"/>
				<input type="button" value="搜索" onclick="searchfood();"/></form></td></tr>
				<tr><td valign="top" colspan="2"><table style="margin-top: 0px;" align="center"><tr>
				<%!int sizea = 0; %>
				<% 
						response.setCharacterEncoding("utf-8");
				    	ArrayList<foodBean> foodList = (ArrayList<foodBean>)session.getAttribute("foodList");
				    	sizea = foodList.size();
				    	foodBean foodbean;
				    	for(int i=0;i<sizea;i++){
				    		foodbean = foodList.get(i);
				 %>
				 <td height="80" width="100"><a href="foodmessage?no=<%=foodbean.getFood_no() %>" target="_self"><img src="images/foodimg/<%=foodbean.getFood_no() %>.jpg" width="90" height="68"/></a></td>
					<td width="140"><a href="foodmessage?no=<%=foodbean.getFood_no() %>" target="_self"><%=foodbean.getFood_name() %></a><br/>价格：<%=foodbean.getFood_price() %>元<br/>
						<input type="button" id="<%=foodbean.getFood_no() %>" value="加入购物车" onclick="addcar(this);">
					</td>
				 	<%if(i%3==2){out.print("</tr><tr>");}
				 } 
				 %>
				</tr></table></td></tr>
			</table>
			<table style="margin-top: 0px;" width="95%" ><tr><td align="center"><%=session.getAttribute("str") %></td></tr></table>
		
		</div>
	</div>
</div>
<div id="dowmbg">
	<div id="dowm">
		
	</div>
</div>
</center>
</body>
</html>
