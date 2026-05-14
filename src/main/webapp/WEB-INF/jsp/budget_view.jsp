<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pricing & Budget - Tourism Platform</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #F8FAFC;
            color: #1E293B;
        }

        .page-header {
            background: #278282;
            color: white;
            padding: 60px 0;
            margin-bottom: 40px;
        }

        .content-card {
            background: white;
            border: 1px solid #E2E8F0;
            border-radius: 10px;
            padding: 40px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .table thead th {
            background: #F1F5F9;
            color: #475569;
            font-weight: 600;
            font-size: 0.85rem;
        }

        .price-badge {
            color: #278282;
            font-weight: bold;
        }

        .plan-badge {
            font-size: 0.75rem;
            padding: 4px 8px;
            border-radius: 20px;
            background: #e2e8f0;
            color: #475569;
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="page-header">
    <div class="container text-center">
        <h1>Pricing & Budget</h1>
        <p>Manage your travel quotes and payment breakdowns</p>
    </div>
</div>

<div class="container">
    <div class="content-card">
        <h4 class="mb-4">Quick Calculation</h4>
        <form action="/calculate-budget" method="POST" class="mb-5">
            <div class="row g-3">
                <div class="col-md-3">
                    <input type="text" name="packageId" class="form-control" placeholder="Package ID" required>
                </div>
                <div class="col-md-3">
                    <input type="number" step="0.01" name="basePrice" class="form-control" placeholder="Base Price" required>
                </div>
                <div class="col-md-3">
                    <input type="number" step="0.01" name="tax" class="form-control" placeholder="Tax (Rs.)">
                </div>
                <div class="col-md-3">
                    <select name="paymentPlan" class="form-select">
                        <option value="One-time">One-time</option>
                        <option value="Installments">Installments</option>
                    </select>
                </div>
                <div class="col-12 text-end">
                    <button type="submit" class="btn btn-primary px-5">Calculate & Save</button>
                </div>
            </div>
        </form>

        <h4 class="mb-4">Saved Quotes Breakdown</h4>
        <div class="table-responsive">
            <table class="table align-middle">
                <thead>
                    <tr>
                        <th>Package ID</th>
                        <th>Base (Rs.)</th>
                        <th>Add-ons</th>
                        <th>Tax (10%)</th>
                        <th>Service (5%)</th>
                        <th>Meals (Est.)</th>
                        <th>Plan</th>
                        <th>Total</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="budget" items="${budgets}">
                        <tr>
                            <td><strong>${budget.packageId}</strong></td>
                            <td><fmt:formatNumber value="${budget.basePrice}" pattern="#,##0.00"/></td>
                            <td><fmt:formatNumber value="${budget.customAddons}" pattern="#,##0.00"/></td>
                            <td><fmt:formatNumber value="${budget.tax}" pattern="#,##0.00"/></td>
                            <td><fmt:formatNumber value="${budget.serviceCharge}" pattern="#,##0.00"/></td>
                            <td><fmt:formatNumber value="${budget.estimatedMeals}" pattern="#,##0.00"/></td>
                            <td><span class="plan-badge">${budget.paymentPlan}</span></td>
                            <td class="price-badge">Rs. <fmt:formatNumber value="${budget.totalPrice}" pattern="#,##0.00"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
