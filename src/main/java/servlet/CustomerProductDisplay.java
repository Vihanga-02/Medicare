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

@WebServlet("/CustomerProductDisplay")
public class CustomerProductDisplay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			// Fetch all products
			List<Products> allProducts = ProductService.getAllProducts();
			
			//For Debug 
			System.out.println("Products fetched: " + allProducts.size());

			// Set products to request
			request.setAttribute("allProducts", allProducts);

			// Forward to JSP
			RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerProductDisplay.jsp");
			dispatcher.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Something went wrong while loading products.");
		}
	}

}
