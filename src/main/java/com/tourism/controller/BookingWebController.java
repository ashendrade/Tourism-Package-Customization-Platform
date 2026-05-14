package com.tourism.controller;

import com.tourism.model.Booking;
import com.tourism.model.User;
import com.tourism.service.BookingService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.IOException;
import java.util.List;

@Controller
public class BookingWebController {

    @Autowired
    private BookingService bookingService;

    @GetMapping({"/bookings", "/bookings/my-bookings"})
    public String viewBookings(HttpSession session, Model model) throws IOException {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        List<Booking> bookings = bookingService.getBookingsByUser(user.getUsername());
        model.addAttribute("bookings", bookings);
        return "bookings";
    }
}
