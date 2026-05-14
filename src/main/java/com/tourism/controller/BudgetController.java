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
}
