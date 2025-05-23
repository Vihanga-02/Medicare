<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Medicine</title>

    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
        .medicine-image-preview {
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
    <div class="back-button">
        <a href="MedicineDisplay" class="btn btn-secondary">
            <i class="fas fa-arrow-left"></i> Back to Medicine List
        </a>
    </div>

    <h3 class="text-center mb-4">Edit Medicine</h3>

    <c:forEach var="medicine" items="${medicine}">
        <form action="MedicineUpdate" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">

            <!-- Medicine ID (readonly) -->
            <div class="mb-3">
                <label class="form-label">Medicine ID</label>
                <input type="text" class="form-control" value="${medicine.medicine_id}" disabled>
                <input type="hidden" name="medicine_id" value="${medicine.medicine_id}">
            </div>

            <!-- Medicine Name -->
            <div class="mb-3">
                <label for="medicine_name" class="form-label">Medicine Name</label>
                <input type="text" class="form-control" name="medicine_name" id="medicine_name" value="${medicine.medicine_name}" required>
            </div>

            <!-- Price -->
            <div class="mb-3">
                <label for="medicine_price" class="form-label">Price (Rs)</label>
                <input type="number" class="form-control" step="0.01" name="medicine_price" id="medicine_price" value="${medicine.medicine_price}" required>
            </div>

            <!-- Manufacture Date -->
            <div class="mb-3">
                <label for="manufacture_date" class="form-label">Manufacture Date</label>
                <input type="date" class="form-control" name="manufacture_date" id="manufacture_date" value="${medicine.manufacture_date}" required>
            </div>

            <!-- Expiry Date -->
            <div class="mb-3">
                <label for="expire_date" class="form-label">Expiry Date</label>
                <input type="date" class="form-control" name="expire_date" id="expire_date" value="${medicine.expire_date}" required>
            </div>

            <!-- Description -->
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" name="description" id="description" rows="3" required>${medicine.description}</textarea>
            </div>

            <!-- Current Image -->
            <div class="mb-3">
                <label class="form-label">Current Image</label><br>
                <img class="medicine-image-preview"
                     src="MedicineImageDisplay?id=${medicine.medicine_id}"
                     alt="Medicine Image">
            </div>

            <!-- Upload New Image -->
            <div class="mb-3">
                <label for="medicine_image" class="form-label">Upload New Image (optional)</label>
                <input type="file" class="form-control" name="medicine_image" id="medicine_image" accept="image/*">
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-success w-100">
                <i class="fas fa-save"></i> Update Medicine
            </button>
        </form>
    </c:forEach>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Client-side Validation -->
<script>
    function validateForm() {
        const price = parseFloat(document.getElementById("medicine_price").value);
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
