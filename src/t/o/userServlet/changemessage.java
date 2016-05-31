package t.o.userServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.jms.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import t.o.bean.DBfood;
import t.o.bean.DBuser;
import t.o.bean.foodBean;
import t.o.bean.userBean;

public class changemessage extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String sql = null;
		String userName = (String)request.getSession().getAttribute("userName");
		sql = "select * from t_o_User where o_userName = '"+userName+"'";
		ArrayList<userBean> userList = new ArrayList<userBean>();
		userList = DBuser.getum(sql);

		request.getSession().setAttribute("usermessage", userList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("changemessage.jsp");
		dispatcher.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		if(request.getParameter("oldpwd")!=null){
			String oldpwd = request.getParameter("oldpwd");
			String newpwd = request.getParameter("newpwd");
			String username = (String)session.getAttribute("userName");
			
			String sql = "select * from t_o_User where o_userName = '"+username+"'";
			ArrayList<userBean> userlist = DBuser.getum(sql);
			userBean userbean = userlist.get(0);
			if(userbean.getUser_pwd().equals(oldpwd)){
				sql = "update t_o_User set o_userPwd = '"+newpwd+"' where o_userName = '"+username+"'";
				int result = DBuser.uploadUser(sql);
				if(result>0){
					response.getWriter().write("<script language='JavaScript'>" +
							"alert('修改成功！！！ ');" + 
							"window.location.href('pwdchange.jsp');" + 
							"</script>"
							);
				}
				else{
					response.getWriter().write("<script language='JavaScript'>" +
							"alert('修改失败！');" + 
							"history.back();" + 
							"</script>"
							);
				}
			}
			else{
				response.getWriter().write("<script language='JavaScript'>" +
						"alert('原密码错误！');" + 
						"history.back();" + 
						"</script>"
						);
			}
			
		}
		else if(request.getParameter("userid")!=null){
			String username = request.getParameter("username");
			String newpwd = request.getParameter("newpwd");
			String userid = request.getParameter("userid");
			System.out.println(userid);
			System.out.println(username);
			System.out.println(newpwd);
			String sql = "select * from t_o_User where o_userName = '"+username+"'";
			ArrayList<userBean> userlist = DBuser.getum(sql);
			System.out.println(userlist.size());
			userBean userbean = null;
			if(userlist.size()!=0){
				userbean = userlist.get(0);
				if(userbean.getUser_idcard().equals(userid)){
					sql = "update t_o_User set o_userPwd = '"+newpwd+"' where o_userName = '"+username+"'";
					int result = DBuser.uploadUser(sql);
					if(result>0){
						response.getWriter().write("<script language='JavaScript'>" +
								"alert(' 密码找回成功！！！ ');" + 
								"window.location.href('getbackpwd.jsp');" + 
								"</script>"
								);
					}
					else{
						response.getWriter().write("<script language='JavaScript'>" +
								"alert('密码找回失败，请输入正确身份证或账号');" + 
								"history.back();" + 
								"</script>"
								);
					}
				}
				else{
					response.getWriter().write("<script language='JavaScript'>" +
							"alert('密码找回失败，请输入正确身份证');" + 
							"history.back();" + 
							"</script>"
							);
				}
			}else{
				response.getWriter().write("<script language='JavaScript'>" +
						"alert('密码找回失败，请输入正确的账号！！！');" + 
						"history.back();" + 
						"</script>"
						);
			}
		}
		else{
			ArrayList<userBean> userList = (ArrayList<userBean>)session.getAttribute("usermessage");
			userBean userbean = userList.get(0);
			String head=null;
			String sex = null;
			String userName = (String)request.getSession().getAttribute("userName");
			String nackname = request.getParameter("nackname");
			request.getSession().setAttribute("nackname", nackname);
			if(request.getParameter("sex")!=null){
				sex = request.getParameter("sex");
			}else{
				sex = userbean.getUser_sex();
			}
			
			String breathdaty = request.getParameter("breathdaty");
			String usermail = request.getParameter("usermail");
			String userphoto = request.getParameter("userphoto");
			
			if(request.getParameter("head").equals("1")){
				head=(String)request.getSession().getAttribute("userimg");
			}else{
				head= request.getParameter("head");
				request.getSession().setAttribute("userimg", head);
			}
			
			String sql = "update t_o_User set o_userNaickname = '"+nackname+"',o_userBirthday='"+breathdaty+"'," +
					"o_userSex='"+sex+"',o_userPhone='"+userphoto+"',o_userEmail='"+usermail+"',o_userImg='"+head+"' where o_userName='"+userName+"'";
			int result = DBuser.uploadUser(sql);
			if(result>0){
				request.getSession().setAttribute("userimg", head);
				response.getWriter().write("<script language='JavaScript'>" +
						"alert('修改成功！！！ ');" + 
						"window.location.href('changemessage');" + 
						"</script>"
						);
			}
			else{
				response.getWriter().write("<script language='JavaScript'>" +
						"alert('修改失败！');" + 
						"history.back();" + 
						"</script>"
						);
			}
		}
	}
}
