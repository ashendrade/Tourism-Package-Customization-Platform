
package com.tourism.service;

import com.tourism.model.TravelPackage;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class

PackageService {

    // Updated path to look inside the 'data' folder
    private static final String FILE_PATH = "data/packages.txt";

    private void ensureFileExists() {
        File file = new File(FILE_PATH);
        File parentDir = file.getParentFile();
        if (parentDir != null && !parentDir.exists()) {
            parentDir.mkdirs();
        }
        if (!file.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public String createPackage(TravelPackage pkg) {
        ensureFileExists();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(pkg.getId() + "," +
                    pkg.getName() + "," +
                    pkg.getDestination() + "," +
                    pkg.getHotelType() + "," +
                    pkg.getDuration());
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "Package saved";
    }

    // READ
    public List<TravelPackage> getAllPackages() {
        ensureFileExists();
        List<TravelPackage> list = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;

            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                
                String[] data = line.split(",");
                if (data.length < 5) continue;

                try {
                    TravelPackage pkg = new TravelPackage(
                            data[0], data[1], data[2], data[3], Integer.parseInt(data[4].trim())
                    );
                    list.add(pkg);
                } catch (NumberFormatException e) {
                    System.err.println("Error parsing duration for line: " + line);
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        return list;
    }


    public String deletePackage(String id) {
        List<TravelPackage> list = getAllPackages();

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (TravelPackage pkg : list) {
                if (!pkg.getId().equals(id)) {
                    writer.write(pkg.getId() + "," +
                            pkg.getName() + "," +
                            pkg.getDestination() + "," +
                            pkg.getHotelType() + "," +
                            pkg.getDuration());
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "Package deleted";
    }

    public String updatePackage(TravelPackage updatedPkg) {
        List<TravelPackage> list = getAllPackages();
        boolean found = false;

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (TravelPackage pkg : list) {
                if (pkg.getId().equals(updatedPkg.getId())) {
                    writer.write(updatedPkg.getId() + "," +
                            updatedPkg.getName() + "," +
                            updatedPkg.getDestination() + "," +
                            updatedPkg.getHotelType() + "," +
                            updatedPkg.getDuration());
                    found = true;
                } else {
                    writer.write(pkg.getId() + "," +
                            pkg.getName() + "," +
                            pkg.getDestination() + "," +
                            pkg.getHotelType() + "," +
                            pkg.getDuration());
                }
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
            return "Error updating package";
        }

        return found ? "Package updated" : "Package not found";
    }
}
