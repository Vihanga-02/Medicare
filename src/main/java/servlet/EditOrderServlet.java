package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Order;
import services.OrderService;

@WebServlet("/EditOrderServlet")
public class EditOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String postalCode = request.getParameter("postalCode");

        Order order = new Order();
        order.setOrderId(orderId);
        order.setFullName(fullName);
        order.setAddress(address);
        order.setCity(city);
        order.setPostalCode(postalCode);

        boolean updated = OrderService.updateOrder(order);

        if (updated) {
            response.sendRedirect("ViewOrdersServlet");
        } else {
            request.setAttribute("error", "Update failed");
            request.getRequestDispatcher("EditOrder.jsp").forward(request, response);
        }
    }
}


