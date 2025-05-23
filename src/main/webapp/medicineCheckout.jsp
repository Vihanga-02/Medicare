<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="sessionCheck.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Medicine Order Checkout</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script>
        window.addEventListener('DOMContentLoaded', function () {
            document.querySelector('form').addEventListener('submit', function(event) {
                const name = document.querySelector('[name="deliveryName"]').value.trim();
                const address = document.querySelector('[name="deliveryAddress"]').value.trim();
                const city = document.querySelector('[name="deliveryCity"]').value.trim();
                const postalCode = document.querySelector('[name="deliveryPostalCode"]').value.trim();
                const cardNumber = document.querySelector('[name="cardNumber"]').value.trim();

                const postalCodeRegex = /^[0-9]{5}$/;
                const cardNumberRegex = /^[0-9]{16}$/;

                let errorMsg = "";

                if (name === "") errorMsg += "Full Name is required.\n";
                if (address === "") errorMsg += "Delivery Address is required.\n";
                if (city === "") errorMsg += "City is required.\n";
                if (!postalCodeRegex.test(postalCode)) errorMsg += "Postal Code must be exactly 5 digits.\n";
                if (!cardNumberRegex.test(cardNumber)) errorMsg += "Card Number must be exactly 16 digits.\n";

                if (errorMsg !== "") {
                    alert(errorMsg);
                    event.preventDefault();
                }
            });
        });
    </script>
</head>
<body>
<jsp:include page="header.jsp" />
<br><br>

<div class="container">
    <h2 class="text-center">Confirm Your Medicine Order</h2>

    <h4>Order Summary</h4>
    <div class="row">
        <c:forEach var="p" items="${prescriptions}">
            <div class="col-md-6 mb-3">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">${p.name}</h5>
                        <p class="card-text"><strong>Medicines:</strong> ${p.medicine}</p>
                        <p class="card-text">
                            <strong>Total:</strong> 
                            <span class="text-success">
                                <fmt:formatNumber value="${p.total}" type="number" minFractionDigits="2"/> LKR
                            </span>
                        </p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="text-end mb-4">
        <h4>Grand Total: 
            <span class="text-primary">
                <fmt:formatNumber value="${grandTotal}" type="number" minFractionDigits="2"/> LKR
            </span>
        </h4>
    </div>

    <hr>

    <h4>Delivery & Payment Details</h4>
    <form action="PlaceMedicineOrder" method="post">
        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" name="deliveryName" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Delivery Address</label>
            <textarea name="deliveryAddress" class="form-control" rows="2" required></textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">City</label>
            <input type="text" name="deliveryCity" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Postal Code</label>
            <input type="text" name="deliveryPostalCode" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Card Number</label>
            <input type="text" name="cardNumber" class="form-control" maxlength="16" required>
        </div>

        <input type="hidden" name="totalAmount" value="${grandTotal}" />

        <button type="submit" class="btn btn-success">Place Medicine Order</button>
        <a href="MedicineCartServlet" class="btn btn-secondary">Back to Cart</a>
    </form>
</div>

<br><br>
<jsp:include page="footer.jsp" />
</body>
</html>