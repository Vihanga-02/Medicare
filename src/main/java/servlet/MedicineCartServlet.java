package servlet;

import model.Customers;
import model.prescriptionOrder;
import services.PrescriptionOrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/MedicineCartServlet")
public class MedicineCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Validate session and customer login
        if (session == null || session.getAttribute("customer") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Retrieve customer object and email
        Customers customer = (Customers) session.getAttribute("customer");
        String customerEmail = customer.getEmail();

        // Debugging (optional)
        System.out.println("Customer email: " + customerEmail);

        // Fetch prescription orders
        List<prescriptionOrder> prescriptions = PrescriptionOrderService.getPrescriptionsByEmail(customerEmail);
        request.setAttribute("myPrescriptions", prescriptions);

        // Forward to JSP page
        request.getRequestDispatcher("medicineCart.jsp").forward(request, response);
    }
}
