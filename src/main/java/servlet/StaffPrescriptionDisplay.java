package servlet;

import model.Prescriptions;
import services.PrescriptionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/StaffPrescriptionDisplay")
public class StaffPrescriptionDisplay extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Prescriptions> prescriptions = PrescriptionService.getAllPrescriptions();
        request.setAttribute("prescriptions", prescriptions);
        request.getRequestDispatcher("StaffPrescriptionDisplay.jsp").forward(request, response);
    }
}
