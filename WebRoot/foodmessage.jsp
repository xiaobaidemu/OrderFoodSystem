<%@page import="t.o.bean.DBuser"%>
<%@page import="t.o.bean.userBean"%>
<%@page import="t.o.bean.CommentBean"%>
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
	<link rel="stylesheet" type="text/css" href="css/all.css">
	<link href="Styles/Comments.css" rel="stylesheet" type="text/css" />

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
		width:800px;
		height:50%;
		margin-top:10px;
		background-image: url(images/10.jpg);
	}
	.STYLE1 {
		font-family: "楷体";
		font-size: 15px;
		font-weight: bold;
	}
	.STYLE2 {
	font-family: "新宋体";
	font-size: 18px;
	font-style: italic;
	font-weight: bold;
	color: #7e8901;
}
	table{
		margin-top: 20px;
	}
</style>
<script type="text/javascript">
	function addcar(object){
		window.location.href = "shoppingcar?food_no=" + object.id;
	}
</script>
 	<%! int size = 0; CommentBean cmtbean;%>
	<%
    	ArrayList<foodBean> foodList = (ArrayList<foodBean>)request.getAttribute("foodmessage");
    	foodBean foodbean = foodList.get(0);
    	ArrayList<CommentBean> cmtList = (ArrayList<CommentBean>)request.getAttribute("cmtlist");
    	size = cmtList.size();
    %>
<script type="text/javascript" src="Scripts/jquery-1.4.1.min.js"></script>
<script language="javascript" type="text/javascript">
 jQuery.support.cors = true;
	    var userName = '<%=session.getAttribute("userName") %>';
	    //这个地方要改
        var startID = <%=size+1%>;//startI
        $(function (object) {
            //初始化评论列表
            initialCommentList();

            //bind click event to post button，在点击评论按钮下要判断是否已经登录
            $('#postBtn').bind('click', function () {
           		if("<%=session.getAttribute("userName") %>"=="null"){
					alert('请先登录后再评论');
					return;
				}			
            	//获取
                var _comment = $('#commentInput').val();
                var ishas = 0;
                if (_comment.length > 0) {
                	
                    
					$.ajax({  
               			type:"GET",//请求方式  
               			url:"PostComment?comment="+encodeURI(encodeURI(_comment))+"&foodno=<%=foodbean.getFood_no()%>",  //发送请求地址 
               			dataType:'json',
               			//data:{comment:encodeURI(encodeURI(_comment)),foodno:"<%=foodbean.getFood_no()%>"},
              			timeout:1500,//超时时间：15秒  
               			//请求成功后的回调函数 data为json格式  
              			success:function(data){  
              				if(data.result=="nologin")
              				{
              					alert('对不起，评论系统只为本店会员开放，请登录！！！');
              				}
              				else if(data.result =="noorderfood")
              				{
              					alert('对不起，您尚未点这道菜或者此菜还未上桌，你还无法评论此道菜');
         						ishas = 1;
              				}
              				else
              				{
              					alert('评论成功！！！');
              				}
              				
              			},   			 
             			 //请求出错的处理  
              			error: function(XMLHttpRequest, textStatus, errorThrown) {
 							alert(XMLHttpRequest.status);
   						}
					});
					if(ishas == 1)
					{
						var newCommentBlock = buildSingleComment(startID, userName, _comment, '1 min ago', '<%=session.getAttribute("userimg") %>');
					}
                    $('.Comment-Container').hide().prepend(newCommentBlock).fadeIn();
                    $('#commentInput').val('');
                    startID += 1;
                } else {
                    alert("The input comments should not be blank.");
                }
            });

        });
		//从数据库中获取评论
        function initialCommentList() {
        	var commentList = [];
        	<%
 				for(int i=0;i<size;i++){
						cmtbean = cmtList.get(i);
						String sql = "select * from t_o_User where o_userName = '"+cmtbean.getUserName()+"'";
						ArrayList<userBean> userList = new ArrayList<userBean>();
						String userimg = DBuser.getum(sql).get(0).getUser_img();
        	%>
            commentList.push({id: <%=i+1%>, user: "<%=cmtbean.getUserName()%>", comments: "<%=cmtbean.getContent()%>", postTime: "<%=cmtbean.getCmtdate().substring(0, 16)%>",userimg:"<%=userimg%>"});
			<%
				}
			%>
            var commentBuild = '';
            for (var i = 0; i < commentList.length; i++) {
                commentBuild += buildSingleComment(commentList[i].id, commentList[i].user, commentList[i].comments, commentList[i].postTime,commentList[i].userimg);
            }

            //fill the parent div automatically
            commentBuild += '<div style="clear:both"></div>';
            $('#commentContainer').html(commentBuild);
        }

        function buildSingleComment(id, user, comments, postTime,userimg) {
            var newCommentBlock = '<div class="Comment" id = "' + id + '">';
            newCommentBlock += ' <div class="Comment-img-container">';
            //修改图片
            newCommentBlock += ' <img alt="#" src="images/userimg/'+userimg+'.gif" class="Comment-img" />';
 
            newCommentBlock += '</div>';
            newCommentBlock += '<div class="Comment-Content-Container">';
            newCommentBlock += '<div class="Comment-User-Containner">';
            newCommentBlock += '<ul>';
            newCommentBlock += '<li><h3>' + user + '</h3></li>';
            newCommentBlock += '</ul>';
            newCommentBlock += '</div>';
            newCommentBlock += '<div class="Comment-Content">' + comments + '</div>';
            newCommentBlock += '</div>';
            newCommentBlock += '<div class="Comment-Post-time">' + postTime + '</div>';
            newCommentBlock += '</div>';
            return newCommentBlock;
        }

</script>
<body onload="chechload();">


<center>
<div id="loginbg">
	<div id="login" >
	</div>
</div>
	<div id="content">

    	<table height="90%" width="95%" ><tr>
	    	<td valign="top"><img src="<%=basePath %>images\foodimg\<%=foodbean.getFood_no()%>.jpg" width="250"></td>
	    	<td valign="top">
	    		<table width="100%" style="margin-top: 0">
	    			<tr><td height="40" colspan="2"><span class="STYLE2">菜色介绍</span></td></tr>
	    			<tr><td height="20" width="60">菜色名称：</td><td><span class="STYLE1"><%=foodbean.getFood_name() %></span></td></tr>
	    			<tr><td height="20">菜色编号：</td><td><%=foodbean.getFood_no() %></td></tr>
	    			<tr><td height="20">菜色主厨：</td><td><%=foodbean.getFood_cook() %></td></tr>
	    			<tr><td height="20">菜色价格：</td><td><%=foodbean.getFood_price() %>元</td></tr>
	    			<tr><td height="20">菜色类别：</td><td><%=foodbean.getFood_type() %></td></tr>
	    			<tr><td valign="top" height="20">菜色简介：</td><td valign="top"><%=foodbean.getFood_synopsis() %></td></tr>
	    			<tr><td valign="top" height="20">备注：</td><td><%=foodbean.getFood_remark()%></td></tr>
	    			<tr><td colspan="2"><input id="<%=foodbean.getFood_no() %>" type="button" value="放入购物车" onclick="addcar(this);"/></td></tr>
	    		</table>
	    	</td>
	    	</tr>    
    	</table>
	</div>

	</center>
	<script type="text/javascript">
	function chechload(){
		if("<%=session.getAttribute("userName") %>"=="null"){
			document.getElementById("commentInput").value = "请先登录后再评论";
		}
	}
	</script>
	<form id="form1" runat="server" method="get" >
    	<div class="Comment-Insert-Container">
        <h3 >您的评论：</h3>
        <textarea id="commentInput" rows="10" cols="1"></textarea>
        <div id="postBtn" class="Comment-Insert-btn" >评价</div>
   		</div>
    <div id="commentContainer" class="Comment-Container">

    </div>
    </form>
</body>
</html>

