

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PrintBill")
public class PrintBill extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PrintBill() {
        super();
    }

    public void generateBill(Table table) {
        int sum = 0;
        try {
            try {
                FileWriter f = new FileWriter("G:\\dev\\bills\\" + table.getBillId() + ".txt");
                BufferedWriter fw= new BufferedWriter(f);
                fw.write("    .        TRASV's Restaurant       .            ");
                fw.newLine();
                fw.newLine();
                fw.newLine();
                fw.write("Main Road, Bachupally, Hyderabad - 500090, Near Vignana Jyothi Nagar, Nizampet");
                fw.newLine();
                fw.write("            Mobile : 8173749975 , 9731575718");
                fw.newLine();
                fw.newLine();
                fw.newLine();
                fw.write("Name" +"           "+"Item_price"+"      "+"Quantity"+"           " +"Total cost" );
                fw.newLine();
                fw.newLine();
                fw.write("--------------------------------------------------------------------------------------------------");
                fw.newLine();
                for(DishItem d : table.orderedItems) {
                	fw.write(d.name  +"           "+ d.price +"           "+  "1" +"           "+ d.price);
                	sum+=d.price;
                	fw.newLine();
                }
                
                fw.write("--------------------------------------------------------------------------------------------------");
                fw.newLine();
                fw.newLine();fw.newLine();
                fw.write("Total Bill =" +sum);
                fw.newLine();
                fw.newLine();
                fw.newLine();
                fw.newLine();
                fw.write("                   THANK YOU FOR VISITING ");
                fw.newLine();
                fw.write("                       Have A Nice Day");
                fw.close();
            } catch (IOException e) {
                e.printStackTrace();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int tableNo = Integer.parseInt(request.getParameter("tableNumber"));
		
		Table table = DataBaseHelper.getInstance().getTable(tableNo);
		generateBill(table);
		DataBaseHelper.removeTable(tableNo);
		ArrayList<Integer> list = DataBaseHelper.getInstance().getActiveTables();

		if(list.size() <= 1) {
			response.sendRedirect("addtable");
		} else {
			response.sendRedirect("main?tableNumber="+list.get(0));
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
