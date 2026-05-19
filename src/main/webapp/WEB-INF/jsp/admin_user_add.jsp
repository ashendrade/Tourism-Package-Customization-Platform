<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create New User - Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { background: #f8fafc; font-family: 'Poppins', sans-serif; }
        .page-header { background: #278282; color: white; padding: 40px 0; margin-bottom: 30px; }
        .admin-card { background: white; border-radius: 12px; padding: 40px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); max-width: 600px; margin: 0 auto; }
        .btn-submit { background: #278282; color: white; font-weight: 600; border: none; }
        .btn-submit:hover { background: #1f6b6b; color: white; }
        .btn-cancel { border: 1px solid #94a3b8; color: #475569; font-weight: 600; }
        .btn-cancel:hover { background: #f1f5f9; color: #1e293b; }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="page-header">
    <div class="container text-center">
        <h1>Register New User</h1>
        <p>Seed new traveler or administrator accounts into the platform</p>
    </div>
</div>

<div class="container mb-5">
    <div class="admin-card">
        <form action="${pageContext.request.contextPath}/admin/users/add" method="POST">
            <div class="mb-4 text-center">
                <i class="fas fa-user-plus text-secondary mb-3" style="font-size: 4.5rem;"></i>
                <h4 class="m-0">Create Profile</h4>
                <p class="text-muted small">All fields marked with an asterisk (*) are required</p>
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold"><i class="fas fa-user text-secondary me-2"></i>Username *</label>
                <input type="text" name="username" class="form-control" placeholder="e.g. jdoe" required>
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold"><i class="fas fa-lock text-secondary me-2"></i>Password *</label>
                <input type="password" name="password" class="form-control" placeholder="Create account password" required>
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold"><i class="fas fa-id-card text-secondary me-2"></i>Full Name</label>
                <input type="text" name="fullName" class="form-control" placeholder="e.g. John Doe">
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold"><i class="fas fa-envelope text-secondary me-2"></i>Email Address</label>
                <input type="email" name="email" class="form-control" placeholder="e.g. john.doe@example.com">
            </div>

            <div class="mb-4">
                <label class="form-label fw-semibold"><i class="fas fa-user-shield text-secondary me-2"></i>Account Role *</label>
                <select name="role" class="form-select" required>
                    <option value="TRAVELER" selected>TRAVELER (Default Traveler Privilege)</option>
                    <option value="ADMIN">ADMIN (Global Administrative Controller)</option>
                </select>
            </div>

            <div class="d-flex gap-3">
                <button type="submit" class="btn btn-submit flex-grow-1 py-2"><i class="fas fa-plus-circle me-2"></i>Create User</button>
                <a href="${pageContext.request.contextPath}/admin/users" class="btn btn-cancel flex-grow-1 py-2 text-center d-flex align-items-center justify-content-center"><i class="fas fa-times-circle me-2"></i>Cancel</a>
            </div>
        </form>
    </div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
