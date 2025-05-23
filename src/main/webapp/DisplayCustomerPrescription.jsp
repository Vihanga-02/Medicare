<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Prescriptions</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body>
<jsp:include page="header.jsp" />

<div class="container mt-5">
    <h2 class="mb-4 text-center">My Prescriptions</h2>
    <div class="d-flex justify-content-end mb-3">
        <a href="PrescriptionInsert.jsp" class="btn btn-success">
            <i class="fas fa-upload"></i> Upload Prescription
        </a>
    </div>
    <div class="table-responsive">
        <table class="table table-bordered table-striped table-hover">
            <thead class="table-dark text-center">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Age</th>
                    <th>Phone</th>
                    <th>Delivery Address</th>
                    <th>Email</th>
                    <th>Medicine Details</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty prescriptions}">
                        <c:forEach var="prescription" items="${prescriptions}">
                            <tr>
                                <td>${prescription.prescription_id}</td>
                                <td>${prescription.first_name} ${prescription.last_name}</td>
                                <td>${prescription.age}</td>
                                <td>${prescription.phone_number}</td>
                                <td>${prescription.delivery_address}</td>
                                <td>${prescription.email}</td>
                                <td>${prescription.medicine_details}</td>
                                <td class="text-center">
                                    <a href="EditCustomerPrescription?id=${prescription.prescription_id}" class="btn btn-sm btn-primary">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <a href="DeleteCustomerPrescription?id=${prescription.prescription_id}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this prescription?');">
                                        <i class="fas fa-trash-alt"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="8" class="text-center text-muted">No prescriptions found.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
</div>

<!-- Creative Section -->
<div class="container my-5">
    <div class="row text-center">
        <div class="col-md-4 mb-4">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <i class="fas fa-notes-medical fa-3x text-primary mb-3"></i>
                    <h5 class="card-title">Manage Your Prescriptions</h5>
                    <p class="card-text">Easily upload, update, or delete your medical prescriptions in one place.</p>
                    <a href="PrescriptionInsert.jsp" class="btn btn-outline-primary btn-sm">Add New</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <i class="fas fa-pills fa-3x text-success mb-3"></i>
                    <h5 class="card-title">Browse Available Medicines</h5>
                    <p class="card-text">Check our stock of essential medicines and products at your convenience.</p>
                    <a href="CustomerMedicineDisplay" class="btn btn-outline-success btn-sm">View Medicines</a>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <i class="fas fa-info-circle fa-3x text-warning mb-3"></i>
                    <h5 class="card-title">About Us</h5>
                    <p class="card-text">Learn more about our mission to deliver quality healthcare to your doorstep.</p>
                    <a href="aboutus.jsp" class="btn btn-outline-warning btn-sm">Learn More</a>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
