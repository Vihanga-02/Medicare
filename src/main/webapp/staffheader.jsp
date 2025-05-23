<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ page import="model.Staff" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Staff Header</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/staffheader.css">
</head>
<body>
 <!-- Top Navbar -->
  <nav class="navbar navbar-expand-lg navbar-dark px-3">
  <a class="navbar-brand" href="#">Medicare Staff Dashboard</a>
  <div class="ms-auto text-white">
	    <%
	      Staff staff = (Staff) session.getAttribute("staff");
	      String fullName = (staff != null) ? staff.getFirstName() + " " + staff.getLastName() : "Guest";
	      String role = (staff != null) ? staff.getRole() : "Unknown Role";
	    %>
    <span><i class="fas fa-user-circle"></i> <strong><%= fullName %></strong></span> |
    <span><i class="fas fa-briefcase"></i> <%= role %></span>
  </div>
</nav>

  <!-- Sidebar Navigation -->
  <div class="sidebar">
    <a href="ProductDisplay"><i class="fas fa-shopping-basket me-2"></i>Grocery Products</a>
    <a href="MedicineDisplay"><i class="fas fa-pills me-2"></i>Medicines</a>
    <a href="StaffPrescriptionDisplay"><i class="fas fa-prescription me-2"></i>Customer Prescriptions</a>
    <a href="displayPrescriptionS"><i class="fas fa-user-nurse me-2"></i>Pharmacist Section</a>
    <a href="AdminViewOrders"><i class="fas fa-truck me-2"></i>Orders</a>
    <a href="CustomerList"><i class="fas fa-users me-2"></i>Customer Management</a>
    <a href="StaffLogout" class="text-danger"><i class="fas fa-sign-out-alt me-2"></i>Logout</a>
  </div>
  
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>