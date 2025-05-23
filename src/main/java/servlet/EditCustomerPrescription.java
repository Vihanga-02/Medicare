package servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Prescriptions;
import services.PrescriptionService;

@WebServlet("/EditCustomerPrescription")
public class EditCustomerPrescription extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String idStr = request.getParameter("id");

        try {
        	// Convert the 'id' parameter to an integer
            int prescriptionId = Integer.parseInt(idStr);
         // Retrieve the prescription details from the database
            Prescriptions prescription = PrescriptionService.getPrescriptionById(prescriptionId);
            request.setAttribute("prescription", prescription);
         // Forward the request to the UpdateCustomerPrescription JSP page for displaying the update form
            request.getRequestDispatcher("UpdateCustomerPrescription.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("DisplayCustomerPrescription");
        }
    }
}
