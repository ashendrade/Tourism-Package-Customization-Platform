<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Tourism Platform</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #F8FAFC;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .register-card {
            background: white;
            border: 1px solid #E2E8F0;
            border-radius: 10px;
            padding: 40px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }
        .btn-primary {
            background-color: #278282;
            border: none;
            padding: 10px;
            font-weight: 600;
        }
        .btn-primary:hover {
            background-color: #1f6b6b;
        }
        .text-info {
            color: #278282 !important;
        }
    </style>
</head>
<body>

<div class="register-card">
    <div class="text-center mb-4">
        <h3 class="fw-bold">Create Account</h3>
        <p class="text-muted small">Join us for your next adventure</p>
    </div>
    
    <c:if test="${not empty error}">
        <div class="alert alert-danger mb-3 py-2 small">
            ${error}
        </div>
    </c:if>
    
    <form action="/register" method="POST">
        <div class="mb-3">
            <label class="form-label small fw-bold">Username</label>
            <input type="text" name="username" class="form-control" required>
        </div>
        <div class="mb-3">
            <label class="form-label small fw-bold">Email</label>
            <input type="email" name="email" class="form-control" required>
        </div>
        <div class="mb-4">
            <label class="form-label small fw-bold">Password</label>
            <input type="password" name="password" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary w-100 mb-3">Register</button>
        <p class="text-center small text-muted">
            Already have an account? <a href="/login" class="text-info">Login</a>
        </p>
    </form>
</div>

</body>
</html>
