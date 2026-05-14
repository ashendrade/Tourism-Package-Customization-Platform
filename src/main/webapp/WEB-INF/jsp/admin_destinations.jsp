<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Destinations - Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f8fafc; font-family: 'Poppins', sans-serif; }
        .page-header { background: #278282; color: white; padding: 40px 0; margin-bottom: 30px; }
        .admin-card { background: white; border-radius: 12px; padding: 30px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
        .table thead { background: #f1f5f9; }
        .btn-add { background: #278282; color: white; border: none; }
        .btn-add:hover { background: #1f6b6b; color: white; }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="page-header">
    <div class="container">
        <h1>Destination Management</h1>
        <p>Add and manage travel destinations globally</p>
    </div>
</div>

<div class="container">
    <div class="row">
        <!-- Add Form -->
        <div class="col-md-4">
            <div class="admin-card mb-4">
                <h4>Add Destination</h4>
                <form action="/admin/destinations/add" method="POST">
                    <div class="mb-3">
                        <label class="form-label">Destination Name</label>
                        <input type="text" name="destinationName" class="form-control" required placeholder="e.g. Santorini">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Country</label>
                        <input type="text" name="country" class="form-control" required placeholder="e.g. Greece">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">City</label>
                        <input type="text" name="city" class="form-control" required placeholder="e.g. Fira">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Description</label>
                        <textarea name="description" class="form-control" rows="3" required></textarea>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Base Price (Rs)</label>
                        <input type="number" name="price" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Package Type</label>
                        <select name="packageType" class="form-control">
                            <option value="Adventure">Adventure</option>
                            <option value="Relaxation">Relaxation</option>
                            <option value="Cultural">Cultural</option>
                            <option value="Luxury">Luxury</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-add w-100">Add Destination</button>
                </form>
            </div>
        </div>

        <!-- List Table -->
        <div class="col-md-8">
            <div class="admin-card">
                <table class="table align-middle">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Country</th>
                            <th>Price</th>
                            <th>Type</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dest" items="${destinations}">
                            <tr>
                                <td><strong>${dest.destinationName}</strong></td>
                                <td>${dest.country}</td>
                                <td>Rs. ${dest.price}</td>
                                <td><span class="badge bg-info text-dark">${dest.packageType}</span></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
