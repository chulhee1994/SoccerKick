package Soccer;
import java.io.Serializable;

public class SoccerVo implements Serializable{
	
	
	private int num; //상품번호
	private String name;	//상품
	private int price;	//가격
	private String publisher; //배급사
	private String information;	//정보
	private String condition;	//상태
	private String category;	//분류
	private int inventory;		//재고
	private String img;			//이미지
	private int quantity;  		//수량
	public SoccerVo() {}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getInformation() {
		return information;
	}
	public void setInformation(String information) {
		this.information = information;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getInventory() {
		return inventory;
	}
	public void setInventory(int inventory) {
		this.inventory = inventory;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "SoccerVo [num=" + num + ", name=" + name + ", price=" + price + ", publisher=" + publisher
				+ ", information=" + information + ", condition=" + condition + ", category=" + category
				+ ", inventory=" + inventory + ", img=" + img + ", quantity=" + quantity + "]";
	}
	

	
	
	
}
