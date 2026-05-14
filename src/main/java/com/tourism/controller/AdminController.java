package com.tourism.controller;

import com.tourism.model.Destination;
import com.tourism.model.User;
import com.tourism.service.DestinationService;
import com.tourism.service.BookingService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private DestinationService destinationService;

    @Autowired
    private BookingService bookingService;

    private boolean isAdmin(HttpSession session) {
        User user = (User) session.getAttribute("user");
        return user != null && "ADMIN".equalsIgnoreCase(user.getRole());
    }

    @GetMapping("/destinations")
    public String listDestinations(HttpSession session, Model model) {
        if (!isAdmin(session)) return "redirect:/login";
        model.addAttribute("destinations", destinationService.viewAllDestinations());
        return "admin_destinations";
    }

    @PostMapping("/destinations/add")
    public String addDestination(@ModelAttribute Destination destination, HttpSession session) throws IOException {
        if (!isAdmin(session)) return "redirect:/login";
        destinationService.addDestination(destination);
        return "redirect:/admin/destinations";
    }

    @GetMapping("/bookings")
    public String viewAllBookings(HttpSession session, Model model) throws IOException {
        if (!isAdmin(session)) return "redirect:/login";
        // Get all bookings from all users
        model.addAttribute("bookings", bookingService.getAllBookings());
        return "admin_bookings";
    }
}
