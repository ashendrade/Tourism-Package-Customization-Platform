<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<header class="navbar-header">
    <div class="container-nav">
        <div class="logo">
            <img src="/img/logo.jpg" alt="OCEANWAVE"/>
        </div>
        <nav class="main-nav">
            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/destinations">Destinations</a></li>
                <li><a href="${pageContext.request.contextPath}/packages">Packages</a></li>
                <li><a href="${pageContext.request.contextPath}/budget">Budget</a></li>
                <li><a href="${pageContext.request.contextPath}/bookings">Bookings</a></li>
                <li><a href="${pageContext.request.contextPath}/reviews">Reviews</a></li>
                <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
            </ul>
            <div class="auth-links">
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <span class="welcome-text">Welcome, ${sessionScope.user.username}</span>
                        <a href="/logout" class="btn-logout">Logout</a>
                    </c:when>
                    <c:otherwise>
                        <a href="/login" class="btn-logout">Login</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </nav>
    </div>
</header>

<style>
    .navbar-header {
        width: 100%;
        background: #FFFFFF;
        padding: 15px 0;
        box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        position: sticky;
        top: 0;
        z-index: 1000;
    }

    .container-nav {
        max-width: 1300px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 40px;
    }

    .logo img {
        height: 50px;
        width: auto;
    }

    .main-nav {
        display: flex;
        align-items: center;
        gap: 40px;
    }

    .nav-links {
        display: flex;
        list-style: none;
        margin: 0;
        padding: 0;
        gap: 25px;
    }

    .nav-links a {
        color: #333333;
        text-decoration: none;
        font-size: 0.95rem;
        font-weight: 500;
        transition: color 0.3s;
    }

    .nav-links a:hover {
        color: #278282;
    }

    .auth-links {
        display: flex;
        align-items: center;
        gap: 20px;
        color: #333333;
    }

    .welcome-text {
        font-size: 0.95rem;
        font-weight: 400;
    }

    .btn-logout {
        border: 1.5px solid #333333;
        padding: 6px 20px;
        border-radius: 8px;
        color: #333333;
        text-decoration: none;
        font-size: 0.95rem;
        font-weight: 500;
        transition: all 0.3s;
    }

    .btn-logout:hover {
        background: #333333;
        color: #FFFFFF;
    }

    body {
        margin-top: 0;
    }
</style>
