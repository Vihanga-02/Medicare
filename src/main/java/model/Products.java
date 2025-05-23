package model;

import java.sql.Date;

public class Products {
	
	 	private int product_id;
	    private String product_name;
	    private byte[] product_image;
	    private double product_price;
	    private Date manufacture_date;
	    private Date expire_date;
	    private String description;
	    
		public Products(int product_id, String product_name, byte[] product_image, double product_price,
				Date manufacture_date, Date expire_date, String description) {
			super();
			this.product_id = product_id;
			this.product_name = product_name;
			this.product_image = product_image;
			this.product_price = product_price;
			this.manufacture_date = manufacture_date;
			this.expire_date = expire_date;
			this.description = description;
		}
		public int getProduct_id() {
			return product_id;
		}
		public void setProduct_id(int product_id) {
			this.product_id = product_id;
		}
		public String getProduct_name() {
			return product_name;
		}
		public void setProduct_name(String product_name) {
			this.product_name = product_name;
		}
		public byte[] getProduct_image() {
			return product_image;
		}
		public void setProduct_image(byte[] product_image) {
			this.product_image = product_image;
		}
		public double getProduct_price() {
			return product_price;
		}
		public void setProduct_price(double product_price) {
			this.product_price = product_price;
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
