package services;

import model.Order;
import utils.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderService {
	public static boolean saveOrder(Order order) {
	    String sql = "INSERT INTO orders (customer_email, full_name, address, city, postal_code, order_date, total_price, card_number) VALUES (?, ?, ?, ?, ?, CURRENT_DATE, ?, ?)";

	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	        stmt.setString(1, order.getCustomerEmail());
	        stmt.setString(2, order.getFullName());
	        stmt.setString(3, order.getAddress());
	        stmt.setString(4, order.getCity());
	        stmt.setString(5, order.getPostalCode());
	        stmt.setDouble(6, order.getTotalPrice());
	        stmt.setString(7, order.getCardNumber());

	        return stmt.executeUpdate() > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return false;
	}
	
	public static List<Order> getOrdersByEmail(String email) {
	    List<Order> orders = new ArrayList<>();
	    String sql = "SELECT * FROM orders WHERE customer_email = ?";

	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	        stmt.setString(1, email);
	        ResultSet rs = stmt.executeQuery();

	        while (rs.next()) {
	            Order order = new Order();
	            order.setOrderId(rs.getInt("order_id"));
	            order.setCustomerEmail(rs.getString("customer_email"));
	            order.setFullName(rs.getString("full_name"));
	            order.setAddress(rs.getString("address"));
	            order.setCity(rs.getString("city"));
	            order.setPostalCode(rs.getString("postal_code"));
	            order.setOrderDate(rs.getDate("order_date"));
	            order.setTotalPrice(rs.getDouble("total_price"));
	            order.setCardNumber(rs.getString("card_number"));
	            orders.add(order);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return orders;
	}
	
	public static Order getOrderById(int orderId) {
	    String sql = "SELECT * FROM orders WHERE order_id=?";
	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setInt(1, orderId);
	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            Order order = new Order();
	            order.setOrderId(rs.getInt("order_id"));
	            order.setCustomerEmail(rs.getString("customer_email"));
	            order.setFullName(rs.getString("full_name"));
	            order.setAddress(rs.getString("address"));
	            order.setCity(rs.getString("city"));
	            order.setPostalCode(rs.getString("postal_code"));
	            order.setOrderDate(rs.getDate("order_date"));
	            order.setTotalPrice(rs.getDouble("total_price"));
	            order.setCardNumber(rs.getString("card_number"));
	            return order;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return null;
	}
	
	public static boolean updateOrder(Order order) {
	    String sql = "UPDATE orders SET full_name=?, address=?, city=?, postal_code=? WHERE order_id=?";

	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	        stmt.setString(1, order.getFullName());
	        stmt.setString(2, order.getAddress());
	        stmt.setString(3, order.getCity());
	        stmt.setString(4, order.getPostalCode());
	        stmt.setInt(5, order.getOrderId());

	        return stmt.executeUpdate() > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return false;
	}
	
	public static boolean deleteOrder(int orderId) {
	    String sql = "DELETE FROM orders WHERE order_id=?";

	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	        stmt.setInt(1, orderId);
	        return stmt.executeUpdate() > 0;

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return false;
	}
	
	public static List<Order> getAllOrders() {
	    List<Order> orderList = new ArrayList<>();
	    try (Connection conn = DBConnect.getConnection();
	         PreparedStatement ps = conn.prepareStatement("SELECT * FROM orders");
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {
	            Order o = new Order();
	            o.setOrderId(rs.getInt("order_id"));
	            o.setFullName(rs.getString("full_name"));
	            o.setAddress(rs.getString("address"));
	            o.setCity(rs.getString("city"));
	            o.setPostalCode(rs.getString("postal_code"));
	            o.setTotalPrice(rs.getDouble("total_price"));
	            o.setOrderDate(rs.getDate("order_date"));
	            orderList.add(o);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return orderList;
	}






}
