package servlet;

import model.Customers;
import services.CustomerService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/CustomerDelete")
public class CustomerDelete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve customer from session
        HttpSession session = request.getSession(false); // false means don't create if it doesn't exist
        Customers customer = (Customers) session.getAttribute("customer");

        if (customer != null) {
            int customerId = customer.getCustomer_id();

            CustomerService service = new CustomerService();
            boolean isDeleted = service.deleteCustomerById(customerId);

            if (isDeleted) {
                // Invalidate session after deletion
                session.invalidate();
                // Redirect to homepage or a success page
                response.sendRedirect("AccountDeleted.jsp");
            } else {
                // If deletion failed, redirect back with error
                response.sendRedirect("CustomerProfile?error=deleteFailed");
            }
        } else {
            // If user is not logged in, redirect to login page
            response.sendRedirect("login.jsp");
        }
    }
}
