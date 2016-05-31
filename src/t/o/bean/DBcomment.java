package t.o.bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DBcomment {
	public static int uploadCom(String sql){
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
	public static ArrayList<CommentBean> getcomment(String sql){
		ArrayList<CommentBean> commentList = new ArrayList<CommentBean>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBmessage.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				int commentId = rs.getInt("o_commentId");
				String foodNo = rs.getString("o_foodNo");
				String userName = rs.getString("o_userName");
				String content = rs.getString("o_content").trim();
				String cmtdate = rs.getString("o_cmttime").trim();
				CommentBean commentbean = new CommentBean(commentId,foodNo,userName,content,cmtdate);
				commentList.add(commentbean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DBmessage.allClose(conn, stmt, rs);
		}
		return commentList;
	}
	
	public static ArrayList<CommentBean> getcommentwithname(String sql){
		ArrayList<CommentBean> commentList = new ArrayList<CommentBean>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBmessage.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				int commentId = rs.getInt("o_commentId");
				String foodNo = rs.getString("t_o_Food.o_foodNo");
				String foodName = rs.getString("t_o_Food.o_foodName");
				String userName = rs.getString("o_userName");
				String content = rs.getString("o_content").trim();
				String cmtdate = rs.getString("o_cmttime").trim();
				CommentBean commentbean = new CommentBean(commentId,foodNo,foodName,userName,content,cmtdate);
				commentList.add(commentbean);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DBmessage.allClose(conn, stmt, rs);
		}
		return commentList;
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
