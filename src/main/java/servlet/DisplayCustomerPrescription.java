package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Customers;
import model.Prescriptions;
import services.PrescriptionService;


@WebServlet("/DisplayCustomerPrescription")
public class DisplayCustomerPrescription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		Customers customer = (Customers) request.getSession().getAttribute("customer");
		if (customer == null) {
		    response.sendRedirect("login.jsp");
		    return;
		}
		String customerEmail = customer.getEmail();


        if (customerEmail == null) {
            response.sendRedirect("login.jsp"); 
            return;
        }

        // Get list of prescriptions for the logged-in customer
        List<Prescriptions> prescriptions = PrescriptionService.getPrescriptionsByCustomerEmail(customerEmail);
        request.setAttribute("prescriptions", prescriptions);

        // Forward to JSP
        request.getRequestDispatcher("DisplayCustomerPrescription.jsp").forward(request, response);
	}

}
