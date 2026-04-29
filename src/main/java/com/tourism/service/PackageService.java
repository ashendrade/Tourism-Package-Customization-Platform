package com.tourism.service;

import com.tourism.model.Budget;
import com.tourism.model.TravelPackage;
import com.tourism.repository.BudgetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class PackageService {

    private static final String FILE_PATH = "packages.txt";

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
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(pkg.getId() + "," +
                         pkg.getName() + "," +
                         pkg.getDestination() + "," +
                         pkg.getHotelType() + "," +
                         pkg.getDuration());
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "Package saved";
    }

    // READ
    public List<TravelPackage> getAllPackages() {
        List<TravelPackage> list = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;

            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");

                TravelPackage pkg = new TravelPackage(
                        data[0], data[1], data[2], data[3], Integer.parseInt(data[4])
                );

                list.add(pkg);
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return list;
    }

    
    public String deletePackage(String id) {
        List<TravelPackage> list = getAllPackages();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (TravelPackage pkg : list) {
                if (!pkg.getId().equals(id)) {
                    writer.write(pkg.getId() + "," +
                                 pkg.getName() + "," +
                                 pkg.getDestination() + "," +
                                 pkg.getHotelType() + "," +
                                 pkg.getDuration());
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "Package deleted";
    }
}