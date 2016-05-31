package t.o.bean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.sina.sae.util.SaeUserInfo;

public class DBmessage {
	/*private static String dbDriver="com.mysql.jdbc.Driver";
	private static String dbUrl="jdbc:mysql://localhost:3306/mysql";
	private static String dbuser = "root";
	private static String dbpwd = "";
	*/
	private static String dbDriver="com.mysql.jdbc.Driver";
	private static String dbUrl="jdbc:mysql://localhost:3306/orderfoodsystem?useUnicode=true&characterEncoding=UTF-8";
	//?zeroDateTimeBehavior=convertToNull
	private static String dbuser = "root";
	private static String dbpwd = "123456";
	
	public static Connection getConnection(){
		Connection conn = null;
		try {
			Class.forName(dbDriver);
			conn = DriverManager.getConnection(dbUrl,dbuser,dbpwd);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("dbUrl:"+dbUrl);
		if (conn == null) 
		{
			System.err.println("����:��������������!");
		}
		return conn;	
	}
	public static void allClose(Connection conn,Statement stmt,ResultSet rs){
			try {
				if(conn!=null){
					conn.close();
					conn=null;
				}
				if(stmt!=null){
					stmt.close();
					stmt = null;
				}
				if(rs!=null){
					rs.close();
					rs = null;
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
}
