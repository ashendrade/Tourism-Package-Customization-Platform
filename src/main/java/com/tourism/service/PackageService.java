package com.tourism.service;

import com.tourism.model.Budget;
import com.tourism.model.TravelPackage;
import com.tourism.repository.BudgetRepository;
import com.tourism.repository.PackageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class PackageService {

    @Autowired
    private PackageRepository packageRepository;

    @Autowired
    private BudgetRepository budgetRepository;

    /**
     * Calculates the total price including tax and potential discounts.
     * @param packageId The ID of the package
     * @param basePrice The base cost of the package
     * @param addonPrice Additional costs for customizations
     * @return Calculated Budget object
     */
    public Budget calculatePrice(String packageId, double basePrice, double addonPrice) {
        double subtotal = basePrice + addonPrice;
        double taxRate = 0.10; // 10% Tax
        double tax = subtotal * taxRate;
        double total = subtotal + tax;

        // Apply 5% discount if total exceeds 2000
        if (total > 2000) {
            total *= 0.95;
        }

        Budget budget = new Budget(packageId, basePrice, addonPrice, total);
        budgetRepository.updateBudgetRecord(budget); // Save/Update in file
        return budget;
    }

    public String createPackage(TravelPackage pkg) {
        packageRepository.save(pkg);
        return "Package saved";
    }

    public List<TravelPackage> getAllPackages() {
        return packageRepository.findAll();
    }

    public String deletePackage(String id) {
        List<TravelPackage> list = getAllPackages();
        list.removeIf(pkg -> pkg.getId().equals(id));
        packageRepository.rewrite(list);
        return "Package deleted";
    }

    public String updatePackage(TravelPackage updatedPkg) {
        List<TravelPackage> list = getAllPackages();
        boolean found = false;
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getId().equals(updatedPkg.getId())) {
                list.set(i, updatedPkg);
                found = true;
                break;
            }
        }
        if (found) {
            packageRepository.rewrite(list);
            return "Package updated";
        }
        return "Package not found";
    }
}
