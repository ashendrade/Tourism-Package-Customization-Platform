<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Customized Packages - OCEANWAVE</title>
    <link rel="icon" type="image/jpg" href="/img/logo.jpg">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #F8FAFC;
            color: #1E293B;
        }

        .page-header {
            background: #278282;
            color: white;
            padding: 60px 0;
            margin-bottom: 40px;
        }

        .package-card {
            background: white;
            border: 1px solid #E2E8F0;
            border-radius: 10px;
            padding: 25px;
            margin-bottom: 20px;
            transition: 0.3s;
        }

        .package-card:hover {
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            border-color: #278282;
        }

        .tier-badge {
            display: inline-block;
            padding: 4px 12px;
            border-radius: 4px;
            font-size: 0.75rem;
            font-weight: bold;
            text-transform: uppercase;
            margin-bottom: 10px;
        }

        .tier-luxury { background: #FEF3C7; color: #92400E; }
        .tier-economy { background: #D1FAE5; color: #065F46; }

        .btn-modify {
            color: #278282;
            border: 1px solid #278282;
            padding: 5px 15px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 0.9rem;
        }

        .btn-modify:hover {
            background: #278282;
            color: white;
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="page-header">
    <div class="container text-center">
        <h1>Travel Packages</h1>
        <p>Your customized configurations</p>
    </div>
</div>

<div class="container">
    <div class="row">
        <c:forEach var="pkg" items="${packages}">
            <div class="col-md-6">
                <div class="package-card">
                    <span class="tier-badge tier-${pkg.hotelType.toLowerCase()}">${pkg.hotelType}</span>
                    <h4 class="mb-2">${pkg.name}</h4>
                    <div class="mb-3 text-muted">
                        <span class="me-3"><i class="fas fa-map-pin me-2"></i>${pkg.destination}</span>
                        <span><i class="fas fa-clock me-2"></i>${pkg.duration} Days</span>
                    </div>
                    <div class="d-flex justify-content-between align-items-center mt-3">
                        <small class="text-muted">ID: <code>#${pkg.id}</code></small>
                        <div>
                            <a href="${pageContext.request.contextPath}/packages/edit/${pkg.id}" class="btn btn-sm btn-outline-primary me-2">
                                <i class="fas fa-edit me-1"></i> Edit
                            </a>
                            <a href="${pageContext.request.contextPath}/packages/delete/${pkg.id}" class="btn btn-sm btn-outline-danger" onclick="return confirm('Are you sure you want to permanently delete this customized package and its associated booking?')">
                                <i class="fas fa-trash-alt me-1"></i> Delete
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

    <jsp:include page="footer.jsp" />
</body>
</html>
