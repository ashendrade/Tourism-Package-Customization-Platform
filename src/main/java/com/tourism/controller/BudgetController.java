package com.tourism.controller;

import com.tourism.model.Budget;
import com.tourism.repository.BudgetRepository;
import com.tourism.service.PackageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class BudgetController {

    @Autowired
    private PackageService packageService;

    @Autowired
    private BudgetRepository budgetRepository;

    /**
     * Display all budgets.
     */
    @GetMapping("/budgets")
    public String viewBudgets(Model model) {
        List<Budget> budgets = budgetRepository.readAllBudgets();
        model.addAttribute("budgets", budgets);
        return "budget_view";
    }

    /**
     * Handle budget calculation and saving.
     */
    @PostMapping("/calculate-budget")
    public String calculateBudget(@RequestParam String packageId,
                                  @RequestParam double basePrice,
                                  @RequestParam double addonPrice) {
        packageService.calculatePrice(packageId, basePrice, addonPrice);
        return "redirect:/budgets";
    }
}
