<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout - Confirm Order</title>
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
    <h2 class="text-center">Confirm Your Order</h2>

    <h4>Order Summary</h4>
    <table class="table table-bordered">
        <thead class="table-light">
            <tr>
                <th>Product</th>
                <th>Price (LKR)</th>
                <th>Quantity</th>
                <th>Subtotal (LKR)</th>
            </tr>
        </thead>
        <tbody>
            <c:set var="total" value="0" />
            <c:forEach var="item" items="${cartItems}">
                <tr>
                    <td>${item.productName}</td>
                    <td>${item.price}</td>
                    <td>${item.quantity}</td>
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

    <hr>

    <h4>Delivery & Payment Details</h4>
			<form action="PlaceOrder" method="post">
			    <div class="mb-3">
			        <label class="form-label">Full Name</label>
			        <input type="text" name="deliveryName" class="form-control" >
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
			
			    <input type="hidden" name="totalAmount" value="${total}" />
			
			    <button type="submit" class="btn btn-success">Place Order</button>
			</form>

</div>

<br><br>
<jsp:include page="footer.jsp" />
</body>
</html>
