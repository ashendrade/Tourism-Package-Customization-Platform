# Project Finalization & Integration Guide: Tourism Package Customization Platform

**To:** Team Antigravity  
**Subject:** Technical Mandate & Individual Task Assignments  
**Project:** SE1020 - Object Oriented Programming (10% Grade Weightage)

This document is your definitive guide for the final sprint. It contains the exact technical requirements from the project brief and your specific module assignments. **Important:** All data management MUST use File I/O (text files) as databases are strictly prohibited for this assignment. Some files might be in wrong places or duplicated, correct them all. Try the best to hold on the files we created. ask me before createing new fiiles or deleting them.

---

## 1. Technical Stack & UI Standards
* **Framework**: Spring Boot (Maven-based).
* **Frontend**: JSP with Tailwind CSS or Bootstrap.
* **Design Theme**: **Glassmorphism (Frosted Glass)**. Standardize all cards, containers, and buttons to match this look.
* **Branding**: Use the logo in the `/img` folder on every page header.
* **Navigation**: Use a unified `navbar.jsp` to link all modules.

---

## 2. Individual Folder & Module Assignments
Based on our architecture, each member is responsible for the following files and logic. Ensure your code implements at least **3 CRUD operations** using the specified `.txt` files.

| Team Member | Module | Java Files & Templates |
| :--- | :--- | :--- |
| **Shehani** | User Management | `UserController.java`, `UserService.java`, `UserRepository.java`, `User.java`, `login.jsp`, `register.jsp` |
| **Sahan** | Destination | `DestinationController.java`, `DestinationService.java`, `DestinationRepository.java`, `Destination.java`, `destinations.jsp` |
| **Danishiyan** | Package | `PackageController.java`, `PackageService.java`, `PackageRepository.java`, `TravelPackage.java`, `packages.jsp` |
| **Ashendra** | Pricing & Budget | `PackageService.java` (Logic for `calculatePrice()`), optional `Budget.java` |
| **Banujan** | Booking & Payment | `BookingController.java`, `BookingService.java`, `BookingRepository.java`, `Booking.java`, `bookings.jsp` |
| **Hafeez** | Review & Rating | `ReviewController.java`, `ReviewService.java`, `ReviewRepository.java`, `Review.java`, `reviews.jsp` |

---

## 3. Mandatory File-Based Data Storage
You must use the following `.txt` files for your respective modules. Ensure all repository classes handle the read/write logic for these files:

* **users.txt**: Store traveler and admin credentials/profiles.
* **destinations.txt**: Catalog of travel locations and attractions.
* **custom_packages.txt**: Saved itinerary drafts and selections.
* **quotes.txt**: Generated price quotes for budget tracking.
* **bookings.txt**: Finalized transaction and booking records.
* **reviews.txt**: User star ratings and text comments.

---

## 4. Backend OOP Requirements (For Viva)
The examiners will focus on these concepts in your code. Ensure they are clearly implemented:

* **Encapsulation**: Use `private` attributes with public `getters/setters` in all model classes.
* **Inheritance**:
    * `Traveler` and `Admin` must inherit from a base `User` class.
    * `CreditCardPayment` and `BankTransfer` must inherit from a base `Payment` class.
* **Polymorphism**:
    * `calculatePrice()` should have different logic for "Economy" vs "Luxury" tiers.
    * Post-login dashboards should render differently based on the `User` type.
* **Abstraction**: Use abstract classes or interfaces to simplify complex logic like tax calculations or date-sequencing.

---

## 5. Final Deliverables Checklist
* [ ] **Source Code**: Full project in IntelliJ IDEA with all `.java`, `.jsp`, and `.txt` files.
* [ ] **Sample Data**: Ensure all `.txt` files are populated with meaningful data for the demo.
* [ ] **Class Diagrams**: High-quality diagrams showing class relationships and inheritance.
* [ ] **GitHub History**: A clean commit history showing each member's contributions.

**Important Note**: Ensure all file paths to the `.txt` files are relative (e.g., `src/main/resources/data/users.txt`) so the project runs correctly on any machine.

---
**Repository**: [https://github.com/ashendrade/Tourism-Package-Customization-Platform](https://github.com/ashendrade/Tourism-Package-Customization-Platform)

