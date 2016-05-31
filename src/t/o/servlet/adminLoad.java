package t.o.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import t.o.bean.DBadmin;
import t.o.bean.adminBean;

public class adminLoad extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		HttpSession session = request.getSession();
		ArrayList<adminBean> adminList = new ArrayList<adminBean>();
		String sql = "select * from t_o_Admin";
		adminList = DBadmin.getrs(sql);
		int size = adminList.size();
		adminBean adminbean;
		boolean adminname = true;
		boolean adminpwd = true;
		for(int i=0;i<size;i++){
			adminbean = adminList.get(i);
			if(adminbean.getName().equals(name) && adminbean.getPwd().equals(pass)){
				System.out.println("name:" + name);
				session.setAttribute("adminName", name);
				System.out.println("-------------");
				response.getWriter().write("<script language='JavaScript'>" +
						"window.location.href='admin/index.jsp';" + 
						"</script>"
						);
				break;
			}
			else{
				System.out.println("wrongname:" + adminbean.getName());
				System.out.println("wrongpwd:" + adminbean.getPwd());
				adminpwd = false;	
			}
		}
		if(!adminname || !adminpwd){
			response.getWriter().write("<script language='JavaScript'>" +
					"alert('用户名或密码错误！');" + 
					"window.location.href='admin/login.jsp';" + 
					"</script>"
					);
		}
		
	}

}
