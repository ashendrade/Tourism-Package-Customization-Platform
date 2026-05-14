<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Traveler Reviews - Tourism Platform</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Project CSS -->
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"/>
    <style>
        body {
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('https://www.image2url.com/r2/default/images/1776767940648-fb7013a2-808d-4464-b265-db0c85273699.jpg');
            background-size: cover;
            background-attachment: fixed;
            min-height: 100vh;
            padding-top: 100px;
        }
        .glass-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            color: white;
            padding: 30px;
            margin-bottom: 30px;
        }
        .review-card {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }
        .review-card:hover {
            transform: translateY(-5px);
            background: rgba(255, 255, 255, 0.1);
        }
        .stars {
            color: #f4c430;
            margin-bottom: 10px;
        }
        .form-control, .form-select {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: white !important;
        }
        .form-control:focus, .form-select:focus {
            background: rgba(255, 255, 255, 0.2);
            border-color: #278282;
            box-shadow: none;
        }
        .btn-primary {
            background-color: #278282;
            border: none;
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="container mt-5">
    <div class="row">
        <!-- Review Submission -->
        <div class="col-md-4">
            <div class="glass-card">
                <h4 class="mb-4">Share Your Experience</h4>
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <form action="/reviews/add" method="POST">
                            <div class="mb-3">
                                <label class="form-label">Package ID</label>
                                <input type="text" name="packageId" class="form-control" placeholder="e.g. PKG001" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Rating</label>
                                <select name="rating" class="form-select" required>
                                    <option value="5">5 Stars - Excellent</option>
                                    <option value="4">4 Stars - Good</option>
                                    <option value="3">3 Stars - Average</option>
                                    <option value="2">2 Stars - Poor</option>
                                    <option value="1">1 Star - Terrible</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Comment</label>
                                <textarea name="comment" class="form-control" rows="4" placeholder="How was your trip?" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Submit Review</button>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <p class="text-center">Please <a href="/login" class="text-info">Login</a> to leave a review.</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Review List -->
        <div class="col-md-8">
            <div class="glass-card">
                <h3 class="mb-4">What Our Travelers Say</h3>
                <c:forEach var="review" items="${reviews}">
                    <div class="review-card">
                        <div class="d-flex justify-content-between align-items-start">
                            <div>
                                <div class="stars">
                                    <c:forEach begin="1" end="${review.rating}">
                                        <i class="fas fa-star"></i>
                                    </c:forEach>
                                    <c:forEach begin="${review.rating + 1}" end="5">
                                        <i class="far fa-star"></i>
                                    </c:forEach>
                                </div>
                                <h5 class="mb-1">${review.userId}</h5>
                                <p class="text-info small mb-2">Package: ${review.packageId}</p>
                            </div>
                        </div>
                        <p class="mb-0 opacity-75">"${review.comment}"</p>
                    </div>
                </c:forEach>
                <c:if test="${empty reviews}">
                    <p class="text-center py-5 opacity-50">No reviews yet. Be the first to share your journey!</p>
                </c:if>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
