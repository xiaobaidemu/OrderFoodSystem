package t.o.bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DBfood {
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
	public static ArrayList<foodBean> getfm(String sql){
		ArrayList<foodBean> foodList = new ArrayList<foodBean>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBmessage.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				String Food_no = rs.getString("o_foodNo").trim();
				String Food_name = rs.getString("o_foodName").trim();
				String Food_type = rs.getString("o_foodType").trim();
				String Food_price = rs.getString("o_foodPrice").trim();
				String Food_cook = rs.getString("o_foodCook").trim();
				String Food_synopsis = rs.getString("o_foodSynopsis").trim();
				String Food_remark = rs.getString("o_foodRemark").trim();
				foodBean foodbean = new foodBean(Food_no,Food_name,Food_cook,Food_type,Food_price,Food_synopsis,Food_remark);
				foodList.add(foodbean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DBmessage.allClose(conn, stmt, rs);
		}
		return foodList;
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
