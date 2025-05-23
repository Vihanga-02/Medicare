<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Customer Prescriptions</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>

<body>
<div class="container mt-5">
    <h2 class="mb-4 text-center">All Customer Prescriptions</h2>
    <div class="d-flex justify-content-start mb-3">
        <a href="staffdashboard.jsp" class="btn btn-outline-primary">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
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
                        <c:forEach var="p" items="${prescriptions}">
                            <tr>
                                <td>${p.prescription_id}</td>
                                <td>${p.first_name} ${p.last_name}</td>
                                <td>${p.age}</td>
                                <td>${p.phone_number}</td>
                                <td>${p.delivery_address}</td>
                                <td>${p.email}</td>
                                <td>${p.medicine_details}</td>
                                <td class="text-center">
                                    <a href="DeleteStaffPrescription?id=${p.prescription_id}" class="btn btn-sm btn-danger"
                                       onclick="return confirm('Are you sure you want to delete this prescription?');">
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
