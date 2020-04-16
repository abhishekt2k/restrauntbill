
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
		DataBaseHelper db = DataBaseHelper.getInstance();
		ArrayList<Integer> list = db.getActiveTables();
		int tableNo = Integer.parseInt(request.getParameter("tableNumber"));
		Table table = db.getTable(tableNo);
		request.setAttribute("table", table);
		request.setAttribute("activeTables", list);
		request.getRequestDispatcher("mainPage.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(request.getParameter("dishId") == null) {
			doGet(request, response);
		}
		
		int billId = Integer.parseInt(request.getParameter("billId"));
		int dishId = Integer.parseInt(request.getParameter("dishId"));
		DataBaseHelper db = DataBaseHelper.getInstance();
		db.addDishtoTable(dishId, billId);
		doGet(request, response);
	}

}
