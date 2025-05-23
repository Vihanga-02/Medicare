package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Medicines;
import services.MedicineService;

@WebServlet("/MedicineDisplay")
public class MedicineDisplay extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Optional: Set encoding
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		// Get all products
		List<Medicines> allMedicines = MedicineService.getAllMedicines();
		request.setAttribute("allMedicines", allMedicines);

		// Forward to JSP
		RequestDispatcher dispatcher = request.getRequestDispatcher("MedicineDisplay.jsp");
		dispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
