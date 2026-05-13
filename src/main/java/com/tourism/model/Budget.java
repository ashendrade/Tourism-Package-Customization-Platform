package com.tourism.model;

/**
 * Model class for Budget/Pricing.
 * Represents the cost breakdown of a travel package.
 */
public class Budget {
    private String packageId;
    private double basePrice;
    private double customAddons;
    private double totalPrice;

    // Default Constructor
    public Budget() {}

    // Parameterized Constructor
    public Budget(String packageId, double basePrice, double customAddons, double totalPrice) {
        this.packageId = packageId;
        this.basePrice = basePrice;
        this.customAddons = customAddons;
        this.totalPrice = totalPrice;
    }

    // Getters and Setters
    public String getPackageId() {
        return packageId;
    }

    public void setPackageId(String packageId) {
        this.packageId = packageId;
    }

    public double getBasePrice() {
        return basePrice;
    }

    public void setBasePrice(double basePrice) {
        this.basePrice = basePrice;
    }

    public double getCustomAddons() {
        return customAddons;
    }

    public void setCustomAddons(double customAddons) {
        this.customAddons = customAddons;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return String.format("%s|%.2f|%.2f|%.2f", packageId, basePrice, customAddons, totalPrice);
    }
}
