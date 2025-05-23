// services/ProductCartService.java
package services;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.ProductCart;
import utils.DBConnect;

public class ProductCartService {

    // Insert product to cart
    public static boolean addToCart(ProductCart cartItem) {
        String sql = "INSERT INTO productcart (customer_email, product_id, product_name, price, quantity) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, cartItem.getCustomerEmail());
            stmt.setInt(2, cartItem.getProductId());
            stmt.setString(3, cartItem.getProductName());
            stmt.setDouble(4, cartItem.getPrice());
            stmt.setInt(5, cartItem.getQuantity());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    // Fetch all cart items for a customer
    public static List<ProductCart> getCartItemsByEmail(String customerEmail) {
        List<ProductCart> cartItems = new ArrayList<>();
        String sql = "SELECT * FROM productcart WHERE customer_email = ?";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, customerEmail);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ProductCart item = new ProductCart(
                    rs.getInt("cart_id"),
                    rs.getString("customer_email"),
                    rs.getInt("product_id"),
                    rs.getString("product_name"),
                    rs.getDouble("price"),
                    rs.getInt("quantity")
                );
                cartItems.add(item);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cartItems;
    }

    public static void clearCart(String email) {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBConnect.getConnection(); // replace with your connection method
            String sql = "DELETE FROM productcart WHERE customer_email = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    

}
