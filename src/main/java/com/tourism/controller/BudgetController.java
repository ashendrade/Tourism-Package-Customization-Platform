package com.tourism.controller;

import com.tourism.repository.BudgetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.IOException;

@Controller
public class BudgetController {

    @Autowired
    private BudgetRepository budgetRepository;

    @GetMapping({"/budget", "/budgets"})
    public String viewBudgets(Model model) throws IOException {
        model.addAttribute("budgets", budgetRepository.readAllBudgets());
        return "budget_view";
    }
}
