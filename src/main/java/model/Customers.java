package model;

import java.sql.Date;

public class Customers {
	
	private int customer_id;
    private String first_name;
    private String last_name;
    private Date dob; 
    private String gender;
    private String contact;
    private String email;
    private String address;
    private String password;
    
    public Customers() {}
    
	public Customers(int customer_id, String first_name, String last_name, Date dob, String gender, String contact,
			String email, String address, String password) {
		super();
		this.customer_id = customer_id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.dob = dob;
		this.gender = gender;
		this.contact = contact;
		this.email = email;
		this.address = address;
		this.password = password;
	}
	
	// Constructor without ID For Registration
	public Customers(String first_name, String last_name, Date dob, String gender, String contact, String email,
			String address, String password) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.dob = dob;
		this.gender = gender;
		this.contact = contact;
		this.email = email;
		this.address = address;
		this.password = password;
	}

	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
    
    
}
