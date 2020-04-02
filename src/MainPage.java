
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/main")
public class MainPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		System.out.println("called main");
		DataBaseHelper db = DataBaseHelper.getInstance();
//		System.out.println("called main");
		ArrayList<Integer> list = db.getActiveTables();
		System.out.println(request.getParameter("tableNumber") + "HIT");
		int tableNo = Integer.parseInt(request.getParameter("tableNumber"));
		Table table = db.getTable(tableNo);
		request.setAttribute("table", table);
		request.setAttribute("activeTables", list);
		request.getRequestDispatcher("mainPage.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("called ");
		if(request.getParameter("dishId") == null) {
			doGet(request, response);
		}
		
		int billId = Integer.parseInt(request.getParameter("billId"));
		int dishId = Integer.parseInt(request.getParameter("dishId"));
		System.out.println(" add " + billId + " for  " + dishId);
		DataBaseHelper db = DataBaseHelper.getInstance();
		db.addDishtoTable(dishId, billId);
		doGet(request, response);
	}

}
