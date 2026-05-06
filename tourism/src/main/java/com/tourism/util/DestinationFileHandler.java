package com.tourism.util;

import com.tourism.model.Destination;
import org.springframework.stereotype.Component;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Component
public class DestinationFileHandler {

    private static final String FILE_PATH = "destinations.txt";

    public void saveDestination(Destination destination) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String line = String.format("%s,%s,%s,%s,%s,%.2f,%s",
                    destination.getDestinationId(),
                    destination.getDestinationName(),
                    destination.getCountry(),
                    destination.getCity(),
                    destination.getPackageType(),
                    destination.getPrice(),
                    destination.getDescription());
            writer.write(line);
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<Destination> getAllDestinations() {
        List<Destination> destinations = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length == 7) {
                    Destination dest = new Destination(
                            parts[0], parts[1], parts[2], parts[3],
                            parts[4], Double.parseDouble(parts[5]), parts[6]
                    );
                    destinations.add(dest);
                }
            }
        } catch (FileNotFoundException e) {
            createFile();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return destinations;
    }

    public Destination getDestinationById(String destinationId) {
        return getAllDestinations().stream()
                .filter(dest -> dest.getDestinationId().equals(destinationId))
                .findFirst()
                .orElse(null);
    }

    public boolean updateDestination(String destinationId, Destination updatedDestination) {
        List<Destination> destinations = getAllDestinations();
        boolean found = false;

        for (int i = 0; i < destinations.size(); i++) {
            if (destinations.get(i).getDestinationId().equals(destinationId)) {
                destinations.set(i, updatedDestination);
                found = true;
                break;
            }
        }

        if (found) {
            rewriteFile(destinations);
        }
        return found;
    }

    public boolean deleteDestination(String destinationId) {
        List<Destination> destinations = getAllDestinations();
        boolean removed = destinations.removeIf(dest -> dest.getDestinationId().equals(destinationId));

        if (removed) {
            rewriteFile(destinations);
        }
        return removed;
    }

    private void rewriteFile(List<Destination> destinations) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Destination dest : destinations) {
                String line = String.format("%s,%s,%s,%s,%s,%.2f,%s",
                        dest.getDestinationId(),
                        dest.getDestinationName(),
                        dest.getCountry(),
                        dest.getCity(),
                        dest.getPackageType(),
                        dest.getPrice(),
                        dest.getDescription());
                writer.write(line);
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createFile() {
        try {
            File file = new File(FILE_PATH);
            file.createNewFile();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<Destination> searchByCountry(String country) {
        List<Destination> results = new ArrayList<>();
        for (Destination dest : getAllDestinations()) {
            if (dest.getCountry().toLowerCase().contains(country.toLowerCase())) {
                results.add(dest);
            }
        }
        return results;
    }

    public List<Destination> searchByBudget(double budget) {
        List<Destination> results = new ArrayList<>();
        for (Destination dest : getAllDestinations()) {
            if (dest.getPrice() <= budget) {
                results.add(dest);
            }
        }
        return results;
    }

    public List<Destination> searchByPackageType(String packageType) {
        List<Destination> results = new ArrayList<>();
        for (Destination dest : getAllDestinations()) {
            if (dest.getPackageType().equalsIgnoreCase(packageType)) {
                results.add(dest);
            }
        }
        return results;
    }
}