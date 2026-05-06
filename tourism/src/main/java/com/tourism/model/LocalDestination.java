package com.tourism.model;

public class LocalDestination extends Destination {

    private String province;
    private String localTransport;

    public LocalDestination() {
        super();
    }

    public LocalDestination(String destinationId, String destinationName, String country,
                            String city, String packageType, double price, String description,
                            String province, String localTransport) {
        super(destinationId, destinationName, country, city, packageType, price, description);
        this.province = province;
        this.localTransport = localTransport;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getLocalTransport() {
        return localTransport;
    }

    public void setLocalTransport(String localTransport) {
        this.localTransport = localTransport;
    }

    @Override
    public String getDestinationType() {
        return "Local Destination (Sri Lanka)";
    }

    @Override
    public String toString() {
        return super.toString() + ", LocalDestination{" +
                "province='" + province + '\'' +
                ", localTransport='" + localTransport + '\'' +
                '}';
    }
}