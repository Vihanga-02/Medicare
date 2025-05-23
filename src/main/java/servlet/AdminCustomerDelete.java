package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.CustomerService;

@WebServlet("/AdminCustomerDelete")
public class AdminCustomerDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		 String customerIdParam = request.getParameter("customer_id");

	        if (customerIdParam != null) {
	            int customerId = Integer.parseInt(customerIdParam);

	            CustomerService service = new CustomerService();
	            boolean isDeleted = service.deleteCustomerById(customerId);

	            if (isDeleted) {
	                // Redirect back to customer list after deletion
	                response.sendRedirect("CustomerList");
	            } else {
	                response.sendRedirect("CustomerList?error=deleteFailed");
	            }
	        } else {
	            response.sendRedirect("CustomerList?error=noCustomerId");
	        }
	}

}
