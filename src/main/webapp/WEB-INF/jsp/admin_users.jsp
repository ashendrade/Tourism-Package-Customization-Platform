<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users - Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { background: #f8fafc; font-family: 'Poppins', sans-serif; }
        .page-header { background: #278282; color: white; padding: 40px 0; margin-bottom: 30px; }
        .admin-card { background: white; border-radius: 12px; padding: 30px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
        .role-badge { padding: 6px 14px; border-radius: 20px; font-size: 0.75rem; font-weight: 700; text-transform: uppercase; }
        .role-admin { background: #fef3c7; color: #92400e; border: 1px solid #fde68a; }
        .role-traveler { background: #d1fae5; color: #065f46; border: 1px solid #a7f3d0; }
        .btn-add-user { background: #278282; color: white; font-weight: 600; border: none; }
        .btn-add-user:hover { background: #1f6b6b; color: white; }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="page-header">
    <div class="container d-flex justify-content-between align-items-center">
        <div>
            <h1>User Management</h1>
            <p>Monitor platform registrations, assign privileges, and manage accounts</p>
        </div>
        <a href="${pageContext.request.contextPath}/admin/users/add" class="btn btn-add-user px-4 py-2">
            <i class="fas fa-user-plus me-2"></i> Add New User
        </a>
    </div>
</div>

<div class="container mb-5">
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success alert-dismissible fade show mb-4" role="alert">
            ${successMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger alert-dismissible fade show mb-4" role="alert">
            ${errorMessage}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <div class="admin-card">
        <div class="table-responsive">
            <table class="table table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Full Name</th>
                        <th>Email Address</th>
                        <th>Role</th>
                        <th class="text-end">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="u" items="${users}">
                        <tr>
                            <td><code>#${u.id}</code></td>
                            <td class="fw-bold">${u.username}</td>
                            <td>${not empty u.fullName ? u.fullName : '<span class="text-muted italic">Not set</span>'}</td>
                            <td>${not empty u.email ? u.email : '<span class="text-muted italic">Not set</span>'}</td>
                            <td>
                                <span class="role-badge role-${u.role.toLowerCase()}">
                                    <i class="fas ${u.role == 'ADMIN' ? 'fa-user-shield' : 'fa-user-plane'} me-1"></i>
                                    ${u.role}
                                </span>
                            </td>
                            <td class="text-end">
                                <a href="${pageContext.request.contextPath}/admin/users/edit/${u.id}" class="btn btn-sm btn-outline-primary me-2">
                                    <i class="fas fa-edit me-1"></i> Edit
                                </a>
                                <c:choose>
                                    <c:when test="${sessionScope.user.id == u.id}">
                                        <button class="btn btn-sm btn-outline-secondary" disabled title="You cannot delete yourself!">
                                            <i class="fas fa-ban me-1"></i> Current User
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${pageContext.request.contextPath}/admin/users/delete/${u.id}" class="btn btn-sm btn-outline-danger" onclick="return confirm('Are you sure you want to permanently delete user ${u.username}?')">
                                            <i class="fas fa-trash-alt me-1"></i> Delete
                                        </a>
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
