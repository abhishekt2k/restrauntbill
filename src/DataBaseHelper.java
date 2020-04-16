
import java.util.ArrayList;

public class DataBaseHelper {
	static DataBaseHelper dbHelper;


	public static DataBaseHelper getInstance() {
		if (dbHelper == null) {
			dbHelper = new DataBaseHelper();
		}
		return dbHelper;
	}
	
	public Table getTable(int tableNo) {
		// return table from db
		Table table = new Table(tableNo);
		int billId = DBServer.getBillId(tableNo);
		table.setBillId(billId);
		table.orderedItems = getBillDishes(billId);
		return table;
	}

	private ArrayList<DishItem> getBillDishes(int billId) {
		return DBServer.getBillDishes(billId);
	}

	public ArrayList<Integer> getActiveTables() {
		// get active tables
		return DBServer.getActiveTables();

	}
	
	public DishItem getDishById(int dishId) {
		// get dish from db
		return DBServer.getDishById(dishId);
	}
	
	public void addDishtoTable(int dishId, int billId) {
		// add dish to table
		DBServer.addDishtoBill(dishId, billId);
		
	}
	
	ArrayList<DishItem> getDishes(String category, String type) {
		return DBServer.getFoodItemsUnderCategory(type, category);
	}


	public void registerTable(int tableNo) {
		// register table
		DBServer.registerTable(tableNo);

	}

	public static void removeTable(int tableNo) {
		DBServer.removeTable(tableNo);	
	}

}
