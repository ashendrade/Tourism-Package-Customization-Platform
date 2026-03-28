tourism-platform/
├─ pom.xml                             <- Maven dependencies
├─ src/
│  ├─ main/
│  │  ├─ java/
│  │  │  └─ com.example.tourism/
│  │  │       ├─ TourismApplication.java   <- Main Spring Boot class
│  │  │       ├─ controller/             <- Controllers (handle requests)
│  │  │       │    ├─ UserController.java
│  │  │       │    ├─ DestinationController.java
│  │  │       │    ├─ PackageController.java
│  │  │       │    ├─ BookingController.java
│  │  │       │    └─ ReviewController.java
│  │  │       ├─ service/                <- Business logic
│  │  │       │    ├─ UserService.java
│  │  │       │    ├─ DestinationService.java
│  │  │       │    ├─ PackageService.java
│  │  │       │    ├─ BookingService.java
│  │  │       │    └─ ReviewService.java
│  │  │       ├─ repository/             <- Database access (Spring Data JPA)
│  │  │       │    ├─ UserRepository.java
│  │  │       │    ├─ DestinationRepository.java
│  │  │       │    ├─ PackageRepository.java
│  │  │       │    ├─ BookingRepository.java
│  │  │       │    └─ ReviewRepository.java
│  │  │       └─ model/                  <- Entities / DB tables
│  │  │            ├─ User.java
│  │  │            ├─ Destination.java
│  │  │            ├─ TravelPackage.java
│  │  │            ├─ Booking.java
│  │  │            └─ Review.java
│  │  └─ resources/
│  │       ├─ application.properties     <- DB config, server port, etc.
│  │       ├─ static/                     <- CSS, JS, images
│  │       │    ├─ css/
│  │       │    │    └─ style.css
│  │       │    ├─ js/
│  │       │    │    └─ script.js
│  │       │    └─ images/
│  │       │         └─ logo.png
│  │       └─ templates/                  <- JSP pages
│  │            ├─ index.jsp
│  │            ├─ login.jsp
│  │            ├─ register.jsp
│  │            ├─ destinations.jsp
│  │            ├─ packages.jsp
│  │            ├─ bookings.jsp
│  │            └─ reviews.jsp
└─ mvnw, mvnw.cmd, .mvn/                 <- Maven wrapper files