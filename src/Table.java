
import java.util.ArrayList;
import java.util.Date;

public class Table {
	int tableNo;
	int billId;
	Date addedAt;
	ArrayList<DishItem> orderedItems;
	
	
	public Table(int tableNo) {
		// register table in database
		this.tableNo = tableNo;
		this.addedAt = new Date();
//		DataBaseHelper db = DataBaseHelper.getInstance();
		
	}
	
//	void setTableNo(int tableNo) { this.tableNo = tableNo; }
	
	void setBillId(int billId) { this.billId = billId; }
	
	void addDish(DishItem dish) {this.orderedItems.add(dish);}
	
	public int getBillId() { return this.billId ; }
	
	public int getTableNo() { return this.tableNo ;}
	
	public ArrayList<DishItem> getOrderedItems(){ return this.orderedItems; }
	

}
