<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Product</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="card shadow-sm">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0"><i class="fas fa-plus-circle"></i> Insert New Product</h4>
        </div>
        <div class="card-body">
            <form action="ProductInsert" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
                
                <div class="mb-3">
                    <label for="product_name" class="form-label">Product Name</label>
                    <input type="text" name="product_name" id="product_name" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="product_image" class="form-label">Product Image</label>
                    <input type="file" name="product_image" id="product_image" class="form-control" accept="image/*" required>
                </div>

                <div class="mb-3">
                    <label for="product_price" class="form-label">Price (Rs.)</label>
                    <input type="number" step="0.01" name="product_price" id="product_price" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="manufacture_date" class="form-label">Manufacture Date</label>
                    <input type="date" name="manufacture_date" id="manufacture_date" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="expire_date" class="form-label">Expire Date</label>
                    <input type="date" name="expire_date" id="expire_date" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="description" class="form-label">Description</label>
                    <textarea name="description" id="description" rows="4" class="form-control" required></textarea>
                </div>

                <!-- Back and Insert Buttons -->
                <div class="d-flex justify-content-between">
                    <a href="ProductDisplay" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i> Back to Product List
                    </a>
                    <button type="submit" class="btn btn-success">
                        <i class="fas fa-upload"></i> Insert Product
                    </button>
                </div>

            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- User Side JavaScript Validation -->
<script>
    function validateForm() {
        const price = parseFloat(document.getElementById('product_price').value);
        const mDate = new Date(document.getElementById('manufacture_date').value);
        const eDate = new Date(document.getElementById('expire_date').value);
        const today = new Date();
        today.setHours(0, 0, 0, 0); // Remove time for accurate comparison

        if (price <= 0) {
            alert("Price must be a positive number.");
            return false;
        }

        if (mDate > today) {
            alert("Manufacture date cannot be in the future.");
            return false;
        }

        if (eDate < today) {
            alert("Expire date cannot be in the past.");
            return false;
        }

        return true;
    }
</script>
</body>
</html>
