package com.tourism.service;

import com.tourism.model.Budget;
import com.tourism.model.Destination;
import com.tourism.model.TravelPackage;
import com.tourism.repository.BudgetRepository;
import com.tourism.repository.PackageRepository;
import com.tourism.util.DestinationFileHandler;
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
     * @param tier The tier of the package (Economy/Luxury)
     * @return Calculated Budget object
     */
    public Budget calculatePrice(String packageId, double basePrice, double addonPrice, String tier) {
        double adjustedBase = basePrice;
        
        // Polymorphism/Tier Check
        if ("Luxury".equalsIgnoreCase(tier)) {
            adjustedBase *= 1.8; // 80% Luxury Premium (Updated)
        } else if ("Budget".equalsIgnoreCase(tier)) {
            adjustedBase *= 0.7; // 30% Discount for Budget
        }
        
        double subtotal = adjustedBase + addonPrice;
        double serviceCharge = subtotal * 0.05; // 5% Service Charge
        double tax = (subtotal + serviceCharge) * 0.10; // 10% Tax
        double estimatedMeals = 5000.0 * 5; // Placeholder for 5 days
        
        double total = subtotal + serviceCharge + tax + estimatedMeals;

        // Apply 5% discount if total exceeds 200,000
        if (total > 200000) {
            total *= 0.95;
        }

        Budget budget = new Budget(packageId, adjustedBase, addonPrice, total, tax, serviceCharge, estimatedMeals, "One-time");
        budgetRepository.updateBudgetRecord(budget); // Save/Update in file
        return budget;
    }

    @Autowired
    private DestinationFileHandler destinationFileHandler;

    public String createPackage(TravelPackage pkg) {
        if (pkg.getId() == null || pkg.getId().isEmpty()) {
            pkg.setId("PKG" + System.currentTimeMillis() % 1000000);
        }
        
        // Fetch destination base price
        List<Destination> destinations = destinationFileHandler.getAllDestinations();
        double basePrice = destinations.stream()
                .filter(d -> d.getDestinationName().equalsIgnoreCase(pkg.getDestination()))
                .map(Destination::getPrice)
                .findFirst()
                .orElse(0.0);
        
        // Calculate and save quote
        calculatePrice(pkg.getId(), basePrice, 0, pkg.getHotelType());
        
        packageRepository.save(pkg);
        return "Package saved with quote";
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
            // Fetch base price
            List<Destination> destinations = destinationFileHandler.getAllDestinations();
            double basePrice = destinations.stream()
                    .filter(d -> d.getDestinationName().equalsIgnoreCase(updatedPkg.getDestination()))
                    .map(Destination::getPrice)
                    .findFirst()
                    .orElse(0.0);
            
            // Recalculate price and update quote
            calculatePrice(updatedPkg.getId(), basePrice, 0, updatedPkg.getHotelType());
            
            packageRepository.rewrite(list);
            return "Package updated";
        }
        return "Package not found";
    }

    public TravelPackage getPackageById(String id) {
        return getAllPackages().stream()
                .filter(pkg -> pkg.getId().equals(id))
                .findFirst()
                .orElse(null);
    }
}
