<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload Prescription</title>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/index.css">

</head>
<body>

<jsp:include page="header.jsp" />
<br><br>

<div class="container">
    <h2 class="text-center mb-4"><i class="fas fa-file-medical"></i> Upload Prescription</h2>

    <form action="PrescriptionInsert" method="post" class="p-4 shadow-lg rounded bg-light">
        
        <!-- Prescription ID (Hidden or optional for user input) -->
        <input type="hidden" name="prescription_id">

        <div class="mb-3">
            <label class="form-label"><i class="fas fa-user"></i> First Name</label>
            <input type="text" class="form-control" name="first_name" required>
        </div>

        <div class="mb-3">
            <label class="form-label"><i class="fas fa-user"></i> Last Name</label>
            <input type="text" class="form-control" name="last_name" required>
        </div>

        <div class="mb-3">
            <label class="form-label"><i class="fas fa-calendar"></i> Age</label>
            <input type="number" class="form-control" name="age" min="0" required>
        </div>

        <div class="mb-3">
            <label class="form-label"><i class="fas fa-phone"></i> Phone Number</label>
            <input type="text" class="form-control" name="phone_number" pattern="\d{10}" required>

        </div>

        <div class="mb-3">
            <label class="form-label"><i class="fas fa-location-dot"></i> Delivery Address</label>
            <textarea class="form-control" name="delivery_address" rows="3" required></textarea>
        </div>
        
        <div class="mb-3">
            <label class="form-label"><i class="fas fa-location-dot"></i> Medicine Details</label>
            <textarea class="form-control" name="medicine_details" rows="5" required></textarea>
        </div>

        <!-- Buttons -->
         <div class="d-flex justify-content-between">
            <a href="index.jsp" class="btn btn-secondary">
             <i class="fas fa-arrow-left"></i> Back
         </a>
        <button type="submit" class="btn btn-success">
        <i class="fas fa-upload"></i> Upload Prescription
      </button>
</div>

    </form>
</div>

<br><br>
<jsp:include page="footer.jsp" />

</body>
</html>
