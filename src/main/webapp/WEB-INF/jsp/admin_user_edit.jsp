<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User Profile - Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { background: #f8fafc; font-family: 'Poppins', sans-serif; }
        .page-header { background: #278282; color: white; padding: 40px 0; margin-bottom: 30px; }
        .admin-card { background: white; border-radius: 12px; padding: 40px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); max-width: 600px; margin: 0 auto; }
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
        <h1>Modify User Account</h1>
        <p>Edit login credentials and personal details for user #${targetUser.id}</p>
    </div>
</div>

<div class="container mb-5">
    <div class="admin-card">
        <form action="${pageContext.request.contextPath}/admin/users/update/${targetUser.id}" method="POST">
            <div class="mb-4 text-center">
                <i class="fas fa-user-circle text-secondary mb-3" style="font-size: 4.5rem;"></i>
                <h4 class="m-0">${targetUser.username}</h4>
                <span class="badge bg-secondary mt-1 px-3 py-1 text-uppercase">${targetUser.role}</span>
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold"><i class="fas fa-hashtag text-secondary me-2"></i>User ID</label>
                <input type="text" class="form-control bg-light" value="${targetUser.id}" readonly disabled>
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold"><i class="fas fa-user text-secondary me-2"></i>Username</label>
                <input type="text" name="username" class="form-control" value="${targetUser.username}" required>
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold"><i class="fas fa-lock text-secondary me-2"></i>Password</label>
                <input type="text" name="password" class="form-control" value="${targetUser.password}" required>
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold"><i class="fas fa-id-card text-secondary me-2"></i>Full Name</label>
                <input type="text" name="fullName" class="form-control" value="${targetUser.fullName}" placeholder="e.g. Ashendra Perera">
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold"><i class="fas fa-envelope text-secondary me-2"></i>Email Address</label>
                <input type="email" name="email" class="form-control" value="${targetUser.email}" placeholder="e.g. name@example.com">
            </div>

            <div class="mb-4">
                <label class="form-label fw-semibold"><i class="fas fa-user-shield text-secondary me-2"></i>Account Role</label>
                <select name="role" class="form-select" required>
                    <option value="TRAVELER" ${targetUser.role == 'TRAVELER' ? 'selected' : ''}>TRAVELER (Default Traveler Privilege)</option>
                    <option value="ADMIN" ${targetUser.role == 'ADMIN' ? 'selected' : ''}>ADMIN (Global Administrative Controller)</option>
                </select>
            </div>

            <div class="d-flex gap-3">
                <button type="submit" class="btn btn-save flex-grow-1 py-2"><i class="fas fa-save me-2"></i>Save Changes</button>
                <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-cancel flex-grow-1 py-2 text-center d-flex align-items-center justify-content-center"><i class="fas fa-times-circle me-2"></i>Cancel</a>
            </div>
        </form>
    </div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
