package t.o.userServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import t.o.bean.DBfood;
import t.o.bean.DBuser;
import t.o.bean.foodBean;

public class newuser extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String username = request.getParameter("username");
		String userpwd = request.getParameter("userpwd");
		String head= request.getParameter("head");
		String nackname = new String(request.getParameter("nackname").getBytes("iso-8859-1"),"utf-8");
		String sex = new String(request.getParameter("sex").getBytes("iso-8859-1"),"utf-8");
		String breathdaty = request.getParameter("breathdaty");
		String truename = new String(request.getParameter("truename").getBytes("iso-8859-1"),"utf-8");
		String userid = request.getParameter("userid");
		String usermail = request.getParameter("usermail");
		String userphoto = request.getParameter("userphoto");
		String sql = "insert into t_o_User values(NULL,'"+username+"','"+userpwd+"'," +
				"'"+nackname+"','"+breathdaty+"','"+sex+"','"+truename+"','"+userid+"'" +
				",'"+userphoto+"','"+usermail+"','"+head+"')";
		int result = DBuser.uploadUser(sql);
		if(result>0){
			response.getWriter().write("<script language='JavaScript'>" +
					"alert('ÉêÇë³É¹¦£¡Çëµ½Ê×Ò³µÇÂ¼£¡£¡£¡ ');" + 
					"window.close();" + 
					"</script>"
					);
		}
		else{
			response.getWriter().write("<script language='JavaScript'>" +
					"alert('ÉêÇëÊ§°Ü£¡');" + 
					"history.back();" + 
					"</script>"
					);
		}
//		out.print(username+"<br>");
//		out.print(userpwd+"<br>");
//		out.print(head+"<br>");
//		out.print(nackname+"<br>");
//		out.print(sex+"<br>");
//		out.print(breathdaty+"<br>");
//		out.print(truename+"<br>");
//		out.print(userid+"<br>");
//		out.print(usermail+"<br>");
//		out.print(userphoto+"<br>");
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
