package t.o.bean;

public class userBean {
	private String user_name=null; 
	private String user_pwd=null; 
	private String user_naickname=null; 
	private String user_birthday=null; 
	private String user_sex=null; 
	private String user_truename=null; 
	private String user_idcard=null; 
	private String user_phone=null; 
	private String user_email=null;
	private String user_img=null;
	public userBean(String user_name, String user_pwd, String user_naickname,
			String user_birthday, String user_sex, String user_truename,
			String user_idcard, String user_phone, String user_email,
			String user_img) {
		super();
		this.user_name = user_name;
		this.user_pwd = user_pwd;
		this.user_naickname = user_naickname;
		this.user_birthday = user_birthday;
		this.user_sex = user_sex;
		this.user_truename = user_truename;
		this.user_idcard = user_idcard;
		this.user_phone = user_phone;
		this.user_email = user_email;
		this.user_img = user_img;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_naickname() {
		return user_naickname;
	}
	public void setUser_naickname(String user_naickname) {
		this.user_naickname = user_naickname;
	}
	public String getUser_birthday() {
		return user_birthday;
	}
	public void setUser_birthday(String user_birthday) {
		this.user_birthday = user_birthday;
	}
	public String getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}
	public String getUser_truename() {
		return user_truename;
	}
	public void setUser_truename(String user_truename) {
		this.user_truename = user_truename;
	}
	public String getUser_idcard() {
		return user_idcard;
	}
	public void setUser_idcard(String user_idcard) {
		this.user_idcard = user_idcard;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}
	
}