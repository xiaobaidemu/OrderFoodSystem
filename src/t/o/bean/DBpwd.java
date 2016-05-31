package t.o.bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DBpwd {
	public static int uploadPwd(String sql){
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
	public static String getoldpwd(String sql){
		String oldpwd = null;
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBmessage.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				oldpwd = rs.getString(1).trim();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DBmessage.allClose(conn, stmt, rs);
		}
		return oldpwd;
	}
}
