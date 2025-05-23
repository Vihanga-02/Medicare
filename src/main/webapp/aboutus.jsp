<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us</title>
<!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp" />
<!-- Hero Section -->
  <section class="about-hero d-flex align-items-center justify-content-center text-center text-white" style="height: 60vh; background: linear-gradient(rgba(0,128,0,0.5), rgba(0,128,0,0.6)), url('images/vimage6.jpg') no-repeat center center/cover;">
      <div>
          <h1 class="display-4 fw-bold">About Medicare</h1>
          <p class="lead">Your trusted partner in digital healthcare and convenience</p>
      </div>
  </section>
  
  <!-- About Section -->
  <section class="container py-5">
      <div class="row align-items-center">
          <div class="col-md-6">
              <img src="images/vimage8.jpg" alt="About Medicare" class="img-fluid rounded shadow">
          </div>
          <div class="col-md-6">
              <h2>Who We Are</h2>
              <p class="text-muted">Medicare is an innovative online platform designed to simplify access to medications and grocery needs from the comfort of your home. Whether it's uploading prescriptions or having groceries delivered, we're here for your convenience.</p>
          </div>
      </div>
  </section>
  
  <!-- Mission Section -->
  <section class="bg-light py-5">
      <div class="container text-center">
          <h2 class="mb-4">Our Mission & Values</h2>
          <p class="text-muted mb-5">At Medicare, we're dedicated to offering quick, secure, and affordable health and wellness services through technology. Your care is our commitment.</p>
          <div class="row">
              <div class="col-md-4 mb-4">
                  <i class="fas fa-leaf fa-3x text-success mb-3"></i>
                  <h5>Sustainability</h5>
                  <p class="text-muted">We focus on eco-friendly practices and community health.</p>
              </div>
              <div class="col-md-4 mb-4">
                  <i class="fas fa-shield-alt fa-3x text-success mb-3"></i>
                  <h5>Security</h5>
                  <p class="text-muted">Your medical data and privacy are fully protected.</p>
              </div>
              <div class="col-md-4 mb-4">
                  <i class="fas fa-heartbeat fa-3x text-success mb-3"></i>
                  <h5>Care</h5>
                  <p class="text-muted">We care deeply about your health and your time.</p>
              </div>
          </div>
      </div>
  </section>
  
  <!-- Team/Support Section -->
  <section class="container py-5">
      <div class="text-center mb-5">
          <h2>Meet Our Team</h2>
          <p class="text-muted">The faces behind the support you trust.</p>
      </div>
      <div class="row text-center">
          <div class="col-md-4">
              <i class="fas fa-user-md fa-3x text-success mb-2"></i>
              <h6>Pharmacists</h6>
              <p class="text-muted">Certified professionals ensuring you get the right meds on time.</p>
          </div>
          <div class="col-md-4">
              <i class="fas fa-truck fa-3x text-success mb-2"></i>
              <h6>Suppliers</h6>
              <p class="text-muted">Efficient partners who manage and deliver grocery & medicine stocks.</p>
          </div>
          <div class="col-md-4">
              <i class="fas fa-cogs fa-3x text-success mb-2"></i>
              <h6>Admins</h6>
              <p class="text-muted">They keep the system running smoothly and securely.</p>
          </div>
      </div>
  </section>
  <jsp:include page="footer.jsp" />
  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>