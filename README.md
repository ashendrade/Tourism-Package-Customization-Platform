# OCEANWAVE - Tourism Package Customization Platform

OCEANWAVE is a modern, premium web platform designed for travelers to discover, customize, and book their dream vacations. Built with Spring Boot and JSP, it offers a seamless experience from itinerary building to financial management.

## 🌟 Key Features

- **Dynamic Destination Discovery**: Explore a curated list of local and foreign destinations with rich multimedia content and local insights.
- **Advanced Itinerary Builder**: Fully customize your travel package, including:
    - Accommodation tiers (Budget, Standard, Luxury).
    - Duration adjustments.
    - Activity selection (Safari, Trekking, Cultural Tours, etc.).
    - Special requests handling.
- **Financial Transparency**: Instant price calculation including taxes, service charges, and discounts based on customization choices.
- **Secure Authentication**: Protected user sessions with a glassmorphic premium login and registration experience.
- **My Bookings Dashboard**: Track your travel history, check booking statuses (Pending, Confirmed, Cancelled), and manage your itineraries.
- **Traveler Reviews**: Share and read experiences from the global traveler community.

## 🛠️ Tech Stack

- **Backend**: Java 17, Spring Boot 3.x
- **Frontend**: JSP (Jakarta Server Pages), JSTL, Bootstrap 5, FontAwesome 6
- **Styling**: Custom Vanilla CSS (OCEANWAVE Design System)
- **Data Storage**: Flat-file system (TXT) for lightweight, portable data persistence.
- **Build Tool**: Maven

## 🚀 Getting Started

### Prerequisites
- Java JDK 17 or higher
- Maven (or use the included `./mvnw` wrapper)

### Running the Application
1. Clone the repository to your local machine.
2. Navigate to the project root directory.
3. Run the application using the Maven wrapper:
   ```bash
   ./mvnw spring-boot:run
   ```
4. Access the platform at `http://localhost:8080`.

## 📄 Functional Documentation

### 1. User Management
Secure authentication system using Spring Boot sessions. Users can register as Travelers, manage their profiles, and maintain persistent sessions across the platform. The UI features a premium glassmorphic aesthetic for the onboarding process.

### 2. Destination Management
Dynamic location profiles featuring multimedia galleries, local insights (weather, etiquette), and transportation options. Destinations are categorized using Point of Interest (POI) tagging for easier discovery.

### 3. Package Customization
A modular itinerary building system that allows travelers to tailor their trips. Features include duration flexibility, custom activity selection (integrated with pricing), and special request handling.

### 4. Pricing & Budgeting
Real-time financial calculation engine that updates quotes instantly as users customize their packages. Includes tiered pricing (Budget/Standard/Luxury), tax/service charge transparency, and automated discount application.

### 5. Bookings & Reviews
Automated booking lifecycle management with status tracking. Travelers can provide media-rich reviews with detailed rating breakdowns for accommodation, transport, and overall experience.

## 👥 Team Contributions (Batch WD202)

| Component | Responsibility | Developer |
|-----------|----------------|-----------|
| **User Management** | Login/Register Security, Profile Management | Shehani (IT25101086) |
| **Destination Management** | Location Profiles, POI Tagging, Insights | Sahan (IT25103682) |
| **Package Customization** | Modular Itinerary Builder, Special Requests | Danishiyan (IT25101436) |
| **Pricing & Budget Calculation** | Live Costing, Tiered Pricing, Financials | Ashendra (IT25101841) |
| **Booking & Payment** | Lifecycle Management, Status Tracking | Banujan (IT25103287) |
| **Review & Rating** | Traveler Feedback, Media Integration | Hafeez (IT25101125) |

## 📂 Project Structure

- `src/main/java/com/tourism`:
    - `controller`: MVC controllers for routing and logic.
    - `model`: Data entities (User, Destination, Booking, etc.).
    - `service`: Business logic layer.
    - `repository`: Data access layer for flat-file persistence.
    - `util`: Utility classes (File handling, formatters).
- `src/main/webapp/WEB-INF/jsp`: UI templates and components.
- `src/main/resources/data`: Flat-file "database" storing users, bookings, and destinations.

## 🎨 Design Philosophy
OCEANWAVE uses a **Premium Aesthetic** characterized by:
- **Teal Theme**: Color `#278282` representing calm and professional exploration.
- **Glassmorphism**: Semi-transparent, blurred layers for modern UI components.
- **Responsive Layouts**: Optimized for both desktop and mobile devices.

---
*Created as part of the SE1020 - Object-Oriented Programming Project.*
