package t.o.bean;

public class foodBean {
	private String food_no = null;
	private String food_name = null;
	private String food_cook = null;
	private String food_type = null;
	private String food_price = null;
	private String food_synopsis = null;
	private String food_remark = null;
	public foodBean(String food_no, String food_name, String food_cook,
			String food_type, String food_price, String food_synopsis,
			String food_remark) {
		super();
		this.food_no = food_no;
		this.food_name = food_name;
		this.food_cook = food_cook;
		this.food_type = food_type;
		this.food_price = food_price;
		this.food_synopsis = food_synopsis;
		this.food_remark = food_remark;
	}
	public String getFood_no() {
		return food_no;
	}
	public void setFood_no(String food_no) {
		this.food_no = food_no;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public String getFood_cook() {
		return food_cook;
	}
	public void setFood_cook(String food_cook) {
		this.food_cook = food_cook;
	}
	public String getFood_type() {
		return food_type;
	}
	public void setFood_type(String food_type) {
		this.food_type = food_type;
	}
	public String getFood_price() {
		return food_price;
	}
	public void setFood_price(String food_price) {
		this.food_price = food_price;
	}
	public String getFood_synopsis() {
		return food_synopsis;
	}
	public void setFood_synopsis(String food_synopsis) {
		this.food_synopsis = food_synopsis;
	}
	public String getFood_remark() {
		return food_remark;
	}
	public void setFood_remark(String food_remark) {
		this.food_remark = food_remark;
	}
	
}
