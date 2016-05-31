package t.o.bean;

public class carBean {
	private foodBean foodbean;//购买商品
	private int quantity;//购买数量
	public carBean(foodBean foodbean, int quantity) {
		super();
		this.foodbean = foodbean;
		this.quantity = quantity;
	}
	public foodBean getFoodbean() {
		return foodbean;
	}
	public void setFoodbean(foodBean foodbean) {
		this.foodbean = foodbean;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
