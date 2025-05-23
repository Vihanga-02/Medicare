package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Order;
import services.OrderService;


@WebServlet("/AdminViewOrders")
public class AdminViewOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     

	        List<Order> orders = OrderService.getAllOrders(); // Implement this method in your service
	        request.setAttribute("orders", orders);
	        request.getRequestDispatcher("AdminOrders.jsp").forward(request, response);
	    }
	}
