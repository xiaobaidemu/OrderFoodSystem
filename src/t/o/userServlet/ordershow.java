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

import t.o.bean.DBfood;
import t.o.bean.DBorder;
import t.o.bean.foodBean;
import t.o.bean.orderBean;

public class ordershow extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String sql = null;
		String userName = (String)request.getSession().getAttribute("userName");
		sql = "select * from t_o_Order where o_orderUser = '"+userName+"'";
		ArrayList<orderBean> orderList = new ArrayList<orderBean>();
		orderList = DBorder.getom(sql);

		request.getSession().setAttribute("ordershow", orderList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("ordershow.jsp");
		dispatcher.forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
	}

}
