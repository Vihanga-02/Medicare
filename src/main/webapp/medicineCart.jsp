<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Customers" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="sessionCheck.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Medicine Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .cart-card {
            border-radius: 16px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }
        .cart-card:hover {
            transform: scale(1.02);
        }
        .total-summary {
            font-size: 1.5rem;
            font-weight: 600;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />
<br><br>
<div class="container my-5">
    <h2 class="text-center mb-4">🛒 My Medicine Cart</h2>

    <!-- Success/Error Messages -->
    <c:if test="${not empty sessionScope.message}">
        <div class="alert alert-success text-center">${sessionScope.message}</div>
        <c:remove var="message" scope="session" />
    </c:if>
    <c:if test="${not empty sessionScope.error}">
        <div class="alert alert-danger text-center">${sessionScope.error}</div>
        <c:remove var="error" scope="session" />
    </c:if>

    <c:if test="${empty myPrescriptions}">
        <div class="text-center mt-5">
            <i class="bi bi-cart-x display-1 text-secondary"></i>
            <h4 class="mt-3">Your medicine cart is empty</h4>
            <p class="text-muted">Looks like you haven't added any prescriptions yet.</p>
            <a href="CustomerMedicineDisplay" class="btn btn-outline-primary mt-3">
                <i class="bi bi-arrow-left"></i> Continue Shopping
            </a>
        </div>

        <!-- Grid filler to push footer down -->
        <div class="container mt-5">
            <div class="row row-cols-1 row-cols-md-3 g-4">
                <div class="col">
                    <div class="card h-100 text-center">
                        <i class="bi bi-bag-heart display-4 mt-4 text-primary"></i>
                        <div class="card-body">
                            <h5 class="card-title">Browse Products</h5>
                            <p class="card-text">Check out our latest collection and best sellers.</p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100 text-center">
                        <i class="bi bi-truck display-4 mt-4 text-success"></i>
                        <div class="card-body">
                            <h5 class="card-title">Fast Delivery</h5>
                            <p class="card-text">We ensure quick delivery right to your doorstep.</p>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card h-100 text-center">
                        <i class="bi bi-stars display-4 mt-4 text-warning"></i>
                        <div class="card-body">
                            <h5 class="card-title">Customer Favorites</h5>
                            <p class="card-text">Explore top-rated products loved by our users.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:if>

    <div class="row">
        <c:set var="grandTotal" value="0" />
        <c:forEach var="p" items="${myPrescriptions}">
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="card cart-card p-3">
                    <div class="card-body">
                        <h5 class="card-title">${p.name}</h5>
                        <h6 class="card-subtitle mb-2 text-muted">Prescription ID: ${p.id}</h6>
                        <p class="card-text"><strong>Medicines:</strong> ${p.medicine}</p>
                        <p class="card-text">
                            <strong>Total:</strong>
                            <span class="text-success">
                                <fmt:formatNumber value="${p.total}" type="number" minFractionDigits="2" /> LKR
                            </span>
                        </p>
                        <p class="card-text">
                            <strong>Status:</strong>
                            <span class="badge bg-${p.status == 'Pending' ? 'warning' : 'success'}">
                                ${p.status}
                            </span>
                        </p>
                    </div>
                </div>
            </div>
            <c:set var="grandTotal" value="${grandTotal + p.total}" />
        </c:forEach>
    </div>

    <c:if test="${not empty myPrescriptions}">
        <div class="text-center mt-5 total-summary">
            Total Amount:
            <span class="text-primary">
                <fmt:formatNumber value="${grandTotal}" type="number" minFractionDigits="2" /> LKR
            </span>
        </div>

        <!-- Checkout and Clear Buttons -->
        <div class="text-center mt-4 d-flex justify-content-center gap-3 flex-wrap">
            <form action="MedicineCheckoutServlet" method="get">
                <button type="submit" class="btn btn-success btn-lg">Proceed to Checkout</button>
            </form>

            <form action="ClearMedicineCart" method="post" onsubmit="return confirm('Are you sure you want to clear your cart?');">
                <button type="submit" class="btn btn-danger btn-lg">Clear Cart</button>
            </form>
        </div>
    </c:if>
</div>
<br><br>
<jsp:include page="footer.jsp" />
</body>
</html>
