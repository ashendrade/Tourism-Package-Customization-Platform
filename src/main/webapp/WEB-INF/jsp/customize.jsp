<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customize Package - Tourism Platform</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #278282;
            --primary-dark: #1f6b6b;
            --secondary: #F43F5E;
            --dark: #0F172A;
            --slate: #64748B;
            --glass: rgba(255, 255, 255, 0.9);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Outfit', sans-serif;
            background: #f1f5f9;
            min-height: 100vh;
            color: var(--dark);
        }

        .container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
        }

        .customize-layout {
            display: grid;
            grid-template-columns: 1fr 1.5fr;
            gap: 30px;
        }

        .destination-card {
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(0,0,0,0.05);
            height: fit-content;
        }

        .dest-img {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }

        .dest-details {
            padding: 25px;
        }

        .insight-box {
            background: #f8fafc;
            border-radius: 12px;
            padding: 15px;
            margin-top: 20px;
        }

        .insight-item {
            display: flex;
            align-items: flex-start;
            gap: 12px;
            margin-bottom: 12px;
        }

        .insight-item i {
            color: var(--primary);
            font-size: 1.1rem;
        }

        .customize-form-card {
            background: white;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.05);
        }

        .section-title {
            font-size: 1.25rem;
            font-weight: 700;
            margin: 30px 0 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .grid-2 {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: var(--slate);
            font-size: 0.9rem;
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            font-family: inherit;
        }

        .checkbox-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .checkbox-item {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 12px;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            cursor: pointer;
        }

        .price-summary {
            background: #f8fafc;
            padding: 30px;
            border-radius: 15px;
            margin-top: 40px;
        }

        .price-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            color: var(--slate);
        }

        .price-total {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
            padding-top: 15px;
            border-top: 1px solid #e2e8f0;
            font-size: 1.5rem;
            font-weight: 800;
            color: var(--primary);
        }

        .btn-book {
            width: 100%;
            background: var(--primary);
            color: white;
            border: none;
            padding: 18px;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            margin-top: 25px;
            transition: 0.3s;
        }

        .btn-book:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
        }
    </style>
</head>
<body>

<jsp:include page="navbar.jsp" />

<div class="container">
    <div class="customize-layout">
        <div class="destination-card">
            <img src="${not empty destination.imageUrl ? destination.imageUrl : 'https://www.image2url.com/r2/default/images/1776767940648-fb7013a2-808d-4464-b265-db0c85273699.jpg'}" class="dest-img" alt="Destination">
            <div class="dest-details">
                <h2 class="mb-2">${destination.destinationName}</h2>
                <p class="text-muted small mb-4">${destination.description}</p>
                
                <div class="insight-box">
                    <h5 class="mb-3">Local Insights</h5>
                    <div class="insight-item">
                        <i class="fas fa-cloud-sun"></i>
                        <div>
                            <strong>Weather:</strong>
                            <p class="small text-muted">${not empty destination.weatherInfo ? destination.weatherInfo : 'Sunny, 28°C'}</p>
                        </div>
                    </div>
                    <div class="insight-item">
                        <i class="fas fa-hand-sparkles"></i>
                        <div>
                            <strong>Cultural Etiquette:</strong>
                            <p class="small text-muted">${not empty destination.culturalEtiquette ? destination.culturalEtiquette : 'Dress modestly in religious sites.'}</p>
                        </div>
                    </div>
                    <div class="insight-item">
                        <i class="fas fa-bus"></i>
                        <div>
                            <strong>Transport:</strong>
                            <p class="small text-muted">${not empty destination.transportOptions ? destination.transportOptions : 'Local trains and private hires available.'}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="customize-form-card">
            <h1 class="mb-4">Build Your Itinerary</h1>
            
            <form id="customizeForm" action="/packages/customize" method="POST">
                <input type="hidden" id="basePrice" value="${destination.price}">
                <input type="hidden" name="destination" value="${destination.destinationName}">
                
                <div class="grid-2">
                    <div class="form-group">
                        <label>Accommodation Tier</label>
                        <select name="hotelTier" id="hotelTier" class="form-control" onchange="updatePrice()">
                            <option value="Budget">Budget (Guest Houses)</option>
                            <option value="Standard" selected>Standard (3-4 Star Hotels)</option>
                            <option value="Luxury">Luxury (5-Star Boutique)</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Duration (Days)</label>
                        <input type="number" name="duration" id="duration" class="form-control" value="5" min="1" onchange="updatePrice()">
                    </div>
                </div>

                <h3 class="section-title"><i class="fas fa-tasks"></i> Select Activities</h3>
                <div class="checkbox-grid">
                    <div class="checkbox-item">
                        <input type="checkbox" class="activity" value="3000" data-name="City Walking Tour" onchange="updatePrice()">
                        <span>City Walking Tour (+3k)</span>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" class="activity" value="15000" data-name="Adventure Trekking" onchange="updatePrice()">
                        <span>Adventure Trekking (+15k)</span>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" class="activity" value="8000" data-name="Cultural Show" onchange="updatePrice()">
                        <span>Cultural Show (+8k)</span>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" class="activity" value="12000" data-name="Safari Expedition" onchange="updatePrice()">
                        <span>Safari Expedition (+12k)</span>
                    </div>
                </div>

                <div class="form-group mt-4">
                    <label>Special Requests</label>
                    <textarea name="specialRequest" class="form-control" rows="3" placeholder="Dietary needs, birthday surprises, extra beds..."></textarea>
                </div>

                <div class="form-group">
                    <label>Payment Plan</label>
                    <select name="paymentPlan" class="form-control">
                        <option value="One-time">Full Payment (5% Discount)</option>
                        <option value="Installments">Installments (25% Upfront)</option>
                    </select>
                </div>

                <div class="price-summary">
                    <div class="price-row">
                        <span>Base Cost</span>
                        <span id="displayBase">Rs. 0.00</span>
                    </div>
                    <div class="price-row">
                        <span>Add-ons</span>
                        <span id="displayAddons">Rs. 0.00</span>
                    </div>
                    <div class="price-row">
                        <span>Service Charge (5%)</span>
                        <span id="displayService">Rs. 0.00</span>
                    </div>
                    <div class="price-row">
                        <span>Tax (10%)</span>
                        <span id="displayTax">Rs. 0.00</span>
                    </div>
                    <div class="price-total">
                        <span>Total Quote</span>
                        <span id="displayTotal">Rs. 0.00</span>
                    </div>
                </div>

                <button type="submit" class="btn-book">Confirm Itinerary & Book</button>
            </form>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />

<script>
    function updatePrice() {
        const base = parseFloat(document.getElementById('basePrice').value);
        const tier = document.getElementById('hotelTier').value;
        const duration = parseInt(document.getElementById('duration').value) || 1;
        
        let tierMultiplier = 1.0;
        if (tier === 'Budget') tierMultiplier = 0.7;
        if (tier === 'Luxury') tierMultiplier = 1.8;
        
        const adjustedBase = base * tierMultiplier * (duration / 5);
        
        let addonTotal = 0;
        document.querySelectorAll('.activity:checked').forEach(a => addonTotal += parseFloat(a.value));
        
        const subtotal = adjustedBase + addonTotal;
        const service = subtotal * 0.05;
        const tax = (subtotal + service) * 0.10;
        const total = subtotal + service + tax;
        
        document.getElementById('displayBase').innerText = 'Rs. ' + adjustedBase.toLocaleString();
        document.getElementById('displayAddons').innerText = 'Rs. ' + addonTotal.toLocaleString();
        document.getElementById('displayService').innerText = 'Rs. ' + service.toLocaleString();
        document.getElementById('displayTax').innerText = 'Rs. ' + tax.toLocaleString();
        document.getElementById('displayTotal').innerText = 'Rs. ' + total.toLocaleString();
    }
    
    updatePrice();
</script>

</body>
</html>
