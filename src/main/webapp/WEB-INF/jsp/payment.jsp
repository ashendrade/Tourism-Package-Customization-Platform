<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Secure Payment - OCEANWAVE</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('https://www.image2url.com/r2/default/images/1776767940648-fb7013a2-808d-4464-b265-db0c85273699.jpg');
            background-size: cover;
            background-attachment: fixed;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            font-family: 'Poppins', sans-serif;
        }

        .payment-container {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
        }

        .payment-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(15px);
            border-radius: 24px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 800px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            overflow: hidden;
        }

        .order-summary {
            background: #278282;
            color: white;
            padding: 50px;
        }

        .payment-form-area {
            padding: 50px;
        }

        .price-display {
            font-size: 2.5rem;
            font-weight: 800;
            margin: 20px 0;
        }

        .btn-confirm {
            background: #278282;
            color: white;
            border: none;
            width: 100%;
            padding: 15px;
            border-radius: 12px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 30px;
            transition: 0.3s;
        }

        .btn-confirm:hover {
            background: #1f6b6b;
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
        }

        .form-label {
            font-weight: 600;
            font-size: 0.85rem;
            color: #64748b;
        }

        .card-icons {
            display: flex;
            gap: 15px;
            font-size: 1.5rem;
            margin-bottom: 30px;
            color: #cbd5e1;
        }

        .card-icons .active {
            color: #278282;
        }

        @media (max-width: 768px) {
            .payment-card {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="payment-container">
    <div class="payment-card">
        <div class="order-summary">
            <h4 class="mb-4">Order Summary</h4>
            <div class="mb-5">
                <p class="text-white-50 mb-1">Package</p>
                <h5>${booking.packageId}</h5>
            </div>
            <div class="mb-5">
                <p class="text-white-50 mb-1">Tier & Duration</p>
                <p>${booking.hotelTier} — ${booking.duration} Days</p>
            </div>
            <hr class="my-4" style="border-color: rgba(255,255,255,0.1);">
            <p class="text-white-50 mb-0">Amount to Pay</p>
            <div class="price-display">
                Rs. <fmt:formatNumber value="${booking.price}" pattern="#,##0.00"/>
            </div>
            <p class="small text-white-50"><i class="fas fa-shield-alt me-2"></i> Secured by OCEANWAVE Pay</p>
        </div>

        <div class="payment-form-area">
            <h4 class="mb-4">Payment Details</h4>
            <div class="card-icons">
                <i class="fab fa-cc-visa active"></i>
                <i class="fab fa-cc-mastercard"></i>
                <i class="fab fa-cc-amex"></i>
            </div>
            
            <form action="/bookings/confirm-payment" method="POST">
                <input type="hidden" name="bookingId" value="${booking.id}">
                
                <div class="mb-3">
                    <label class="form-label">CARDHOLDER NAME</label>
                    <input type="text" class="form-control" placeholder="John Doe" required>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">CARD NUMBER</label>
                    <div class="input-group">
                        <span class="input-group-text bg-white border-end-0"><i class="far fa-credit-card"></i></span>
                        <input type="text" class="form-control border-start-0" placeholder="0000 0000 0000 0000" required>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-7 mb-3">
                        <label class="form-label">EXPIRATION DATE</label>
                        <input type="text" class="form-control" placeholder="MM / YY" required>
                    </div>
                    <div class="col-md-5 mb-3">
                        <label class="form-label">CVV</label>
                        <input type="password" class="form-control" placeholder="***" required>
                    </div>
                </div>

                <button type="submit" class="btn-confirm">Complete Payment</button>
                <p class="text-center mt-3 small text-muted">
                    <a href="/bookings" class="text-decoration-none text-muted"><i class="fas fa-arrow-left me-1"></i> Cancel and go back</a>
                </p>
            </form>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>
