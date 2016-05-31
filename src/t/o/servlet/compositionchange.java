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

import t.o.bean.DBcomposition;
import t.o.bean.DBorder;
import t.o.bean.DBuser;
import t.o.bean.compositionBean;
import t.o.bean.orderBean;

public class compositionchange extends HttpServlet {
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
			sql = "select * from t_o_Com";
			showpage = 1;
		}
		if(request.getParameter("searchtext")!=null){
			String search_type = request.getParameter("search_type");
			String com= new String(request.getParameter("searchtext").toString().getBytes("iso-8859-1"),"utf-8");
			if(search_type.equals("com_no")){
				sql = "select * from t_o_Com where o_cNo like '%"+com+"%'";
				showpage = 1;
			}
			if(search_type.equals("com_title")){
				sql = "select * from t_o_Com where o_cTitle like '%"+com+"%'";
				showpage = 1;
			}
		}
		ArrayList<compositionBean> compositionList = new ArrayList<compositionBean>();
		compositionList = DBcomposition.getcm(sql);
		session.setAttribute("comchange", compositionList);
		//显示总页数
		allrow = compositionList.size();
		lastyerow = allrow % yerow;
		if(lastyerow == 0){
			yeshu = allrow/yerow;
		}
		else{
			yeshu = (allrow-lastyerow)/yerow;
			yeshu ++;
		}

		if(request.getParameter("ToPage")==null){
			ArrayList<compositionBean> list = new ArrayList<compositionBean>();
			if(allrow<yerow){
				for(int i=0;i<allrow;i++){
					list.add(compositionList.get(i));
				}
			}
			else{
				for(int i=0;i<yerow;i++){
					list.add(compositionList.get(i));
				}
			}
			session.setAttribute("compositionList", list);
		}
		if(request.getParameter("ToPage")!=null){
			if(request.getParameter("ToPage").equals("")){
				ArrayList<compositionBean> list = new ArrayList<compositionBean>();
				if(allrow<yerow){
					for(int i=0;i<allrow;i++){
						list.add(compositionList.get(i));
					}
				}
				else{
					for(int i=0;i<yerow;i++){
						list.add(compositionList.get(i));
					}
				}
				session.setAttribute("compositionList", list);
			}
			else{
				if(Integer.parseInt(request.getParameter("ToPage"))*yerow<=allrow){
					String pagea = request.getParameter("ToPage");
					int page = Integer.parseInt(pagea);
					ArrayList<compositionBean> list = new ArrayList<compositionBean>();
					for(int i=(page-1)*yerow;i<page*yerow;i++){
						list.add(compositionList.get(i));
					}
					session.setAttribute("compositionList", list);
					showpage = page;
				}
				if(Integer.parseInt(request.getParameter("ToPage"))*yerow>=allrow){
					String pagea = request.getParameter("ToPage");
					int page = Integer.parseInt(pagea);
					ArrayList<compositionBean> list = new ArrayList<compositionBean>();
					for(int i=(page-1)*yerow;i<allrow;i++){
						list.add(compositionList.get(i));
					}
					session.setAttribute("compositionList", list);
					showpage = page;
				}
			}
		}
		
		String str = "";  
		int next, prev;  
		prev=showpage-1;  
		next=showpage+1; 
		str+="<form aciont='compositionchange'>";
		str += "查询到<span>"+allrow+"</span>条记录"+
		"    共<span>"+yeshu+"</span>页";  
		str +=" 第<span>"+showpage+"</span>页 ";  
		if(showpage>1) 
			str += " <A href=compositionchange?ToPage=1"+">首页</A> ";  
		else 
			str += " 首页 ";  
		if(showpage>1)
			str += " <A href=compositionchange?ToPage=" + prev + ">上一页</A> ";  
		else
			str += " 上一页 ";  
		if(showpage<yeshu)  
			str += " <A href=compositionchange?ToPage=" + next + ">下一页</A> ";  
		else 
			str += " 下一页 ";  
		if(yeshu>1&&showpage!=yeshu)  
			str += " <A href=compositionchange?ToPage=" + yeshu + 
			">尾页</A>";  
		else
			str += " 尾页 ";  
		str+="第<input name=ToPage type=text size=2>页 <input type=submit value=GO></form>" ;
		
		session.setAttribute("str", str);
		if(request.getParameter("com_no")!=null){
			request.setAttribute("com_no",request.getParameter("com_no"));
			RequestDispatcher dispatcher = request.getRequestDispatcher("admin/compositionchange.jsp");
			dispatcher.forward(request, response);
		}
		else if(request.getParameter("changecontent")!=null){
			String com_no = (String)session.getAttribute("com_no");
			String com_c = new String(request.getParameter("changecontent").getBytes("iso-8859-1"),"utf-8");
			String sql = "update t_o_Com set o_cContent = '"+com_c+"' where o_cNo = '"+com_no+"'";
			int result = DBcomposition.uploadc(sql);
			if(result > 0){
				response.getWriter().write("<script language='JavaScript'>" +
						"alert('修改成功！');" + 
						"window.location.href('compositionchange?com_no="+com_no+"');" + 
						"</script>"
						);
			}else{
				response.getWriter().write("<script language='JavaScript'>" +
						"alert('修改不成功！');" + 
						"window.location.href('compositionchange?com_no="+com_no+"');" + 
						"</script>"
						);
			}
		}
		else if(request.getParameter("delete")!=null){
			String com_no = request.getParameter("delete");
			String sql = "delete from t_o_Com where o_cNo = '" + com_no + "'";
			int result = DBcomposition.uploadc(sql);
			if(result > 0){
				response.getWriter().write("<script language='JavaScript'>" +
						"alert('刪除成功！');" + 
						"window.location.href='compositionchange';" + 
						"</script>"
						);
			}else{
				response.getWriter().write("<script language='JavaScript'>" +
						"alert('刪除不成功！');" + 
						"window.location.href='compositionchange';" + 
						"</script>"
						);
			}
		}
		else{
			RequestDispatcher dispatcher = request.getRequestDispatcher("admin/compositionsearch.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
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
