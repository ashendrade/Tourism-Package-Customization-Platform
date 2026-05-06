package com.tourism.controller;

import com.tourism.model.Destination;
import com.tourism.service.DestinationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/destinations")
public class DestinationController {

    @Autowired
    private DestinationService destinationService;

    // This handles /destinations, /destinations/, and /destinations/list
    @GetMapping({"", "/", "/list"})
    public String listDestinations(Model model) {
        List<Destination> destinations = destinationService.viewAllDestinations();
        model.addAttribute("destinations", destinations);
        model.addAttribute("totalDestinations", destinations.size());
        return "list";  // Returns /WEB-INF/jsp/list.jsp
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("destination", new Destination());
        return "add";  // Returns /WEB-INF/jsp/add.jsp
    }

    @PostMapping("/add")
    public String addDestination(@ModelAttribute Destination destination,
                                 RedirectAttributes redirectAttributes) {
        destinationService.addDestination(destination);
        redirectAttributes.addFlashAttribute("successMessage",
                "✅ Destination added successfully!");
        return "redirect:/destinations/list";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable String id, Model model) {
        Destination destination = destinationService.getDestinationById(id);
        if (destination != null) {
            model.addAttribute("destination", destination);
            return "edit";  // Returns /WEB-INF/jsp/edit.jsp
        }
        return "redirect:/destinations/list";
    }

    @PostMapping("/update/{id}")
    public String updateDestination(@PathVariable String id,
                                    @ModelAttribute Destination destination,
                                    RedirectAttributes redirectAttributes) {
        boolean updated = destinationService.updateDestination(id, destination);
        if (updated) {
            redirectAttributes.addFlashAttribute("successMessage",
                    "✅ Destination updated successfully!");
        }
        return "redirect:/destinations/list";
    }

    @GetMapping("/delete/{id}")
    public String deleteDestination(@PathVariable String id,
                                    RedirectAttributes redirectAttributes) {
        destinationService.deleteDestination(id);
        redirectAttributes.addFlashAttribute("successMessage",
                "✅ Destination deleted successfully!");
        return "redirect:/destinations/list";
    }


    @GetMapping("/search/country")
    public String searchByCountry(@RequestParam String country, Model model) {
        List<Destination> destinations = destinationService.searchByCountry(country);
        model.addAttribute("destinations", destinations);
        model.addAttribute("searchInfo", "Country: " + country);
        model.addAttribute("totalDestinations", destinations.size());
        return "list";
    }

    @GetMapping("/search/budget")
    public String searchByBudget(@RequestParam double budget, Model model) {
        List<Destination> destinations = destinationService.searchByBudget(budget);
        model.addAttribute("destinations", destinations);
        model.addAttribute("searchInfo", "Budget: Rs. " + String.format("%,.2f", budget));
        model.addAttribute("totalDestinations", destinations.size());
        return "list";
    }

    @GetMapping("/search/package")
    public String searchByPackageType(@RequestParam String packageType, Model model) {
        List<Destination> destinations = destinationService.searchByPackageType(packageType);
        model.addAttribute("destinations", destinations);
        model.addAttribute("searchInfo", "Package: " + packageType);
        model.addAttribute("totalDestinations", destinations.size());
        return "list";
    }
}