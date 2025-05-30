package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/StaffLogout")
public class StaffLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 HttpSession session = request.getSession(false); // Fetch session if exists

	        if (session != null) {
	            session.removeAttribute("staff"); // Remove staff object from session
	            session.invalidate(); // Invalidate session
	        }

	        response.sendRedirect("index.jsp"); // Redirect to homepage
	}

}
