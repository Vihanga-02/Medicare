package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Products;
import services.ProductService;

@WebServlet("/ProductDisplay")
public class ProductDisplay extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set encoding
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try {
            // Get all products
            List<Products> allProducts = ProductService.getAllProducts();
            request.setAttribute("allProducts", allProducts);

            // Forward to JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("ProductDisplay.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            // Handle exception and forward to error page or show message
            e.printStackTrace(); // Use proper logging in production
            request.setAttribute("errorMessage", "Error retrieving product list.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp"); // Ensure this page exists
            dispatcher.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
