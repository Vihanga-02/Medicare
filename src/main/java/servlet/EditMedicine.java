package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Medicines;
import services.MedicineService;

@WebServlet("/EditMedicine")
public class EditMedicine extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String medicine_id = request.getParameter("id");

        if (medicine_id != null) {
            List<Medicines> medicine = MedicineService.getById(medicine_id);

            if (medicine != null && !medicine.isEmpty()) {
                request.setAttribute("medicine", medicine);
                RequestDispatcher dispatcher = request.getRequestDispatcher("MedicineUpdate.jsp");
                dispatcher.forward(request, response);
            } else {
                response.getWriter().println("<script>alert('Medicine not found'); window.location='MedicineDisplay';</script>");
            }
        } else {
            response.getWriter().println("<script>alert('Invalid medicine ID'); window.location='MedicineDisplay';</script>");
        }
    }

}
