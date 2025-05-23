package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Customers;
import model.Order;
import services.OrderService;

@WebServlet("/ViewOrdersServlet")
public class ViewOrdersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Customers customer = (Customers) session.getAttribute("customer");

        if (customer == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Order> orders = OrderService.getOrdersByEmail(customer.getEmail());
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("MyOrders.jsp").forward(request, response);
    }
}



