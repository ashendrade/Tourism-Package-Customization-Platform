<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Tourism Platform</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Project CSS -->
    <link rel="stylesheet" href="/css/style.css">
    <style>
        body {
            background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)), url('https://www.image2url.com/r2/default/images/1776767940648-fb7013a2-808d-4464-b265-db0c85273699.jpg');
            background-size: cover;
            background-attachment: fixed;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .glass-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 40px;
            width: 100%;
            max-width: 400px;
            color: white;
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
        }
        .form-control {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: white !important;
            padding: 12px;
        }
        .form-control:focus {
            background: rgba(255, 255, 255, 0.2);
            border-color: #278282;
            box-shadow: none;
            color: white;
        }
        .btn-primary {
            background-color: #278282;
            border: none;
            padding: 12px;
            font-weight: 600;
        }
        .btn-primary:hover {
            background-color: #1f6b6b;
        }
        .register-link {
            color: #4ecdc4;
            text-decoration: none;
            font-weight: 600;
        }
        .register-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="glass-card">
    <h2 class="text-center mb-4">Login</h2>
    <c:if test="${not empty error}">
        <div class="alert alert-danger bg-transparent text-white border-danger mb-4">
            ${error}
        </div>
    </c:if>
    <form action="/login" method="POST">
        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" name="username" class="form-control" placeholder="Enter username" required>
        </div>
        <div class="mb-4">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" placeholder="Enter password" required>
        </div>
        <button type="submit" class="btn btn-primary w-100 mb-3">Login</button>
        <p class="text-center mb-0">
            Don't have an account? <a href="/register" class="register-link">Register</a>
        </p>
    </form>
</div>

</body>
</html>
