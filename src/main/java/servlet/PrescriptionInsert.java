package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Customers;
import services.PrescriptionService;

@WebServlet("/PrescriptionInsert")
public class PrescriptionInsert extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get session and check for logged-in customer
        HttpSession session = request.getSession(false);
        Customers customer = (session != null) ? (Customers) session.getAttribute("customer") : null;

        if (customer == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get form data
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        int age = Integer.parseInt(request.getParameter("age"));
        String phone_number = request.getParameter("phone_number");
        String delivery_address = request.getParameter("delivery_address");
        String medicine_details = request.getParameter("medicine_details");

        // Get email from session object, not form
        String email = customer.getEmail();

        // Call service to insert prescription
        boolean isInserted = PrescriptionService.insertPrescriptionData(
                first_name, last_name, age, phone_number, delivery_address, email, medicine_details
        );

        // Redirect or show result based on success
        if (isInserted) {
            response.sendRedirect("DisplayCustomerPrescription");
        } else {
            request.setAttribute("error", "Failed to upload prescription.");
            request.getRequestDispatcher("PrescriptionInsert.jsp").forward(request, response);
        }
    }
}
