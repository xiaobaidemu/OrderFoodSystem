package t.o.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

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

public class userchange extends HttpServlet {
	private int allrow = 0;//行数
	private int yerow = 10;//每页行数
	private int yeshu = 0;//页数
	private int lastyerow = 0;//最后一页的行数
	private int showpage = 1;//当前页
	private String sql = null;
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
		if(request.getParameter("ToPage")==null){
			sql = "select * from t_o_User";
			showpage = 1;
		}
		if(request.getParameter("searchtext")!=null){
			String search_type = request.getParameter("usersearch");
			String user= new String(request.getParameter("searchtext").toString().getBytes("iso-8859-1"),"utf-8");
			if(search_type.equals("user_name")){
				sql = "select * from t_o_User where o_userNaickname like '%"+user+"%'";
				showpage = 1;
			}
			if(search_type.equals("user_no")){
				sql = "select * from t_o_User where o_userName like '%"+user+"%'";
				showpage = 1;
			}
		}
		ArrayList<userBean> userList = new ArrayList<userBean>();
		userList = DBuser.getum(sql);
		session.setAttribute("userchange", userList);
		//显示总页数
		allrow = userList.size();
		lastyerow = allrow % yerow;
		if(lastyerow == 0){
			yeshu = allrow/yerow;
		}
		else{
			yeshu = (allrow-lastyerow)/yerow;
			yeshu ++;
		}

		if(request.getParameter("ToPage")==null){
			ArrayList<userBean> list = new ArrayList<userBean>();
			if(allrow<yerow){
				for(int i=0;i<allrow;i++){
					list.add(userList.get(i));
				}
			}
			else{
				for(int i=0;i<yerow;i++){
					list.add(userList.get(i));
				}
			}
			session.setAttribute("userList", list);
		}
		if(request.getParameter("ToPage")!=null){
			if(request.getParameter("ToPage").equals("")){
				ArrayList<userBean> list = new ArrayList<userBean>();
				if(allrow<yerow){
					for(int i=0;i<allrow;i++){
						list.add(userList.get(i));
					}
				}
				else{
					for(int i=0;i<yerow;i++){
						list.add(userList.get(i));
					}
				}
				session.setAttribute("userList", list);
			}
			else{
				if(Integer.parseInt(request.getParameter("ToPage"))*yerow<=allrow){
					String pagea = request.getParameter("ToPage");
					int page = Integer.parseInt(pagea);
					ArrayList<userBean> list = new ArrayList<userBean>();
					for(int i=(page-1)*yerow;i<page*yerow;i++){
						list.add(userList.get(i));
					}
					session.setAttribute("userList", list);
					showpage = page;
				}
				if(Integer.parseInt(request.getParameter("ToPage"))*yerow>=allrow){
					String pagea = request.getParameter("ToPage");
					int page = Integer.parseInt(pagea);
					ArrayList<userBean> list = new ArrayList<userBean>();
					for(int i=(page-1)*yerow;i<allrow;i++){
						list.add(userList.get(i));
					}
					session.setAttribute("userList", list);
					showpage = page;
				}
			}
		}
		
		String str = "";  
		int next, prev;  
		prev=showpage-1;  
		next=showpage+1; 
		str+="<form aciont='userchange'>";
		str += "查询到<span>"+allrow+"</span>条记录"+
		"    共<span>"+yeshu+"</span>页";  
		str +=" 第<span>"+showpage+"</span>页 ";  
		if(showpage>1) 
			str += " <A href=userchange?ToPage=1"+">首页</A> ";  
		else 
			str += " 首页 ";  
		if(showpage>1)
			str += " <A href=userchange?ToPage=" + prev + ">上一页</A> ";  
		else
			str += " 上一页 ";  
		if(showpage<yeshu)  
			str += " <A href=userchange?ToPage=" + next + ">下一页</A> ";  
		else 
			str += " 下一页 ";  
		if(yeshu>1&&showpage!=yeshu)  
			str += " <A href=foodchange?ToPage=" + yeshu + 
			">尾页</A>";  
		else
			str += " 尾页 ";  
		str+="第<input name=ToPage type=text size=2>页 <input type=submit value=GO></form>" ;
		
		session.setAttribute("str", str);
		if(request.getParameter("user_name")!=null){
			request.setAttribute("user_name",request.getParameter("user_name"));
			RequestDispatcher dispatcher = request.getRequestDispatcher("admin/userchange.jsp");
			dispatcher.forward(request, response);
		}
		else if(request.getParameter("username")!=null){
			String user_name = request.getParameter("username");
			String user_pwd = request.getParameter("userpwd");
			String sql = "update t_o_User set o_userPwd = '"+user_pwd+"' where o_userName = '"+user_name+"'";
			int result = DBuser.uploadUser(sql);
			if(result > 0){
				response.getWriter().write("<script language='JavaScript'>" +
						"alert('修改成功！');" + 
						"window.location.href='userchange?user_name="+user_name+"';" + 
						"</script>"
						);
			}else{
				response.getWriter().write("<script language='JavaScript'>" +
						"alert('修改不成功！');" + 
						"window.location.href='userchange?user_name="+user_name+"';" + 
						"</script>"
						);
			}
		}
		else if(request.getParameter("delete")!=null){
			String user_name = request.getParameter("delete");
			String sql = "delete from t_o_User where o_userName = '" + user_name + "'";
			int result = DBuser.uploadUser(sql);
			if(result > 0){
				response.getWriter().write("<script language='JavaScript'>" +
						"alert('刪除用户成功！');" + 
						"window.location.href='userchange';" + 
						"</script>"
						);
			}else{
				response.getWriter().write("<script language='JavaScript'>" +
						"alert('刪除用户不成功！');" + 
						"window.location.href='userchange';" + 
						"</script>"
						);
			}
		}
		else{
			RequestDispatcher dispatcher = request.getRequestDispatcher("admin/usersearch.jsp");
			dispatcher.forward(request, response);
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
