
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/showdishes")
public class ShowDishServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ShowDishServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DataBaseHelper db = DataBaseHelper.getInstance();
		String categoryParam = request.getParameter("category");
		String category, type;
		if (categoryParam.charAt(0) == 'n') {
			type = categoryParam.substring(0, 4);
			category = categoryParam.substring(4);
		} else if (categoryParam.charAt(0) == 'v') {
			type = categoryParam.substring(0, 3);
			category = categoryParam.substring(3);
		} else {
			category = categoryParam;
			type = "veg";
		}
		System.out.println("once");
		ArrayList<DishItem> list = db.getDishes(category, type);
		System.out.println("done");
		request.setAttribute("dishes", list);
		System.out.println("attrb set");
		int tableNo = Integer.parseInt( request.getParameter("tableNumber"));
		Table table = db.getTable(tableNo);
		request.setAttribute("table", table );
		System.out.println("another atr");
		request.getRequestDispatcher("showDishes.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		doGet(request, response);
	}

}
