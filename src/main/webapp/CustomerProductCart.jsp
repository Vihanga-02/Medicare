<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    
</head>
<body>

<jsp:include page="header.jsp" />
<br><br>

<div class="container">
    <h2 class="mb-4 text-center">🛒 My Cart</h2>

    <c:choose>
        <c:when test="${not empty cartItems}">
            <table class="table table-bordered table-striped text-center">
                <thead class="table-dark">
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
					 <c:if test="${not empty cartItems}">
					    <div class="text-end">
					        <form action="ViewOrderPage" method="get" class="text-center">
							    <button type="submit" class="btn btn-primary">Confirm Cart & Checkout</button>
							</form>
							<form action="ClearCart" method="post" class="text-end mt-3">
						    <button type="submit" class="btn btn-danger">Clear Cart</button>
						   </form>

					    </div>
					</c:if>

        </c:when>
        <c:otherwise>
    <div class="text-center mt-5">
        <i class="bi bi-cart-x display-1 text-secondary"></i>
        <h4 class="mt-3">Your cart is empty</h4>
        <p class="text-muted">Looks like you haven't added any items yet.</p>
        <a href="CustomerProductDisplay" class="btn btn-outline-primary mt-3">
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
</c:otherwise>

    </c:choose>
</div>

<br><br>
<jsp:include page="footer.jsp" />
</body>
</html>