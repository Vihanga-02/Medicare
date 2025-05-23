package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.PrescriptionService;

@WebServlet("/DeleteCustomerPrescription")
public class DeleteCustomerPrescription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

        String idStr = request.getParameter("id");
     // Check if the ID is not null
        if (idStr != null) {
            int id = Integer.parseInt(idStr);// Convert the ID from String to integer
            boolean result = PrescriptionService.deletePrescriptionById(id);// Calling the service method to delete the prescription from the database
            if (result) {
                request.getSession().setAttribute("message", "Prescription deleted successfully.");
            } else {
                request.getSession().setAttribute("message", "Failed to delete prescription.");
            }
        }
        response.sendRedirect("DisplayCustomerPrescription"); // Redirect to customer prescription page
	}

}
