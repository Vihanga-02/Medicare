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


@WebServlet("/updatePrescriptionS")
public class updatePrescriptionS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
            int id = Integer.parseInt(request.getParameter("id"));
            prescriptionOrder prescription = PrescriptionOrderService.getById(id).get(0);

            request.setAttribute("prescription", prescription); // Make it available in JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("updatePrescriptionOrder.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Error loading prescription: " + e.getMessage() + "'); window.location='displayPrescriptionS';</script>");
        }
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {	
		int id= Integer.parseInt(request.getParameter("p_id"));
		String Cname= request.getParameter("customer_name");
		String Cemail= request.getParameter("customer_email");
		String[] medicineNames = request.getParameterValues("medicine_name[]");
        String[] medicineQuantities = request.getParameterValues("medicine_quantity[]");
        double totalPrice = Double.parseDouble(request.getParameter("total_price"));
        String status = request.getParameter("status");

        StringBuilder medicines = new StringBuilder();
        for (int i = 0; i < medicineNames.length; i++) {
            medicines.append(medicineNames[i])
                     .append(" (Qty: ")
                     .append(medicineQuantities[i])
                     .append(")");
            if (i < medicineNames.length - 1) {
                medicines.append(", ");
            }
        }
        
        String Medicines=medicines.toString();
        
        boolean isTrue= PrescriptionOrderService.updatedata(id,Cname,Cemail,Medicines,totalPrice,status);
        
        if (isTrue == true) {
        	List<prescriptionOrder> allPrescriptions = PrescriptionOrderService.getById(id);
            request.setAttribute("allPrescriptions", allPrescriptions);

            response.getWriter().println("<script>alert('Prescription Order Updated Successfully'); window.location='displayPrescriptionS';</script>");
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
            dis2.forward(request, response);
        }
	}
	catch (Exception e) {
        e.printStackTrace();
        response.getWriter().println("<script>alert('Error: " + e.getMessage() + "'); window.location='addPrescriptionOrder.jsp';</script>");
    }
	}

}
