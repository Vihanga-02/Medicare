<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, model.Order, services.OrderService" %>
<%@ page session="true" %>
<%
    int orderId = Integer.parseInt(request.getParameter("id"));
    Order order = OrderService.getOrderById(orderId);

    if (order == null) {
        out.println("<h3 style='color:red;'>Order not found.</h3>");
        return;
    }
%>
<%@ include file="sessionCheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Order</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f8;
            margin: 0;
            padding: 0px;
        }
        h2 {
            color: #333;
        }
        form {
            background-color: #fff;
            padding: 25px;
            border-radius: 8px;
            max-width: 400px;
            margin: auto;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            padding: 10px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>

    <script>
    window.addEventListener('DOMContentLoaded', function () {
        document.querySelector('form').addEventListener('submit', function(event) {
            const name = document.querySelector('[name="fullName"]').value.trim();
            const address = document.querySelector('[name="address"]').value.trim();
            const city = document.querySelector('[name="city"]').value.trim();
            const postalCode = document.querySelector('[name="postalCode"]').value.trim();

            const postalCodeRegex = /^[0-9]{5}$/;
            let errorMsg = "";

            if (name === "") errorMsg += "Full Name is required.\n";
            if (address === "") errorMsg += "Address is required.\n";
            if (city === "") errorMsg += "City is required.\n";
            if (!postalCodeRegex.test(postalCode)) errorMsg += "Postal Code must be exactly 5 digits.\n";

            if (errorMsg !== "") {
                alert(errorMsg);
                event.preventDefault();
            }
        });
    });
    </script>
</head>
<body>
<jsp:include page="header.jsp" />
<br><br>
    <h2 style="text-align:center;">Edit Order #<%= order.getOrderId() %></h2>
    <form action="EditOrderServlet" method="post">
        <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">

        Full Name:
        <input type="text" name="fullName" value="<%= order.getFullName() %>" required>

        Address:
        <input type="text" name="address" value="<%= order.getAddress() %>" required>

        City:
        <input type="text" name="city" value="<%= order.getCity() %>" required>

        Postal Code:
        <input type="text" name="postalCode" value="<%= order.getPostalCode() %>" pattern="\d{5}" required>

        <input type="submit" value="Update Order">
    </form>
    <br><br>
   <jsp:include page="footer.jsp" />
</body>
</html>
