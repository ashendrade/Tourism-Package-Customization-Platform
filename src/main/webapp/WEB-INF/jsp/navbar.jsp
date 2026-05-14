<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header>
   <div class="container">
     <nav>
        <div class="logo">
            <img src="/img/logo.jpg" alt="Logo"/>
        </div>
        <ul>
             <li><a href="/">Home</a></li>
             <li><a href="/destinations">Destinations</a></li>
             <li><a href="/packages">Packages</a></li>
             <li><a href="/budget">Budget</a></li>
             <li><a href="/bookings">Bookings</a></li>
             <li><a href="/reviews">Reviews</a></li>
            <li>
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <span class="text-white me-3">Welcome, ${sessionScope.user.username}</span>
                        <a href="/logout" class="btn btn-outline-light btn-sm">Logout</a>
                    </c:when>
                    <c:otherwise>
                        <a href="/login" class="btn btn-outline-light btn-sm">Login</a>
                    </c:otherwise>
                </c:choose>
            </li>
        </ul>    
     </nav>
    </div> 
</header>
