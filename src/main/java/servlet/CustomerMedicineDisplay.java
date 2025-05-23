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

@WebServlet("/CustomerMedicineDisplay")
public class CustomerMedicineDisplay extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		try {
			// Fetch all products
			List<Medicines> allMedicines = MedicineService.getAllMedicines();
			
			// For debug
			System.out.println("Medicnes fetched: " + allMedicines.size()); 

			// Set products to request
			request.setAttribute("allMedicines", allMedicines);

			// Forward to JSP
			RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerMedicineDisplay.jsp");
			dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Something went wrong while loading products.");
		}
	}

}
