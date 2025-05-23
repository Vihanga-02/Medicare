<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/signup.css">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container my-5">
  <div class="row justify-content-center">
    <div class="col-lg-8">
      <form class="signup-form needs-validation" action="CustomerSignUp" method="post">
        <h2 class="text-center form-title mb-4"><i class="fa-solid fa-user-plus"></i> Create Your Medicare Account</h2>
		<% if (request.getAttribute("error") != null) { %>
  			<div class="alert alert-danger text-center" role="alert">
   		 <%= request.getAttribute("error") %>
  			</div>
		<% } %>
        <div class="row mb-3">
          <div class="col-md-6">
            <label for="firstName" class="form-label">First Name</label>
            <input type="text" class="form-control" name="first_Name" id="first_Name" required>
            <div class="invalid-feedback">Please enter your first name.</div>
          </div>
          <div class="col-md-6">
            <label for="lastName" class="form-label">Last Name</label>
            <input type="text" class="form-control" name="last_Name" id="last_Name" required>
            <div class="invalid-feedback">Please enter your last name.</div>
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-md-6">
            <label for="dob" class="form-label">Date of Birth</label>
            <input type="date" class="form-control" name="dob" id="dob" required>
            <div class="invalid-feedback">Please enter your date of birth.</div>
          </div>
          <div class="col-md-6">
            <label class="form-label d-block">Gender</label>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="gender" id="male" value="male" required>
              <label class="form-check-label" for="male">Male</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="gender" id="female" value="female" required>
              <label class="form-check-label" for="female">Female</label>
            </div>
            <div class="invalid-feedback d-block">Please select your gender.</div>
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-md-6">
            <label for="contact" class="form-label">Contact Number</label>
            <input type="tel" class="form-control" name="contact" id="contact" pattern="[0-9]{10}" required>
            <div class="invalid-feedback">Enter a valid 10-digit phone number.</div>
          </div>
          <div class="col-md-6">
            <label for="email" class="form-label">Email Address</label>
            <input type="email" class="form-control" name="email" id="email" required>
            <div class="invalid-feedback">Please enter a valid email address.</div>
          </div>
        </div>

        <div class="mb-3">
          <label for="address" class="form-label">Address</label>
          <textarea class="form-control" name="address" id="address" rows="2" required></textarea>
          <div class="invalid-feedback">Please enter your address.</div>
        </div>

        <div class="row mb-3">
          <div class="col-md-6">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" name="password" id="password" required>
          </div>
          <div class="col-md-6">
            <label for="confirmPassword" class="form-label">Confirm Password</label>
            <input type="password" class="form-control" id="confirmPassword" required>
            <div class="invalid-feedback" id="passwordMismatch">Passwords do not match.</div>
          </div>
        </div>

        <div class="text-center mt-4">
          <button type="submit" class="btn btn-success px-4 me-2"><i class="fas fa-user-plus"></i> Sign Up</button>
          <button type="reset" class="btn btn-secondary px-4"><i class="fas fa-rotate-left"></i> Reset</button>
        </div>
      </form>
    </div>
  </div>
</div>

 <jsp:include page="footer.jsp" />

<!-- Bootstrap JS + Form Validation -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  (() => {
    'use strict';
    const forms = document.querySelectorAll('.needs-validation');
    forms.forEach(form => {
      form.addEventListener('submit', e => {
        if (!form.checkValidity()) {
          e.preventDefault();
          e.stopPropagation();
        } else {
          const password = document.getElementById('password').value;
          const confirmPassword = document.getElementById('confirmPassword').value;
          if (password !== confirmPassword) {
        	  e.preventDefault();
        	  e.stopPropagation();
        	  document.getElementById('passwordMismatch').style.display = 'block';
        	} else {
        	  document.getElementById('passwordMismatch').style.display = 'none';
        	}

        }
        form.classList.add('was-validated');
      }, false);
    });
  })();
</script>
</body>
</html>
