
public class DishItem {
	int id;
	String name;
	String type;
	String category;
	int price;
	
	public DishItem(int id, String name, String type, String category, int price) {
		this.id = id;
		this.name = name;
		this.type = type;
		this.category = category;
		this.price = price;
	}
	
	public String getName() { return this.name; }
	public String getType() { return this.type; }
	public String getCategory() { return this.category ; }
	public int getPrice() { return this.price; }
	public int getId() { return this.id; }
}
