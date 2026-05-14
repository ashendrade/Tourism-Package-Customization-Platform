package com.tourism.model;

public class TravelPackage {

    private String id;
    private String name;
    private String destination;
    private String hotelType;
    private int duration;

    public TravelPackage() {}

    public TravelPackage(String id, String name, String destination, String hotelType, int duration) {
        this.id = id;
        this.name = name;
        this.destination = destination;
        this.hotelType = hotelType;
        this.duration = duration;
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
}