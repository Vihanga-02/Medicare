package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.prescriptionOrder;
import services.PrescriptionOrderService;

@WebServlet("/displayPrescriptionS")
public class displayPrescriptionS extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public displayPrescriptionS() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try {
            List<prescriptionOrder> allPrescriptions = PrescriptionOrderService.getAllPrescriptions();
            request.setAttribute("allPrescriptions", allPrescriptions);

            RequestDispatcher dispatcher = request.getRequestDispatcher("displayPrescriptionOrder.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            // Log the exception and redirect to an error page if needed
            e.printStackTrace(); // Consider using a logger in production
            request.setAttribute("errorMessage", "Error retrieving prescription orders.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp"); // Make sure error.jsp exists
            dispatcher.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
