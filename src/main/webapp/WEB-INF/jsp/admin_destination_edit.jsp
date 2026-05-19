<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Destination - Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { background: #f8fafc; font-family: 'Poppins', sans-serif; }
        .page-header { background: #278282; color: white; padding: 40px 0; margin-bottom: 30px; }
        .admin-card { background: white; border-radius: 12px; padding: 40px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); max-width: 700px; margin: 0 auto; }
        .btn-save { background: #278282; color: white; font-weight: 600; border: none; }
        .btn-save:hover { background: #1f6b6b; color: white; }
        .btn-cancel { border: 1px solid #94a3b8; color: #475569; font-weight: 600; }
        .btn-cancel:hover { background: #f1f5f9; color: #1e293b; }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="page-header">
    <div class="container text-center">
        <h1>Edit Destination</h1>
        <p>Modify geographical and pricing metadata for destination #${destination.destinationId}</p>
    </div>
</div>

<div class="container mb-5">
    <div class="admin-card">
        <form action="${pageContext.request.contextPath}/admin/destinations/update/${destination.destinationId}" method="POST">
            <div class="mb-4 text-center">
                <i class="fas fa-map-marked-alt text-secondary mb-3" style="font-size: 4.5rem;"></i>
                <h4 class="m-0">${destination.destinationName}</h4>
                <p class="text-muted small">${destination.city}, ${destination.country}</p>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label fw-semibold"><i class="fas fa-map-pin text-secondary me-2"></i>Destination Name</label>
                    <input type="text" name="destinationName" class="form-control" value="${destination.destinationName}" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label fw-semibold"><i class="fas fa-globe text-secondary me-2"></i>Country</label>
                    <input type="text" name="country" class="form-control" value="${destination.country}" required>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label fw-semibold"><i class="fas fa-city text-secondary me-2"></i>City</label>
                    <input type="text" name="city" class="form-control" value="${destination.city}" required>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label fw-semibold"><i class="fas fa-suitcase text-secondary me-2"></i>Package Type</label>
                    <select name="packageType" class="form-select" required>
                        <option value="Honeymoon" ${destination.packageType == 'Honeymoon' ? 'selected' : ''}>🌹 Honeymoon</option>
                        <option value="Adventure" ${destination.packageType == 'Adventure' ? 'selected' : ''}>⛰️ Adventure</option>
                        <option value="Luxury" ${destination.packageType == 'Luxury' ? 'selected' : ''}>💎 Luxury</option>
                        <option value="Family" ${destination.packageType == 'Family' ? 'selected' : ''}>👨‍👩‍👧‍👦 Family</option>
                        <option value="Budget" ${destination.packageType == 'Budget' ? 'selected' : ''}>💰 Budget</option>
                        <option value="Relaxation" ${destination.packageType == 'Relaxation' ? 'selected' : ''}>🌴 Relaxation</option>
                        <option value="Cultural" ${destination.packageType == 'Cultural' ? 'selected' : ''}>🏛️ Cultural</option>
                    </select>
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold"><i class="fas fa-tag text-secondary me-2"></i>Base Price (Rs.)</label>
                <input type="number" name="price" class="form-control" value="${destination.price}" step="0.01" min="0" required>
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold"><i class="fas fa-align-left text-secondary me-2"></i>Description</label>
                <textarea name="description" class="form-control" rows="4" required>${destination.description}</textarea>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label class="form-label fw-semibold"><i class="fas fa-image text-secondary me-2"></i>Image Filename</label>
                    <input type="text" name="imageUrl" class="form-control" value="${destination.imageUrl}" placeholder="e.g. maldives.png">
                </div>
                <div class="col-md-6 mb-3">
                    <label class="form-label fw-semibold"><i class="fas fa-cloud-sun text-secondary me-2"></i>Weather Information</label>
                    <input type="text" name="weatherInfo" class="form-control" value="${destination.weatherInfo}" placeholder="e.g. Sunny and Pleasant">
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-4">
                    <label class="form-label fw-semibold"><i class="fas fa-bus text-secondary me-2"></i>Transport Options</label>
                    <input type="text" name="transportOptions" class="form-control" value="${destination.transportOptions}" placeholder="e.g. Bus and Taxi">
                </div>
                <div class="col-md-6 mb-4">
                    <label class="form-label fw-semibold"><i class="fas fa-handshake text-secondary me-2"></i>Cultural Etiquette</label>
                    <input type="text" name="culturalEtiquette" class="form-control" value="${destination.culturalEtiquette}" placeholder="e.g. Respect local customs">
                </div>
            </div>

            <div class="d-flex gap-3">
                <button type="submit" class="btn btn-save flex-grow-1 py-2"><i class="fas fa-save me-2"></i>Save Destination</button>
                <a href="${pageContext.request.contextPath}/admin/destinations" class="btn btn-cancel flex-grow-1 py-2 text-center d-flex align-items-center justify-content-center"><i class="fas fa-times-circle me-2"></i>Cancel</a>
            </div>
        </form>
    </div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
