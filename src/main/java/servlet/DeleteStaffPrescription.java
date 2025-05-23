package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.PrescriptionService;

@WebServlet("/DeleteStaffPrescription")
public class DeleteStaffPrescription extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 String idStr = request.getParameter("id");
	        if (idStr != null) {
	            int id = Integer.parseInt(idStr);
	            boolean result = PrescriptionService.deletePrescriptionById(id);
	            if (result) {
	                request.getSession().setAttribute("message", "Prescription deleted by staff.");
	            } else {
	                request.getSession().setAttribute("message", "Staff deletion failed.");
	            }
	        }
	        response.sendRedirect("StaffPrescriptionDisplay"); // Redirect to staff dashboard page
	}

}
