<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Medicines" %>
<%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Medicines</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .medicine-card {
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 10px;
            padding: 20px;
            background: white;
            margin-bottom: 20px;
            height: 100%;
        }
        .medicine-image {
            width: 100px;
            height: 100px;
            object-fit: contain;
        }
        .search-input {
            max-width: 400px;
            margin-bottom: 30px;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />
<br><br>
<div class="container">
    <h2 class="mb-4 text-center"><i class="fas fa-pills me-2"></i>Available Medicines</h2>

    <div class="d-flex justify-content-center">
        <input type="text" id="searchInput" class="form-control search-input" placeholder="Search by medicine name..." onkeyup="filterMedicines()">
    </div>

    <div class="row mt-4" id="medicineContainer">
        <c:choose>
            <c:when test="${not empty allMedicines}">
                <c:forEach var="medicine" items="${allMedicines}">
                    <div class="col-sm-6 col-md-4 col-lg-3 mb-4 medicine-card-wrapper">
                        <div class="medicine-card">
                            <div class="d-flex align-items-center mb-3">
                                <img src="MedicineImageDisplay?id=${medicine.medicine_id}" class="medicine-image me-3" alt="Medicine Image">
                                <h6 class="mb-0 medicine-name">${medicine.medicine_name}</h6>
                            </div>
                            <p class="text-muted"><strong>Price:</strong> LKR ${medicine.medicine_price}</p>
                            <p>${medicine.description}</p>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <p class="text-center">No medicines available at the moment.</p>
            </c:otherwise>
        </c:choose>
    </div>
</div>
<br>
<jsp:include page="footer.jsp" />
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Live Search Script -->
<script>
    function filterMedicines() {
        const input = document.getElementById('searchInput').value.toLowerCase();
        const cards = document.querySelectorAll('.medicine-card-wrapper');

        cards.forEach(card => {
            const name = card.querySelector('.medicine-name').textContent.toLowerCase();
            if (name.includes(input)) {
                card.style.display = 'block';
            } else {
                card.style.display = 'none';
            }
        });
    }
</script>

</body>
</html>
