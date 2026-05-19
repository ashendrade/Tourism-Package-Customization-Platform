<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Budget & Quote - OCEANWAVE Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --primary: #278282;
            --primary-dark: #1f6b6b;
            --secondary: #F43F5E;
            --dark: #0F172A;
            --slate: #64748B;
        }

        body {
            font-family: 'Outfit', sans-serif;
            background: #f8fafc;
            color: var(--dark);
        }

        .page-header {
            background: var(--primary);
            color: white;
            padding: 40px 0;
            margin-bottom: 30px;
        }

        .admin-card {
            background: white;
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.05);
            max-width: 700px;
            margin: 0 auto;
        }

        .form-label {
            font-weight: 600;
            color: var(--slate);
            font-size: 0.9rem;
        }

        .btn-save {
            background: var(--primary);
            color: white;
            font-weight: 700;
            border: none;
            padding: 12px;
            border-radius: 10px;
            transition: 0.3s;
        }

        .btn-save:hover {
            background: var(--primary-dark);
            color: white;
            transform: translateY(-1px);
        }

        .btn-cancel {
            border: 1px solid #cbd5e1;
            color: #475569;
            font-weight: 700;
            padding: 12px;
            border-radius: 10px;
            transition: 0.3s;
        }

        .btn-cancel:hover {
            background: #f1f5f9;
            color: #1e293b;
        }

        .calc-summary {
            background: #f1f5f9;
            border-radius: 12px;
            padding: 20px;
            margin-top: 25px;
        }

        .calc-total {
            font-size: 1.5rem;
            font-weight: 800;
            color: var(--primary);
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="page-header">
    <div class="container text-center">
        <h1>Modify Budget Record</h1>
        <p>Manually override calculations, fees, and plans for customized package quotes</p>
    </div>
</div>

<div class="container mb-5">
    <div class="admin-card">
        <form action="${pageContext.request.contextPath}/admin/budgets/update/${budget.packageId}" method="POST">
            <div class="mb-4 text-center">
                <i class="fas fa-calculator text-secondary mb-3" style="font-size: 4.5rem;"></i>
                <h4 class="m-0">Package Quote: #${budget.packageId}</h4>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">Package ID (Read-only)</label>
                    <input type="text" class="form-control bg-light" value="${budget.packageId}" disabled readonly>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label">Payment Plan</label>
                    <select name="paymentPlan" id="paymentPlan" class="form-select" onchange="updateTotal()">
                        <option value="One-time" ${budget.paymentPlan == 'One-time' ? 'selected' : ''}>One-time (5% Discount)</option>
                        <option value="Installments" ${budget.paymentPlan == 'Installments' ? 'selected' : ''}>Installments</option>
                    </select>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">Base Cost (Rs.)</label>
                    <input type="number" step="0.01" name="basePrice" id="basePrice" class="form-control" value="${budget.basePrice}" oninput="updateTotal()" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label">Add-ons Cost (Rs.)</label>
                    <input type="number" step="0.01" name="customAddons" id="customAddons" class="form-control" value="${budget.customAddons}" oninput="updateTotal()" required>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label">Taxes (Rs.)</label>
                    <input type="number" step="0.01" name="tax" id="tax" class="form-control" value="${budget.tax}" oninput="updateTotal()" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label">Service Charge (Rs.)</label>
                    <input type="number" step="0.01" name="serviceCharge" id="serviceCharge" class="form-control" value="${budget.serviceCharge}" oninput="updateTotal()" required>
                </div>
            </div>

            <div class="mb-4">
                <label class="form-label">Estimated Meals Cost (Rs.)</label>
                <input type="number" step="0.01" name="estimatedMeals" id="estimatedMeals" class="form-control" value="${budget.estimatedMeals}" oninput="updateTotal()" required>
            </div>

            <div class="calc-summary d-flex justify-content-between align-items-center">
                <div>
                    <span class="text-muted small fw-bold">DYNAMICAL TOTAL CALCULATION</span>
                    <p class="m-0 text-muted small">(Base + Addons + Taxes + Service + Meals) - Plan Discounts</p>
                </div>
                <div class="calc-total" id="displayTotal">Rs. 0.00</div>
            </div>

            <div class="row mt-4 g-3">
                <div class="col-md-6">
                    <button type="submit" class="btn btn-save w-100"><i class="fas fa-save me-2"></i>Save Quote</button>
                </div>
                <div class="col-md-6">
                    <a href="${pageContext.request.contextPath}/budget" class="btn btn-cancel w-100 text-center d-inline-block"><i class="fas fa-times me-2"></i>Cancel</a>
                </div>
            </div>
        </form>
    </div>
</div>

<jsp:include page="footer.jsp" />

<script>
    function updateTotal() {
        const base = parseFloat(document.getElementById('basePrice').value) || 0;
        const addons = parseFloat(document.getElementById('customAddons').value) || 0;
        const tax = parseFloat(document.getElementById('tax').value) || 0;
        const service = parseFloat(document.getElementById('serviceCharge').value) || 0;
        const meals = parseFloat(document.getElementById('estimatedMeals').value) || 0;
        const plan = document.getElementById('paymentPlan').value;

        let total = base + addons + tax + service + meals;
        if (plan === 'One-time') {
            total *= 0.95; // 5% Discount
        }

        document.getElementById('displayTotal').innerText = 'Rs. ' + total.toLocaleString(undefined, {minimumFractionDigits: 2, maximumFractionDigits: 2});
    }

    // Run calculation once on load
    updateTotal();
</script>

</body>
</html>
