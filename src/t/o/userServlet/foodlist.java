package t.o.userServlet;

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
import t.o.bean.foodBean;

public class foodlist extends HttpServlet {

	private int allrow = 0;//行数
	private int yerow = 15;//每页行数
	private int yeshu = 0;//页数
	private int lastyerow = 0;//最后一页的行数
	private int showpage = 1;//当前页
	private String sql = null;
	String food_type = null;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("URL:"+request.getRequestURI());
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		food_type = request.getParameter("foodtype");
		session.setAttribute("currentpage", request.getRequestURI()+"?foodtype="+food_type);
		String url = food_type;
		if(food_type.equals("nosh")){
			food_type = "小吃";
		}
		if(food_type.equals("my")){
			food_type = "招牌菜";
		}
		if(food_type.equals("cake")){
			food_type = "糕点";
		}
		if(food_type.equals("china")){
			food_type = "中餐";
		}
		if(food_type.equals("abroad")){
			food_type = "西餐";
		}
		if(food_type.equals("drink")){
			food_type = "饮品";
		}
		ArrayList<foodBean> foodList = null;
		if(request.getParameter("ToPage")==null){	
			sql = "select * from t_o_Food where o_foodType = '"+food_type+"'";
			showpage = 1;
			foodList = new ArrayList<foodBean>();
			foodList = DBfood.getfm(sql);
			session.setAttribute("foodchange", foodList);
		}else{
			foodList = (ArrayList<foodBean>)session.getAttribute("foodchange");
		}
		//显示总页数
		allrow = foodList.size();
		lastyerow = allrow % yerow;
		if(lastyerow == 0){
			yeshu = allrow/yerow;
		}
		else{
			yeshu = (allrow-lastyerow)/yerow;
			yeshu ++;
		}

		if(request.getParameter("ToPage")==null){
			ArrayList<foodBean> list = new ArrayList<foodBean>();
			if(allrow<yerow){
				for(int i=0;i<allrow;i++){
					list.add(foodList.get(i));
				}
			}
			else{
				for(int i=0;i<yerow;i++){
					list.add(foodList.get(i));
				}
			}
			session.setAttribute("foodList", list);
		}
		if(request.getParameter("ToPage")!=null){
			if(request.getParameter("ToPage").equals("")){
				ArrayList<foodBean> list = new ArrayList<foodBean>();
				if(allrow<yerow){
					for(int i=0;i<allrow;i++){
						list.add(foodList.get(i));
					}
				}
				else{
					for(int i=0;i<yerow;i++){
						list.add(foodList.get(i));
					}
				}
				session.setAttribute("foodList", list);
			}
			else{
				if(Integer.parseInt(request.getParameter("ToPage"))*yerow<=allrow){
					String pagea = request.getParameter("ToPage");
					int page = Integer.parseInt(pagea);
					ArrayList<foodBean> list = new ArrayList<foodBean>();
					for(int i=(page-1)*yerow;i<page*yerow;i++){
						list.add(foodList.get(i));
					}
					session.setAttribute("foodList", list);
					showpage = page;
				}
				if(Integer.parseInt(request.getParameter("ToPage"))*yerow>=allrow){
					String pagea = request.getParameter("ToPage");
					int page = Integer.parseInt(pagea);
					ArrayList<foodBean> list = new ArrayList<foodBean>();
					for(int i=(page-1)*yerow;i<allrow;i++){
						list.add(foodList.get(i));
					}
					session.setAttribute("foodList", list);
					showpage = page;
				}
			}
		}
		
		String str = "";  
		int next, prev;  
		prev=showpage-1;  
		next=showpage+1; 
		str+="<form aciont='foodlist'>";
		str += "查询到<span>"+allrow+"</span>条记录"+
		"    共<span>"+yeshu+"</span>页";  
		str +=" 第<span>"+showpage+"</span>页 ";  
		if(showpage>1) 
			str += " <A href=foodlist?foodtype="+url+"&ToPage=1"+">首页</A> ";  
		else 
			str += " 首页 ";  
		if(showpage>1)
			str += " <A href=foodlist?foodtype="+url+"&ToPage=" + prev + ">上一页</A> ";  
		else
			str += " 上一页 ";  
		if(showpage<yeshu)  
			str += " <A href=foodlist?foodtype="+url+"&ToPage=" + next + ">下一页</A> ";  
		else 
			str += " 下一页 ";  
		if(yeshu>1&&showpage!=yeshu)  
			str += " <A href=foodlist?foodtype="+url+"&ToPage=" + yeshu + 
			">尾页</A>";  
		else
			str += " 尾页 ";  
		str+="第<input id=go name=ToPage type=text size=2>页 <input type=button value=GO onclick='goo();'></form>" ;
		
		session.setAttribute("str", str);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url+".jsp");
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
