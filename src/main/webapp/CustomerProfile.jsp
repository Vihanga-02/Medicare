<%@ page import="model.Customers" %>
  <%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Profile</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    
    <style>
        body {
            background-color: #f8f9fa;
        }
        .profile-card {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        .form-label i {
            margin-right: 8px;
            color: #0d6efd;
        }
        .btn i {
            margin-right: 5px;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container">
    <div class="profile-card">
        <h3 class="text-center mb-4"><i class="fas fa-user-circle"></i> My Profile</h3>

        <form method="get">
        <input type="hidden" name="customer_id" value="<%= customer.getCustomer_id() %>">
            <div class="mb-3">
                <label class="form-label"><i class="fas fa-user"></i> First Name</label>
                <input type="text" class="form-control" value="<%= customer.getFirst_name() %>" readonly>
            </div>

            <div class="mb-3">
                <label class="form-label"><i class="fas fa-user"></i> Last Name</label>
                <input type="text" class="form-control" value="<%= customer.getLast_name() %>" readonly>
            </div>

            <div class="mb-3">
                <label class="form-label"><i class="fas fa-calendar"></i> Date of Birth</label>
                <input type="date" class="form-control" value="<%= customer.getDob() %>" readonly>
            </div>

            <div class="mb-3">
                <label class="form-label"><i class="fas fa-venus-mars"></i> Gender</label>
                <input type="text" class="form-control" value="<%= customer.getGender() %>" readonly>
            </div>

            <div class="mb-3">
                <label class="form-label"><i class="fas fa-phone"></i> Contact</label>
                <input type="text" class="form-control" value="<%= customer.getContact() %>" readonly>
            </div>

            <div class="mb-3">
                <label class="form-label"><i class="fas fa-envelope"></i> Email</label>
                <input type="email" class="form-control" value="<%= customer.getEmail() %>" readonly>
            </div>

            <div class="mb-3">
                <label class="form-label"><i class="fas fa-location-dot"></i> Address</label>
                <input type="text" class="form-control" value="<%= customer.getAddress() %>" readonly>
            </div>

            <div class="mb-4">
                <label class="form-label"><i class="fas fa-lock"></i> Password</label>
                <input type="password" class="form-control" value="<%= customer.getPassword() %>" readonly>
            </div>

            <div class="d-flex justify-content-between">
        <button formaction="CustomerEdit" class="btn btn-primary">
            <i class="fas fa-pen-to-square"></i> Update Account
        </button>
        <button formaction="CustomerDelete" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete your account? This action cannot be undone.')">
            <i class="fas fa-trash-alt"></i> Delete Account
        </button>
    </div>
        </form>
    </div>
</div> <br>
<jsp:include page="footer.jsp" />
<!-- Bootstrap JS (Optional) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
