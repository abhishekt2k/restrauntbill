


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DBServer {
	
	public static Connection getConnection(){
        Connection connection = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/resbill", "atr", "chararray");
        }catch(Exception e){ System.out.println(e); }
       
        return connection; 
    }
	
	public static void registerTable( int table_no ) {
		System.out.println("DB Server called");
        try{
            Connection con= getConnection();
            PreparedStatement ps=con.prepareStatement(
                    "insert into bill_ids values(null,?, ?)");
            java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
            ps.setDate(2, date);
            ps.setInt(1,table_no);
            ps.executeUpdate();
            ps = con.prepareStatement("insert into active_tables values(?)");
            ps.setInt(1, table_no);
            ps.execute();
            con.close();
            
        }catch(Exception ex){ex.printStackTrace();}
        System.out.println("DB Server call ended");

    }
	
	public static ArrayList<DishItem> getFoodItemsUnderCategory(String type ,String category){
        ArrayList<DishItem> dishItems = new ArrayList<DishItem>();
		try{
            Connection con = getConnection();
            PreparedStatement ps=con.prepareStatement("select * from food_items where type =? and category =?");
            ps.setString(1,type);
            ps.setString(2,category);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
            	int dishId = rs.getInt("item_id");
            	String dishName = rs.getString("item_name");
//            	String category = rs.getString("category");
//            	String type = rs.getString("type");
            	int price = rs.getInt("item_price");
            	dishItems.add(new DishItem(dishId, dishName, type, category, price));
            }

        }catch(Exception ex){ex.printStackTrace();}
		
		return dishItems;

    }
	
	
	public static int getBillId(int tableNo) {
		java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
		int billId = 0;
		try {
			Connection con = getConnection();
			System.out.println(date);
			PreparedStatement ps = con.prepareStatement("select bill_id from bill_ids where table_no = ? ");
			ps.setInt(1, tableNo);
//			ps.setDate(2,  date);
			ResultSet rs = ps.executeQuery();
//			System.out.println(rs.getInt("bill_id"));
			if(rs.next()) {
				billId = rs.getInt("bill_id");
			}
			System.out.println("bill id is set to   " + billId);
			
		} catch(Exception e) { System.out.println(e); }
		return billId;		
	}

	public static DishItem getDishById(int dishId) {
		int id = 0;
		int price = 0;
		String name = null;
		String category = null;
		String type = null;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from food_items where item_id = ?");
			ps.setInt(1, dishId);
			ResultSet rs = ps.executeQuery();
			id = dishId;
			if(rs.next()) {
				price = rs.getInt("item_price");
				type = rs.getString("type");
				category = rs.getString("category");
				name = rs.getString("item_name");
			}
				
		} catch(Exception e) { System.out.println(e); }
		DishItem dish = new DishItem(id, name, type, category, price);
		return dish;
	}

	public static ArrayList<DishItem> getBillDishes(int billId) {
		ArrayList<DishItem> dishItems = new ArrayList<DishItem>();
		try{
            Connection con = getConnection();
            PreparedStatement ps=con.prepareStatement("select item_id from bills where bill_id =?");
            ps.setInt(1, billId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
            	dishItems.add(getDishById(rs.getInt("item_id")));
            }

        }catch(Exception ex){ex.printStackTrace();}
		
		return dishItems;
	}

	public static ArrayList<Integer> getActiveTables() {
		// TODO Auto-generated method stub
		ArrayList<Integer> activeTables = new ArrayList<Integer>();
		try{
            Connection con = getConnection();
            PreparedStatement ps=con.prepareStatement("select table_no from active_tables");
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
            	activeTables.add(rs.getInt("table_no"));
            }
            
        }catch(Exception ex){ex.printStackTrace();}
		
		
		return activeTables;
	}

	public static void addDishtoBill(int dishId, int billId) {
		// TODO Auto-generated method stub
		System.out.println("called addDishtoBill server");
		try{
            Connection con = getConnection();
            PreparedStatement ps=con.prepareStatement("insert into bills values( ? , ?)");
            ps.setInt(1, billId);
            ps.setInt(2,  dishId);
            ps.execute();
            System.out.println("query excuted");
        }catch(Exception ex){ex.printStackTrace();}
	}

	public static void removeTable(int tableNo) {
		// TODO Auto-generated method stub
		try{
            Connection con = getConnection();
            PreparedStatement ps=con.prepareStatement("delete from active_tables where table_no = ?");
            ps.setInt(1, tableNo);
            ps.execute();
//            System.out.println("query excuted");
        }catch(Exception ex){ex.printStackTrace();}
		
		
	}

}
