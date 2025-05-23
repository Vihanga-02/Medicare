<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Place Order</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<jsp:include page="header.jsp" />
<br><br>

<div class="container">
    <h2 class="text-center mb-4">Checkout</h2>

    <!-- Cart Summary -->
    <table class="table table-bordered text-center">
        <thead class="table-dark">
            <tr>
                <th>Product</th>
                <th>Qty</th>
                <th>Price (LKR)</th>
                <th>Subtotal</th>
            </tr>
        </thead>
        <tbody>
            <c:set var="total" value="0" />
            <c:forEach var="item" items="${cartItems}">
                <tr>
                    <td>${item.productName}</td>
                    <td>${item.quantity}</td>
                    <td>${item.price}</td>
                    <td>
                        <c:set var="subtotal" value="${item.price * item.quantity}" />
                        ${subtotal}
                        <c:set var="total" value="${total + subtotal}" />
                    </td>
                </tr>
            </c:forEach>
            <tr class="fw-bold">
                <td colspan="3" class="text-end">Total:</td>
                <td>LKR ${total}</td>
            </tr>
        </tbody>
    </table>

    <!-- Delivery Info Form -->
    <form action="PlaceOrderServlet" method="post" class="mt-4">
        <h4>Delivery Details</h4>
        <div class="mb-3">
            <label>Full Name</label>
            <input type="text" name="fullName" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Address</label>
            <textarea name="address" class="form-control" required></textarea>
        </div>
        <div class="mb-3">
            <label>Card Number</label>
            <input type="text" name="cardNumber" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Place Order</button>
    </form>
</div>

<br><br>
<jsp:include page="footer.jsp" />
</body>
</html>
