package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.ProductService;

@WebServlet("/ProductUpdate")
@MultipartConfig(maxFileSize = 16177215)  //limit file size
public class ProductUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // DEBUG: Print parameters to console for troubleshooting
            System.out.println("product_id: " + request.getParameter("product_id"));
            System.out.println("product_name: " + request.getParameter("product_name"));
            System.out.println("product_price: " + request.getParameter("product_price"));
            System.out.println("manufacture_date: " + request.getParameter("manufacture_date"));
            System.out.println("expire_date: " + request.getParameter("expire_date"));
            System.out.println("description: " + request.getParameter("description"));

            // Get parameters safely
            int product_id = Integer.parseInt(request.getParameter("product_id"));
            String product_name = request.getParameter("product_name");
            double product_price = Double.parseDouble(request.getParameter("product_price"));
            
            String manuDateStr = request.getParameter("manufacture_date");
            String expDateStr = request.getParameter("expire_date");

            if (manuDateStr == null || expDateStr == null || manuDateStr.isEmpty() || expDateStr.isEmpty()) {
                throw new IllegalArgumentException("Date fields must not be empty.");
            }

            Date manufacture_date = Date.valueOf(manuDateStr);
            Date expire_date = Date.valueOf(expDateStr);

            String description = request.getParameter("description");

            // Handle image
            Part filePart = request.getPart("product_image");
            InputStream inputStream = null;
            byte[] product_image = null;

            if (filePart != null && filePart.getSize() > 0) {
                inputStream = filePart.getInputStream();
                product_image = inputStream.readAllBytes();
            } else {
                // No new image uploaded, fetch existing image from DB
                product_image = ProductService.getById(String.valueOf(product_id)).get(0).getProduct_image();
            }

            // Update DB
            boolean isTrue = ProductService.updatedata(product_id, product_name, product_image,
                    product_price, manufacture_date, expire_date, description);

            if (isTrue) {
                response.getWriter().println("<script>alert('Data Updated Successfully'); window.location='ProductDisplay';</script>");
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
