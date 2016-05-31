<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page  import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*" %>
<%@ page import="java.io.OutputStream" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'validate.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body>
    <%!
		Color getRandColor(int fc,int bc){
			Random random = new Random();
			if(fc>255) fc=255;
			if(bc>255) bc=255;
			int r=fc+random.nextInt(bc-fc);
			int g=fc+random.nextInt(bc-fc);
			int b=fc+random.nextInt(bc-fc);
			return new Color(r,g,b);
		}
	%>
	<%
		try{
			response.setHeader("Pragma","No-cache");
			response.setHeader("Cache-Control","no-cache");
			response.setDateHeader("Expires", 0);
			int width=60, height=20;
			BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
			OutputStream os=response.getOutputStream();
			Graphics g = image.getGraphics();
			Random random = new Random();
			//以下填充背景颜色
			g.setColor(getRandColor(160,200));
			g.fillRect(0, 0, width, height);
			g.setFont(new Font("Times New Roman",Font.PLAIN,18));
			//设置字体颜色
			g.setColor(getRandColor(200,250));
			for (int i=0;i<155;i++)
			{
				int x = random.nextInt(width);
				int y = random.nextInt(height);
				int xl = random.nextInt(12);
				int yl = random.nextInt(12);
				g.drawLine(x,y,x+xl,y+yl);
			}
			String sRand="";
			for (int i=0;i<4;i++){
				String rand=String.valueOf(random.nextInt(10));
				sRand+=rand;
				g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));
				g.drawString(rand,13*i+6,16);
			}
			g.dispose();
			ImageIO.write(image,"JPEG",os);
			os.flush();
			os.close();
			os=null;
			session.setAttribute("validate",sRand);
			System.out.print(sRand+"\n");
			out.clear();
			out = pageContext.pushBody();
			response.flushBuffer();
		}catch(IllegalStateException e){
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
	%>
  </body>
</html>
