package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import services.PrescriptionOrderService;

@WebServlet("/deletePrescriptionOrder")
public class deletePrescriptionOrder extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String p_id = request.getParameter("id");
        

        try {
            boolean isDeleted = PrescriptionOrderService.deletedata(p_id);

            if (isDeleted) {
                response.getWriter().println("<script>alert('Prescription Order deleted successfully!'); window.location='displayPrescriptionS';</script>");
            } else {
                response.getWriter().println("<script>alert('Failed to delete prescription Order.'); window.location='displayPrescriptionS';</script>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Error occurred: " + e.getMessage() + "'); window.location='wrong.jsp';</script>");
        }
    }
}
