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
    private com.tourism.repository.BudgetRepository budgetRepository;

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

    @GetMapping("/edit/{id}")
    public String showEditPackagePage(@PathVariable String id, Model model) {
        com.tourism.model.User user = (com.tourism.model.User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        
        TravelPackage pkg = packageService.getPackageById(id);
        if (pkg == null) {
            return "redirect:/packages";
        }
        
        // Authorization check: travelers can only edit their own packages; admins can edit all
        if ("TRAVELER".equalsIgnoreCase(user.getRole()) && !user.getUsername().equalsIgnoreCase(pkg.getUserId())) {
            return "redirect:/packages";
        }
        
        // Fetch base price of the destination to compute live prices in JSP
        Destination destination = destinationService.viewAllDestinations().stream()
                .filter(d -> d.getDestinationName().equalsIgnoreCase(pkg.getDestination()))
                .findFirst()
                .orElse(null);
        
        model.addAttribute("pkg", pkg);
        model.addAttribute("destination", destination);
        return "edit_package";
    }

    @PostMapping("/update/{id}")
    public String updatePackage(@PathVariable String id, @ModelAttribute TravelPackage updatedPkg) {
        com.tourism.model.User user = (com.tourism.model.User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        
        TravelPackage existingPkg = packageService.getPackageById(id);
        if (existingPkg == null) {
            return "redirect:/packages";
        }
        
        if ("TRAVELER".equalsIgnoreCase(user.getRole()) && !user.getUsername().equalsIgnoreCase(existingPkg.getUserId())) {
            return "redirect:/packages";
        }
        
        updatedPkg.setId(id);
        updatedPkg.setUserId(existingPkg.getUserId()); // Keep original owner
        packageService.updatePackage(updatedPkg);
        
        // Sync the matching Booking price, hotel tier, and duration
        try {
            com.tourism.model.Booking booking = bookingService.getAllBookings().stream()
                .filter(b -> b.getPackageId().equals(id))
                .findFirst()
                .orElse(null);
            
            if (booking != null) {
                booking.setHotelTier(updatedPkg.getHotelTier());
                booking.setDuration(updatedPkg.getDuration());
                
                // Fetch updated budget total
                double updatedPrice = budgetRepository.readAllBudgets().stream()
                    .filter(b -> b.getPackageId().equals(id))
                    .map(com.tourism.model.Budget::getTotalPrice)
                    .findFirst()
                    .orElse(booking.getPrice());
                booking.setPrice(updatedPrice);
                
                // Rewrite all bookings with updated data
                java.util.List<com.tourism.model.Booking> allBookings = bookingService.getAllBookings();
                java.util.List<String> lines = new java.util.ArrayList<>();
                for (com.tourism.model.Booking b : allBookings) {
                    if (b.getId().equals(booking.getId())) {
                        lines.add(booking.toTextLine());
                    } else {
                        lines.add(b.toTextLine());
                    }
                }
                com.tourism.util.FileHandler.writeLines("src/main/resources/data/bookings.txt", lines);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return "redirect:/packages";
    }

    @GetMapping("/delete/{id}")
    public String deletePackage(@PathVariable String id) {
        com.tourism.model.User user = (com.tourism.model.User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        
        TravelPackage existingPkg = packageService.getPackageById(id);
        if (existingPkg == null) {
            return "redirect:/packages";
        }
        
        if ("TRAVELER".equalsIgnoreCase(user.getRole()) && !user.getUsername().equalsIgnoreCase(existingPkg.getUserId())) {
            return "redirect:/packages";
        }
        
        packageService.deletePackage(id);
        
        // Automatically delete the matching Booking for a clean cascading delete
        try {
            com.tourism.model.Booking booking = bookingService.getAllBookings().stream()
                .filter(b -> b.getPackageId().equals(id))
                .findFirst()
                .orElse(null);
            
            if (booking != null) {
                bookingService.deleteBooking(booking.getId());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return "redirect:/packages";
    }
}
