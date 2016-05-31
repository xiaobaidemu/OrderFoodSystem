package t.o.bean;

public class orderlisBean {
	private String foodno;
	private String foodname;
	private int foodtime;
	private float foodprice;
	public orderlisBean(String foodno, String foodname, int foodtime,
			float foodprice) {
		super();
		this.foodno = foodno;
		this.foodname = foodname;
		this.foodtime = foodtime;
		this.foodprice = foodprice;
	}
	public String getFoodno() {
		return foodno;
	}
	public void setFoodno(String foodno) {
		this.foodno = foodno;
	}
	public String getFoodname() {
		return foodname;
	}
	public void setFoodname(String foodname) {
		this.foodname = foodname;
	}
	public int getFoodtime() {
		return foodtime;
	}
	public void setFoodtime(int foodtime) {
		this.foodtime = foodtime;
	}
	public float getFoodprice() {
		return foodprice;
	}
	public void setFoodprice(float foodprice) {
		this.foodprice = foodprice;
	}
	
	
}
