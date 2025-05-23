<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Staff Dashboard</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/staffdashboard.css">
</head>
<body>
<%@ include file="staffheader.jsp" %>
<!-- Main Content Area -->
  <div class="main-content">
    <h3 class="mb-4">Welcome to Your Dashboard</h3>
    <div class="dashboard-cards row">
      <!-- Grocery Products Card -->
      <div class="col-md-4 my-3">
        <div class="card p-4 text-center">
          <i class="fas fa-apple-alt fa-2x text-success mb-3"></i>
          <h5>Grocery Products</h5>
          <p>Manage and update grocery stock in real-time.</p>
          <span class="badge bg-success mb-2">56 Items in Stock</span>
          <button class="btn btn-outline-success btn-sm mt-2">View Products</button>
        </div>
      </div>

      <!-- Prescriptions Card -->
      <div class="col-md-4 my-3">
        <div class="card p-4 text-center">
          <i class="fas fa-file-medical fa-2x text-primary mb-3"></i>
          <h5>Prescriptions</h5>
          <p>Review and assign prescriptions to pharmacists.</p>
          <span class="badge bg-primary mb-2">12 Pending Reviews</span>
          <button class="btn btn-outline-primary btn-sm mt-2">Check Queue</button>
        </div>
      </div>

      <!-- Orders & Staff Card -->
      <div class="col-md-4 my-3">
        <div class="card p-4 text-center">
          <i class="fas fa-box-open fa-2x text-warning mb-3"></i>
          <h5>Orders & Staff</h5>
          <p>Manage delivery statuses and assign staff roles.</p>
          <div class="d-flex justify-content-center gap-2 mb-2">
            <span class="badge bg-warning text-dark">8 New Orders</span>
            <span class="badge bg-info text-dark">3 Active Staff</span>
          </div>
          <button class="btn btn-outline-warning btn-sm mt-2">Track Orders</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>