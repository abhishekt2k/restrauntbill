
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addtable")
public class AddTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddTableServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("addTable.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		DataBaseHelper db = DataBaseHelper.getInstance();
		int tableNumber = Integer.parseInt(request.getParameter("tableNumber"));
		db.registerTable(tableNumber);
		request.getRequestDispatcher("main").forward(request, response);
	}

}
