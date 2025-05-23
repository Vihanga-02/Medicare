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

@WebServlet("/ProductInsert")
@MultipartConfig(maxFileSize = 1024 * 1024 * 10) // 10MB limit
public class ProductInsert extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Get basic parameters
            String product_name = request.getParameter("product_name");
            double product_price = Double.parseDouble(request.getParameter("product_price"));
            Date manufacture_date = Date.valueOf(request.getParameter("manufacture_date"));
            Date expire_date = Date.valueOf(request.getParameter("expire_date"));
            String description = request.getParameter("description");

            // Get image part
            Part filePart = request.getPart("product_image");
            InputStream inputStream = null;
            if (filePart != null) {
                inputStream = filePart.getInputStream();
            }

            // Read image into byte array
            byte[] product_image = null;
            if (inputStream != null) {
                product_image = inputStream.readAllBytes();
            }

            // Call service
            boolean isTrue = ProductService.insertdata(product_name, product_image, product_price, manufacture_date, expire_date, description);

            if (isTrue) {
                response.getWriter().println("<script>alert('Data Inserted Successfully'); window.location='ProductDisplay';</script>");
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
