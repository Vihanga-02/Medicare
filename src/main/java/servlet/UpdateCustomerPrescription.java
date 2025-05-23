package servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import services.PrescriptionService;

@WebServlet("/UpdateCustomerPrescription")
public class UpdateCustomerPrescription extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int prescriptionId = Integer.parseInt(request.getParameter("prescription_id"));
            String firstName = request.getParameter("first_name");
            String lastName = request.getParameter("last_name");
            int age = Integer.parseInt(request.getParameter("age"));
            String phone = request.getParameter("phone_number");
            String address = request.getParameter("delivery_address");
            String email = request.getParameter("email");
            String medicineDetails = request.getParameter("medicine_details");
            
            //calling the service class to perform update

            boolean success = PrescriptionService.updateCustomerPrescription(prescriptionId, firstName, lastName, age, phone, address, email, medicineDetails);
            //checking update successfull or not

            if (success) {
                response.sendRedirect("DisplayCustomerPrescription");
            } else {
                request.setAttribute("error", "Update failed. Please try again.");
                request.getRequestDispatcher("UpdateCustomerPrescription.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("DisplayCustomerPrescription");
        }
    }
}
