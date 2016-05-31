package t.o.bean;

public class compositionBean {
	private String c_no;
	private String c_title;
	private String c_type;
	private String c_date;
	private String c_c;
	public compositionBean(String c_no, String c_title, String c_type,
			String c_date, String c_c) {
		super();
		this.c_no = c_no;
		this.c_title = c_title;
		this.c_type = c_type;
		this.c_date = c_date;
		this.c_c = c_c;
	}
	public String getC_no() {
		return c_no;
	}
	public void setC_no(String c_no) {
		this.c_no = c_no;
	}
	public String getC_title() {
		return c_title;
	}
	public void setC_title(String c_title) {
		this.c_title = c_title;
	}
	public String getC_type() {
		return c_type;
	}
	public void setC_type(String c_type) {
		this.c_type = c_type;
	}
	public String getC_date() {
		return c_date;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}
	public String getC_c() {
		return c_c;
	}
	public void setC_c(String c_c) {
		this.c_c = c_c;
	}
	
}
