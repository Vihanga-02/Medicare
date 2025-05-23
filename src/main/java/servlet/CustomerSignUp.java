package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Customers;
import services.CustomerService;

@WebServlet("/CustomerSignUp")
public class CustomerSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String firstName = request.getParameter("first_Name");
        String lastName = request.getParameter("last_Name");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String contact = request.getParameter("contact");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String password = request.getParameter("password");

        Connection con = null;
        PreparedStatement checkPs = null;
        PreparedStatement insertPs = null;
        ResultSet rs = null;

        try {
        	
        	con = utils.DBConnect.getConnection();

            // Check if email already exists
            String checkQuery = "SELECT email FROM customers WHERE email = ?";
            checkPs = con.prepareStatement(checkQuery);
            checkPs.setString(1, email);
            rs = checkPs.executeQuery();

            if (rs.next()) {
                // Email exists
                request.setAttribute("error", "Email already registered. Please use a different email.");
                RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
                dispatcher.forward(request, response);
            } else {
                // Email is unique, insert user
                String insertQuery = "INSERT INTO customers (first_name, last_name, dob, gender, contact, email, address, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                insertPs = con.prepareStatement(insertQuery);
                insertPs.setString(1, firstName);
                insertPs.setString(2, lastName);
                insertPs.setString(3, dob);
                insertPs.setString(4, gender);
                insertPs.setString(5, contact);
                insertPs.setString(6, email);
                insertPs.setString(7, address);
                insertPs.setString(8, password);

             // Parse date
                Date dobSql = Date.valueOf(dob);

                // Create Customer object
                Customers newCustomer = new Customers(firstName, lastName, dobSql, gender, contact, email, address, password);

                // Use service class
                CustomerService service = new CustomerService();
                boolean isInserted = service.insertCustomer(newCustomer);

                if (isInserted) {
                    response.sendRedirect("login.jsp");
                } else {
                    request.setAttribute("error", "Registration failed. Please try again.");
                    request.getRequestDispatcher("signup.jsp").forward(request, response);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred. Please try again later.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
            dispatcher.forward(request, response);
        } finally {
            try {
                if (rs != null) rs.close();
                if (checkPs != null) checkPs.close();
                if (insertPs != null) insertPs.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
	}

}
