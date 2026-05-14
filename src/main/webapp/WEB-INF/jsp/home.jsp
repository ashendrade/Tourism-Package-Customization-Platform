<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tourism Platform - Discover The World</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/responsive.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.css"/>
    <style>
        /* Small fixes for integrated navbar */
        header {
            background: rgba(0,0,0,0.5);
            backdrop-filter: blur(10px);
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<!--------------showcase----------->
<main>
    <div class="slide-container swiper">
        <div class="slider-content swiper-wrapper">
            <div class="overlay swiper-slide">
                <img src="https://www.image2url.com/r2/default/images/1776767940648-fb7013a2-808d-4464-b265-db0c85273699.jpg" alt="image">
                <div class="img-overlay">
                   <p>Let's Travel the world with us</p>
                   <h2><span>Discover</span> The world</h2> 
                   <h2>With our Guide</h2>
                </div>
            </div>
            <div class="overlay swiper-slide">
                <img src="https://www.image2url.com/r2/default/images/1776769631622-0cf4bdb9-7f93-4250-83f1-fe0e35af8da9.jpg" alt="image">
                <div class="img-overlay">
                   <p>Let's Travel the world with us</p>
                   <h2><span>Discover</span> The world</h2> 
                   <h2>With our Guide</h2>
                </div>
            </div>
            <div class="overlay swiper-slide">
                <img src="https://www.image2url.com/r2/default/images/1776770294845-894d1ed9-2681-4f30-bb03-201f3c5aebde.jpg" alt="image">
                <div class="img-overlay">
                   <p>Let's Travel the world with us</p>
                   <h2><span>Discover</span>The world</h2> 
                   <h2>With our <span>Travelo</span></h2>
                </div>
            </div>
        </div>
    </div>
</main>
<!-------showcase end--------->

<!-------review section start------->
<section id="reviews">
    <div class="container">
        <div class="review-header">
            <p class="review-subtitle">TESTIMONIALS</p>
            <h2 class="review-title">What Our <span>Travelers</span> Say</h2>
        </div>

        <div class="review-slider swiper">
            <div class="swiper-wrapper">

                <div class="swiper-slide">
                    <div class="review-card">
                        <div class="review-stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                        </div>
                        <p class="review-text">"I planned my trip using this travel website and it made everything easy. The trip went smoothly and the information matched what I experienced. Overall it helped me have a well-organized and enjoyable trip."</p>
                        <div class="review-profile">
                            <img src="https://www.image2url.com/r2/default/images/1777110874463-b5cfec2b-7460-4240-8bb8-be133219339d.jpg" alt="John Deo">
                            <div class="review-info">
                                <h4>John Deo</h4>
                                <p>Greece Tour — 7 Days</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="swiper-slide">
                    <div class="review-card">
                        <div class="review-stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="far fa-star"></i>
                        </div>
                        <p class="review-text">"I used a travel website to plan my trip, and it saved me a lot of time. Everything from booking to finding attractions was simple and easy."</p>
                        <div class="review-profile">
                            <img src="https://www.image2url.com/r2/default/images/1777110874463-b5cfec2b-7460-4240-8bb8-be133219339d.jpg" alt="Jane Smith">
                            <div class="review-info">
                                <h4>Jane Smith</h4>
                                <p>Maldives Tour — 5 Days</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
<!-------review section end------->

<!----------footer section starts-------------------->
<section class="footer">
   <div class="box-container">
    <div class="box">
    <h3>about us</h3>
    <p>Every journey begins with a single step — let us guide yours.</p>
    </div>
     <div class="box">
    <h3>branch locations</h3>
     <a href="#">Colombo</a>
     <a href="#">Galle</a>
     <a href="#">Kandy</a>
    </div>
    <div class="box">
    <h3>quick links</h3>
     <a href="/">Home</a>
     <a href="/destinations">Destinations</a>
     <a href="/packages">Packages</a>
      <a href="/reviews">reviews</a>
     <a href="/contact">Contact</a>
     </div>
     <div class="box">
    <h3>follow us</h3>
     <a href="#">facebook</a>
     <a href="#">instagram</a>
     <a href="#">twitter</a>
     </div>
   </div>
    <p class="credit">Created by <span>2026Pearl</span> | All rights reserved!</p>
</section>

<script src="https://cdn.jsdelivr.net/npm/swiper@12/swiper-bundle.min.js"></script>
<script src="/js/swiper.js"></script>
<script src="/js/script.js"></script>
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
</body>
</html>
