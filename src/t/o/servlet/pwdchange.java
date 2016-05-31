package t.o.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import t.o.bean.DBpwd;

public class pwdchange extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		if(session.getAttribute("adminName")==null){
			response.getWriter().write("<script language='JavaScript'>" +
					"window.open('admin/login.jsp',target='_top');" + 
					"</script>"
					);
			}
		String old = request.getParameter("old");
		String news = request.getParameter("news");
		String sqla = "select o_adminPwd from t_o_Admin where o_adminName = '"+session.getAttribute("adminName")+"'";
		String oldpwd = DBpwd.getoldpwd(sqla);
		if(oldpwd.equals(old)){
			String sql = "update t_o_Admin set o_adminPwd = '"+news+"' where o_adminName = '"+session.getAttribute("adminName")+"'";
			int result = DBpwd.uploadPwd(sql);
			if(result==1){
				out.print("≥…π¶");
			}
			else{
				out.print(" ß∞‹");
			}
		}else{
			out.print("æ…√‹¬Î¥ÌŒÛ");
		}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

}
