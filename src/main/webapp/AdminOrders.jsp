<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Orders</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <h2 class="mb-4">Order List</h2>
    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
            <tr>
                <th>Order ID</th>
                <th>Full Name</th>
                <th>Address</th>
                <th>City</th>
                <th>Postal Code</th>
                <th>Total Price</th>
                <th>Order Date</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${orders}">
            <tr>
                <td>${order.orderId}</td>
                <td>${order.fullName}</td>
                <td>${order.address}</td>
                <td>${order.city}</td>
                <td>${order.postalCode}</td>
                <td>${order.totalPrice}</td>
                <td>${order.orderDate}</td>
                <td>
                    <a href="DeleteOrderServlet?id=${order.orderId}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
      <!-- Back to Dashboard Button -->
    <div class="text-center mt-4">
        <a href="staffdashboard.jsp" class="btn btn-primary">
            &larr; Back to Dashboard
        </a>
    </div>
</div>

<!-- Bootstrap JS (optional for interactions) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>