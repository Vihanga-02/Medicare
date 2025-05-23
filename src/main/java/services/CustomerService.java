package services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Customers;
import utils.DBConnect;

public class CustomerService {
	
	//Insert Customer Details Using SignUp form
	public boolean insertCustomer(Customers customer) {
        boolean isSuccess = false;
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = DBConnect.getConnection();
            String sql = "INSERT INTO customers (first_name, last_name, dob, gender, contact, email, address, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, customer.getFirst_name());
            pstmt.setString(2, customer.getLast_name());
            pstmt.setDate(3, customer.getDob());
            pstmt.setString(4, customer.getGender());
            pstmt.setString(5, customer.getContact());
            pstmt.setString(6, customer.getEmail());
            pstmt.setString(7, customer.getAddress());
            pstmt.setString(8, customer.getPassword());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isSuccess;
    }
	
	//Get Customer Profile Data
	 public Customers getCustomerById(int customerId) {
	        Customers customer = null;
	        Connection con = null;
	        PreparedStatement pstmt = null;

	        try {
	            con = DBConnect.getConnection();
	            String sql = "SELECT * FROM customers WHERE customer_id = ?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setInt(1, customerId);

	            ResultSet rs = pstmt.executeQuery();
	            if (rs.next()) {
	                customer = new Customers();
	                customer.setCustomer_id(rs.getInt("customer_id"));
	                customer.setFirst_name(rs.getString("first_name"));
	                customer.setLast_name(rs.getString("last_name"));
	                customer.setDob(rs.getDate("dob"));
	                customer.setGender(rs.getString("gender"));
	                customer.setContact(rs.getString("contact"));
	                customer.setEmail(rs.getString("email"));
	                customer.setAddress(rs.getString("address"));
	                customer.setPassword(rs.getString("password"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return customer;
	 }
	 
	 //DisplayAll Customers in Dashbaord 
	 public List<Customers> getAllCustomers() {
		    List<Customers> customers = new ArrayList<>();
		    Connection con = null;
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;

		    try {
		        con = DBConnect.getConnection();
		        String sql = "SELECT * FROM customers";
		        pstmt = con.prepareStatement(sql);
		        rs = pstmt.executeQuery();

		        while (rs.next()) {
		            Customers customer = new Customers();
		            customer.setCustomer_id(rs.getInt("customer_id"));
		            customer.setFirst_name(rs.getString("first_name"));
		            customer.setLast_name(rs.getString("last_name"));
		            customer.setDob(rs.getDate("dob"));
		            customer.setGender(rs.getString("gender"));
		            customer.setContact(rs.getString("contact"));
		            customer.setEmail(rs.getString("email"));
		            customer.setAddress(rs.getString("address"));
		            customer.setPassword(rs.getString("password"));
		            customers.add(customer);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return customers;

	 }
	 //Customer Data Update Method
	 public boolean updateCustomer(Customers customer) {
		    boolean isSuccess = false;
		    Connection con = null;
		    PreparedStatement pstmt = null;

		    try {
		        con = DBConnect.getConnection();
		        String sql = "UPDATE customers SET first_name = ?, last_name = ?, dob = ?, gender = ?, contact = ?, email = ?, address = ?, password = ? WHERE customer_id = ?";
		        pstmt = con.prepareStatement(sql);

		        pstmt.setString(1, customer.getFirst_name());
		        pstmt.setString(2, customer.getLast_name());
		        pstmt.setDate(3, customer.getDob());
		        pstmt.setString(4, customer.getGender());
		        pstmt.setString(5, customer.getContact());
		        pstmt.setString(6, customer.getEmail());
		        pstmt.setString(7, customer.getAddress());
		        pstmt.setString(8, customer.getPassword());
		        pstmt.setInt(9, customer.getCustomer_id());

		        int rowsAffected = pstmt.executeUpdate();
		        if (rowsAffected > 0) {
		            isSuccess = true;
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return isSuccess;
		}
	 
	 //CustomerDelete
	 public boolean deleteCustomerById(int customerId) {
		    boolean isSuccess = false;
		    Connection con = null;
		    PreparedStatement pstmt = null;

		    try {
		        con = DBConnect.getConnection();
		        String sql = "DELETE FROM customers WHERE customer_id = ?";
		        pstmt = con.prepareStatement(sql);
		        pstmt.setInt(1, customerId);

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
