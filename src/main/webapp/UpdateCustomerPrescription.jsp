<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Prescription</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container mt-5">
    <h2 class="text-center mb-4">Update Prescription</h2>
    <form action="UpdateCustomerPrescription" method="post" class="shadow p-4 rounded bg-light">
        <input type="hidden" name="prescription_id" value="${prescription.prescription_id}">

        <div class="mb-3">
            <label class="form-label">First Name</label>
            <input type="text" name="first_name" class="form-control" value="${prescription.first_name}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Last Name</label>
            <input type="text" name="last_name" class="form-control" value="${prescription.last_name}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Age</label>
            <input type="number" name="age" class="form-control" value="${prescription.age}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Phone Number</label>
            <input type="text" name="phone_number" class="form-control" value="${prescription.phone_number}" pattern="\d{10}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Delivery Address</label>
            <textarea name="delivery_address" class="form-control" required>${prescription.delivery_address}</textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Email (readonly)</label>
            <input type="email" name="email" class="form-control" value="${prescription.email}" readonly>
        </div>

        <div class="mb-3">
            <label class="form-label">Medicine Details</label>
            <textarea name="medicine_details" class="form-control" rows="4" required>${prescription.medicine_details}</textarea>
        </div>

        <div class="d-flex justify-content-between">
            <a href="DisplayCustomerPrescription" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Cancel</a>
            <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Update</button>
        </div>
    </form>
</div>
<br> <br>
<jsp:include page="footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
