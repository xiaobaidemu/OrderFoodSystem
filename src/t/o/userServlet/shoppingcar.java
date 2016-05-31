package t.o.userServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import t.o.bean.DBfood;
import t.o.bean.carBean;
import t.o.bean.foodBean;
import t.o.bean.randomno;

public class shoppingcar extends HttpServlet {
	ArrayList foodorderList = new ArrayList();
	int num = 1;
	Map<String, carBean> cart;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String sqla = "select * from t_o_Food";
		session.setAttribute("foodList", DBfood.getfm(sqla));
		String currentpage = (String)session.getAttribute("currentpage");
		System.out.println("currentpage:"+currentpage);
		if(session.getAttribute("userName")==null){
			response.getWriter().write("<script language='JavaScript'>" +
					"alert('对不起，点餐系统只为本店会员开放，请登录！！！');" + 
					"history.back();" + 
					"</script>"
					);
		}
		else if(request.getParameter("foodnum")!=null){
			int foodnum = Integer.parseInt(request.getParameter("foodnum"));
			String food_no = request.getParameter("food_no");
			if(foodnum<1){
				cart.remove(food_no);
			}
			else{
				System.out.println(foodnum);
				cart.get(food_no).setQuantity(foodnum);
			}
			session.setAttribute("carsize", cart.size());
			response.sendRedirect(getServletContext().getContextPath()+"/shopingcar.jsp");
		}
		else if(request.getParameter("delete_no")!=null){
			String delete_no = request.getParameter("delete_no");
			cart.remove(delete_no);
			session.setAttribute("carsize", cart.size());
			response.sendRedirect(getServletContext().getContextPath()+"/shopingcar.jsp");
		}
		else if(request.getParameter("deleteall")!=null){
			cart = new HashMap();
			session.setAttribute("cart", cart);
			session.setAttribute("carsize", cart.size());
			response.sendRedirect(getServletContext().getContextPath()+"/shopingcar.jsp");
		}
		else if(request.getParameter("define")!=null){
			String orderfood = "";
			float zj = Float.valueOf(request.getParameter("define"));
			System.out.println("zj::::"+zj);
			Map cart = (Map)session.getAttribute("cart");
			Set foodorderBeans = cart.keySet();
			Object[] isbn = foodorderBeans.toArray();
			int size = cart.size();
			for(int i=0;i<size;i++){
				carBean carbean = (carBean)cart.get(isbn[i]);
				String food_no = carbean.getFoodbean().getFood_no();
				String food_name = carbean.getFoodbean().getFood_name();
				int foodnum = carbean.getQuantity();
				float food_price = Float.valueOf(carbean.getFoodbean().getFood_price());
				orderfood = orderfood+food_no+";"+food_name+";"+foodnum+"份;"+foodnum*food_price+"元;";
			}
			String orderno = randomno.orderno();
			String roomname = session.getAttribute("userName").toString();
			String sql = "insert into t_o_Order values(NULL,'"+orderno+"','"+roomname+"','"+orderfood+"',"+zj+",'','未完成')";
			System.out.println(sql);
			int result = DBfood.uploadFood(sql);
			if(result>0){
				cart = new HashMap();
				session.setAttribute("cart", cart);
				session.setAttribute("carsize", 0);
				response.getWriter().write("<script language='JavaScript'>" +
						"alert('订单成功！！！');" +
						"window.location.href=\""+currentpage+"\""+
						"</script>"
						);
				
			}
			else{
				response.getWriter().write("<script language='JavaScript'>" +
						"alert('订单失败！');" + 
						"window.close();" + 
						"</script>"
						);
			}
		}
		else{
			String food_no = request.getParameter("food_no").trim();
			ArrayList<foodBean> foodList = (ArrayList<foodBean>)session.getAttribute("foodList");
			foodBean foodbean;
			for(int i=0;i<foodList.size();i++){
				foodbean = foodList.get(i);
				if(food_no.equals(foodbean.getFood_no().trim())){
					foodbean = foodList.get(i);
					foodorderList.add(foodbean);
					//将商品放入购物车
					cart =
						(Map)request.getSession(false).getAttribute("cart");
					
					if(cart == null){
						//创建购物车
						System.out.println("开始创建购物车");
						//Map<Object,Object> map = new HashMap<Object,Object>();
						cart = new HashMap();
						session.setAttribute("cart", cart);
						System.out.println("创建购物车成功");
					}
					
					carBean carbean = new carBean(foodbean, num);
					//生成的购物记录和购物车中所有记录判断，如果存在相同的
					//商品，则改变数量，不进行put加入
					if(cart.get(food_no)!=null){	
						System.out.println("相同");
						int numfood = cart.get(food_no).getQuantity();
						numfood++;
						System.out.println(numfood);
						cart.get(food_no).setQuantity(numfood);
					}
					else{
						System.out.println("不同");
						System.out.println(carbean);
						cart.put(foodbean.getFood_no(), carbean);
						System.out.println("加入购物车成功");
					}
			
					break;
				}
			}
			//System.out.println("URL:"+request.getRequestURI());
			session.setAttribute("carsize", cart.size());
			session.setAttribute("foodorderList", foodorderList);
			response.getWriter().write("<script language='JavaScript'>" +
					"alert('点餐成功！！！');" +
					"window.location.href=\""+currentpage+"\""+
					"</script>"
					);
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
