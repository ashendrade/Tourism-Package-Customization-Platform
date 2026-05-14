package com.tourism.model;

public class Destination {
    private String destinationId;
    private String destinationName;
    private String country;
    private String city;
    private String packageType; // e.g. Adventure, Religious, etc.
    private double price;
    private String description;
    
    // New fields from updates.md
    private String imageUrl;
    private String videoUrl;
    private String weatherInfo;
    private String culturalEtiquette;
    private String transportOptions;
    private String poiType; // Adventure, Religious, Coastal, Nightlife

    // Default Constructor
    public Destination() {
    }

    // Parameterized Constructor (13 fields)
    public Destination(String destinationId, String destinationName, String country,
                       String city, String packageType, double price, String description,
                       String imageUrl, String videoUrl, String weatherInfo, 
                       String culturalEtiquette, String transportOptions, String poiType) {
        this.destinationId = destinationId;
        this.destinationName = destinationName;
        this.country = country;
        this.city = city;
        this.packageType = packageType;
        this.price = price;
        this.description = description;
        this.imageUrl = imageUrl;
        this.videoUrl = videoUrl;
        this.weatherInfo = weatherInfo;
        this.culturalEtiquette = culturalEtiquette;
        this.transportOptions = transportOptions;
        this.poiType = poiType;
    }

    // Backward Compatibility Constructor (7 fields)
    public Destination(String destinationId, String destinationName, String country,
                       String city, String packageType, double price, String description) {
        this(destinationId, destinationName, country, city, packageType, price, description,
             "", "", "Not Available", "Respect local traditions", "Bus, Taxi", "General");
    }

    // Getters and Setters
    public String getDestinationId() { return destinationId; }
    public void setDestinationId(String destinationId) { this.destinationId = destinationId; }

    public String getDestinationName() { return destinationName; }
    public void setDestinationName(String destinationName) { this.destinationName = destinationName; }

    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }

    public String getCity() { return city; }
    public void setCity(String city) { this.city = city; }

    public String getPackageType() { return packageType; }
    public void setPackageType(String packageType) { this.packageType = packageType; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    public String getVideoUrl() { return videoUrl; }
    public void setVideoUrl(String videoUrl) { this.videoUrl = videoUrl; }

    public String getWeatherInfo() { return weatherInfo; }
    public void setWeatherInfo(String weatherInfo) { this.weatherInfo = weatherInfo; }

    public String getCulturalEtiquette() { return culturalEtiquette; }
    public void setCulturalEtiquette(String culturalEtiquette) { this.culturalEtiquette = culturalEtiquette; }

    public String getTransportOptions() { return transportOptions; }
    public void setTransportOptions(String transportOptions) { this.transportOptions = transportOptions; }

    public String getPoiType() { return poiType; }
    public void setPoiType(String poiType) { this.poiType = poiType; }

    @Override
    public String toString() {
        return "Destination{" +
                "id='" + destinationId + '\'' +
                ", name='" + destinationName + '\'' +
                ", country='" + country + '\'' +
                ", city='" + city + '\'' +
                ", poiType='" + poiType + '\'' +
                '}';
    }

    // Polymorphism method
    public String getDestinationType() {
        return "General Destination";
    }
}