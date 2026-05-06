package com.tourism.model;

public class Destination {
    private String destinationId;
    private String destinationName;
    private String country;
    private String city;
    private String packageType;
    private double price;
    private String description;

    // Default Constructor
    public Destination() {
    }

    // Parameterized Constructor
    public Destination(String destinationId, String destinationName, String country,
                       String city, String packageType, double price, String description) {
        this.destinationId = destinationId;
        this.destinationName = destinationName;
        this.country = country;
        this.city = city;
        this.packageType = packageType;
        this.price = price;
        this.description = description;
    }

    // Getters and Setters
    public String getDestinationId() {
        return destinationId;
    }

    public void setDestinationId(String destinationId) {
        this.destinationId = destinationId;
    }

    public String getDestinationName() {
        return destinationName;
    }

    public void setDestinationName(String destinationName) {
        this.destinationName = destinationName;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPackageType() {
        return packageType;
    }

    public void setPackageType(String packageType) {
        this.packageType = packageType;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Destination{" +
                "destinationId='" + destinationId + '\'' +
                ", destinationName='" + destinationName + '\'' +
                ", country='" + country + '\'' +
                ", city='" + city + '\'' +
                ", packageType='" + packageType + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                '}';
    }

    // Polymorphism method
    public String getDestinationType() {
        return "General Destination";
    }
}