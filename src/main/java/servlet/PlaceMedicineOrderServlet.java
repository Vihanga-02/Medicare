package servlet;

import model.Customers;
import model.Order;
import model.ProductCart;
import model.prescriptionOrder;
import services.OrderService;
import services.PrescriptionOrderService;
import services.ProductCartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;


@WebServlet("/PlaceMedicineOrder")
public class PlaceMedicineOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Customers customer = (Customers) session.getAttribute("customer");

        if (customer == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String fullName = request.getParameter("deliveryName");
        String address = request.getParameter("deliveryAddress");
        String city = request.getParameter("deliveryCity");
        String postalCode = request.getParameter("deliveryPostalCode");
        String cardNumber = request.getParameter("cardNumber");
        double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));

        // Validate inputs
        if (fullName == null || address == null || city == null || postalCode == null || cardNumber == null ||
            fullName.isEmpty() || address.isEmpty() || city.isEmpty() || postalCode.isEmpty() || cardNumber.isEmpty()) {
            
            request.setAttribute("error", "Please fill in all delivery and payment details.");
            request.getRequestDispatcher("medicineCheckout.jsp").forward(request, response);
            return;
        }

        // Get prescriptions from session or database
        List<prescriptionOrder> prescriptions = PrescriptionOrderService.getPrescriptionsByEmail(customer.getEmail());

        if (prescriptions == null || prescriptions.isEmpty()) {
            request.setAttribute("error", "Your medicine cart is empty.");
            request.getRequestDispatcher("medicineCheckout.jsp").forward(request, response);
            return;
        }

        // Create and save the order
        Order order = new Order(
            customer.getEmail(),
            fullName,
            address,
            city,
            postalCode,
            totalAmount,
            cardNumber
           
        );

        boolean saved = OrderService.saveOrder(order);

        if (saved) {
            // Optionally mark prescriptions as processed
            for (prescriptionOrder p : prescriptions) {
                p.setStatus("Processed");
               
            }
            
            response.sendRedirect("ViewOrdersServlet");
        } else {
            request.setAttribute("error", "Failed to place order. Please try again.");
            request.getRequestDispatcher("medicineCheckout.jsp").forward(request, response);
        }
    }
}