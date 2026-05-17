package com.tourism.controller;

import com.tourism.service.DestinationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @Autowired
    private DestinationService destinationService;

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("destinations", destinationService.viewAllDestinations());
        return "home";
    }
}
