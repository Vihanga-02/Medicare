<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Medicines" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Staff Medicine Display</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            padding: 20px;
        }
        .table th, .table td {
            vertical-align: middle;
        }
        img.medicine-image {
            width: 80px;
            height: auto;
            object-fit: contain;
        }
        .top-buttons {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h3 class="mb-4">Medicine Management</h3>

    <div class="top-buttons">
        <a href="staffdashboard.jsp" class="btn btn-secondary">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>
        <a href="MedicineInsert.jsp" class="btn btn-success">
            <i class="fas fa-plus"></i> Insert New Medicine
        </a>
    </div>

    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Image</th>
                    <th>Price (LKR)</th>
                    <th>Manufacture Date</th>
                    <th>Expire Date</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty allMedicines}">
                        <c:forEach var="medicine" items="${allMedicines}">
                            <tr>
                                <td>${medicine.medicine_id}</td>
                                <td>${medicine.medicine_name}</td>
                                <td>
                                    <img src="MedicineImageDisplay?id=${medicine.medicine_id}" class="medicine-image" alt="Medicine Image"/>
                                </td>
                                <td>${medicine.medicine_price}</td>
                                <td>${medicine.manufacture_date}</td>
                                <td>${medicine.expire_date}</td>
                                <td>${medicine.description}</td>
                                <td>
                                    <a href="EditMedicine?id=${medicine.medicine_id}" class="btn btn-sm btn-warning me-1">
                                        <i class="fas fa-edit"></i> Edit
                                    </a>
                                    <a href="MedicineDelete?medicine_id=${medicine.medicine_id}" class="btn btn-sm btn-danger"
                                       onclick="return confirm('Are you sure you want to delete this medicine?');">
                                        <i class="fas fa-trash-alt"></i> Delete
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="8" class="text-center">No medicines found.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
