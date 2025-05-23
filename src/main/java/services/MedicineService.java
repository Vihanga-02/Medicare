package services;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Medicines;
import model.Products;
import utils.DBConnect;

public class MedicineService {
	
	// Insert data function
    public static boolean insertdata(String medicine_name, byte[] medicine_image, double medicine_price,
                                     Date manufacture_date, Date expire_date, String description) {
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DBConnect.getConnection();
            String sql = "INSERT INTO medicines (medicine_name, medicine_image, medicine_price, manufacture_date, expire_date, description) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, medicine_name);
            pstmt.setBytes(2, medicine_image);
            pstmt.setDouble(3, medicine_price);
            pstmt.setDate(4, manufacture_date);
            pstmt.setDate(5, expire_date);
            pstmt.setString(6, description);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }
    
 // Get Medicine by ID
    public static List<Medicines> getById(String medicine_id) {
        List<Medicines> medicineList = new ArrayList<>();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            int convertedID = Integer.parseInt(medicine_id);
            con = DBConnect.getConnection();
            String sql = "SELECT * FROM medicines WHERE medicine_id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, convertedID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("medicine_id");
                String name = rs.getString("medicine_name");
                byte[] image = rs.getBytes("medicine_image");
                double price = rs.getDouble("medicine_price");
                Date mfgDate = rs.getDate("manufacture_date");
                Date expDate = rs.getDate("expire_date");
                String desc = rs.getString("description");

                Medicines md = new Medicines(id, name, image, price, mfgDate, expDate, desc);
                medicineList.add(md);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return medicineList;
    }
    
 // Get all Medicines
    public static List<Medicines> getAllMedicines() {
        List<Medicines> medicines = new ArrayList<>();

        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM medicines";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("medicine_id");
                String name = rs.getString("medicine_name");
                byte[] image = rs.getBytes("medicine_image");
                double price = rs.getDouble("medicine_price");
                Date mfgDate = rs.getDate("manufacture_date");
                Date expDate = rs.getDate("expire_date");
                String desc = rs.getString("description");

                Medicines md = new Medicines(id, name, image, price, mfgDate, expDate, desc);
                medicines.add(md);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return medicines;
    }
    
    //Update Data Function 
    public static boolean updatedata(int medicine_id, String medicine_name, byte[] medicine_image, double medicine_price,
            Date manufacture_date, Date expire_date, String description) {

        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DBConnect.getConnection();
            String sql = "UPDATE medicines SET medicine_name=?, medicine_image=?, medicine_price=?, manufacture_date=?, expire_date=?, description=? WHERE medicine_id=?";
            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, medicine_name);
            pstmt.setBytes(2, medicine_image);
            pstmt.setDouble(3, medicine_price);
            pstmt.setDate(4, manufacture_date);
            pstmt.setDate(5, expire_date);
            pstmt.setString(6, description);
            pstmt.setInt(7, medicine_id); // WHERE clause

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }
    
 // Delete Data
    public static boolean deletedata(String medicine_id) {
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            int convID = Integer.parseInt(medicine_id);
            con = DBConnect.getConnection();
            String sql = "DELETE FROM medicines WHERE medicine_id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, convID);

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }
}
