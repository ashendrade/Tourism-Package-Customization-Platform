package com.tourism.controller;

import com.tourism.repository.BudgetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@Controller
public class BudgetController {

    @Autowired
    private BudgetRepository budgetRepository;

    @Autowired
    private jakarta.servlet.http.HttpSession session;

    @GetMapping({"/budget", "/budgets"})
    public String viewBudgets(Model model) throws IOException {
        com.tourism.model.User user = (com.tourism.model.User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        if (!"ADMIN".equalsIgnoreCase(user.getRole())) {
            return "redirect:/"; // Redirect unauthorized travelers to home
        }
        model.addAttribute("budgets", budgetRepository.readAllBudgets());
        return "budget_view";
    }

    @PostMapping("/calculate-budget")
    public String calculateBudget(@RequestParam String packageId,
                                  @RequestParam double basePrice,
                                  @RequestParam(required = false) Double customAddons,
                                  @RequestParam(required = false) Double tax,
                                  @RequestParam String paymentPlan,
                                  org.springframework.web.servlet.mvc.support.RedirectAttributes redirectAttributes) {
        com.tourism.model.User user = (com.tourism.model.User) session.getAttribute("user");
        if (user == null || !"ADMIN".equalsIgnoreCase(user.getRole())) {
            return "redirect:/login";
        }

        double addons = (customAddons != null) ? customAddons : 0.0;
        double subtotal = basePrice + addons;
        double serviceCharge = subtotal * 0.05;
        double calculatedTax = (tax != null) ? tax : ((subtotal + serviceCharge) * 0.10);
        double estimatedMeals = 5000.0 * 5; // Standard 5 days meal placeholder
        
        double total = subtotal + serviceCharge + calculatedTax + estimatedMeals;
        if ("One-time".equalsIgnoreCase(paymentPlan)) {
            total *= 0.95; // 5% Discount
        }

        com.tourism.model.Budget budget = new com.tourism.model.Budget(
            packageId,
            basePrice,
            addons,
            total,
            calculatedTax,
            serviceCharge,
            estimatedMeals,
            paymentPlan
        );

        budgetRepository.updateBudgetRecord(budget);
        redirectAttributes.addFlashAttribute("successMessage", "✅ Budget/Pricing quote saved successfully!");
        return "redirect:/budget";
    }

    @GetMapping("/admin/budgets/edit/{packageId}")
    public String showEditBudgetPage(@PathVariable String packageId, Model model) {
        com.tourism.model.User user = (com.tourism.model.User) session.getAttribute("user");
        if (user == null || !"ADMIN".equalsIgnoreCase(user.getRole())) {
            return "redirect:/login";
        }

        com.tourism.model.Budget budget = budgetRepository.readAllBudgets().stream()
            .filter(b -> b.getPackageId().equalsIgnoreCase(packageId))
            .findFirst()
            .orElse(null);

        if (budget == null) {
            return "redirect:/budget";
        }

        model.addAttribute("budget", budget);
        return "budget_edit";
    }

    @PostMapping("/admin/budgets/update/{packageId}")
    public String updateBudget(@PathVariable String packageId,
                               @RequestParam double basePrice,
                               @RequestParam double customAddons,
                               @RequestParam double tax,
                               @RequestParam double serviceCharge,
                               @RequestParam double estimatedMeals,
                               @RequestParam String paymentPlan,
                               org.springframework.web.servlet.mvc.support.RedirectAttributes redirectAttributes) {
        com.tourism.model.User user = (com.tourism.model.User) session.getAttribute("user");
        if (user == null || !"ADMIN".equalsIgnoreCase(user.getRole())) {
            return "redirect:/login";
        }

        double subtotal = basePrice + customAddons;
        double total = subtotal + serviceCharge + tax + estimatedMeals;
        if ("One-time".equalsIgnoreCase(paymentPlan)) {
            total *= 0.95; // 5% Discount
        }

        com.tourism.model.Budget budget = new com.tourism.model.Budget(
            packageId,
            basePrice,
            customAddons,
            total,
            tax,
            serviceCharge,
            estimatedMeals,
            paymentPlan
        );

        budgetRepository.updateBudgetRecord(budget);
        
        // Dynamic Sync: Update associated Booking prices if matching
        try {
            com.tourism.service.BookingService bookingService = org.springframework.web.context.support.WebApplicationContextUtils
                .getRequiredWebApplicationContext(session.getServletContext())
                .getBean(com.tourism.service.BookingService.class);
            
            com.tourism.model.Booking booking = bookingService.getAllBookings().stream()
                .filter(b -> b.getPackageId().equalsIgnoreCase(packageId))
                .findFirst()
                .orElse(null);
            
            if (booking != null) {
                booking.setPrice(total);
                
                // Rewrite bookings.txt
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

        redirectAttributes.addFlashAttribute("successMessage", "✅ Budget/Pricing quote updated successfully!");
        return "redirect:/budget";
    }

    @GetMapping("/admin/budgets/delete/{packageId}")
    public String deleteBudget(@PathVariable String packageId, org.springframework.web.servlet.mvc.support.RedirectAttributes redirectAttributes) {
        com.tourism.model.User user = (com.tourism.model.User) session.getAttribute("user");
        if (user == null || !"ADMIN".equalsIgnoreCase(user.getRole())) {
            return "redirect:/login";
        }

        budgetRepository.deleteBudgetRecord(packageId);
        redirectAttributes.addFlashAttribute("successMessage", "✅ Budget/Pricing quote deleted successfully!");
        return "redirect:/budget";
    }
}
