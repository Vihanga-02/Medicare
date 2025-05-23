package services;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Prescriptions;
import utils.DBConnect; 

public class PrescriptionService {

    // Method to insert prescription data into the database
    public static boolean insertPrescriptionData(String first_name, String last_name, int age, String phone_number, String delivery_address, String email, String medicine_details) {
        
        boolean isSuccess = false; // Track operation success
        Connection con = null;
        Statement stmt = null;

        try {
            // Establish connection to database
            con = DBConnect.getConnection();
            // Create a SQL statement
            stmt = con.createStatement();

            // SQL INSERT query — prescription_id is auto-incremented, so not included here
            String sql = "INSERT INTO prescriptions (first_name, last_name, age, phone_number, delivery_address, email, medicine_details) " +
                         "VALUES ('" + first_name + "', '" + last_name + "', " + age + ", '" + phone_number + "', '" + delivery_address + "', '" + email + "', '" + medicine_details + "')";

            // Execute the INSERT query
            int result = stmt.executeUpdate(sql);

            // Check if the insert was successful
            if (result > 0) {
                isSuccess = true;
            }

        } catch (Exception e) {
            // Print any exception details
            e.printStackTrace();
        }

        // Return whether the insert was successful
        return isSuccess;
    }
    
 // Method to display prescription data into the customer side
    //Retrieves all prescriptions for a logged-in customer based on their email.
    public static List<Prescriptions> getPrescriptionsByCustomerEmail(String email) {
        List<Prescriptions> prescriptions = new ArrayList<>();//To hold the all prescriptions for logged-in cusromer

        try (Connection con = DBConnect.getConnection();
             Statement stmt = con.createStatement()) {

            String sql = "SELECT * FROM prescriptions WHERE email = '" + email + "'";
            ResultSet rs = stmt.executeQuery(sql);//Execute and get the results

            while (rs.next()) {
                Prescriptions p = new Prescriptions(
                        rs.getInt("prescription_id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getInt("age"),
                        rs.getString("phone_number"),
                        rs.getString("delivery_address"),
                        rs.getString("email"),
                        rs.getString("medicine_details")
                );
                prescriptions.add(p);//add the prescription objects to the list
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return prescriptions;
    }
    
 // Method to display prescription data into the staff side
    public static List<Prescriptions> getAllPrescriptions() {
        List<Prescriptions> prescriptions = new ArrayList<>();

        try (Connection con = DBConnect.getConnection();
             Statement stmt = con.createStatement()) {

            String sql = "SELECT * FROM prescriptions";
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Prescriptions p = new Prescriptions(
                        rs.getInt("prescription_id"),
                        rs.getString("first_name"),
                        rs.getString("last_name"),
                        rs.getInt("age"),
                        rs.getString("phone_number"),
                        rs.getString("delivery_address"),
                        rs.getString("email"),
                        rs.getString("medicine_details")
                );
                prescriptions.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return prescriptions;
    }
    
 // Method to update prescription data in to the database
    public static Prescriptions getPrescriptionById(int id) {
        Prescriptions prescription = null;// Initialize the prescription object as null
        try (Connection con = DBConnect.getConnection();
             Statement stmt = con.createStatement()) {

            String sql = "SELECT * FROM prescriptions WHERE prescription_id=" + id;// SQL query to select the prescription with the prescription  ID
            ResultSet rs = stmt.executeQuery(sql);
         // If a record is found, create a Prescriptions object from the result
            if (rs.next()) {
            	prescription = new Prescriptions(
            			//fetch details
                    rs.getInt("prescription_id"),
                    rs.getString("first_name"),
                    rs.getString("last_name"),
                    rs.getInt("age"),
                    rs.getString("phone_number"),
                    rs.getString("delivery_address"),
                    rs.getString("email"),
                    rs.getString("medicine_details")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return prescription;// Return the fetched prescription or if not found return null
    }
    
    
//To update an existing prescription record in the database
    public static boolean updateCustomerPrescription(int prescriptionId, String firstName, String lastName, int age, String phone, String address, String email, String medicineDetails) {
        boolean isSuccess = false;
        try (Connection con = DBConnect.getConnection();
             Statement stmt = con.createStatement()) {

            String sql = "UPDATE prescriptions SET first_name='" + firstName + "', last_name='" + lastName + "', age=" + age +
                         ", phone_number='" + phone + "', delivery_address='" + address + "', email='" + email +
                         "', medicine_details='" + medicineDetails + "' WHERE prescription_id=" + prescriptionId + " AND email='" + email + "'";
         // Check if the update affected any rows
            int result = stmt.executeUpdate(sql);
            if (result > 0) isSuccess = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }
    
 // Method to delete prescription data into the database
    public static boolean deletePrescriptionById(int prescriptionId) {
        boolean isSuccess = false;
        try (Connection con = DBConnect.getConnection();
             Statement stmt = con.createStatement()) {
        	//To remove the prescription with the prescsription ID
            String sql = "DELETE FROM prescriptions WHERE prescription_id = " + prescriptionId;
            int result = stmt.executeUpdate(sql);
         // Check if a row was succesfully deleted
            if (result > 0) {
                isSuccess = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }



}
