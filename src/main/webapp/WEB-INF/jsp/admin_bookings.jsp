<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Global Bookings - Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { background: #f8fafc; font-family: 'Poppins', sans-serif; }
        .page-header { background: #278282; color: white; padding: 40px 0; margin-bottom: 30px; }
        .admin-card { background: white; border-radius: 12px; padding: 30px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
        .status-badge { padding: 5px 12px; border-radius: 20px; font-size: 0.7rem; font-weight: 700; text-transform: uppercase; }
        .status-pending { background: #fef3c7; color: #92400e; }
        .status-confirmed { background: #d1fae5; color: #065f46; }
        .user-pill { background: #e2e8f0; padding: 4px 10px; border-radius: 6px; font-size: 0.8rem; font-weight: 600; }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="page-header">
    <div class="container">
        <h1>Global Booking Monitor</h1>
        <p>Overview of all traveler activity across the platform</p>
    </div>
</div>

<div class="container mb-5">
    <div class="admin-card">
        <table class="table table-hover align-middle">
            <thead class="table-light">
                <tr>
                    <th>Ref ID</th>
                    <th>Traveler</th>
                    <th>Package ID</th>
                    <th>Tier</th>
                    <th>Date</th>
                    <th>Price</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="booking" items="${bookings}">
                    <tr>
                        <td><code>#${booking.id}</code></td>
                        <td><span class="user-pill"><i class="fas fa-user me-2"></i>${booking.userId}</span></td>
                        <td><strong>${booking.packageId}</strong></td>
                        <td>${booking.hotelTier}</td>
                        <td><small>${booking.bookingDate}</small></td>
                        <td class="fw-bold">Rs. <fmt:formatNumber value="${booking.price}" pattern="#,##0.00"/></td>
                        <td>
                            <span class="status-badge status-${booking.status.toLowerCase()}">${booking.status}</span>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
