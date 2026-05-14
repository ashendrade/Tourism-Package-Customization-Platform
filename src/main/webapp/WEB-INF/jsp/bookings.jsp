<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Bookings - Tourism Platform</title>
    <link rel="icon" type="image/jpg" href="/img/logo.jpg">
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

        .booking-card {
            background: white;
            border: 1px solid #E2E8F0;
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            transition: transform 0.2s;
        }

        .booking-card:hover {
            transform: translateY(-2px);
        }

        .status-badge {
            padding: 5px 15px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 600;
            text-transform: uppercase;
        }

        .status-pending { background: #FEF3C7; color: #92400E; }
        .status-confirmed { background: #D1FAE5; color: #065F46; }
        .status-cancelled { background: #FEE2E2; color: #991B1B; }

        .price-text {
            color: #278282;
            font-weight: 800;
            font-size: 1.25rem;
        }

        .details-text {
            font-size: 0.85rem;
            color: #64748B;
        }

        .tier-badge {
            background: #f1f5f9;
            padding: 2px 8px;
            border-radius: 4px;
            font-size: 0.75rem;
            margin-left: 10px;
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="page-header">
    <div class="container text-center">
        <h1>My Bookings</h1>
        <p>Track your customized travel history</p>
    </div>
</div>

<div class="container">
    <c:if test="${param.success == 'true'}">
        <div class="alert alert-success border-0 shadow-sm mb-4 py-3" style="border-radius: 12px; background: #D1FAE5; color: #065F46;">
            <i class="fas fa-check-circle me-2"></i> Payment successful! Your booking has been confirmed.
        </div>
    </c:if>
    <div class="booking-list">
        <c:forEach var="booking" items="${bookings}">
            <div class="booking-card">
                <div class="d-flex align-items-center">
                    <div class="me-4 text-center">
                        <i class="fas fa-suitcase-rolling fa-2x text-muted"></i>
                    </div>
                    <div>
                        <h5 class="mb-1">${booking.packageId} <span class="tier-badge">${booking.hotelTier}</span></h5>
                        <div class="details-text">
                            <span><i class="far fa-calendar-alt me-1"></i> ${booking.bookingDate}</span>
                            <span class="ms-3"><i class="far fa-clock me-1"></i> ${booking.duration} Days</span>
                        </div>
                    </div>
                </div>
                <div class="text-center">
                    <span class="status-badge status-${booking.status.toLowerCase()}">${booking.status}</span>
                    <div class="small text-muted mt-2">Ref: #${booking.id}</div>
                </div>
                <div class="text-end">
                    <div class="price-text">Rs. <fmt:formatNumber value="${booking.price}" pattern="#,##0.00"/></div>
                    <c:choose>
                        <c:when test="${booking.status == 'PENDING'}">
                            <a href="${pageContext.request.contextPath}/bookings/pay?bookingId=${booking.id}" class="btn btn-sm btn-primary mt-2 px-4 py-2 fw-bold" style="background:#278282; border:none; border-radius:8px;">Pay Now</a>
                        </c:when>
                        <c:otherwise>
                            <div class="small text-muted mt-1">Payment Completed</div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
