package t.o.bean;

public class CommentBean {
	private int commentId = 0;
	private String foodNo = null;
	private String foodName = null;
	private String userName = null;
	private String content = null;
	private String cmtdate = null;
	public CommentBean(int commentId, String foodNo, String userName,
			String content, String cmtdate) {
		super();
		this.commentId = commentId;
		this.foodNo = foodNo;
		this.userName = userName;
		this.content = content;
		this.cmtdate = cmtdate;
	}
	

	public CommentBean(int commentId, String foodNo, String foodName,
			String userName, String content, String cmtdate) {
		super();
		this.commentId = commentId;
		this.foodNo = foodNo;
		this.foodName = foodName;
		this.userName = userName;
		this.content = content;
		this.cmtdate = cmtdate;
	}


	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public String getFoodNo() {
		return foodNo;
	}
	public void setFoodNo(String foodNo) {
		this.foodNo = foodNo;
	}
	
	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCmtdate() {
		return cmtdate;
	}
	public void setCmtdate(String cmtdate) {
		this.cmtdate = cmtdate;
	}
	

	
} 
