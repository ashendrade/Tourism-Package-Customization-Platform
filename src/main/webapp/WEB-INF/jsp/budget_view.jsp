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
    <!-- Project CSS -->
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/responsive.css">
    <style>
        body {
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('https://www.image2url.com/r2/default/images/1776767940648-fb7013a2-808d-4464-b265-db0c85273699.jpg');
            background-size: cover;
            background-attachment: fixed;
            min-height: 100vh;
            padding-top: 100px;
        }
        .glass-card {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            color: white;
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
        }
        .form-control {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: white !important;
        }
        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }
        .form-control:focus {
            background: rgba(255, 255, 255, 0.2);
            border-color: #278282;
            box-shadow: none;
            color: white;
        }
        .table {
            color: white;
        }
        .btn-primary {
            background-color: #278282;
            border: none;
        }
        .btn-primary:hover {
            background-color: #1f6b6b;
        }
        h2, h4 {
            font-weight: 600;
            letter-spacing: 1px;
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-11">
            <div class="glass-card p-5">
                <h2 class="text-center mb-5">Pricing & Budget Management</h2>
                
                <!-- Calculation Form -->
                <form action="/calculate-budget" method="POST" class="mb-5 border-bottom border-secondary pb-4">
                    <div class="row g-4 align-items-center justify-content-center">
                        <div class="col-md-3">
                            <label class="form-label">Package ID</label>
                            <input type="text" name="packageId" class="form-control" placeholder="e.g. PKG001" required>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Base Price ($)</label>
                            <input type="number" step="0.01" name="basePrice" class="form-control" placeholder="Base cost" required>
                        </div>
                        <div class="col-md-3">
                            <label class="form-label">Add-on Price ($)</label>
                            <input type="number" step="0.01" name="addonPrice" class="form-control" placeholder="Customizations" required>
                        </div>
                        <div class="col-md-2 d-flex align-items-end">
                            <button type="submit" class="btn btn-primary w-100 py-2">Calculate</button>
                        </div>
                    </div>
                </form>

                <h4 class="mb-4">Saved Price Records</h4>
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead class="table-dark bg-transparent">
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
                                    <td>$ ${budget.basePrice}</td>
                                    <td>$ ${budget.customAddons}</td>
                                    <td><span class="badge bg-success p-2">$ ${budget.totalPrice}</span></td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty budgets}">
                                <tr>
                                    <td colspan="4" class="text-center py-4 text-muted">No records found.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
                
                <div class="mt-4 text-light opacity-75">
                    <small>* Total Price includes 10% Tax. A 5% Discount is automatically applied for totals exceeding $2,000.</small>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
