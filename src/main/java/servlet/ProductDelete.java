package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.ProductService;

@WebServlet("/ProductDelete")
public class ProductDelete extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String product_id = request.getParameter("product_id");

        try {
            boolean isDeleted = ProductService.deletedata(product_id);

            if (isDeleted) {
                response.getWriter().println("<script>alert('Product deleted successfully!'); window.location='ProductDisplay';</script>");
            } else {
                response.getWriter().println("<script>alert('Failed to delete product.'); window.location='ProductDisplay';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Error occurred: " + e.getMessage() + "'); window.location='wrong.jsp';</script>");
        }
    }
}
