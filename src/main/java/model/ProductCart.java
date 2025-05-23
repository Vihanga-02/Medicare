package model;

public class ProductCart {
    private int cartId;
    private String customerEmail;
    private int productId;
    private String productName;
    private double price;
    private int quantity;

    // Default constructor
    public ProductCart() {}

    // Full constructor
    public ProductCart(int cartId, String customerEmail, int productId, String productName, double price, int quantity) {
        this.cartId = cartId;
        this.customerEmail = customerEmail;
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
    }

    // Constructor without cartId (for insertion)
    public ProductCart(String customerEmail, int productId, String productName, double price, int quantity) {
        this.customerEmail = customerEmail;
        this.productId = productId;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
    }

    // Getters and Setters
    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
