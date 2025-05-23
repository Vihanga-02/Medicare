package servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.DBConnect;

@WebServlet("/MedicineImageDisplay")
public class MedicineImageDisplay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String idParam = request.getParameter("id");

        if (idParam != null) {
            try {
                int medicineId = Integer.parseInt(idParam);

                Connection con = DBConnect.getConnection();
                String sql = "SELECT medicine_image FROM medicines WHERE medicine_id = ?";
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setInt(1, medicineId);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    byte[] imageData = rs.getBytes("medicine_image");

                    response.setContentType("image/jpg");
                    OutputStream out = response.getOutputStream();
                    out.write(imageData);
                    out.close();
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                }

            } catch (Exception e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
	}

}
