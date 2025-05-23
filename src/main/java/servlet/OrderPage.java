package servlet;

import model.Customers;
import model.ProductCart;
import services.ProductCartService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/OrderPage")
public class OrderPage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customers customer = (Customers) session.getAttribute("customer");

        if (customer == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<ProductCart> cartItems = ProductCartService.getCartItemsByEmail(customer.getEmail());

        request.setAttribute("cartItems", cartItems);
        RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerOrderPage.jsp");
        dispatcher.forward(request, response);
    }
}
