package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import services.MedicineService;

@WebServlet("/MedicineUpdate")
@MultipartConfig(maxFileSize = 16177215)  // for limit file size
public class MedicineUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
            // DEBUG: Print parameters to console for troubleshooting
            System.out.println("medicine_id: " + request.getParameter("medicine_id"));
            System.out.println("medicine_name: " + request.getParameter("medicine_name"));
            System.out.println("medicine_price: " + request.getParameter("medicine_price"));
            System.out.println("manufacture_date: " + request.getParameter("manufacture_date"));
            System.out.println("expire_date: " + request.getParameter("expire_date"));
            System.out.println("description: " + request.getParameter("description"));

            // Get parameters safely
            int medicine_id = Integer.parseInt(request.getParameter("medicine_id"));
            String medicine_name = request.getParameter("medicine_name");
            double medicine_price = Double.parseDouble(request.getParameter("medicine_price"));
            
            String manuDateStr = request.getParameter("manufacture_date");
            String expDateStr = request.getParameter("expire_date");

            if (manuDateStr == null || expDateStr == null || manuDateStr.isEmpty() || expDateStr.isEmpty()) {
                throw new IllegalArgumentException("Date fields must not be empty.");
            }

            Date manufacture_date = Date.valueOf(manuDateStr);
            Date expire_date = Date.valueOf(expDateStr);
            
            if (medicine_price < 0) {
                throw new IllegalArgumentException("Price cannot be negative.");
            }
            if (manufacture_date.after(expire_date)) {
                throw new IllegalArgumentException("Manufacture date cannot be after expiry date.");
            }

            String description = request.getParameter("description");

            // Handle image
            Part filePart = request.getPart("medicine_image");
            InputStream inputStream = null;
            byte[] medicine_image = null;

            if (filePart != null && filePart.getSize() > 0) {
                inputStream = filePart.getInputStream();
                medicine_image = inputStream.readAllBytes();
            } else {
                // No new image uploaded, fetch existing image from DB
                medicine_image = MedicineService.getById(String.valueOf(medicine_id)).get(0).getMedicine_image();
            }

            // Update DB
            boolean isTrue = MedicineService.updatedata(medicine_id, medicine_name, medicine_image, medicine_price, manufacture_date, expire_date, description);

            if (isTrue) {
                response.getWriter().println("<script>alert('Data Updated Successfully'); window.location='MedicineDisplay';</script>");
            } else {
                RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
                dis2.forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<script>alert('Error: " + e.getMessage() + "'); window.location='wrong.jsp';</script>");
        }
	}

}
