package t.o.bean;

public class orderBean {
	private String order_no = null;
	private String order_user = null;
	private String order_food = null;
	private float order_allprice;
	private String order_remark = null;
	private String order_state = null;
	public orderBean(String order_no, String order_user, String order_food,
			float order_allprice, String order_remark, String order_state) {
		super();
		this.order_no = order_no;
		this.order_user = order_user;
		this.order_food = order_food;
		this.order_allprice = order_allprice;
		this.order_remark = order_remark;
		this.order_state = order_state;
	}
	public String getOrder_no() {
		return order_no;
	}
	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}
	public String getOrder_user() {
		return order_user;
	}
	public void setOrder_user(String order_user) {
		this.order_user = order_user;
	}
	public String getOrder_food() {
		return order_food;
	}
	public void setOrder_food(String order_food) {
		this.order_food = order_food;
	}
	public float getOrder_allprice() {
		return order_allprice;
	}
	public void setOrder_allprice(float order_allprice) {
		this.order_allprice = order_allprice;
	}
	public String getOrder_remark() {
		return order_remark;
	}
	public void setOrder_remark(String order_remark) {
		this.order_remark = order_remark;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	
}
