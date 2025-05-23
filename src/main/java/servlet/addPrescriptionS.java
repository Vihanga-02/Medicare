package servlet;

import java.io.IOException;
import services.PrescriptionOrderService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addPrescriptionS")
public class addPrescriptionS extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public addPrescriptionS() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 try {
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
        
        boolean isTrue= PrescriptionOrderService.insertPrescription(Cname,Cemail,medicines,totalPrice,status);
        
        if (isTrue) {
            response.getWriter().println("<script>alert('order Inserted Successfully'); window.location='displayPrescriptionS';</script>");
        } else {
            RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
            dis2.forward(request, response);
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.getWriter().println("<script>alert('Error: " + e.getMessage() + "'); window.location='addPrescriptionOrder.jsp';</script>");
    }
}
}
