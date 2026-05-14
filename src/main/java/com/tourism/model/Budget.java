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
    
    // New fields from updates.md
    private double tax;
    private double serviceCharge;
    private double estimatedMeals;
    private String paymentPlan; // One-time, 2 Installments, etc.

    // Default Constructor
    public Budget() {}

    // Parameterized Constructor (8 fields)
    public Budget(String packageId, double basePrice, double customAddons, double totalPrice,
                  double tax, double serviceCharge, double estimatedMeals, String paymentPlan) {
        this.packageId = packageId;
        this.basePrice = basePrice;
        this.customAddons = customAddons;
        this.totalPrice = totalPrice;
        this.tax = tax;
        this.serviceCharge = serviceCharge;
        this.estimatedMeals = estimatedMeals;
        this.paymentPlan = paymentPlan;
    }

    // Backward Compatibility Constructor (4 fields)
    public Budget(String packageId, double basePrice, double customAddons, double totalPrice) {
        this(packageId, basePrice, customAddons, totalPrice, 
             totalPrice * 0.10, totalPrice * 0.05, 10000.0, "One-time");
    }

    // Getters and Setters
    public String getPackageId() { return packageId; }
    public void setPackageId(String packageId) { this.packageId = packageId; }

    public double getBasePrice() { return basePrice; }
    public void setBasePrice(double basePrice) { this.basePrice = basePrice; }

    public double getCustomAddons() { return customAddons; }
    public void setCustomAddons(double customAddons) { this.customAddons = customAddons; }

    public double getTotalPrice() { return totalPrice; }
    public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }

    public double getTax() { return tax; }
    public void setTax(double tax) { this.tax = tax; }

    public double getServiceCharge() { return serviceCharge; }
    public void setServiceCharge(double serviceCharge) { this.serviceCharge = serviceCharge; }

    public double getEstimatedMeals() { return estimatedMeals; }
    public void setEstimatedMeals(double estimatedMeals) { this.estimatedMeals = estimatedMeals; }

    public String getPaymentPlan() { return paymentPlan; }
    public void setPaymentPlan(String paymentPlan) { this.paymentPlan = paymentPlan; }

    @Override
    public String toString() {
        return String.format("%s|%.2f|%.2f|%.2f|%.2f|%.2f|%.2f|%s", 
            packageId, basePrice, customAddons, totalPrice, tax, serviceCharge, estimatedMeals, paymentPlan);
    }
}
