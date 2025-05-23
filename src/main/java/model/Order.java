package model;

import java.sql.Date;

public class Order {
    private int orderId;
    private String customerEmail;
    private String fullName;
    private String address;
    private String city;
    private String postalCode;
    private Date orderDate;
    private double totalPrice;
    private String cardNumber;

    public Order() {}

    public Order(String customerEmail, String fullName, String address, String city, String postalCode, double totalPrice, String cardNumber) {
        this.customerEmail = customerEmail;
        this.fullName = fullName;
        this.address = address;
        this.city = city;
        this.postalCode = postalCode;
        this.totalPrice = totalPrice;
        this.cardNumber = cardNumber;
    }

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getCustomerEmail() {
		return customerEmail;
	}

	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

    // Getters and setters...
    
    
}
