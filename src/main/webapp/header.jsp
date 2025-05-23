<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Customers" %>
<%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>header</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/header.css">
</head>
<body>
  <!-- Navbar Start -->
  <nav class="navbar navbar-expand-lg shadow-sm sticky-top">
    <div class="container">
      <a class="navbar-brand" href="#">
        <img src="images/Logo.png" alt="Logo" />
        MEDICARE
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarContent">
        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
          <li class="nav-item"><a class="nav-link" href="index.jsp"><b>Home</b></a></li>
          <li class="nav-item"><a class="nav-link" href="CustomerMedicineDisplay"><b>Medicines</b></a></li>

          <li class="nav-item">
            <a class="nav-link" href="<%= isLoggedIn ? "CustomerProductDisplay" : "login.jsp" %>"><b>Products</b></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="<%= isLoggedIn ? "ViewOrdersServlet" : "login.jsp" %>"><b>My Orders</b></a>
          </li>
          <li class="nav-item"><a class="nav-link" href="aboutus.jsp"><b>About Us</b></a></li>
        </ul>

        <% if (isLoggedIn) { %>
          <!-- Cart Icons for Logged-in Users -->
          <div class="d-flex align-items-center ms-3">
            <!-- Medicine Cart Icon -->
            <a href="MedicineCartServlet" class="btn btn-outline-secondary me-2" title="Medicine Cart">
              <i class="fas fa-pills"></i>
            </a>
            <!-- Product Cart Icon -->
            <a href="ViewProductCart" class="btn btn-outline-secondary me-2" title="Product Cart">
              <i class="fas fa-shopping-cart"></i>
            </a>

            <!-- First Name Button -->
            <a href="CustomerProfile" class="btn btn-primary me-2">
              <i class="fas fa-user-circle"></i> <%= customer.getFirst_name() %>
            </a>

            <!-- Logout Button -->
            <a href="CustomerLogout" class="btn btn-danger">Logout</a>
          </div>
        <% } else { %>
          <div class="d-flex ms-3">
            <a href="login.jsp" class="btn btn-login me-2">Login</a>
            <a href="signup.jsp" class="btn btn-signup">Sign Up</a>
          </div>
        <% } %>
      </div>
    </div>
  </nav>
  <!-- Navbar End -->

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
