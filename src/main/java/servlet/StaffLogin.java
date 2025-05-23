package servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import model.Staff;
import utils.DBConnect;

@WebServlet("/StaffLogin")
public class StaffLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		try (Connection con = DBConnect.getConnection();
			 PreparedStatement pst = con.prepareStatement("SELECT * FROM staff WHERE email=? AND password=?")) {

			pst.setString(1, email);
			pst.setString(2, password);

			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				Staff staff = new Staff(
					rs.getInt("staff_id"),
					rs.getString("first_name"),
					rs.getString("last_name"),
					rs.getString("email"),
					rs.getString("password"),
					rs.getString("phone"),
					rs.getString("gender"),
					rs.getDate("dob"),
					rs.getString("role"),
					rs.getDate("join_date"),
					rs.getString("status")
				);

				HttpSession session = request.getSession();
				session.setAttribute("staff", staff);

				response.sendRedirect("staffdashboard.jsp"); // Make sure you create this page
			} else {
				request.setAttribute("error", "Invalid Email or Password");
				RequestDispatcher dispatcher = request.getRequestDispatcher("stafflogin.jsp");
				dispatcher.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}
}
