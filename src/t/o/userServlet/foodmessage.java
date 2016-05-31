package t.o.userServlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import t.o.bean.CommentBean;
import t.o.bean.DBcomment;
import t.o.bean.DBfood;
import t.o.bean.foodBean;

public class foodmessage extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String sql = null;
		String food_no = new String(request.getParameter("no").getBytes("iso-8859-1"),"utf-8");
		sql = "select * from t_o_Food where o_foodNo = '"+food_no+"'";
		ArrayList<foodBean> foodList = new ArrayList<foodBean>();
		foodList = DBfood.getfm(sql);
		request.setAttribute("foodmessage", foodList);
		//获取此food的全部评论,之后按时间降序排列
		sql = "select * from t_o_Comment where o_foodNo = '"+food_no+"' order by o_cmttime desc";
		ArrayList<CommentBean> cmtlist = new ArrayList<CommentBean>();
		cmtlist = DBcomment.getcomment(sql);
		request.setAttribute("cmtlist",cmtlist);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("foodmessage.jsp");
		dispatcher.forward(request, response);
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
