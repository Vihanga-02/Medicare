<%@ page import="model.Customers" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Customer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container mt-5">
    <h2 class="mb-4">Update Profile Details</h2>
    <form action="CustomerUpdate" method="POST">
        <!-- Hidden field for customer_id -->
        <input type="hidden" name="customer_id" value="<%= customer.getCustomer_id() %>">

        <!-- First Name -->
        <div class="mb-3">
            <label class="form-label">First Name</label>
            <input type="text" class="form-control" name="first_name" value="<%= customer.getFirst_name() %>" required>
        </div>

        <!-- Last Name -->
        <div class="mb-3">
            <label class="form-label">Last Name</label>
            <input type="text" class="form-control" name="last_name" value="<%= customer.getLast_name() %>" required>
        </div>

        <!-- Date of Birth -->
        <div class="mb-3">
            <label class="form-label">Date of Birth</label>
            <input type="date" class="form-control" name="dob" value="<%= customer.getDob() %>" required>
        </div>

        <!-- Gender -->
        <div class="mb-3">
            <label class="form-label">Gender</label>
            <select class="form-select" name="gender" required>
                <option value="Male" <%= customer.getGender().equals("Male") ? "selected" : "" %>>Male</option>
                <option value="Female" <%= customer.getGender().equals("Female") ? "selected" : "" %>>Female</option>
                <option value="Other" <%= customer.getGender().equals("Other") ? "selected" : "" %>>Other</option>
            </select>
        </div>

        <!-- Contact -->
        <div class="mb-3">
            <label class="form-label">Contact</label>
            <input type="text" class="form-control" name="contact" value="<%= customer.getContact() %>" required>
        </div>

        <!-- Email (non-editable with tooltip) -->
        <div class="mb-3">
            <label class="form-label">Email</label>
            <input 
                type="email" 
                class="form-control" 
                name="email" 
                value="<%= customer.getEmail() %>" 
                readonly 
                onclick="showTooltip()" 
                onmouseover="this.title='You don\\'t have permission to update email'" 
                style="cursor: not-allowed;"
            >
        </div>

        <!-- Address -->
        <div class="mb-3">
            <label class="form-label">Address</label>
            <input type="text" class="form-control" name="address" value="<%= customer.getAddress() %>" required>
        </div>

        <!-- Password -->
        <div class="mb-3">
            <label class="form-label">Password</label>
            <input type="password" class="form-control" name="password" value="<%= customer.getPassword() %>" required>
        </div>

        <!-- Submit Button -->
        <button type="submit" class="btn btn-primary">Update</button>
    </form>
</div>
<br><br>
 <jsp:include page="footer.jsp" />
<!-- Tooltip Alert -->
<script>
    function showTooltip() {
        alert("You don't have permission to update email.");
    }
</script>
</body>
</html>
