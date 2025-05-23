package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.prescriptionOrder;
import utils.DBConnect;

public class PrescriptionOrderService {
	
	//insert prescriptions to the table
	public static boolean insertPrescription(String Cname, String Cemail , StringBuilder medicines , double totalPrice, String status ) {
		 Connection con = null;
	     Statement stmt = null;
	        
	     boolean isSuccess= false;
	     
	      try {
	    	  con = DBConnect.getConnection();
	           stmt = con.createStatement();
	    	  
	    	  String query= "INSERT INTO prescriptionOrders (name, email, medicine, total, status) VALUES ('"+Cname+"', '"+Cemail+"', '"+medicines+"',"+totalPrice+",'"+status+"')";
	    	  
	    	  int ar =stmt.executeUpdate(query);
	    	  
	    	  if (ar > 0) {
	                isSuccess = true;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return isSuccess;
	}
	//get elements by id
	public static List<prescriptionOrder> getById(int prescriptionId) {
	    List<prescriptionOrder> prescriptionList = new ArrayList<>();
	    
	    //int convertedID = Integer.parseInt(prescriptionId);

	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    Statement stmt=null;

	    try {
	    	
	        con = DBConnect.getConnection();
	        stmt =con.createStatement();
	        
	        String sql = "SELECT * FROM prescriptionOrders WHERE p_id = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, prescriptionId);

	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            int id = rs.getInt("p_id");
	            String name = rs.getString("name");
	            String email = rs.getString("email");
	            String medicine = rs.getString("medicine");
	            double total = rs.getDouble("total");
	            String status = rs.getString("status");

	            prescriptionOrder p = new prescriptionOrder(id,name,email,medicine,total,status);
	            prescriptionList.add(p);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return prescriptionList;
	}
	// get all the prescriptions 
	public static List<prescriptionOrder> getAllPrescriptions() {
	    List<prescriptionOrder> prescriptions = new ArrayList<>();

	    Connection con = null;
	    Statement stmt = null;
	    ResultSet rs = null;

	    try {
	        con = DBConnect.getConnection();
	        stmt = con.createStatement();
	        String sql = "SELECT * FROM prescriptionOrders";
	        rs = stmt.executeQuery(sql);

	        while (rs.next()) {
	            int id = rs.getInt("p_id");
	            String name = rs.getString("name");
	            String email = rs.getString("email");
	            String medicine = rs.getString("medicine");
	            double total = rs.getDouble("total");
	            String status = rs.getString("status");

	            prescriptionOrder p = new prescriptionOrder(id, name, email, medicine, total, status);
	            prescriptions.add(p);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return prescriptions;
	}
	// update prescription
	public static boolean updatedata(int id, String name, String email, String medicines, double total, String status) {

	    boolean isSuccess = false;
	    Connection con = null;
	    PreparedStatement pstmt = null;

	    try {
	        con = DBConnect.getConnection();
	        String sql = "UPDATE prescriptionOrders SET name=?, email=?, medicine=?, total=?, status=? WHERE p_id=?";
	        pstmt = con.prepareStatement(sql);

	        pstmt.setString(1, name);
	        pstmt.setString(2, email);
	        pstmt.setString(3, medicines);
	        pstmt.setDouble(4, total);
	        pstmt.setString(5, status);
	        pstmt.setInt(6, id); // WHERE clause

	        int rowsAffected = pstmt.executeUpdate();
	        if (rowsAffected > 0) {
	            isSuccess = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isSuccess;
	}

	// delete prescription
	
	public static boolean deletedata(String id) {
	    boolean isSuccess = false;
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    
	    int Id= Integer.parseInt(id);
	    try {
	        con = DBConnect.getConnection();
	        String sql = "DELETE FROM prescriptionOrders WHERE p_id = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, Id);

	        int rowsAffected = pstmt.executeUpdate();
	        if (rowsAffected > 0) {
	            isSuccess = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return isSuccess;
	}

	//get all the prescriptions by the email
	
	public static List<prescriptionOrder> getPrescriptionsByEmail(String email) {
	    List<prescriptionOrder> prescriptions = new ArrayList<>();
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        con = DBConnect.getConnection();
	        String sql = "SELECT * FROM prescriptionOrders WHERE email = ?";
	        pstmt = con.prepareStatement(sql);
	        pstmt.setString(1, email);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            int id = rs.getInt("p_id");
	            String name = rs.getString("name");
	            String medicine = rs.getString("medicine");
	            double total = rs.getDouble("total");
	            String status = rs.getString("status");

	            prescriptionOrder p = new prescriptionOrder(id, name, email, medicine, total, status);
	            prescriptions.add(p);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return prescriptions;
	}
	
	// delete all prescriptions by customer email
		public static boolean deletePrescriptionsByEmail(String email) {
		    boolean isSuccess = false;
		    Connection con = null;
		    PreparedStatement pstmt = null;

		    try {
		        con = DBConnect.getConnection();
		        String sql = "DELETE FROM prescriptionOrders WHERE email = ?";
		        pstmt = con.prepareStatement(sql);
		        pstmt.setString(1, email);

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
