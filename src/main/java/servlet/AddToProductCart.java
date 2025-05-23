package servlet;

import model.Customers;
import model.ProductCart;
import services.ProductCartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;


@WebServlet("/AddToProductCart")
public class AddToProductCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 // Check if customer is logged in
        HttpSession session = request.getSession();
        Customers customer = (Customers) session.getAttribute("customer");

        if (customer == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("productName");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));

            ProductCart cartItem = new ProductCart(
                customer.getEmail(),
                productId,
                productName,
                price,
                quantity
            );

            boolean added = ProductCartService.addToCart(cartItem);

            if (added) {
                session.setAttribute("cart_message", "Item added to cart!");
            } else {
                session.setAttribute("cart_message", "Failed to add item.");
            }

            response.sendRedirect("CustomerProductDisplay");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("CustomerProductDisplay");
        }
	}

}
