package model;

public class Prescriptions {
	
	private int prescription_id;
	private String first_name;
	private String last_name;
	private int age;
	private String phone_number;
	private String delivery_address;
	private String email;
	private String medicine_details;
	
	
	public Prescriptions(int prescription_id, String first_name, String last_name, int age, String phone_number,
			String delivery_address, String email, String medicine_details) {
		super();
		this.prescription_id = prescription_id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.age = age;
		this.phone_number = phone_number;
		this.delivery_address = delivery_address;
		this.email = email;
		this.medicine_details = medicine_details;
	}


	public int getPrescription_id() {
		return prescription_id;
	}


	public void setPrescription_id(int prescription_id) {
		this.prescription_id = prescription_id;
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


	public int getAge() {
		return age;
	}


	public void setAge(int age) {
		this.age = age;
	}


	public String getPhone_number() {
		return phone_number;
	}


	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}


	public String getDelivery_address() {
		return delivery_address;
	}


	public void setDelivery_address(String delivery_address) {
		this.delivery_address = delivery_address;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getMedicine_details() {
		return medicine_details;
	}


	public void setMedicine_details(String medicine_details) {
		this.medicine_details = medicine_details;
	}
	
	

}
