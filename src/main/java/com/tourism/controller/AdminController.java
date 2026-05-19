package com.tourism.controller;

import com.tourism.model.Destination;
import com.tourism.model.User;
import com.tourism.service.DestinationService;
import com.tourism.service.BookingService;
import com.tourism.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private DestinationService destinationService;

    @Autowired
    private BookingService bookingService;

    @Autowired
    private UserService userService;

    private boolean isAdmin(HttpSession session) {
        User user = (User) session.getAttribute("user");
        return user != null && "ADMIN".equalsIgnoreCase(user.getRole());
    }

    // ==========================================
    // DESTINATION MANAGEMENT ENDPOINTS
    // ==========================================

    @GetMapping("/destinations")
    public String listDestinations(HttpSession session, Model model) {
        if (!isAdmin(session)) return "redirect:/login";
        model.addAttribute("destinations", destinationService.viewAllDestinations());
        return "admin_destinations";
    }

    @PostMapping("/destinations/add")
    public String addDestination(@ModelAttribute Destination destination, HttpSession session, RedirectAttributes redirectAttributes) throws IOException {
        if (!isAdmin(session)) return "redirect:/login";
        destinationService.addDestination(destination);
        redirectAttributes.addFlashAttribute("successMessage", "✅ Destination added successfully!");
        return "redirect:/admin/destinations";
    }

    @GetMapping("/destinations/edit/{id}")
    public String showEditDestinationForm(@PathVariable String id, HttpSession session, Model model) {
        if (!isAdmin(session)) return "redirect:/login";
        Destination destination = destinationService.getDestinationById(id);
        if (destination != null) {
            model.addAttribute("destination", destination);
            return "admin_destination_edit";
        }
        return "redirect:/admin/destinations";
    }

    @PostMapping("/destinations/update/{id}")
    public String updateDestination(@PathVariable String id, @ModelAttribute Destination destination, HttpSession session, RedirectAttributes redirectAttributes) {
        if (!isAdmin(session)) return "redirect:/login";
        destinationService.updateDestination(id, destination);
        redirectAttributes.addFlashAttribute("successMessage", "✅ Destination updated successfully!");
        return "redirect:/admin/destinations";
    }

    @GetMapping("/destinations/delete/{id}")
    public String deleteDestination(@PathVariable String id, HttpSession session, RedirectAttributes redirectAttributes) {
        if (!isAdmin(session)) return "redirect:/login";
        destinationService.deleteDestination(id);
        redirectAttributes.addFlashAttribute("successMessage", "✅ Destination deleted successfully!");
        return "redirect:/admin/destinations";
    }

    // ==========================================
    // USER MANAGEMENT ENDPOINTS
    // ==========================================

    @GetMapping("/users")
    public String listUsers(HttpSession session, Model model) {
        if (!isAdmin(session)) return "redirect:/login";
        model.addAttribute("users", userService.getAllUsers());
        return "admin_users";
    }

    @GetMapping("/users/add")
    public String showAddUserForm(HttpSession session) {
        if (!isAdmin(session)) return "redirect:/login";
        return "admin_user_add";
    }

    @PostMapping("/users/add")
    public String addUser(@RequestParam String username, @RequestParam String password,
                          @RequestParam String role, @RequestParam(required = false) String fullName,
                          @RequestParam(required = false) String email, HttpSession session,
                          RedirectAttributes redirectAttributes) {
        if (!isAdmin(session)) return "redirect:/login";
        boolean registered = userService.register(username, password, role, fullName, email);
        if (registered) {
            redirectAttributes.addFlashAttribute("successMessage", "✅ User added successfully!");
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "❌ Username already exists!");
        }
        return "redirect:/admin/users";
    }

    @GetMapping("/users/edit/{id}")
    public String showEditUserForm(@PathVariable String id, HttpSession session, Model model) {
        if (!isAdmin(session)) return "redirect:/login";
        User user = userService.getUserById(id);
        if (user != null) {
            model.addAttribute("targetUser", user);
            return "admin_user_edit";
        }
        return "redirect:/admin/users";
    }

    @PostMapping("/users/update/{id}")
    public String updateUser(@PathVariable String id, @RequestParam String username,
                             @RequestParam String password, @RequestParam String role,
                             @RequestParam(required = false) String fullName,
                             @RequestParam(required = false) String email, HttpSession session,
                             RedirectAttributes redirectAttributes) {
        if (!isAdmin(session)) return "redirect:/login";
        User user = userService.getUserById(id);
        if (user != null) {
            user.setUsername(username);
            user.setPassword(password);
            user.setRole(role);
            user.setFullName(fullName);
            user.setEmail(email);
            userService.updateUser(user);
            redirectAttributes.addFlashAttribute("successMessage", "✅ User updated successfully!");
        }
        return "redirect:/admin/users";
    }

    @GetMapping("/users/delete/{id}")
    public String deleteUser(@PathVariable String id, HttpSession session, RedirectAttributes redirectAttributes) {
        if (!isAdmin(session)) return "redirect:/login";

        User currentUser = (User) session.getAttribute("user");
        if (currentUser != null && currentUser.getId().equals(id)) {
            redirectAttributes.addFlashAttribute("errorMessage", "❌ You cannot delete your own active administrator account!");
            return "redirect:/admin/users";
        }

        userService.deleteUser(id);
        redirectAttributes.addFlashAttribute("successMessage", "✅ User deleted successfully!");
        return "redirect:/admin/users";
    }

    // ==========================================
    // BOOKING MONITOR ENDPOINTS
    // ==========================================

    @GetMapping("/bookings")
    public String viewAllBookings(HttpSession session, Model model) throws IOException {
        if (!isAdmin(session)) return "redirect:/login";
        model.addAttribute("bookings", bookingService.getAllBookings());
        return "admin_bookings";
    }
}
