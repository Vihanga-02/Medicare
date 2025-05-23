package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Customers;
import services.CustomerService;


@WebServlet("/CustomerProfile")
public class CustomerProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  HttpSession session = request.getSession(false);
	        
		  if (session != null && session.getAttribute("customer") != null) {
			    Customers customer = (Customers) session.getAttribute("customer");
			    request.setAttribute("customer", customer);
			    request.getRequestDispatcher("CustomerProfile.jsp").forward(request, response);
			} else {
			    response.sendRedirect("login.jsp");
			}

	}

}
