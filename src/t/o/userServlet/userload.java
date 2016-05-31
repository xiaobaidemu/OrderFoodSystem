package t.o.userServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import t.o.bean.DBadmin;
import t.o.bean.DBuser;
import t.o.bean.adminBean;
import t.o.bean.userBean;

public class userload extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		HttpSession session = request.getSession();
		if(request.getParameter("outload")==null){
			ArrayList<userBean> userList = new ArrayList<userBean>();
			String sql = "select * from t_o_User";
			System.out.println("从t_o_User中查询");
			userList = DBuser.getum(sql);
			int size = userList.size();
			userBean userbean;
			boolean username = true;
			boolean userpwd = true;
			for(int i=0;i<size;i++){
				userbean = userList.get(i);
				username = userbean.getUser_name().equals(name);
				userpwd = userbean.getUser_pwd().equals(pass);
				if(username && userpwd){
					//登录成功则跳转到index.jsp
					session.setAttribute("userName", name);
					session.setAttribute("userimg", userbean.getUser_img());
					session.setAttribute("nackname", userbean.getUser_naickname());
					response.getWriter().write("<script language='JavaScript'>" +
							"window.location.href('index.jsp');" + 
							"</script>"
							);
					response.sendRedirect(getServletContext().getContextPath()+"/index.jsp");
					System.out.println("path:"+getServletContext().getContextPath());
					break;
				}
			}
			if(!username || !userpwd){
				response.getWriter().write("<script language='JavaScript'>" +
						"alert('用户名或密码错误！');" + 
						"window.location.href='index.jsp';" + 
						"</script>"
						);
			}
		}
		if(request.getParameter("outload")!=null){
			session.setAttribute("userName", null);
			session.setAttribute("userimg", null);
			response.getWriter().write("<script language='JavaScript'>" +
					"window.location.href('index.jsp');" + 
					"</script>"
					);
			response.sendRedirect(getServletContext().getContextPath()+"/index.jsp");
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
