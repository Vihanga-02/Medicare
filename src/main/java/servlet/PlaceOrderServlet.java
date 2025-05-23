package servlet;

import model.Customers;
import model.Order;
import model.ProductCart;
import services.OrderService;
import services.ProductCartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/PlaceOrder")
public class PlaceOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

        if (fullName == null || address == null || city == null || postalCode == null || cardNumber == null ||
            fullName.isEmpty() || address.isEmpty() || city.isEmpty() || postalCode.isEmpty() || cardNumber.isEmpty()) {

            request.setAttribute("error", "Please fill in all delivery and payment details.");
            request.getRequestDispatcher("OrderCheckout.jsp").forward(request, response);
            return;
        }

        List<ProductCart> cartItems = ProductCartService.getCartItemsByEmail(customer.getEmail());

        if (cartItems == null || cartItems.isEmpty()) {
            request.setAttribute("error", "Your cart is empty.");
            request.getRequestDispatcher("OrderCheckout.jsp").forward(request, response);
            return;
        }

        double totalPrice = 0.0;
        for (ProductCart item : cartItems) {
            totalPrice += item.getPrice() * item.getQuantity();
        }

        Order order = new Order(
            customer.getEmail(),
            fullName,
            address,
            city,
            postalCode,
            totalPrice,
            cardNumber
        );

        boolean saved = OrderService.saveOrder(order);

        if (saved) {
            // Optionally clear the cart after successful order
            ProductCartService.clearCart(customer.getEmail());

            request.setAttribute("message", "Your order has been placed successfully!");
            response.sendRedirect("ViewOrdersServlet");
        } else {
            request.setAttribute("error", "Something went wrong. Please try again.");
            request.getRequestDispatcher("OrderCheckout.jsp").forward(request, response);
        }
    }
}
