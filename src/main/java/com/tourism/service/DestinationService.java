package com.tourism.service;

import com.tourism.model.Destination;
import com.tourism.util.DestinationFileHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class DestinationService {

    @Autowired
    private DestinationFileHandler fileHandler;

    public void addDestination(Destination destination) {
        String id = "DEST" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
        destination.setDestinationId(id);
        fileHandler.saveDestination(destination);
    }

    public List<Destination> viewAllDestinations() {
        return fileHandler.getAllDestinations();
    }

    public Destination getDestinationById(String id) {
        return fileHandler.getDestinationById(id);
    }

    public boolean updateDestination(String id, Destination updatedDestination) {
        updatedDestination.setDestinationId(id);
        return fileHandler.updateDestination(id, updatedDestination);
    }

    public boolean deleteDestination(String id) {
        return fileHandler.deleteDestination(id);
    }

    public List<Destination> searchByCountry(String country) {
        return fileHandler.searchByCountry(country);
    }

    public List<Destination> searchByBudget(double budget) {
        return fileHandler.searchByBudget(budget);
    }

    public List<Destination> searchByPackageType(String packageType) {
        return fileHandler.searchByPackageType(packageType);
    }
}