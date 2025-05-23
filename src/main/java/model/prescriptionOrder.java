package model;

public class prescriptionOrder {
	
	private int id;
	private String name;
	private String email;
	private String medicine;
	private double total;
	private String status;
	
	public prescriptionOrder(int id,String name, String email, String medicine, double total, String status) {
		
		this.id=id;
		this.name = name;
		this.email = email;
		this.medicine = medicine;
		this.total = total;
		this.status = status;
		
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMedicine() {
		return medicine;
	}
	public void setMedicine(String medicine) {
		this.medicine = medicine;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}
