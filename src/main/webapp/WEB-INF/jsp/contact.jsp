<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Tourism Platform</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: #F8FAFC;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .page-header {
            background: #278282;
            color: white;
            padding: 60px 0;
            text-align: center;
        }

        .contact-container {
            max-width: 1000px;
            margin: -40px auto 60px;
            display: grid;
            grid-template-columns: 1fr 1.5fr;
            gap: 30px;
            padding: 0 20px;
        }

        .contact-info {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.05);
        }

        .contact-form {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.05);
        }

        .info-item {
            display: flex;
            align-items: flex-start;
            gap: 20px;
            margin-bottom: 30px;
        }

        .info-item i {
            color: #278282;
            font-size: 1.5rem;
            margin-top: 5px;
        }

        .info-item h5 {
            margin: 0 0 5px 0;
            font-weight: 600;
        }

        .info-item p {
            margin: 0;
            color: #666;
            font-size: 0.9rem;
        }

        .btn-primary {
            background: #278282;
            border: none;
            padding: 12px;
            font-weight: 600;
            border-radius: 8px;
        }

        .btn-primary:hover {
            background: #1f6b6b;
        }

        .social-links {
            display: flex;
            gap: 15px;
            margin-top: 40px;
        }

        .social-links a {
            width: 40px;
            height: 40px;
            background: #f1f5f9;
            color: #278282;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            text-decoration: none;
            transition: 0.3s;
        }

        .social-links a:hover {
            background: #278282;
            color: white;
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="page-header">
    <div class="container">
        <h1>Contact Us</h1>
        <p>We'd love to hear from you</p>
    </div>
</div>

<div class="contact-container">
    <div class="contact-info">
        <h3>Get in Touch</h3>
        <p class="mb-5 text-muted">Have a question or need assistance? Our team is here to help you plan your perfect journey.</p>
        
        <div class="info-item">
            <i class="fas fa-map-marker-alt"></i>
            <div>
                <h5>Office Location</h5>
                <p>123 Ocean Street, Colombo 03, Sri Lanka</p>
            </div>
        </div>

        <div class="info-item">
            <i class="fas fa-phone-alt"></i>
            <div>
                <h5>Phone Number</h5>
                <p>+94 11 234 5678</p>
                <p>+94 11 987 6543</p>
            </div>
        </div>

        <div class="info-item">
            <i class="fas fa-envelope"></i>
            <div>
                <h5>Email Address</h5>
                <p>info@oceanwave.com</p>
                <p>support@oceanwave.com</p>
            </div>
        </div>

        <div class="social-links">
            <a href="#"><i class="fab fa-facebook-f"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-linkedin-in"></i></a>
        </div>
    </div>

    <div class="contact-form">
        <h3>Send a Message</h3>
        <form action="#" class="mt-4">
            <div class="row g-3">
                <div class="col-md-6">
                    <label class="form-label">Full Name</label>
                    <input type="text" class="form-control" placeholder="John Doe">
                </div>
                <div class="col-md-6">
                    <label class="form-label">Email Address</label>
                    <input type="email" class="form-control" placeholder="john@example.com">
                </div>
                <div class="col-12">
                    <label class="form-label">Subject</label>
                    <input type="text" class="form-control" placeholder="Inquiry about Packages">
                </div>
                <div class="col-12">
                    <label class="form-label">Message</label>
                    <textarea class="form-control" rows="6" placeholder="Your message here..."></textarea>
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-primary w-100">Send Message</button>
                </div>
            </div>
        </form>
    </div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
