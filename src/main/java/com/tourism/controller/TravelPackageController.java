package com.tourism.controller;

import com.tourism.model.Destination;
import com.tourism.model.TravelPackage;
import com.tourism.service.DestinationService;
import com.tourism.service.PackageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/packages")
public class TravelPackageController {

    @Autowired
    private PackageService packageService;

    @Autowired
    private DestinationService destinationService;

    @Autowired
    private com.tourism.service.BookingService bookingService;

    @Autowired
    private jakarta.servlet.http.HttpSession session;

    @GetMapping({"", "/list"})
    public String listPackages(Model model) {
        com.tourism.model.User user = (com.tourism.model.User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        
        java.util.List<TravelPackage> allPackages = packageService.getAllPackages();
        if ("TRAVELER".equalsIgnoreCase(user.getRole())) {
            java.util.List<TravelPackage> userPackages = allPackages.stream()
                .filter(p -> user.getUsername().equalsIgnoreCase(p.getUserId()))
                .collect(java.util.stream.Collectors.toList());
            model.addAttribute("packages", userPackages); 
        } else {
            model.addAttribute("packages", allPackages);
        }
        return "packages";
    }

    @GetMapping("/customize")
    public String showCustomizePage(@RequestParam String destinationId, Model model) {
        if (session.getAttribute("user") == null) {
            return "redirect:/login";
        }
        Destination destination = destinationService.getDestinationById(destinationId);
        if (destination == null) {
            return "redirect:/destinations";
        }
        model.addAttribute("destination", destination);
        return "customize";
    }

    @PostMapping("/customize")
    public String handleCustomization(@ModelAttribute TravelPackage pkg) {
        com.tourism.model.User user = (com.tourism.model.User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        
        // 1. Save the Package and Quote
        pkg.setUserId(user.getUsername());
        String result = packageService.createPackage(pkg);
        
        // 2. Create a Booking automatically for the current user
        try {
            com.tourism.model.Booking booking = new com.tourism.model.Booking();
            booking.setPackageId(pkg.getId());
            booking.setUserId(user.getUsername());
            booking.setBookingDate(java.time.LocalDate.now().toString());
            booking.setHotelTier(pkg.getHotelTier());
            booking.setDuration(pkg.getDuration());
            booking.setStatus("PENDING");
            
            bookingService.createBooking(booking);
        } catch (java.io.IOException e) {
            e.printStackTrace();
        }
        
        return "redirect:/bookings/my-bookings";
    }
}
