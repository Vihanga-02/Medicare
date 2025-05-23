package services;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Products;
import utils.DBConnect;

public class ProductService {

    // Insert data function
    public static boolean insertdata(String product_name, byte[] product_image, double product_price,
                                     Date manufacture_date, Date expire_date, String description) {
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DBConnect.getConnection();
            String sql = "INSERT INTO products (product_name, product_image, product_price, manufacture_date, expire_date, description) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, product_name);
            pstmt.setBytes(2, product_image);
            pstmt.setDouble(3, product_price);
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

    // Get product by ID
    public static List<Products> getById(String product_id) {
        List<Products> productList = new ArrayList<>();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            int convertedID = Integer.parseInt(product_id);
            con = DBConnect.getConnection();
            String sql = "SELECT * FROM products WHERE product_id = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, convertedID);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("product_id");
                String name = rs.getString("product_name");
                byte[] image = rs.getBytes("product_image");
                double price = rs.getDouble("product_price");
                Date mfgDate = rs.getDate("manufacture_date");
                Date expDate = rs.getDate("expire_date");
                String desc = rs.getString("description");

                Products pd = new Products(id, name, image, price, mfgDate, expDate, desc);
                productList.add(pd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return productList;
    }

    // Get all products
    public static List<Products> getAllProducts() {
        List<Products> products = new ArrayList<>();

        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            String sql = "SELECT * FROM products";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("product_id");
                String name = rs.getString("product_name");
                byte[] image = rs.getBytes("product_image");
                double price = rs.getDouble("product_price");
                Date mfgDate = rs.getDate("manufacture_date");
                Date expDate = rs.getDate("expire_date");
                String desc = rs.getString("description");

                Products pd = new Products(id, name, image, price, mfgDate, expDate, desc);
                products.add(pd);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return products;
    }
    
    //Update Data Function 
    public static boolean updatedata(int product_id, String product_name, byte[] product_image, double product_price,
            Date manufacture_date, Date expire_date, String description) {

        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DBConnect.getConnection();
            String sql = "UPDATE products SET product_name=?, product_image=?, product_price=?, manufacture_date=?, expire_date=?, description=? WHERE product_id=?";
            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, product_name);
            pstmt.setBytes(2, product_image);
            pstmt.setDouble(3, product_price);
            pstmt.setDate(4, manufacture_date);
            pstmt.setDate(5, expire_date);
            pstmt.setString(6, description);
            pstmt.setInt(7, product_id); // WHERE clause

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
    public static boolean deletedata(String product_id) {
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            int convID = Integer.parseInt(product_id);
            con = DBConnect.getConnection();
            String sql = "DELETE FROM products WHERE product_id = ?";
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


