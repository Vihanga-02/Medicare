package servlet;

import model.Customers;
import services.PrescriptionOrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ClearMedicineCart")
public class ClearMedicineCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("customer") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Customers customer = (Customers) session.getAttribute("customer");
        String email = customer.getEmail();

        boolean cleared = PrescriptionOrderService.deletePrescriptionsByEmail(email);

        if (cleared) {
            session.setAttribute("message", "Medicine cart cleared successfully.");
        } else {
            session.setAttribute("error", "Failed to clear medicine cart.");
        }

        response.sendRedirect("MedicineCartServlet");  // Refresh the cart page
    }
}
