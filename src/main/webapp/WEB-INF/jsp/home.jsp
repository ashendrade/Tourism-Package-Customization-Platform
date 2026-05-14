<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tourism Platform - Discover The World</title>
    <link rel="icon" type="image/jpg" href="/img/logo.jpg">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: white;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .hero-section {
            height: 100vh;
            width: 100%;
            background: linear-gradient(rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.3)), url('https://www.image2url.com/r2/default/images/1776767940648-fb7013a2-808d-4464-b265-db0c85273699.jpg');
            background-size: cover;
            background-position: center;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
        }

        .hero-content p {
            font-size: 1.1rem;
            letter-spacing: 5px;
            margin-bottom: 20px;
            text-transform: uppercase;
        }

        .hero-content h1 {
            font-size: 4.5rem;
            font-weight: 800;
            max-width: 900px;
            line-height: 1.2;
            margin: 0 auto;
            text-transform: uppercase;
        }

        .testimonials {
            padding: 80px 20px;
            text-align: center;
        }

        .section-subtitle {
            color: #278282;
            letter-spacing: 5px;
            font-size: 0.9rem;
            text-transform: uppercase;
            margin-bottom: 10px;
            display: block;
        }

        .section-title {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 50px;
        }

        .section-title span {
            color: #278282;
        }

        .test-grid {
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
            max-width: 1200px;
            margin: 0 auto;
        }

        .test-card {
            background: white;
            padding: 30px;
            border-radius: 8px;
            width: 350px;
            text-align: left;
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.05);
            border: 1px solid #eee;
        }

        .stars {
            color: #f1c40f;
            margin-bottom: 20px;
        }

        .test-text {
            font-size: 0.9rem;
            line-height: 1.8;
            color: #666;
            margin-bottom: 25px;
        }

        .test-profile {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .test-profile img {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            object-fit: cover;
        }

        .test-info h5 {
            margin: 0;
            font-size: 1rem;
            font-weight: 600;
        }

        .test-info span {
            font-size: 0.8rem;
            color: #278282;
        }
        .about-section {
            padding: 100px 20px;
            background: #fdfdfd;
        }

        .container-wide {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            align-items: center;
            gap: 60px;
        }

        .about-image {
            flex: 1;
            position: relative;
        }

        .about-image img {
            width: 100%;
            border-radius: 20px;
            box-shadow: 20px 20px 0px #278282;
        }

        .about-content {
            flex: 1;
            text-align: left;
        }

        .about-content p {
            color: #666;
            line-height: 1.8;
            margin-bottom: 30px;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-top: 40px;
        }

        .stat-item h3 {
            font-size: 2rem;
            color: #278282;
            margin-bottom: 5px;
        }

        .stat-item p {
            font-size: 0.85rem;
            margin: 0;
            color: #888;
        }

        .features-section {
            padding: 80px 20px;
            background: #fff;
            text-align: center;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .feature-card {
            padding: 40px;
            border-radius: 15px;
            background: #f8fafc;
            transition: 0.3s;
            text-align: center;
        }

        .feature-card:hover {
            background: #278282;
            color: white;
            transform: translateY(-10px);
        }

        .feature-card:hover p {
            color: rgba(255,255,255,0.8);
        }

        .feature-card i {
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: #278282;
        }

        .feature-card:hover i {
            color: white;
        }

        .cta-section {
            background: linear-gradient(rgba(39, 130, 130, 0.9), rgba(39, 130, 130, 0.9)), url('https://www.image2url.com/r2/default/images/1776767940648-fb7013a2-808d-4464-b265-db0c85273699.jpg');
            background-size: cover;
            background-position: center;
            padding: 100px 20px;
            color: white;
            text-align: center;
        }

        .cta-section h2 {
            font-size: 3rem;
            margin-bottom: 20px;
        }

        .btn-cta {
            display: inline-block;
            padding: 15px 40px;
            background: white;
            color: #278282;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 700;
            margin-top: 30px;
            transition: 0.3s;
        }

        .btn-cta:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }
    </style>
</head>

<body>

    <jsp:include page="navbar.jsp" />

    <div class="hero-section">
        <div class="hero-content">
            <p>Let's Travel the world with us</p>
            <h1>DISCOVER THE WORLD WITH OUR GUIDE</h1>
        </div>
    </div>

    <section class="about-section">
        <div class="container-wide">
            <div class="about-image">
                <img src="https://www.image2url.com/r2/default/images/1776767940648-fb7013a2-808d-4464-b265-db0c85273699.jpg" alt="About Us">
            </div>
            <div class="about-content">
                <span class="section-subtitle">ABOUT US</span>
                <h2 class="section-title">We Provide Best <span>Travel</span> Experience</h2>
                <p>Welcome to OCEANWAVE, your premier partner in global exploration. We believe that travel is not just about visiting new places, but about creating memories that last a lifetime. Our platform is designed to give you full control over your journey, allowing you to customize every detail from accommodations to local excursions.</p>
                <p>With a network of trusted partners worldwide and a passion for discovery, we ensure that every itinerary is crafted with care and precision.</p>
                <div class="stats-grid">
                    <div class="stat-item">
                        <h3>15k+</h3>
                        <p>Happy Travelers</p>
                    </div>
                    <div class="stat-item">
                        <h3>200+</h3>
                        <p>Destinations</p>
                    </div>
                    <div class="stat-item">
                        <h3>10+</h3>
                        <p>Years Experience</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="features-section">
        <div class="container text-center mb-5">
            <span class="section-subtitle">WHY CHOOSE US</span>
            <h2 class="section-title">Our <span>Core</span> Values</h2>
        </div>
        <div class="features-grid">
            <div class="feature-card">
                <i class="fas fa-shield-alt"></i>
                <h4>Safe Travels</h4>
                <p>Your safety is our priority. We partner only with verified and highly-rated service providers.</p>
            </div>
            <div class="feature-card">
                <i class="fas fa-tags"></i>
                <h4>Best Prices</h4>
                <p>Enjoy premium experiences at competitive rates with our transparent pricing model.</p>
            </div>
            <div class="feature-card">
                <i class="fas fa-user-edit"></i>
                <h4>Easy Customization</h4>
                <p>Plan your trip your way. Our intuitive tools let you build the perfect itinerary in minutes.</p>
            </div>
        </div>
    </section>

    <section class="testimonials">
        <span class="section-subtitle">TESTIMONIALS</span>
        <h2 class="section-title">What Our <span>Travelers</span> Say</h2>

        <div class="test-grid">
            <div class="test-card">
                <div class="stars">
                    <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i
                        class="fas fa-star"></i><i class="fas fa-star"></i>
                </div>
                <p class="test-text">"I planned my trip using this travel website and it made everything easy.
                    The trip went smoothly and the information matched what I experienced. Overall it helped me
                    have a well-organized and enjoyable trip."</p>
                <div class="test-profile">
                    <img src="https://www.image2url.com/r2/default/images/1777110874463-b5cfec2b-7460-4240-8bb8-be133219339d.jpg"
                        alt="profile">
                    <div class="test-info">
                        <h5>John Deo</h5>
                        <span>Greece Tour — 7 Days</span>
                    </div>
                </div>
            </div>
            <div class="test-card">
                <div class="stars">
                    <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i
                        class="fas fa-star"></i><i class="far fa-star"></i>
                </div>
                <p class="test-text">"I used a travel website to plan my trip, and it saved me a lot of time.
                    Everything from booking to finding attractions was simple and easy."</p>
                <div class="test-profile">
                    <img src="https://www.image2url.com/r2/default/images/1777110874463-b5cfec2b-7460-4240-8bb8-be133219339d.jpg"
                        alt="profile">
                    <div class="test-info">
                        <h5>Jane Smith</h5>
                        <span>Maldives Tour — 5 Days</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="cta-section">
        <div class="container">
            <h2>Ready to Start Your Adventure?</h2>
            <p>Explore our wide range of destinations and create your custom itinerary today.</p>
            <a href="${pageContext.request.contextPath}/destinations" class="btn-cta">Explore Destinations</a>
        </div>
    </section>

    <jsp:include page="footer.jsp" />

</body>

</html>