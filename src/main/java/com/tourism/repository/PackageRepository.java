package com.tourism.repository;

import com.tourism.model.TravelPackage;
import org.springframework.stereotype.Repository;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class PackageRepository {
    private static final String FILE_PATH = "src/main/resources/data/packages.txt";

    public void save(TravelPackage pkg) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(formatPackage(pkg));
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<TravelPackage> findAll() {
        List<TravelPackage> list = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) return list;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                try {
                    String[] data = line.split(",", 9);
                    if (data.length == 9) {
                        list.add(new TravelPackage(
                            data[0], data[1], data[2], data[3], 
                            Integer.parseInt(data[4].trim()), 
                            data[5], data[6], data[7], data[8]
                        ));
                    } else if (data.length == 8) {
                        list.add(new TravelPackage(
                            data[0], data[1], data[2], data[3], 
                            Integer.parseInt(data[4].trim()), 
                            data[5], data[6], data[7], "admin"
                        ));
                    } else if (data.length == 5) {
                        list.add(new TravelPackage(
                            data[0], data[1], data[2], data[3], 
                            Integer.parseInt(data[4].trim()),
                            "Standard Tour", "", "Standard", "admin"
                        ));
                    }
                } catch (Exception e) {
                    System.err.println("Error parsing package line: " + line);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }

    public void rewrite(List<TravelPackage> packages) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (TravelPackage pkg : packages) {
                writer.write(formatPackage(pkg));
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private String formatPackage(TravelPackage pkg) {
        return String.format("%s,%s,%s,%s,%d,%s,%s,%s,%s",
            pkg.getId(),
            pkg.getName(),
            pkg.getDestination(),
            pkg.getHotelType(),
            pkg.getDuration(),
            pkg.getActivities() != null ? pkg.getActivities() : "Standard Tour",
            pkg.getSpecialRequest() != null ? pkg.getSpecialRequest() : "",
            pkg.getHotelTier() != null ? pkg.getHotelTier() : "Standard",
            pkg.getUserId() != null ? pkg.getUserId() : "admin"
        );
    }
}
