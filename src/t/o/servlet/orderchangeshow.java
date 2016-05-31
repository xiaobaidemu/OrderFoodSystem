package t.o.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import t.o.bean.DBfood;
import t.o.bean.DBorder;
import t.o.bean.orderlisBean;

public class orderchangeshow extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		ArrayList<orderlisBean> olist = (ArrayList<orderlisBean>)session.getAttribute("olist");
		int size = olist.size();

		float allprice = Float.valueOf((String) session.getAttribute("allprice"));
		orderlisBean obean = null;
		String orderno = (String) session.getAttribute("orderno");

		if(request.getParameter("foodnum")!=null){
			String foodno = request.getParameter("foodno");
			int foodnum = Integer.parseInt(request.getParameter("foodnum"));
			for(int i=0;i<size ;i++){
				obean = olist.get(i);
				if(obean.getFoodno().equals(foodno)){
					if(foodnum<1){
						float newallprice = allprice - obean.getFoodprice();
						String vv = String.valueOf(newallprice);
						session.setAttribute("allprice", vv);
						olist.remove(i);
						session.setAttribute("olist", olist);
						response.getWriter().write("<script language='JavaScript'>" +
								"alert('修改成功！');" + 
								"window.location.href='admin/orderchange.jsp';" + 
								"</script>"
								);
						break;
					}
					else{
						float newprice = obean.getFoodprice()/Float.valueOf(obean.getFoodtime())*Float.valueOf(foodnum);
						float newallprice = allprice + newprice - obean.getFoodprice();
						obean.setFoodprice(newprice);
						String all = String.valueOf(newallprice);
						session.setAttribute("allprice", all);
						obean.setFoodtime(foodnum);
						session.setAttribute("olist", olist);
						response.getWriter().write("<script language='JavaScript'>" +
								"alert('修改成功！');" + 
								"window.location.href='admin/orderchange.jsp';" + 
								"</script>"
								);
					}
				}
			}
		}
		else if(request.getParameter("food")!=null){
			String foodno = request.getParameter("food");
			for(int i=0;i<size ;i++){
				obean = olist.get(i);
				if(obean.getFoodno().equals(foodno)){
					float newallprice = allprice - obean.getFoodprice();
					String vv = String.valueOf(newallprice);
					session.setAttribute("allprice", vv);
					olist.remove(i);
					session.setAttribute("olist", olist);
					response.getWriter().write("<script language='JavaScript'>" +
							"alert('删除成功！');" + 
							"window.location.href='admin/orderchange.jsp';" + 
							"</script>"
							);
					break;			
				}
			}
		}
		else{
			String orderfood = "";
			for(int i=0;i<size ;i++){
				obean = olist.get(i);
				orderfood = orderfood+obean.getFoodno()+";"+obean.getFoodname()+";"+obean.getFoodtime()+"份;"+obean.getFoodprice()+"元;";
			}
			String fs = (String )session.getAttribute("allprice");
			allprice = Float.valueOf(fs);
			String sql = "update t_o_Order set o_orderFood='"+orderfood+"',o_orderAllprice='"+allprice+"' where o_orderNo='"+orderno+"'";
			int result = DBorder.uploadFood(sql);
			if(result>0){
				response.getWriter().write("<script language='JavaScript'>" +
						"alert('修改订单成功！');" + 
						"window.location.href='orderchange?order_no=" +orderno+
						"';</script>"
						);
			}
			else{
				response.getWriter().write("<script language='JavaScript'>" +
						"alert('修改失败！');" + 
						"window.location.href='orderchange?order_no=" +orderno+
						"';</script>"
						);
			}
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
