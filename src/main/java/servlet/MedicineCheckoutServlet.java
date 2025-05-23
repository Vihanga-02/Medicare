package servlet;

import model.Customers;
import model.prescriptionOrder;

import services.PrescriptionOrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/MedicineCheckoutServlet")
public class MedicineCheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Customers customer = (Customers) session.getAttribute("customer");

        if (customer == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Fetch prescription orders
        List<prescriptionOrder> prescriptions = PrescriptionOrderService.getPrescriptionsByEmail(customer.getEmail());
        
        if (prescriptions.isEmpty()) {
            session.setAttribute("medicine_message", "Your medicine cart is empty.");
            response.sendRedirect("MedicineCartServlet");
            return;
        }

        // Calculate grand total
        double grandTotal = 0;
        for (prescriptionOrder p : prescriptions) {
            grandTotal += p.getTotal();
        }

        request.setAttribute("prescriptions", prescriptions);
        request.setAttribute("grandTotal", grandTotal);
        request.getRequestDispatcher("medicineCheckout.jsp").forward(request, response);
    }
}