<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile - OCEANWAVE</title>
    <link rel="icon" type="image/jpg" href="/img/logo.jpg">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { background: #f1f5f9; font-family: 'Poppins', sans-serif; }
        .profile-container { max-width: 800px; margin: 50px auto; }
        .profile-card { background: white; border-radius: 15px; overflow: hidden; box-shadow: 0 10px 30px rgba(0,0,0,0.05); }
        .profile-header { background: #278282; color: white; padding: 40px; text-align: center; }
        .profile-avatar { width: 100px; height: 100px; background: white; color: #278282; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 3rem; margin: 0 auto 15px; }
        .profile-body { padding: 40px; }
        .form-label { font-weight: 600; color: #64748b; }
        .btn-update { background: #278282; color: white; border: none; padding: 12px 30px; border-radius: 8px; font-weight: 600; }
        .btn-update:hover { background: #1f6b6b; color: white; }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="container profile-container">
    <div class="profile-card">
        <div class="profile-header">
            <div class="profile-avatar">
                <i class="fas fa-user"></i>
            </div>
            <h2>${user.username}</h2>
            <span class="badge bg-light text-dark text-uppercase">${user.role}</span>
        </div>
        
        <div class="profile-body">
            <c:if test="${param.success == 'true'}">
                <div class="alert alert-success border-0 mb-4" style="background: #dcfce7; color: #166534;">
                    <i class="fas fa-check-circle me-2"></i> Profile updated successfully!
                </div>
            </c:if>

            <form action="/profile/update" method="POST">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" name="fullName" class="form-control" value="${user.fullName}" placeholder="Enter your full name">
                    </div>
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Email Address</label>
                        <input type="email" name="email" class="form-control" value="${user.email}" placeholder="john@example.com">
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Username (Permanent)</label>
                    <input type="text" class="form-control" value="${user.username}" disabled>
                </div>

                <div class="mb-4">
                    <label class="form-label">New Password (Leave blank to keep current)</label>
                    <input type="password" name="password" class="form-control" placeholder="••••••••">
                </div>

                <div class="text-end">
                    <button type="submit" class="btn btn-update">Update Profile</button>
                </div>
            </form>

            <hr class="my-5">

            <div class="card border-danger bg-light">
                <div class="card-body">
                    <h5 class="card-title text-danger fw-bold"><i class="fas fa-exclamation-triangle me-2"></i>Danger Zone</h5>
                    <p class="card-text text-muted small">Once you delete your account, there is no going back. All of your customized travel packages, active bookings, and profile settings will be permanently lost.</p>
                    <form action="${pageContext.request.contextPath}/profile/delete" method="POST" onsubmit="return confirm('⚠️ WARNING: Are you absolutely sure you want to permanently delete your account? This action is irreversible and all your bookings will be deleted.')">
                        <button type="submit" class="btn btn-outline-danger">
                            <i class="fas fa-trash-alt me-1"></i> Delete My Account
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
