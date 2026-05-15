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
}
