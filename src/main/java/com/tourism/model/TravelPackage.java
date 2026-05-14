package com.tourism.model;

public class TravelPackage {

    private String id;
    private String name;
    private String destination;
    private String hotelType; // This was here, might map to hotelTier
    private int duration;
    
    // New fields from updates.md
    private String activities; // Semicolon separated list
    private String specialRequest;
    private String hotelTier; // Budget, Standard, Luxury

    public TravelPackage() {}

    public TravelPackage(String id, String name, String destination, String hotelType, int duration,
                        String activities, String specialRequest, String hotelTier) {
        this.id = id;
        this.name = name;
        this.destination = destination;
        this.hotelType = hotelType;
        this.duration = duration;
        this.activities = activities;
        this.specialRequest = specialRequest;
        this.hotelTier = hotelTier;
    }

    // Backward Compatibility Constructor (5 fields)
    public TravelPackage(String id, String name, String destination, String hotelType, int duration) {
        this(id, name, destination, hotelType, duration, "City Tour", "None", hotelType);
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDestination() { return destination; }
    public void setDestination(String destination) { this.destination = destination; }

    public String getHotelType() { return hotelType; }
    public void setHotelType(String hotelType) { this.hotelType = hotelType; }

    public int getDuration() { return duration; }
    public void setDuration(int duration) { this.duration = duration; }

    public String getActivities() { return activities; }
    public void setActivities(String activities) { this.activities = activities; }

    public String getSpecialRequest() { return specialRequest; }
    public void setSpecialRequest(String specialRequest) { this.specialRequest = specialRequest; }

    public String getHotelTier() { return hotelTier; }
    public void setHotelTier(String hotelTier) { this.hotelTier = hotelTier; }
}