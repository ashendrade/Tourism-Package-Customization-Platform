<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Traveler Reviews - OCEANWAVE</title>
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

        .content-card {
            background: white;
            border: 1px solid #E2E8F0;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .review-card {
            background: #F8FAFC;
            border: 1px solid #E2E8F0;
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 20px;
        }

        .stars {
            color: #FBBF24;
        }

        .rating-breakdown {
            display: flex;
            gap: 15px;
            font-size: 0.8rem;
            color: #64748B;
            margin: 10px 0;
        }

        .review-media {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }

        .review-media img, .review-media video {
            width: 120px;
            height: 80px;
            object-fit: cover;
            border-radius: 8px;
        }

        .text-info {
            color: #278282 !important;
        }

        .btn-primary {
            background-color: #278282;
            border: none;
        }

        .btn-primary:hover {
            background-color: #1f6b6b;
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="page-header">
    <div class="container text-center">
        <h1>Traveler Reviews</h1>
        <p>Real stories from real travelers</p>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-5">
            <div class="content-card mb-4">
                <h4>Share Your Experience</h4>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger border-0 shadow-sm mb-3" style="border-radius: 8px; font-size: 0.85rem;">
                        <i class="fas fa-exclamation-circle me-2"></i> ${error}
                    </div>
                </c:if>
                <c:if test="${param.success == 'true'}">
                    <div class="alert alert-success border-0 shadow-sm mb-3" style="border-radius: 8px; font-size: 0.85rem; background: #D1FAE5; color: #065F46;">
                        <i class="fas fa-check-circle me-2"></i> Review posted successfully!
                    </div>
                </c:if>
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <form action="/reviews/add" method="POST" class="mt-4">
                            <div class="mb-3">
                                <label class="form-label">Select Destination</label>
                                <select name="packageId" class="form-select" required>
                                    <option value="">-- Choose a location --</option>
                                    <c:forEach var="dest" items="${destinations}">
                                        <option value="${dest.destinationId}">${dest.destinationName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            
                            <div class="row mb-3">
                                <div class="col">
                                    <label class="form-label">Overall Rating</label>
                                    <select name="rating" class="form-select">
                                        <option value="5">⭐⭐⭐⭐⭐</option>
                                        <option value="4">⭐⭐⭐⭐</option>
                                        <option value="3">⭐⭐⭐</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col">
                                    <label class="form-label small">Hotel Rating</label>
                                    <input type="number" name="accommodationRating" class="form-control form-control-sm" min="1" max="5" value="5">
                                </div>
                                <div class="col">
                                    <label class="form-label small">Transport</label>
                                    <input type="number" name="transportRating" class="form-control form-control-sm" min="1" max="5" value="5">
                                </div>
                                <div class="col">
                                    <label class="form-label small">Guide</label>
                                    <input type="number" name="guideRating" class="form-control form-control-sm" min="1" max="5" value="5">
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Comment</label>
                                <textarea name="comment" class="form-control" rows="3" required></textarea>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Media URLs (Optional)</label>
                                <input type="text" name="imageUrl" class="form-control form-control-sm mb-2" placeholder="Image URL">
                                <input type="text" name="videoUrl" class="form-control form-control-sm" placeholder="Video URL">
                            </div>

                            <button type="submit" class="btn btn-primary w-100">Post Review</button>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <p class="mt-4 text-center text-muted">Please login to leave a review.</p>
                        <a href="/login" class="btn btn-outline-primary w-100">Login Now</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <div class="col-md-7">
            <div class="content-card">
                <h4>Community Feedback</h4>
                <div class="mt-4">
                    <c:forEach var="review" items="${reviews}">
                        <div class="review-card">
                            <div class="d-flex justify-content-between align-items-center">
                                <h6 class="mb-0"><strong>${review.userId}</strong></h6>
                                <div class="stars">
                                    <c:forEach begin="1" end="${review.rating}"><i class="fas fa-star"></i></c:forEach>
                                </div>
                            </div>
                            <small class="text-info d-block mb-2">${review.packageId}</small>
                            
                            <div class="rating-breakdown">
                                <span><i class="fas fa-hotel"></i> ${review.accommodationRating}/5</span>
                                <span><i class="fas fa-car"></i> ${review.transportRating}/5</span>
                                <span><i class="fas fa-user-tie"></i> ${review.guideRating}/5</span>
                            </div>

                            <p class="mb-0 text-muted">"${review.comment}"</p>

                            <c:if test="${not empty review.imageUrl or not empty review.videoUrl}">
                                <div class="review-media">
                                    <c:if test="${not empty review.imageUrl}">
                                        <img src="${review.imageUrl}" alt="Review Image">
                                    </c:if>
                                    <c:if test="${not empty review.videoUrl}">
                                        <video src="${review.videoUrl}" controls></video>
                                    </c:if>
                                </div>
                            </c:if>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
