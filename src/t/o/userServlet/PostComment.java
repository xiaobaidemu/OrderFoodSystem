package t.o.userServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import t.o.bean.DBcomment;
import t.o.bean.DBorder;
import t.o.bean.foodBean;

public class PostComment extends HttpServlet {
	private static final long serialVersionUID = 1L;  
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		String comment = req.getParameter("comment");
		comment = URLDecoder.decode(comment, "UTF-8");
		String foodno = req.getParameter("foodno");
		foodno = URLDecoder.decode(foodno, "UTF-8");
		HttpSession session = req.getSession();
		if(session.getAttribute("userName")==null)
		{
			System.out.println("没有登录");
			resp.setCharacterEncoding("utf-8");
		    PrintWriter out = resp.getWriter();
			out.write("{\"result\":\"nologin\"}");
			out.flush();
			out.close();
		}
		else 
		{
			String username = (String) session.getAttribute("userName");
			//如果已经登录了
			//需要查看订单中是否已点这道菜，且状态是已完成
			String sqlcheck = "select o_orderFood from t_o_Order where o_orderUser ='"+username+"' and o_orderState ='完成'";
			ArrayList<String> orderList = new ArrayList<String>();
			orderList = DBorder.getorders(sqlcheck);
			boolean ishas = false;
			for(String order:orderList)
			{
				
				String[] info = order.split(";");
				for(int i = 0;i < info.length;)
				{
					if(info[i].equals(foodno))
					{
						ishas = true;
						break;
					}
					i+=3;
				}
				if(ishas == true)
					break;
			}
			if(ishas)
			{
				//已点了此道菜且订单状态已经完成
				String sql = "insert into t_o_Comment values(NULL,'"+foodno+"','"+username+"'," +
						"'"+comment+"',NOW())";
				int result = DBcomment.uploadCom(sql);
				if(result > 0)
				{
					resp.setCharacterEncoding("utf-8");
				    PrintWriter out = resp.getWriter();
					out.write("{\"result\":\"success\"}");
					out.flush();
					out.close();
				}
			}
			else {
				resp.setCharacterEncoding("utf-8");
			    PrintWriter out = resp.getWriter();
				out.write("{\"result\":\"noorderfood\"}");
				out.flush();
				out.close();
			}
			
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		String comment = req.getParameter("comment");
		comment = URLDecoder.decode(comment, "UTF-8");
		String foodno = req.getParameter("foodno");
		foodno = URLDecoder.decode(foodno, "UTF-8");
		HttpSession session = req.getSession();
		if(session.getAttribute("userName")==null)
		{
			System.out.print("没有登录");
			resp.getWriter().write("<script language='JavaScript'>" +
					"alert('对不起，评论系统只为本店会员开放，请登录！！！');" + 
					"history.back();" + 
					"</script>"
					);
		}
		else 
		{
			String username = (String) session.getAttribute("userName");
			//如果已经登录了
			String sql = "insert into t_o_Comment values(NULL,'"+foodno+"','"+username+"'," +
					"'"+comment+"',NOW())";
			int result = DBcomment.uploadCom(sql);
			if(result > 0)
			{
				resp.setCharacterEncoding("utf-8"); 
				PrintWriter out = resp.getWriter();
				out.write("{\"result\":\"success\"}");
				out.flush();
				out.close();
				
			}
		}
	}
	
}
