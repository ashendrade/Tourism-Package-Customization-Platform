package com.tourism.controller;

import com.tourism.model.User;
import com.tourism.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProfileController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private com.tourism.service.PackageService packageService;

    @Autowired
    private com.tourism.service.BookingService bookingService;

    @GetMapping("/profile")
    public String viewProfile(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";
        
        // Refresh user data from file to get latest
        user = userRepository.findByUsername(user.getUsername());
        session.setAttribute("user", user);
        
        model.addAttribute("user", user);
        return "profile";
    }

    @PostMapping("/profile/update")
    public String updateProfile(@RequestParam String fullName,
                               @RequestParam String email,
                               @RequestParam(required = false) String password,
                               HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        user.setFullName(fullName);
        user.setEmail(email);
        if (password != null && !password.isEmpty()) {
            user.setPassword(password);
        }

        userRepository.updateUser(user);
        session.setAttribute("user", user);
        
        return "redirect:/profile?success=true";
    }

    @PostMapping("/profile/delete")
    public String deleteAccount(HttpSession session, org.springframework.web.servlet.mvc.support.RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        String username = user.getUsername();

        // 1. Delete associated customized packages
        try {
            packageService.getAllPackages().stream()
                .filter(pkg -> username.equalsIgnoreCase(pkg.getUserId()))
                .forEach(pkg -> packageService.deletePackage(pkg.getId()));
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 2. Delete associated bookings
        try {
            bookingService.getAllBookings().stream()
                .filter(b -> username.equalsIgnoreCase(b.getUserId()))
                .forEach(b -> {
                    try {
                        bookingService.deleteBooking(b.getId());
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                });
        } catch (Exception e) {
            e.printStackTrace();
        }

        // 3. Delete user account
        userRepository.deleteUser(user.getId());

        // 4. Invalidate session
        session.invalidate();

        redirectAttributes.addFlashAttribute("successMessage", "✅ Your account and all associated bookings have been successfully deleted. We are sorry to see you go!");
        return "redirect:/login";
    }
}
