<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="model.prescriptionOrder" %>
<%@ page import="services.PrescriptionOrderService" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));
    prescriptionOrder prescription = PrescriptionOrderService.getById(id).get(0);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Prescription</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        input[type=number] {
            -moz-appearance: textfield;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-10 col-lg-8">
            <div class="card shadow p-4">
                <h2 class="text-center mb-4">Update Prescription Order</h2>

                <form action="updatePrescriptionS" method="post" onsubmit="return validateForm(event)">
                    <input type="hidden" name="p_id" value="<%= prescription.getId() %>">

                    <div class="mb-3">
                        <label for="customer_name" class="form-label">Customer Name</label>
                        <input type="text" name="customer_name" id="customer_name" class="form-control" value="<%= prescription.getName() %>" required>
                    </div>

                    <div class="mb-3">
                        <label for="customer_email" class="form-label">Email</label>
                        <input type="email" name="customer_email" id="customer_email" class="form-control" value="<%= prescription.getEmail() %>" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Medicines & Quantities</label>
                        <div id="medicineContainer">
                            <%
                                String[] medicineParts = prescription.getMedicine().split(",");
                                for (String part : medicineParts) {
                                    String name = part.substring(0, part.indexOf(" (")).trim();
                                    String qty = part.substring(part.indexOf("Qty:") + 4, part.indexOf(")")).trim();
                            %>
                            <div class="row mb-2">
                                <div class="col-md-6">
                                    <input type="text" name="medicine_name[]" class="form-control" placeholder="Medicine Name" value="<%= name %>" required>
                                </div>
                                <div class="col-md-4">
                                    <input type="number" name="medicine_quantity[]" class="form-control" placeholder="Quantity" value="<%= qty %>" min="1" required>
                                </div>
                                <div class="col-md-2">
                                    <button type="button" class="btn btn-danger btn-sm remove-row">Remove</button>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                        <button type="button" id="addMedicineRow" class="btn btn-secondary btn-sm">+ Add Medicine</button>
                    </div>

                    <div class="mb-3">
                        <label for="total_price" class="form-label">Total Price</label>
                        <input type="number" step="0.01" name="total_price" id="total_price" class="form-control" value="<%= prescription.getTotal() %>" required>
                    </div>

                    <div class="mb-3">
                        <label for="status" class="form-label">Status</label>
                        <select name="status" id="status" class="form-select" required>
  
                            <option value="Processed" <%= prescription.getStatus().equals("Processed") ? "selected" : "" %>>Processed</option>
                            <option value="Completed" <%= prescription.getStatus().equals("Completed") ? "selected" : "" %>>Completed</option>
                        </select>
                    </div>

                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-primary">Update Prescription</button>
                        <a href="displayPrescriptionS" class="btn btn-secondary ms-2">Cancel</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById('addMedicineRow').addEventListener('click', function () {
        const container = document.getElementById('medicineContainer');
        const row = document.createElement('div');
        row.classList.add('row', 'mb-2');
        row.innerHTML = `
            <div class="col-md-6">
                <input type="text" name="medicine_name[]" class="form-control" placeholder="Medicine Name" required>
            </div>
            <div class="col-md-4">
                <input type="number" name="medicine_quantity[]" class="form-control" placeholder="Quantity" min="1" required>
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-danger btn-sm remove-row">Remove</button>
            </div>
        `;
        container.appendChild(row);
    });

    document.addEventListener('click', function (e) {
        if (e.target.classList.contains('remove-row')) {
            e.target.closest('.row').remove();
        }
    });

    function validateForm(event) {
        const nameFields = document.getElementsByName('medicine_name[]');
        const qtyFields = document.getElementsByName('medicine_quantity[]');
        const totalPrice = document.getElementById('total_price');
        const seen = new Set();

        for (let i = 0; i < nameFields.length; i++) {
            const name = nameFields[i].value.trim().toLowerCase();
            const qty = parseInt(qtyFields[i].value);

            if (seen.has(name)) {
                alert("Duplicate medicine name found: " + nameFields[i].value);
                nameFields[i].focus();
                event.preventDefault();
                return false;
            }
            seen.add(name);

            if (qty <= 0 || isNaN(qty)) {
                alert("Quantity must be greater than 0.");
                qtyFields[i].focus();
                event.preventDefault();
                return false;
            }
        }

        if (parseFloat(totalPrice.value) <= 0 || isNaN(totalPrice.value)) {
            alert("Total price must be greater than 0.");
            totalPrice.focus();
            event.preventDefault();
            return false;
        }

        return true;
    }
</script>

</body>
</html>
