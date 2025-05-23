<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Staff Login</title>
<!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link rel="stylesheet" type="text/css" href="css/stafflogin.css">
</head>
<body>

<jsp:include page="header.jsp" />
<div class="container my-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
      <% if (request.getAttribute("error") != null) { %>
  <div class="alert alert-danger text-center" role="alert">
    <%= request.getAttribute("error") %>
  </div>
<% } %>
        <form class="login-card needs-validation" novalidate action="StaffLogin" method="post">

          <h2 class="text-center login-title mb-4"><i class="fas fa-user-shield"></i> Staff Login</h2>
  
          <div class="mb-3">
            <label for="staffEmail" class="form-label">Email Address</label>
            <input type="email" class="form-control" id="staffEmail" name="email" required>
            <div class="invalid-feedback">Please enter a valid staff email address.</div>
          </div>
  
          <div class="mb-4">
            <label for="staffPassword" class="form-label">Password</label>
            <input type="password" class="form-control" id="staffPassword" name="password" required minlength="6">
            <div class="invalid-feedback">Please enter your password (at least 6 characters).</div>
          </div>
  
          <div class="d-grid gap-2">
            <button type="submit" class="btn btn-success"><i class="fas fa-user-shield me-2"></i>Login</button>
            <a href="login.jsp" class="btn btn-secondary"><i class="fas fa-user me-2"></i>Login as Customer</a>
          </div>
        </form>
      </div>
    </div>
  </div>
<jsp:include page="footer.jsp" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>