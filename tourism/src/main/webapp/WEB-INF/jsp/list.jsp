<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Destination Management - Tourism Platform</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #0EA5E9;
            --primary-light: #38BDF8;
            --dark: #1F2937;
            --light-bg: #F0F9FF;
            --white: #FFFFFF;
            --text-dark: #1F2937;
            --text-gray: #6B7280;
            --border: #E5E7EB;
            --success: #10B981;
            --warning: #F59E0B;
            --danger: #EF4444;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, var(--light-bg) 0%, #E0F2FE 100%);
            min-height: 100vh;
            color: var(--text-dark);
        }

        /* Header Section */
        .top-header {
            background: var(--white);
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            position: sticky;
            top: 0;
            z-index: 100;
            animation: slideDown 0.5s ease;
        }

        @keyframes slideDown {
            from {
                transform: translateY(-100%);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .header-content {
            max-width: 1400px;
            margin: 0 auto;
            padding: 25px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        .header-title {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .header-title i {
            font-size: 2.5rem;
            color: var(--primary);
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }

        .header-title h1 {
            font-size: 2rem;
            font-weight: 700;
            color: var(--dark);
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-light) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .header-actions {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
        }

        .btn {
            padding: 12px 28px;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            font-size: 0.95rem;
            position: relative;
            overflow: hidden;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            border-radius: 50%;
            background: rgba(255,255,255,0.3);
            transform: translate(-50%, -50%);
            transition: width 0.6s, height 0.6s;
        }

        .btn:hover::before {
            width: 300px;
            height: 300px;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-light) 100%);
            color: var(--white);
            box-shadow: 0 4px 15px rgba(14, 165, 233, 0.3);
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(14, 165, 233, 0.4);
        }

        /* Container */
        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 30px;
        }

        /* Alerts */
        .alert {
            padding: 16px 24px;
            border-radius: 12px;
            margin-bottom: 25px;
            display: flex;
            align-items: center;
            gap: 12px;
            animation: slideInLeft 0.5s ease;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        @keyframes slideInLeft {
            from {
                opacity: 0;
                transform: translateX(-30px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .alert-success {
            background: linear-gradient(135deg, #D1FAE5 0%, #A7F3D0 100%);
            color: #065F46;
            border-left: 4px solid var(--success);
        }

        .alert-info {
            background: linear-gradient(135deg, var(--light-bg) 0%, #DBEAFE 100%);
            color: #1E40AF;
            border-left: 4px solid var(--primary);
        }

        .alert i {
            font-size: 1.3rem;
        }

        /* Search Section */
        .search-section {
            background: var(--white);
            padding: 30px;
            border-radius: 20px;
            margin-bottom: 30px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.08);
            animation: fadeIn 0.6s ease;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.95);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        .search-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            flex-wrap: wrap;
            gap: 15px;
        }

        .search-header h2 {
            font-size: 1.5rem;
            color: var(--dark);
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .search-header h2 i {
            color: var(--primary);
        }

        .toggle-search {
            background: var(--light-bg);
            color: var(--primary);
            border: 2px solid var(--primary);
            padding: 10px 20px;
            border-radius: 10px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .toggle-search:hover {
            background: var(--primary);
            color: var(--white);
        }

        .search-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }

        .search-grid.hidden {
            display: none;
        }

        .search-box {
            background: linear-gradient(135deg, var(--light-bg) 0%, #E0F2FE 100%);
            padding: 25px;
            border-radius: 15px;
            border: 2px solid transparent;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .search-box::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(14, 165, 233, 0.1), transparent);
            transition: left 0.5s ease;
        }

        .search-box:hover::before {
            left: 100%;
        }

        .search-box:hover {
            border-color: var(--primary);
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(14, 165, 233, 0.2);
        }

        .search-box h3 {
            font-size: 1.1rem;
            color: var(--dark);
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .search-box h3 i {
            color: var(--primary);
            font-size: 1.3rem;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: var(--text-gray);
            font-weight: 500;
            font-size: 0.9rem;
        }

        .form-control {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid var(--border);
            border-radius: 10px;
            font-size: 0.95rem;
            font-family: 'Inter', sans-serif;
            transition: all 0.3s ease;
            background: var(--white);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 4px rgba(14, 165, 233, 0.1);
            transform: translateY(-2px);
        }

        .btn-search {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-light) 100%);
            color: var(--white);
            border: none;
            border-radius: 10px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .btn-search:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(14, 165, 233, 0.4);
        }

        .btn-reset {
            width: 100%;
            padding: 10px;
            background: var(--white);
            color: var(--text-gray);
            border: 2px solid var(--border);
            border-radius: 10px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 10px;
            transition: all 0.3s ease;
        }

        .btn-reset:hover {
            border-color: var(--danger);
            color: var(--danger);
            background: #FEF2F2;
        }

        /* Stats Section */
        .stats-section {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-light) 100%);
            padding: 25px 30px;
            border-radius: 20px;
            margin-bottom: 30px;
            color: var(--white);
            box-shadow: 0 10px 40px rgba(14, 165, 233, 0.3);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        .stats-content {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .stats-icon {
            font-size: 3.5rem;
            opacity: 0.9;
            animation: bounce 2s infinite;
        }

        @keyframes bounce {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
        }

        .stats-text h3 {
            font-size: 1.1rem;
            font-weight: 500;
            margin-bottom: 8px;
            opacity: 0.95;
        }

        .stats-number {
            font-size: 3rem;
            font-weight: 800;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }

        /* Cards Grid */
        .cards-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 30px;
            margin-bottom: 30px;
        }

        .destination-card {
            background: var(--white);
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            animation: fadeInUp 0.6s ease;
            position: relative;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .destination-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 50px rgba(14, 165, 233, 0.2);
        }

        .card-header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-light) 100%);
            color: var(--white);
            padding: 25px;
            position: relative;
            overflow: hidden;
        }

        .card-header::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.15) 0%, transparent 70%);
            animation: rotate 10s linear infinite;
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .card-header h3 {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 8px;
            position: relative;
            z-index: 1;
        }

        .location {
            font-size: 0.95rem;
            opacity: 0.95;
            display: flex;
            align-items: center;
            gap: 8px;
            position: relative;
            z-index: 1;
        }

        .card-body {
            padding: 25px;
        }

        .package-badge {
            display: inline-block;
            padding: 8px 18px;
            border-radius: 50px;
            font-size: 0.85rem;
            font-weight: 600;
            margin-bottom: 15px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .badge-honeymoon {
            background: linear-gradient(135deg, #FDF2F8 0%, #FCE7F3 100%);
            color: #BE185D;
            border: 2px solid #F9A8D4;
        }

        .badge-adventure {
            background: linear-gradient(135deg, #F0FDF4 0%, #DCFCE7 100%);
            color: #15803D;
            border: 2px solid #86EFAC;
        }

        .badge-luxury {
            background: linear-gradient(135deg, #FFFBEB 0%, #FEF3C7 100%);
            color: #B45309;
            border: 2px solid #FDE68A;
        }

        .badge-family {
            background: linear-gradient(135deg, #EFF6FF 0%, #DBEAFE 100%);
            color: #1E40AF;
            border: 2px solid #93C5FD;
        }

        .badge-budget {
            background: linear-gradient(135deg, #F5F3FF 0%, #EDE9FE 100%);
            color: #6B21A8;
            border: 2px solid #C4B5FD;
        }

        .price-tag {
            background: linear-gradient(135deg, #1F2937 0%, #374151 100%);
            color: var(--white);
            padding: 15px 25px;
            border-radius: 15px;
            font-size: 1.6rem;
            font-weight: 800;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 20px;
            box-shadow: 0 4px 15px rgba(31, 41, 55, 0.3);
        }

        .price-tag i {
            font-size: 1.3rem;
        }

        .card-info {
            display: grid;
            gap: 12px;
            margin-bottom: 20px;
        }

        .info-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 12px;
            background: var(--light-bg);
            border-radius: 10px;
            transition: all 0.3s ease;
        }

        .info-row:hover {
            background: #DBEAFE;
            transform: translateX(5px);
        }

        .info-left {
            display: flex;
            align-items: center;
            gap: 10px;
            color: var(--text-gray);
            font-weight: 500;
        }

        .info-left i {
            color: var(--primary);
            width: 20px;
            text-align: center;
        }

        .info-right {
            color: var(--dark);
            font-weight: 600;
        }

        .description {
            color: var(--text-gray);
            font-size: 0.95rem;
            line-height: 1.7;
            margin-bottom: 20px;
            padding: 15px;
            background: var(--light-bg);
            border-radius: 12px;
            border-left: 4px solid var(--primary);
        }

        .card-actions {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
        }

        .btn-edit {
            background: linear-gradient(135deg, #FEF3C7 0%, #FDE047 100%);
            color: #854D0E;
            border: 2px solid #FCD34D;
            justify-content: center;
            font-weight: 700;
        }

        .btn-edit:hover {
            background: linear-gradient(135deg, #FDE047 0%, #FACC15 100%);
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(250, 204, 21, 0.4);
        }

        .btn-delete {
            background: linear-gradient(135deg, #FEE2E2 0%, #FCA5A5 100%);
            color: #991B1B;
            border: 2px solid #FCA5A5;
            justify-content: center;
            font-weight: 700;
        }

        .btn-delete:hover {
            background: linear-gradient(135deg, #FCA5A5 0%, #F87171 100%);
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(248, 113, 113, 0.4);
        }

        /* Empty State */
        .empty-state {
            background: var(--white);
            padding: 80px 40px;
            border-radius: 20px;
            text-align: center;
            box-shadow: 0 10px 40px rgba(0,0,0,0.08);
        }

        .empty-state i {
            font-size: 6rem;
            color: var(--primary);
            opacity: 0.3;
            margin-bottom: 25px;
            animation: float 3s infinite ease-in-out;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }

        .empty-state h2 {
            color: var(--dark);
            margin-bottom: 15px;
            font-size: 2rem;
        }

        .empty-state p {
            color: var(--text-gray);
            margin-bottom: 30px;
            font-size: 1.1rem;
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .cards-grid {
                grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            }
        }

        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }

            .header-content {
                flex-direction: column;
                align-items: flex-start;
            }

            .header-title h1 {
                font-size: 1.5rem;
            }

            .header-title i {
                font-size: 2rem;
            }

            .header-actions {
                width: 100%;
            }

            .btn {
                width: 100%;
                justify-content: center;
            }

            .search-grid {
                grid-template-columns: 1fr;
            }

            .stats-section {
                flex-direction: column;
                text-align: center;
            }

            .cards-grid {
                grid-template-columns: 1fr;
            }

            .card-actions {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 15px;
            }

            .header-content {
                padding: 20px 15px;
            }

            .search-section {
                padding: 20px;
            }

            .stats-icon {
                font-size: 2.5rem;
            }

            .stats-number {
                font-size: 2rem;
            }

            .price-tag {
                font-size: 1.3rem;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="top-header">
        <div class="header-content">
            <div class="header-title">
                <i class="fas fa-globe-americas"></i>
                <div>
                    <h1>Destination Management</h1>
                </div>
            </div>
            <div class="header-actions">
                <a href="${pageContext.request.contextPath}/destinations/add" class="btn btn-primary">
                    <i class="fas fa-plus-circle"></i>
                    Add Destination
                </a>
            </div>
        </div>
    </div>

    <div class="container">
        <!-- Success Message -->
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success">
                <i class="fas fa-check-circle"></i>
                <span>${successMessage}</span>
            </div>
        </c:if>

        <!-- Search Info -->
        <c:if test="${not empty searchInfo}">
            <div class="alert alert-info">
                <i class="fas fa-filter"></i>
                <strong>Active Filter:</strong> ${searchInfo}
            </div>
        </c:if>

        <!-- Search Section -->
        <div class="search-section">
            <div class="search-header">
                <h2>
                    <i class="fas fa-search"></i>
                    Search & Filter
                </h2>
                <button class="toggle-search" onclick="toggleSearch()">
                    <i class="fas fa-sliders-h"></i>
                    <span id="toggleText">Show Filters</span>
                </button>
            </div>

            <div class="search-grid hidden" id="searchGrid">
                <!-- Search by Country -->
                <div class="search-box">
                    <h3>
                        <i class="fas fa-globe"></i>
                        By Country
                    </h3>
                    <form action="${pageContext.request.contextPath}/destinations/search/country" method="get">
                        <div class="form-group">
                            <label>Country Name</label>
                            <input type="text" name="country" class="form-control"
                                   placeholder="e.g., Indonesia, France" required>
                        </div>
                        <button type="submit" class="btn-search">
                            <i class="fas fa-search"></i>
                            Search
                        </button>
                    </form>
                </div>

                <!-- Search by Budget -->
                <div class="search-box">
                    <h3>
                        <i class="fas fa-wallet"></i>
                        By Budget
                    </h3>
                    <form action="${pageContext.request.contextPath}/destinations/search/budget" method="get">
                        <div class="form-group">
                            <label>Maximum Budget (Rs.)</label>
                            <input type="number" name="budget" class="form-control"
                                   placeholder="e.g., 50000" required step="0.01" min="0">
                        </div>
                        <button type="submit" class="btn-search">
                            <i class="fas fa-search"></i>
                            Search
                        </button>
                    </form>
                </div>

                <!-- Search by Package Type -->
                <div class="search-box">
                    <h3>
                        <i class="fas fa-suitcase"></i>
                        By Package
                    </h3>
                    <form action="${pageContext.request.contextPath}/destinations/search/package" method="get">
                        <div class="form-group">
                            <label>Package Type</label>
                            <select name="packageType" class="form-control" required>
                                <option value="">Select Package</option>
                                <option value="Honeymoon">🌹 Honeymoon</option>
                                <option value="Adventure">⛰️ Adventure</option>
                                <option value="Luxury">💎 Luxury</option>
                                <option value="Family">👨‍👩‍👧‍👦 Family</option>
                                <option value="Budget">💰 Budget</option>
                            </select>
                        </div>
                        <button type="submit" class="btn-search">
                            <i class="fas fa-search"></i>
                            Search
                        </button>
                    </form>
                </div>
            </div>

            <!-- Clear Filters Button -->
            <c:if test="${not empty searchInfo}">
                <a href="${pageContext.request.contextPath}/destinations/list" class="btn-reset" style="display: block; text-align: center; margin-top: 15px; text-decoration: none;">
                    <i class="fas fa-times-circle"></i>
                    Clear All Filters
                </a>
            </c:if>
        </div>

        <!-- Stats Section -->
        <div class="stats-section">
            <div class="stats-content">
                <i class="fas fa-map-marked-alt stats-icon"></i>
                <div class="stats-text">
                    <h3>Total Destinations Available</h3>
                    <div class="stats-number">
                        <c:choose>
                            <c:when test="${not empty totalDestinations}">${totalDestinations}</c:when>
                            <c:otherwise>0</c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>

        <!-- Destinations Grid -->
        <c:choose>
            <c:when test="${not empty destinations}">
                <div class="cards-grid">
                    <c:forEach var="dest" items="${destinations}">
                        <div class="destination-card">
                            <div class="card-header">
                                <h3>${dest.destinationName}</h3>
                                <div class="location">
                                    <i class="fas fa-map-marker-alt"></i>
                                    <span>${dest.city}, ${dest.country}</span>
                                </div>
                            </div>
                            <div class="card-body">
                                <span class="package-badge badge-${dest.packageType.toLowerCase()}">
                                    ${dest.packageType}
                                </span>

                                <div class="price-tag">
                                    <i class="fas fa-rupee-sign"></i>
                                    <fmt:formatNumber value="${dest.price}" pattern="#,##0.00"/>
                                </div>

                                <div class="card-info">
                                    <div class="info-row">
                                        <div class="info-left">
                                            <i class="fas fa-hashtag"></i>
                                            <span>ID</span>
                                        </div>
                                        <div class="info-right">${dest.destinationId}</div>
                                    </div>
                                    <div class="info-row">
                                        <div class="info-left">
                                            <i class="fas fa-flag"></i>
                                            <span>Country</span>
                                        </div>
                                        <div class="info-right">${dest.country}</div>
                                    </div>
                                    <div class="info-row">
                                        <div class="info-left">
                                            <i class="fas fa-city"></i>
                                            <span>City</span>
                                        </div>
                                        <div class="info-right">${dest.city}</div>
                                    </div>
                                </div>

                                <div class="description">
                                    ${dest.description}
                                </div>

                                <div class="card-actions">
                                    <a href="${pageContext.request.contextPath}/destinations/edit/${dest.destinationId}"
                                       class="btn btn-edit">
                                        <i class="fas fa-edit"></i>
                                        Edit
                                    </a>
                                    <a href="${pageContext.request.contextPath}/destinations/delete/${dest.destinationId}"
                                       class="btn btn-delete"
                                       onclick="return confirm('⚠️ Are you sure you want to delete this destination?\n\nDestination: ${dest.destinationName}\nLocation: ${dest.city}, ${dest.country}\n\nThis action cannot be undone!')">
                                        <i class="fas fa-trash-alt"></i>
                                        Delete
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:when>
            <c:otherwise>
                <div class="empty-state">
                    <i class="fas fa-map-marked-alt"></i>
                    <h2>No Destinations Found</h2>
                    <p>Start building your destination database by adding your first location</p>
                    <a href="${pageContext.request.contextPath}/destinations/add" class="btn btn-primary">
                        <i class="fas fa-plus-circle"></i>
                        Add Your First Destination
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <script>
        function toggleSearch() {
            const searchGrid = document.getElementById('searchGrid');
            const toggleText = document.getElementById('toggleText');
            const toggleBtn = document.querySelector('.toggle-search');

            if (searchGrid.classList.contains('hidden')) {
                searchGrid.classList.remove('hidden');
                toggleText.textContent = 'Hide Filters';
                toggleBtn.innerHTML = '<i class="fas fa-times"></i> ' + toggleText.outerHTML;
            } else {
                searchGrid.classList.add('hidden');
                toggleText.textContent = 'Show Filters';
                toggleBtn.innerHTML = '<i class="fas fa-sliders-h"></i> ' + toggleText.outerHTML;
            }
        }

        // Auto-dismiss alerts after 5 seconds
        setTimeout(() => {
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(alert => {
                alert.style.transition = 'all 0.5s ease';
                alert.style.opacity = '0';
                alert.style.transform = 'translateX(-30px)';
                setTimeout(() => alert.remove(), 500);
            });
        }, 5000);
    </script>
</body>
</html>