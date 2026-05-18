<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Explore Destinations - Tourism Platform</title>
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

        .dest-card {
            background: white;
            border: 1px solid #E2E8F0;
            border-radius: 10px;
            overflow: hidden;
            transition: 0.3s;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        .dest-card:hover {
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            transform: translateY(-5px);
        }

        .dest-img {
            height: 200px;
            background: #f1f5f9;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3rem;
            color: #278282;
        }

        .dest-body {
            padding: 20px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .price-tag {
            font-size: 1.25rem;
            font-weight: bold;
            color: #278282;
        }

        .btn-customize {
            background: #278282;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            text-decoration: none;
            text-align: center;
            font-weight: bold;
            margin-top: 15px;
        }

        .btn-customize:hover {
            background: #179FD0;
            color: white;
        }

        .search-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            margin-top: -30px;
            position: relative;
            z-index: 20;
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="page-header">
    <div class="container">
        <h1>Explore Destinations</h1>
        <p>Your journey begins here</p>
    </div>
</div>

<div class="container">
    <div class="search-container mb-5">
        <div class="row g-3">
            <div class="col-md-4">
                <form action="${pageContext.request.contextPath}/destinations/search/country" method="GET" class="d-flex gap-2">
                    <input type="text" name="country" class="form-control" placeholder="By Country">
                    <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i></button>
                </form>
            </div>
            <div class="col-md-4">
                <form action="${pageContext.request.contextPath}/destinations/search/budget" method="GET" class="d-flex gap-2">
                    <input type="number" name="budget" class="form-control" placeholder="Max Budget (Rs.)">
                    <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i></button>
                </form>
            </div>
            <div class="col-md-4">
                <form action="${pageContext.request.contextPath}/destinations/search/package" method="GET" class="d-flex gap-2">
                    <select name="packageType" class="form-select">
                        <option value="Adventure">Adventure</option>
                        <option value="Religious">Religious</option>
                        <option value="Coastal">Coastal</option>
                        <option value="Nightlife">Nightlife</option>
                    </select>
                    <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i></button>
                </form>
            </div>
        </div>
    </div>

    <div class="row">
        <c:forEach var="dest" items="${destinations}">
            <div class="col-md-4 mb-4">
                <div class="dest-card">
                    <div class="dest-img">
                        <c:choose>
                            <c:when test="${not empty dest.imageUrl}">
                                <img src="${pageContext.request.contextPath}/img/${dest.imageUrl}" alt="${dest.destinationName}" style="width: 100%; height: 100%; object-fit: cover;">
                            </c:when>
                            <c:otherwise>
                                <i class="fas fa-map-marked-alt"></i>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="dest-body">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <h4 class="m-0">${dest.destinationName}</h4>
                            <span class="badge bg-info text-white">${dest.packageType}</span>
                        </div>
                        <p class="text-muted small"><i class="fas fa-location-dot me-2"></i>${dest.city}, ${dest.country}</p>
                        <p class="small flex-grow-1">${dest.description}</p>
                        <div class="price-tag mt-3">Rs. <fmt:formatNumber value="${dest.price}" pattern="#,##0.00"/></div>
                        <a href="${pageContext.request.contextPath}/packages/customize?destinationId=${dest.destinationId}" class="btn-customize">Customize Now</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>