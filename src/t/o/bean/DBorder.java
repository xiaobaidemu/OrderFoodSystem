package t.o.bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DBorder {
	public static int uploadFood(String sql){
		int result = 0;
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		try {
			conn = DBmessage.getConnection();
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			result = 0;
		}
		finally{
			DBmessage.allClose(conn, stmt, rs);
		}
		return result;
	}
	public static ArrayList<orderBean> getom(String sql){
		ArrayList<orderBean> orderList = new ArrayList<orderBean>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBmessage.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				String order_no = rs.getString("o_orderNo").trim();
				String order_user = rs.getString("o_orderUser").trim();
				String order_food = rs.getString("o_orderFood").trim();
				float order_allprice = Float.valueOf(rs.getString("o_orderAllprice").trim());
				String order_remark = rs.getString("o_orderRemark").trim();
				String order_state = rs.getString("o_orderState").trim();
				
				orderBean orderbean = new orderBean(order_no,order_user,order_food,order_allprice,order_remark,order_state);
				orderList.add(orderbean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DBmessage.allClose(conn, stmt, rs);
		}
		return orderList;
	}
	public static ArrayList<String> getorders(String sql){
		ArrayList<String> orderList = new ArrayList<String>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBmessage.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				String order = rs.getString("o_orderFood").trim();
				orderList.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DBmessage.allClose(conn, stmt, rs);
		}
		return orderList;
	}
	public static int getrs(String sql){
		int size = 0;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBmessage.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
	        while(rs.next()){
	        	size++;
	        }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DBmessage.allClose(conn, stmt, rs);
		}
		return size;
	}
}
