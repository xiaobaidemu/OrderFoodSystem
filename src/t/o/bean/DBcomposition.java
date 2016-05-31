package t.o.bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DBcomposition {
	public static int uploadc(String sql){
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
	public static ArrayList<compositionBean> getcm(String sql){
		ArrayList<compositionBean> compositionList = new ArrayList<compositionBean>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBmessage.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				String c_no = rs.getString("o_cNo").trim();
				String c_title = rs.getString("o_cTitle").trim();
				String c_type = rs.getString("o_cType").trim();
				String c_date = rs.getString("o_cDate").trim().substring(0,10);
				String c_c = rs.getString("o_cContent").trim();
				compositionBean compositionbean = new compositionBean(c_no,c_title,c_type,c_date,c_c);
				compositionList.add(compositionbean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DBmessage.allClose(conn, stmt, rs);
		}
		return compositionList;
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
