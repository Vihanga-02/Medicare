<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Products</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
            padding-top: 0px;
        }

        .product-card {
            transition: transform 0.2s ease;
        }

        .product-card:hover {
            transform: scale(1.02);
        }

        .product-image {
            height: 200px;
            object-fit: cover;
            width: 100%;
        }

        .add-to-cart-btn {
            background-color: #198754;
            color: white;
        }

        .add-to-cart-btn:hover {
            background-color: #146c43;
        }

        .search-input {
            max-width: 400px;
            margin: 0 auto 30px;
        }
    </style>
</head>
<body>

<jsp:include page="header.jsp" />
<br><br>

<div class="container">
    <h2 class="text-center mb-4"><i class="fas fa-capsules me-2"></i>Our Products</h2>

    <!-- Search Bar -->
    <div class="d-flex justify-content-center">
        <input type="text" id="searchInput" class="form-control search-input" placeholder="Search by product name..." onkeyup="filterProducts()">
    </div>

    <div class="row g-4 mt-3" id="productContainer">
        <c:choose>
            <c:when test="${not empty allProducts}">
                <c:forEach var="product" items="${allProducts}">
                    <div class="col-md-4 product-card-wrapper">
                        <div class="card product-card h-100 shadow-sm">
                            <img src="ProductImageDisplay?id=${product.product_id}" class="card-img-top product-image" alt="Product Image">
                            <div class="card-body d-flex flex-column">
                                <h5 class="card-title product-name">${product.product_name}</h5>
                                <p class="card-text text-muted mb-1">LKR ${product.product_price}</p>
                                <p class="card-text small text-secondary mb-3">
                                    <c:choose>
                                        <c:when test="${fn:length(product.description) > 60}">
                                            ${fn:substring(product.description, 0, 60)}...
                                        </c:when>
                                        <c:otherwise>
                                            ${product.description}
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                                <form action="AddToProductCart" method="post" class="mt-auto">
    							<input type="hidden" name="productId" value="${product.product_id}" />
   								 <input type="hidden" name="productName" value="${product.product_name}" />
    							<input type="hidden" name="price" value="${product.product_price}" />
    							<input type="hidden" name="quantity" value="1" />
   								 <button type="submit" class="btn add-to-cart-btn w-100">
       							 <i class="fas fa-cart-plus me-1"></i>Add to Cart
   								 </button>
								</form>
                                
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>

            <c:otherwise>
                <div class="col-12 text-center">
                    <p>No products available at the moment.</p>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<br><br>
<jsp:include page="footer.jsp" />

<!-- Bootstrap Bundle JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Live Search Script -->
<script>
    function filterProducts() {
        const input = document.getElementById('searchInput').value.toLowerCase();
        const cards = document.querySelectorAll('.product-card-wrapper');

        cards.forEach(card => {
            const name = card.querySelector('.product-name').textContent.toLowerCase();
            card.style.display = name.includes(input) ? 'block' : 'none';
        });
    }
</script>

</body>
</html>
