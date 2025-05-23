<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Customers" %>
<%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Footer</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/footer.css">
</head>
<body>

<!-- Footer Section -->
<footer class="footer bg-success text-white pt-5 pb-3">
  <div class="container">
    <div class="row">
      <!-- Logo & Info -->
      <div class="col-md-4 mb-4">
        <img src="images/Logo.png" alt="Medicare Logo" style="width: 150px;" class="mb-3">
        <p>MEDICARE is your trusted platform for online medicine and grocery ordering. Quick, safe, and reliable delivery at your fingertips.</p>
      </div>

      <!-- Quick Links -->
      <div class="col-md-4 mb-4">
        <h5 class="text-white fw-bold">Quick Links</h5>
        <ul class="list-unstyled">
          <li><a href="index.jsp" class="text-white text-decoration-none"><i class="fas fa-chevron-right me-2"></i>Home</a></li>
          <li><a href="CustomerMedicineDisplay" class="text-white text-decoration-none"><i class="fas fa-chevron-right me-2"></i>Medicines</a></li>
          <li><a href="<%= isLoggedIn ? "CustomerProductDisplay" : "login.jsp" %>" class="text-white text-decoration-none"><i class="fas fa-chevron-right me-2"></i>Products</a></li>
          <li><a href="<%= isLoggedIn ? "DisplayCustomerPrescription" : "login.jsp" %>" class="text-white text-decoration-none"><i class="fas fa-chevron-right me-2"></i>My Prescriptions</a></li>
          <li><a href="<%= isLoggedIn ? "ViewOrdersServlet" : "login.jsp" %>" class="text-white text-decoration-none"><i class="fas fa-chevron-right me-2"></i>My Orders</a></li>
          <li><a href="aboutus.jsp" class="text-white text-decoration-none"><i class="fas fa-chevron-right me-2"></i>About Us</a></li>
        </ul>
      </div>

      <!-- Contact Info & Social -->
      <div class="col-md-4 mb-4">
        <h5 class="text-white fw-bold">Contact Us</h5>
        <p><i class="fas fa-map-marker-alt me-2"></i>No. 123, Galle Road, Colombo, Sri Lanka</p>
        <p><i class="fas fa-phone me-2"></i>+94 77 123 4567</p>
        <div class="social-icons mt-3">
          <a href="https://www.facebook.com/" class="text-white me-3 fs-5"><i class="fab fa-facebook-f"></i></a>
          <a href="https://www.instagram.com/" class="text-white me-3 fs-5"><i class="fab fa-instagram"></i></a>
          <a href="https://www.youtube.com/" class="text-white me-3 fs-5"><i class="fab fa-youtube"></i></a>
          <a href="https://www.tiktok.com/" class="text-white fs-5"><i class="fab fa-tiktok"></i></a>
        </div>
      </div>
    </div>

    <!-- Bottom Line -->
    <div class="text-center border-top border-white pt-3 mt-4">
      <small>&copy; 2025 MEDICARE. All Rights Reserved.</small>
    </div>
  </div>
</footer>
<!-- Footer Section End -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
