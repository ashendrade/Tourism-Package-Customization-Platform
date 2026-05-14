package com.tourism.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ContactController {

    @GetMapping("/contact")
    public String showContactPage() {
        return "contact";
    }

    @org.springframework.web.bind.annotation.PostMapping("/contact/submit")
    public String submitContactForm(@org.springframework.web.bind.annotation.RequestParam String name,
                                  @org.springframework.web.bind.annotation.RequestParam String email,
                                  @org.springframework.web.bind.annotation.RequestParam String message) {
        // In a real app, send email or save to DB
        return "redirect:/contact?success=true";
    }
}
