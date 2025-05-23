<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/index.css">
  
</head>
<body>
<jsp:include page="header.jsp" />
 <!-- ✅ Hero Section Start -->
 <div id="heroCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000">
    <div class="carousel-inner">

      <!-- Slide 1 -->
      <div class="carousel-item active">
        <div class="hero-slide" style="background-image: url('images/vimage1.jpg');">
          <div class="hero-content">
            <h1>Bringing Medicines to Your Doorstep</h1>
            <p>Fast, reliable, and safe online medicine orders</p>
            <%
    		String prescriptionLink = (session.getAttribute("customer") != null) ? "PrescriptionInsert.jsp" : "login.jsp";
			%>
			<a href="<%= prescriptionLink %>" class="btn btn-prescription">
  			<i class="fas fa-file-medical"></i> Upload Prescription
			</a>
            
          </div>
        </div>
      </div>

      <!-- Slide 2 -->
      <div class="carousel-item">
        <div class="hero-slide" style="background-image: url('images/vimage2.jpg');">
          <div class="hero-content">
            <h1>Easy Access to Health Essentials</h1>
            <p>Order groceries and medicines from one platform</p>
            <%
    		prescriptionLink = (session.getAttribute("customer") != null) ? "PrescriptionInsert.jsp" : "login.jsp";
			%>
			<a href="<%= prescriptionLink %>" class="btn btn-prescription">
  			<i class="fas fa-file-medical"></i> Upload Prescription
			</a>
          </div>
        </div>
      </div>

      <!-- Slide 3 -->
      <div class="carousel-item">
        <div class="hero-slide" style="background-image: url('images/vimage3.jpg');">
          <div class="hero-content">
            <h1>Your Health is Our Priority</h1>
            <p>Quick delivery and trusted service across the city</p>
            <%
    		prescriptionLink = (session.getAttribute("customer") != null) ? "PrescriptionInsert.jsp" : "login.jsp";
			%>
			<a href="<%= prescriptionLink %>" class="btn btn-prescription">
  			<i class="fas fa-file-medical"></i> Upload Prescription
			</a>
          </div>
        </div>
      </div>

      <!-- Slide 4 -->
      <div class="carousel-item">
        <div class="hero-slide" style="background-image: url('images/vimage4.jpg');">
          <div class="hero-content">
            <h1>Trusted by Thousands</h1>
            <p>Serving customers with care and responsibility</p>
            <%
    		prescriptionLink = (session.getAttribute("customer") != null) ? "PrescriptionInsert.jsp" : "login.jsp";
			%>
			<a href="<%= prescriptionLink %>" class="btn btn-prescription">
  			<i class="fas fa-file-medical"></i> Upload Prescription
			</a>
          </div>
        </div>
      </div>

      <!-- Slide 5 -->
      <div class="carousel-item">
        <div class="hero-slide" style="background-image: url('images/vimage5.jpg');">
          <div class="hero-content">
            <h1>24/7 Support and Fast Delivery</h1>
            <p>Your partner in good health, anytime, anywhere</p>
            <%
    		prescriptionLink = (session.getAttribute("customer") != null) ? "PrescriptionInsert.jsp" : "login.jsp";
			%>
			<a href="<%= prescriptionLink %>" class="btn btn-prescription">
  			<i class="fas fa-file-medical"></i> Upload Prescription
			</a>
          </div>
        </div>
      </div>

    </div>

    <!-- Prev / Next Arrows -->
    <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>

    <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
  <!-- ✅ Hero Section End -->  

  <!-- Latest Updates & News Section -->
<section class="latest-news-section py-5 bg-light">
    <div class="container">
      <h2 class="text-center mb-4 text-success fw-bold">
        <i class="fas fa-bullhorn me-2"></i>Latest Updates & News
      </h2>
      <div class="row g-4">
        <!-- Card 1 -->
        <div class="col-md-4">
          <div class="card h-100 shadow-sm news-card">
            <img src="images/vimage7.jpg" class="card-img-top" alt="Grocery News">
            <div class="card-body">
              <h5 class="card-title text-success"><i class="fas fa-shopping-basket me-2"></i>New Grocery Arrivals</h5>
              <p class="card-text">Fresh stock of organic products just arrived! Explore a wide variety of healthy options now in store.</p>
            </div>
          </div>
        </div>
  
        <!-- Card 2 -->
        <div class="col-md-4">
          <div class="card h-100 shadow-sm news-card">
            <img src="images/vimage6.jpg" class="card-img-top" alt="Medicine News">
            <div class="card-body">
              <h5 class="card-title text-success"><i class="fas fa-prescription-bottle-alt me-2"></i>Medicine Updates</h5>
              <p class="card-text">Top up your prescriptions faster! We've improved our medicine order processing and delivery time.</p>
            </div>
          </div>
        </div>
  
        <!-- Card 3 -->
        <div class="col-md-4">
          <div class="card h-100 shadow-sm news-card">
            <img src="images/vimage5.jpg" class="card-img-top" alt="Support News">
            <div class="card-body">
              <h5 class="card-title text-success"><i class="fas fa-headset me-2"></i>24/7 Support Available</h5>
              <p class="card-text">Our dedicated team is now available 24/7 to help with your prescriptions, orders, and deliveries.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
 <jsp:include page="footer.jsp" />
  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>