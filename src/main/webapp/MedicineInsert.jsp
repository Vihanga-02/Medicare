<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Medicine</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            background: #f8f9fa;
        }
        .form-container {
            background: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 4px 15px rgba(0,0,0,0.1);
            max-width: 700px;
            margin: 50px auto;
        }
        .form-title {
            text-align: center;
            margin-bottom: 25px;
            font-weight: bold;
            color: #343a40;
        }
        .btn-back {
            background-color: #6c757d;
            color: white;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="form-container">
        <h2 class="form-title"><i class="fas fa-capsules me-2"></i>Insert New Medicine</h2>

        <form action="MedicineInsert" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
            <div class="mb-3">
                <label for="medicine_name" class="form-label"><i class="fas fa-pills me-1"></i>Medicine Name</label>
                <input type="text" class="form-control" name="medicine_name" id="medicine_name" required>
            </div>

            <div class="mb-3">
                <label for="medicine_image" class="form-label"><i class="fas fa-image me-1"></i>Medicine Image</label>
                <input type="file" class="form-control" name="medicine_image" id="medicine_image" accept="image/*" required>
            </div>

            <div class="mb-3">
                <label for="medicine_price" class="form-label"><i class="fas fa-dollar-sign me-1"></i>Medicine Price</label>
                <input type="number" step="0.01" class="form-control" name="medicine_price" id="medicine_price" required>
            </div>

            <div class="mb-3">
                <label for="manufacture_date" class="form-label"><i class="fas fa-calendar-plus me-1"></i>Manufacture Date</label>
                <input type="date" class="form-control" name="manufacture_date" id="manufacture_date" required>
            </div>

            <div class="mb-3">
                <label for="expire_date" class="form-label"><i class="fas fa-calendar-times me-1"></i>Expiry Date</label>
                <input type="date" class="form-control" name="expire_date" id="expire_date" required>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label"><i class="fas fa-align-left me-1"></i>Description</label>
                <textarea class="form-control" name="description" id="description" rows="4" required></textarea>
            </div>

            <div class="d-flex justify-content-between">
                <a href="MedicineDisplay" class="btn btn-back"><i class="fas fa-arrow-left me-1"></i>Back to Medicine List</a>
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-plus-circle me-1"></i>Insert Medicine
                </button>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- User Side JavaScript Validation -->
<script>
    function validateForm() {
        const price = parseFloat(document.getElementById('medicine_price').value);
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
