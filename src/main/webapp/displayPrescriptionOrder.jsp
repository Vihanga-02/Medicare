<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Prescription Orders</title>

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

        .action-btns .btn {
            margin-right: 5px;
        }
    </style>
</head>
<body>


<div class="container mt-4">
    <h3 class="mb-3">Prescription Order Management</h3>

    <div class="d-flex justify-content-between mb-3">
        <a href="staffdashboard.jsp" class="btn btn-secondary">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>
        <a href="addPrescriptionOrder.jsp" class="btn btn-success">
            <i class="fas fa-plus"></i> Add New Prescription
        </a>
    </div>

    <div class="table-responsive">
        <table class="table table-bordered table-hover align-middle">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Customer Name</th>
                    <th>Email</th>
                    <th>Medicines</th>
                    <th>Total (LKR)</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty allPrescriptions}">
                        <c:forEach var="p" items="${allPrescriptions}">
                            <tr>
                                <td>${p.id}</td>
                                <td>${p.name}</td>
                                <td>${p.email}</td>
                                <td>${p.medicine}</td>
                                <td>${p.total}</td>
                                <td>${p.status}</td>
                                <td class="action-btns">
                                    <form action="updatePrescriptionOrder.jsp" method="get" class="d-inline">
                                        <input type="hidden" name="id" value="${p.id}">
                                        <button type="submit" class="btn btn-sm btn-warning">
                                            <i class="fas fa-edit"></i> Edit
                                        </button>
                                    </form>
                                    <form action="deletePrescriptionOrder" method="get" class="d-inline" onsubmit="return confirm('Delete this prescription order?');">
                                        <input type="hidden" name="id" value="${p.id}">
                                        <button type="submit" class="btn btn-sm btn-danger">
                                            <i class="fas fa-trash-alt"></i> Delete
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="7" class="text-center">No prescription orders found.</td>
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
