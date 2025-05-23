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

@WebServlet("/EditProduct")
public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String product_id = request.getParameter("id");

	        if (product_id != null) {
	            List<Products> product = ProductService.getById(product_id);

	            if (product != null && !product.isEmpty()) {
	                request.setAttribute("product", product);
	                RequestDispatcher dispatcher = request.getRequestDispatcher("ProductUpdate.jsp");
	                dispatcher.forward(request, response);
	            } else {
	                response.getWriter().println("<script>alert('Product not found'); window.location='ProductDisplay';</script>");
	            }
	        } else {
	            response.getWriter().println("<script>alert('Invalid product ID'); window.location='ProductDisplay';</script>");
	        }
	}

}
