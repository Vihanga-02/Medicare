package model;

import java.sql.Date;

public class Medicines {
	
	private int medicine_id;
    private String medicine_name;
    private byte[] medicine_image;
    private double medicine_price;
    private Date manufacture_date;
    private Date expire_date;
    private String description;
	public Medicines(int medicine_id, String medicine_name, byte[] medicine_image, double medicine_price,
			Date manufacture_date, Date expire_date, String description) {
		super();
		this.medicine_id = medicine_id;
		this.medicine_name = medicine_name;
		this.medicine_image = medicine_image;
		this.medicine_price = medicine_price;
		this.manufacture_date = manufacture_date;
		this.expire_date = expire_date;
		this.description = description;
	}
	public int getMedicine_id() {
		return medicine_id;
	}
	public void setMedicine_id(int medicine_id) {
		this.medicine_id = medicine_id;
	}
	public String getMedicine_name() {
		return medicine_name;
	}
	public void setMedicine_name(String medicine_name) {
		this.medicine_name = medicine_name;
	}
	public byte[] getMedicine_image() {
		return medicine_image;
	}
	public void setMedicine_image(byte[] medicine_image) {
		this.medicine_image = medicine_image;
	}
	public double getMedicine_price() {
		return medicine_price;
	}
	public void setMedicine_price(double medicine_price) {
		this.medicine_price = medicine_price;
	}
	public Date getManufacture_date() {
		return manufacture_date;
	}
	public void setManufacture_date(Date manufacture_date) {
		this.manufacture_date = manufacture_date;
	}
	public Date getExpire_date() {
		return expire_date;
	}
	public void setExpire_date(Date expire_date) {
		this.expire_date = expire_date;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
    
    
}
