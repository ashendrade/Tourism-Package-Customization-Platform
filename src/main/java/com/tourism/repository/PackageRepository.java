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
            writer.write(pkg.getId() + "," + pkg.getName() + "," + pkg.getDestination() + "," + pkg.getHotelType() + "," + pkg.getDuration());
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
                String[] data = line.split(",");
                if (data.length >= 5) {
                    list.add(new TravelPackage(data[0], data[1], data[2], data[3], Integer.parseInt(data[4].trim())));
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
                writer.write(pkg.getId() + "," + pkg.getName() + "," + pkg.getDestination() + "," + pkg.getHotelType() + "," + pkg.getDuration());
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
