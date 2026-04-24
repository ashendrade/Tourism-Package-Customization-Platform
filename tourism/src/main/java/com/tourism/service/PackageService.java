package com.tourism.service;

import com.tourism.model.TravelPackage;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

Service
public class PackageService {

    private static final String FILE_PATH = "packages.txt";

    
    public String createPackage(TravelPackage pkg) {
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
        List<TravelPackage> list = new ArrayList<>();

        try (BufferedReader reader = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;

            while ((line = reader.readLine()) != null) {
                String[] data = line.split(",");

                TravelPackage pkg = new TravelPackage(
                        data[0], data[1], data[2], data[3], Integer.parseInt(data[4])
                );

                list.add(pkg);
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
}