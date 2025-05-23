package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Customers;
import model.ProductCart;
import services.ProductCartService;

@WebServlet("/ViewOrderPage")
public class ViewOrderPage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customers customer = (Customers) session.getAttribute("customer");

        if (customer == null) {
            response.sendRedirect("login.jsp");
            return;
        }


        List<ProductCart> cartItems = ProductCartService.getCartItemsByEmail(customer.getEmail());

        if (cartItems.isEmpty()) {
            session.setAttribute("cart_message", "Cart is empty. Add items first.");
            response.sendRedirect("ViewProductCart");
            return;
        }

        request.setAttribute("cartItems", cartItems);
        RequestDispatcher dispatcher = request.getRequestDispatcher("OrderPage.jsp");
        dispatcher.forward(request, response);
    }
}


