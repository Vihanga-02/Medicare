<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Product</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- FontAwesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <style>
        .container {
            max-width: 700px;
            margin-top: 60px;
            background: #f8f9fa;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 4px 15px rgba(0,0,0,0.1);
        }
        .product-image-preview {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border: 2px solid #ccc;
            margin-bottom: 10px;
        }
        .back-button {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Back button -->
    <div class="back-button">
        <a href="ProductDisplay" class="btn btn-secondary">
            <i class="fas fa-arrow-left"></i> Back to Product List
        </a>
    </div>

    <h3 class="text-center mb-4">Edit Product</h3>

    <c:forEach var="product" items="${product}">
        <form action="ProductUpdate" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">

            <!-- Product ID (readonly) -->
            <div class="mb-3">
                <label class="form-label">Product ID</label>
                <input type="text" class="form-control" value="${product.product_id}" disabled>
                <input type="hidden" name="product_id" value="${product.product_id}">
            </div>

            <!-- Product Name -->
            <div class="mb-3">
                <label for="product_name" class="form-label">Product Name</label>
                <input type="text" class="form-control" name="product_name" id="product_name"
                       value="${product.product_name}" required>
            </div>

            <!-- Price -->
            <div class="mb-3">
                <label for="product_price" class="form-label">Price (Rs)</label>
                <input type="number" class="form-control" step="0.01" name="product_price" id="product_price"
                       value="${product.product_price}" required>
            </div>

            <!-- Manufacture Date -->
            <div class="mb-3">
                <label for="manufacture_date" class="form-label">Manufacture Date</label>
                <input type="date" class="form-control" name="manufacture_date" id="manufacture_date"
                       value="${product.manufacture_date}" required>
            </div>

            <!-- Expiry Date -->
            <div class="mb-3">
                <label for="expire_date" class="form-label">Expiry Date</label>
                <input type="date" class="form-control" name="expire_date" id="expire_date"
                       value="${product.expire_date}" required>
            </div>

            <!-- Description -->
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" name="description" id="description" rows="3" required>${product.description}</textarea>
            </div>

            <!-- Current Image -->
            <div class="mb-3">
                <label class="form-label">Current Image</label><br>
                <img class="product-image-preview"
                     src="ProductImageDisplay?id=${product.product_id}"
                     alt="Product Image">
            </div>

            <!-- Upload New Image -->
            <div class="mb-3">
                <label for="product_image" class="form-label">Upload New Image (optional)</label>
                <input type="file" class="form-control" name="product_image" id="product_image" accept="image/*">
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-success w-100">
                <i class="fas fa-save"></i> Update Product
            </button>
        </form>
    </c:forEach>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Client-side Validation -->
<script>
    function validateForm() {
        const price = parseFloat(document.getElementById("product_price").value);
        const manufactureDate = new Date(document.getElementById("manufacture_date").value);
        const expireDate = new Date(document.getElementById("expire_date").value);
        const today = new Date();
        today.setHours(0, 0, 0, 0); // remove time portion

        if (price <= 0) {
            alert("Price must be a positive number.");
            return false;
        }

        if (manufactureDate > today) {
            alert("Manufacture date cannot be in the future.");
            return false;
        }

        if (expireDate < today) {
            alert("Expire date cannot be in the past.");
            return false;
        }

        return true;
    }
</script>

</body>
</html>
