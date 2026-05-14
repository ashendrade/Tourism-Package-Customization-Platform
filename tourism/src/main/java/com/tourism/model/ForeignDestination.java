package com.tourism.model;

public class ForeignDestination extends Destination {

    private String visaRequired;
    private String flightDuration;
    private String currency;

    public ForeignDestination() {
        super();
    }

    public ForeignDestination(String destinationId, String destinationName, String country,
                              String city, String packageType, double price, String description,
                              String visaRequired, String flightDuration, String currency) {
        super(destinationId, destinationName, country, city, packageType, price, description);
        this.visaRequired = visaRequired;
        this.flightDuration = flightDuration;
        this.currency = currency;
    }

    public String getVisaRequired() {
        return visaRequired;
    }

    public void setVisaRequired(String visaRequired) {
        this.visaRequired = visaRequired;
    }

    public String getFlightDuration() {
        return flightDuration;
    }

    public void setFlightDuration(String flightDuration) {
        this.flightDuration = flightDuration;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    @Override
    public String getDestinationType() {
        return "Foreign Destination (International)";
    }

    @Override
    public String toString() {
        return super.toString() + ", ForeignDestination{" +
                "visaRequired='" + visaRequired + '\'' +
                ", flightDuration='" + flightDuration + '\'' +
                ", currency='" + currency + '\'' +
                '}';
    }
}