<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Orders</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="container mt-5">
    <h2 class="mb-4 text-center">My Orders</h2>

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
                    <a href="EditOrder.jsp?id=${order.orderId}" class="btn btn-warning btn-sm">
                        <i class="fas fa-edit"></i> Edit
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Additional Page Fill Content -->
    <div class="row mt-5">
        <!-- Summary card -->
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h5 class="card-title"><i class="fas fa-receipt text-primary"></i> Order Summary</h5>
                    <p class="card-text">You have placed <strong>${fn:length(orders)}</strong> orders. <br>Keep track of all your deliveries here.</p>
                </div>
            </div>
        </div>

        <!-- Help section -->
        <div class="col-md-6">
            <div class="card shadow-sm bg-light">
                <div class="card-body">
                    <h5 class="card-title"><i class="fas fa-headset text-success"></i> Need Help?</h5>
                    <p class="card-text">If you have any issues with your orders, contact our customer support at <a href="mailto:support@medicare.com">support@medicare.com</a> or call <strong>+94 77 123 4567</strong>.</p>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS (optional for interactions) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
<br><br>
<jsp:include page="footer.jsp" />
</body>
</html>
