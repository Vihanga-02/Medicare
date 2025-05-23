package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.MedicineService;
import services.ProductService;

@WebServlet("/MedicineDelete")
public class MedicineDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String medicine_id = request.getParameter("medicine_id");

        try {
            boolean isDeleted = MedicineService.deletedata(medicine_id);

            if (isDeleted) {
                response.getWriter().println("<script>alert('Product deleted successfully!'); window.location='MedicineDisplay';</script>");
            } else {
                response.getWriter().println("<script>alert('Failed to delete product.'); window.location='MedicineDisplay';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Error occurred: " + e.getMessage() + "'); window.location='wrong.jsp';</script>");
        }
	}

}
