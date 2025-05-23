<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container my-5">
  <div class="row justify-content-center">
    <div class="col-md-6">
  
  <% String error = (String) request.getAttribute("error"); %>
  <% if (error != null) { %>
    <div class="alert alert-danger text-center" role="alert">
      <%= error %>
    </div>
  <% } %>

  <form class="login-card needs-validation" action="CustomerLogin" method="post" novalidate>
    <h2 class="text-center login-title mb-4"><i class="fas fa-sign-in-alt"></i> Login to Medicare</h2>

    <div class="mb-3">
      <label for="email" class="form-label">Email Address</label>
      <input type="email" class="form-control" id="email" name="email" required>
      <div class="invalid-feedback">Please enter a valid email address.</div>
    </div>

    <div class="mb-4">
      <label for="password" class="form-label">Password</label>
      <input type="password" class="form-control" id="password" name="password" required>
      <div class="invalid-feedback">Invalid Password.</div>
    </div>

    <div class="d-grid gap-2">
      <button type="submit" class="btn btn-success"><i class="fas fa-sign-in-alt me-2"></i>Login</button>
      <a href="stafflogin.jsp" class="btn btn-secondary"><i class="fas fa-user-shield me-2"></i>Login as Staff</a>
    </div>
  </form>
</div>
    
  </div>
</div>
 <jsp:include page="footer.jsp" />
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>