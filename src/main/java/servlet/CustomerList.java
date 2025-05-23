package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Customers;
import services.CustomerService;

@WebServlet("/CustomerList")
public class CustomerList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 CustomerService customerService = new CustomerService();
	        List<Customers> customersList = customerService.getAllCustomers();

	        request.setAttribute("customersList", customersList);
	        RequestDispatcher dispatcher = request.getRequestDispatcher("CustomerList.jsp");
	        dispatcher.forward(request, response);
	}

}
