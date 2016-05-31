package t.o.bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DBadmin {
	public static ArrayList<adminBean> getrs(String sql){
		ArrayList<adminBean> adminList = new ArrayList<adminBean>();
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		try {
			conn = DBmessage.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				String name = rs.getString("o_adminName").trim();
				String pwd = rs.getString("o_adminPwd").trim();
				adminBean adminbean = new adminBean(name,pwd);
				adminList.add(adminbean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DBmessage.allClose(conn, stmt, rs);
		}
		return adminList;
	}
}
