package t.o.bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DBuser {
	public static int uploadUser(String sql){
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
	public static ArrayList<userBean> getum(String sql){
		ArrayList<userBean> userList = new ArrayList<userBean>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBmessage.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				String user_name = rs.getString("o_userName").trim();
				String user_paw = rs.getString("o_userPwd").trim();
				String user_naickname = rs.getString("o_userNaickname").trim();
				String user_birthday = rs.getString("o_userBirthday").trim().substring(0,10);
				String user_sex = rs.getString("o_userSex").trim();
				String user_truename = rs.getString("o_userTruename").trim();
				String user_idcard = rs.getString("o_userIdcard").trim();
				String user_phone = rs.getString("o_userPhone").trim();
				String user_email = rs.getString("o_userEmail").trim();
				String user_img = rs.getString("o_userImg").trim();
				userBean userbean = new userBean(user_name,user_paw,user_naickname,user_birthday,user_sex,user_truename,user_idcard,user_phone,user_email,user_img);
				userList.add(userbean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DBmessage.allClose(conn, stmt, rs);
		}
		return userList;
	}

}
