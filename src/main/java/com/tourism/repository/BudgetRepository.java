package com.tourism.repository;

import com.tourism.model.Budget;
import org.springframework.stereotype.Repository;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

@Repository
public class BudgetRepository {
    private static final String FILE_PATH = "pricing.txt";
    private static final String DELIMITER = "\\|";

    /**
     * Saves a budget record to the text file.
     */
    public void saveToFile(Budget budget) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(budget.getPackageId() + "|" +
                         budget.getBasePrice() + "|" +
                         budget.getCustomAddons() + "|" +
                         budget.getTotalPrice());
            writer.newLine();
        } catch (IOException e) {
            System.err.println("Error writing to file: " + e.getMessage());
        }
    }

    /**
     * Reads all budget records from the text file.
     */
    public List<Budget> readAllBudgets() {
        List<Budget> budgets = new ArrayList<>();
        File file = new File(FILE_PATH);
        
        if (!file.exists()) {
            return budgets;
        }

        try (Scanner scanner = new Scanner(file)) {
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine();
                if (line.trim().isEmpty()) continue;
                
                String[] data = line.split(DELIMITER);
                if (data.length == 4) {
                    Budget budget = new Budget(
                        data[0],
                        Double.parseDouble(data[1]),
                        Double.parseDouble(data[2]),
                        Double.parseDouble(data[3])
                    );
                    budgets.add(budget);
                }
            }
        } catch (FileNotFoundException e) {
            System.err.println("File not found: " + e.getMessage());
        } catch (NumberFormatException e) {
            System.err.println("Error parsing numeric values: " + e.getMessage());
        }
        
        return budgets;
    }

    /**
     * Updates an existing budget record in the text file.
     */
    public void updateBudgetRecord(Budget updatedBudget) {
        List<Budget> budgets = readAllBudgets();
        boolean found = false;

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Budget b : budgets) {
                if (b.getPackageId().equals(updatedBudget.getPackageId())) {
                    writer.write(updatedBudget.getPackageId() + "|" +
                                 updatedBudget.getBasePrice() + "|" +
                                 updatedBudget.getCustomAddons() + "|" +
                                 updatedBudget.getTotalPrice());
                    found = true;
                } else {
                    writer.write(b.getPackageId() + "|" +
                                 b.getBasePrice() + "|" +
                                 b.getCustomAddons() + "|" +
                                 b.getTotalPrice());
                }
                writer.newLine();
            }
            
            // If not found, add it as a new record
            if (!found) {
                writer.write(updatedBudget.getPackageId() + "|" +
                             updatedBudget.getBasePrice() + "|" +
                             updatedBudget.getCustomAddons() + "|" +
                             updatedBudget.getTotalPrice());
                writer.newLine();
            }
        } catch (IOException e) {
            System.err.println("Error updating file: " + e.getMessage());
        }
    }
}
