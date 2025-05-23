package servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Customers;
import services.ProductCartService;

@WebServlet("/ClearCart")
public class ClearCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        Customers customer = (Customers) session.getAttribute("customer");

        if (customer != null) {
            ProductCartService.clearCart(customer.getEmail());
        }

        response.sendRedirect("ViewProductCart");
    }
}
