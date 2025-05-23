package servlet;

import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Customers;
import services.CustomerService;

@WebServlet("/CustomerUpdate")
public class CustomerUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int customer_id = Integer.parseInt(request.getParameter("customer_id"));
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        Date dob = Date.valueOf(request.getParameter("dob"));
        String gender = request.getParameter("gender");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String password = request.getParameter("password");

        Customers customer = new Customers(customer_id, first_name, last_name, dob, gender, contact, email, address, password);

        CustomerService service = new CustomerService();
        boolean isUpdated = service.updateCustomer(customer);

        if (isUpdated) {
            // Update session too
            HttpSession session = request.getSession();
            session.setAttribute("customer", customer);
            response.sendRedirect("CustomerProfile");
        } else {
            response.sendRedirect("error.jsp"); // optional error page
        }
	}

}
