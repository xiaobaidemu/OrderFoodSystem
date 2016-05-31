package t.o.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import t.o.bean.DBcomposition;
import t.o.bean.compositionBean;
import t.o.bean.foodBean;

public class compositionadd extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("adminName")==null){
			response.getWriter().write("<script language='JavaScript'>" +
					"window.open('admin/admin/login.jsp',target='_top');" + 
					"</script>"
					);
			}
		
		String c_no = request.getParameter("c_no");
		String c_type;
		String c_name = new String(request.getParameter("c_title").getBytes("iso-8859-1"),"utf-8");
		if(request.getParameter("c_type").equals("news")){
			c_type = "消息";
		}
		else{
			c_type = "健康";
		}
		String c_date = request.getParameter("c_date");;
		String c_c = new String(request.getParameter("content").getBytes("iso-8859-1"),"utf-8");
		String sql = "insert into t_o_Com values(NULL,'"+c_no+"','"+c_name+"','"+c_type+"','"+c_date+"','"+c_c+"')";
		int result = DBcomposition.uploadc(sql);
		if(result>0){
			compositionBean compositionbean = new compositionBean(c_no,c_name,c_type,c_date,c_c);
			request.setAttribute("comaddshow", compositionbean);
			RequestDispatcher dispatcher = request.getRequestDispatcher("admin/comaddshow.jsp");
			dispatcher.forward(request, response);
		}
		else{
			out.print("提交失败！");
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
