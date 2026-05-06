<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Destination - Tourism Platform</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #0EA5E9;
            --primary-light: #38BDF8;
            --dark: #1F2937;
            --light-bg: #F0F9FF;
            --white: #FFFFFF;
            --text-gray: #6B7280;
            --border: #E5E7EB;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, var(--light-bg) 0%, #E0F2FE 100%);
            min-height: 100vh;
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            max-width: 800px;
            width: 100%;
            background: var(--white);
            padding: 50px;
            border-radius: 25px;
            box-shadow: 0 25px 70px rgba(0,0,0,0.15);
            animation: slideUp 0.6s ease;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(40px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .header {
            text-align: center;
            margin-bottom: 40px;
        }

        .header-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-light) 100%);
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            box-shadow: 0 10px 30px rgba(14, 165, 233, 0.3);
        }

        .header-icon i {
            font-size: 2.5rem;
            color: var(--white);
        }

        .header h1 {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-light) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-size: 2.2rem;
            font-weight: 800;
            margin-bottom: 10px;
        }

        .header p {
            color: var(--text-gray);
            font-size: 1.05rem;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        label {
            display: block;
            margin-bottom: 10px;
            color: var(--dark);
            font-weight: 600;
            font-size: 0.95rem;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        label i {
            color: var(--primary);
            width: 20px;
        }

        .form-control {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid var(--border);
            border-radius: 12px;
            font-size: 0.95rem;
            font-family: 'Inter', sans-serif;
            transition: all 0.3s ease;
            background: var(--light-bg);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            background: var(--white);
            box-shadow: 0 0 0 4px rgba(14, 165, 233, 0.1);
            transform: translateY(-2px);
        }

        textarea.form-control {
            resize: vertical;
            min-height: 130px;
        }

        .btn {
            width: 100%;
            padding: 18px;
            border: none;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            margin-top: 15px;
            text-decoration: none;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-light) 100%);
            color: var(--white);
            box-shadow: 0 10px 30px rgba(14, 165, 233, 0.3);
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 40px rgba(14, 165, 233, 0.4);
        }

        .btn-secondary {
            background: var(--light-bg);
            color: var(--primary);
            border: 2px solid var(--primary);
        }

        .btn-secondary:hover {
            background: var(--white);
            transform: translateY(-2px);
        }

        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }

            .container {
                padding: 35px 25px;
            }

            .header h1 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="header-icon">
                <i class="fas fa-map-marked-alt"></i>
            </div>
            <h1>Add New Destination</h1>
            <p>Fill in the details to create a new travel destination</p>
        </div>

        <form action="${pageContext.request.contextPath}/destinations/add" method="post">
            <div class="form-grid">
                <div class="form-group">
                    <label>
                        <i class="fas fa-map-pin"></i>
                        Destination Name
                    </label>
                    <input type="text" name="destinationName" class="form-control"
                           placeholder="e.g., Bali Paradise Resort" required>
                </div>

                <div class="form-group">
                    <label>
                        <i class="fas fa-globe"></i>
                        Country
                    </label>
                    <input type="text" name="country" class="form-control"
                           placeholder="e.g., Indonesia" required>
                </div>

                <div class="form-group">
                    <label>
                        <i class="fas fa-city"></i>
                        City
                    </label>
                    <input type="text" name="city" class="form-control"
                           placeholder="e.g., Ubud" required>
                </div>

                <div class="form-group">
                    <label>
                        <i class="fas fa-suitcase"></i>
                        Package Type
                    </label>
                    <select name="packageType" class="form-control" required>
                        <option value="">Select Package Type</option>
                        <option value="Honeymoon">🌹 Honeymoon</option>
                        <option value="Adventure">⛰️ Adventure</option>
                        <option value="Luxury">💎 Luxury</option>
                        <option value="Family">👨‍👩‍👧‍👦 Family</option>
                        <option value="Budget">💰 Budget</option>
                    </select>
                </div>

                <div class="form-group full-width">
                    <label>
                        <i class="fas fa-rupee-sign"></i>
                        Price (Rs.)
                    </label>
                    <input type="number" name="price" class="form-control"
                           placeholder="e.g., 45000.00" required step="0.01" min="0">
                </div>

                <div class="form-group full-width">
                    <label>
                        <i class="fas fa-align-left"></i>
                        Description
                    </label>
                    <textarea name="description" class="form-control"
                              placeholder="Describe the destination, key attractions, and unique features..."
                              required></textarea>
                </div>
            </div>

            <button type="submit" class="btn btn-primary">
                <i class="fas fa-check-circle"></i>
                Add Destination
            </button>

            <a href="${pageContext.request.contextPath}/destinations/list" class="btn btn-secondary">
                <i class="fas fa-arrow-left"></i>
                Back to Destinations
            </a>
        </form>
    </div>
</body>
</html>