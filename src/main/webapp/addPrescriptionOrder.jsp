<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Prescription</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
  /* Disable spinner arrows for number inputs */
  input[type=number]::-webkit-outer-spin-button,
  input[type=number]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
  }
  input[type=number] {
    -moz-appearance: textfield;
  }
</style>

<script>
  function addMedicineRow() {
    const group = document.getElementById('medicine-group');
    const row = document.createElement('div');
    row.className = 'row g-3 mb-2';

    row.innerHTML = `
      <div class="col-md-5">
        <input type="text" name="medicine_name[]" class="form-control" placeholder="Medicine Name" required>
      </div>
      <div class="col-md-3">
        <input type="number" name="medicine_quantity[]" class="form-control" placeholder="Quantity" min="1" required>
      </div>
      <div class="col-md-2">
        <button type="button" class="btn btn-danger" onclick="this.closest('.row').remove()">Remove</button>
      </div>
    `;

    group.appendChild(row);
  }

  function validateForm(event) {
    const quantities = document.getElementsByName('medicine_quantity[]');
    const names = document.getElementsByName('medicine_name[]');
    const total = document.querySelector('input[name="total_price"]');

    const seenNames = new Set();

    for (let i = 0; i < names.length; i++) {
      const name = names[i].value.trim().toLowerCase();
      const quantity = parseInt(quantities[i].value);

      if (seenNames.has(name)) {
        alert('Duplicate medicine name found: "' + names[i].value + '". Please remove or rename.');
        names[i].focus();
        event.preventDefault();
        return false;
      }
      seenNames.add(name);

      if (quantity <= 0 || isNaN(quantity)) {
        alert('Medicine quantity must be greater than 0.');
        quantities[i].focus();
        event.preventDefault();
        return false;
      }
    }

    if (parseFloat(total.value) <= 0 || isNaN(total.value)) {
      alert('Total price must be greater than 0.');
      total.focus();
      event.preventDefault();
      return false;
    }

    return true;
  }
  
  
</script>
</head>
<body class="bg-light">

<div class="container mt-5">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="card shadow p-4">
        <h2 class="mb-4 text-center">Create Prescription</h2>
        <form action="addPrescriptionS" method="post" onsubmit="return validateForm(event)">
          <div class="mb-3">
            <label class="form-label">Customer Name</label>
            <input type="text" name="customer_name" class="form-control" required>
          </div>

          <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" name="customer_email" class="form-control" placeholder="ABC@gmail.com" required>
          </div>

          <h5>Medicines</h5>
          <div id="medicine-group" class="mb-3">
            <div class="row g-3 mb-2">
              <div class="col-md-5">
                <input type="text" name="medicine_name[]" class="form-control" placeholder="Medicine Name" required>
              </div>
              <div class="col-md-3">
                <input type="number" name="medicine_quantity[]" class="form-control" placeholder="Quantity" min="1" required>
              </div>
              <div class="col-md-2">
                <button type="button" class="btn btn-danger" onclick="this.closest('.row').remove()">Remove</button>
              </div>
            </div>
          </div>
          <button type="button" class="btn btn-secondary mb-3" onclick="addMedicineRow()">+ Add Medicine</button>

          <div class="mb-3">
            <label class="form-label">Total Price</label>
            <input type="number" name="total_price" step="0.01" class="form-control" required>
          </div>

          <div class="mb-4">
  			<label class="form-label">Order Status</label>
 			 <select name="status" class="form-select" required>
   				 <option value="" disabled selected>Pending</option>
  				  <option value="Processed">Processed</option>
  				  <option value="Completed">Completed</option>
			  </select>
		</div>

          <div class="text-center">
            <button type="submit" class="btn btn-primary w-50">Create Prescription</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

</body>
</html>
