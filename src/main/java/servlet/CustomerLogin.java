package servlet;


import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Customers;
import utils.DBConnect;

@WebServlet("/CustomerLogin")
public class CustomerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		try (Connection con = DBConnect.getConnection(); 
		     PreparedStatement pst = con.prepareStatement("SELECT * FROM customers WHERE email=? AND password=?")) {

			pst.setString(1, email);
			pst.setString(2, password);

			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				Customers customer = new Customers(
						rs.getInt("customer_id"),
						rs.getString("first_name"),
						rs.getString("last_name"),
						rs.getDate("dob"),
						rs.getString("gender"),
						rs.getString("contact"),
						rs.getString("email"),
						rs.getString("address"),
						rs.getString("password")
				);

				HttpSession session = request.getSession();
				session.setAttribute("customer", customer);

				response.sendRedirect("index.jsp");
			} else {
				request.setAttribute("error", "Invalid Email or Password");
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

}
