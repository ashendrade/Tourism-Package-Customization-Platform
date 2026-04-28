<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pricing & Budget Breakdown</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            border: none;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .table thead {
            background-color: #343a40;
            color: white;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card p-4">
                <h2 class="text-center mb-4">Pricing & Budget Management</h2>
                
                <!-- Calculation Form -->
                <form action="/calculate-budget" method="POST" class="mb-5 border-bottom pb-4">
                    <div class="row g-3 align-items-center justify-content-center">
                        <div class="col-md-3">
                            <input type="text" name="packageId" class="form-control" placeholder="Package ID (e.g. PKG001)" required>
                        </div>
                        <div class="col-md-3">
                            <input type="number" step="0.01" name="basePrice" class="form-control" placeholder="Base Price" required>
                        </div>
                        <div class="col-md-3">
                            <input type="number" step="0.01" name="addonPrice" class="form-control" placeholder="Add-on Price" required>
                        </div>
                        <div class="col-md-2">
                            <button type="submit" class="btn btn-primary w-100">Calculate</button>
                        </div>
                    </div>
                </form>

                <h4 class="mb-3">Saved Price Records</h4>
                <div class="table-responsive">
                    <table class="table table-hover table-striped">
                        <thead>
                            <tr>
                                <th>Package ID</th>
                                <th>Base Price ($)</th>
                                <th>Add-ons ($)</th>
                                <th>Total Price ($)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="budget" items="${budgets}">
                                <tr>
                                    <td>${budget.packageId}</td>
                                    <td>${budget.basePrice}</td>
                                    <td>${budget.customAddons}</td>
                                    <td><strong>${budget.totalPrice}</strong></td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty budgets}">
                                <tr>
                                    <td colspan="4" class="text-center">No records found.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
                
                <div class="mt-3 text-muted">
                    <small>* Total Price includes 10% Tax. 5% Discount applied for totals above $2000.</small>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
