package com.tourism.repository;

import com.tourism.model.Admin;
import com.tourism.model.Traveler;
import com.tourism.model.User;
import org.springframework.stereotype.Repository;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Repository
public class UserRepository {
    private static final String FILE_PATH = "src/main/resources/data/users.txt";

    public void saveUser(User user) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(String.format("%s,%s,%s,%s,%s,%s",
                user.getId(), 
                user.getUsername(), 
                user.getPassword(), 
                user.getRole(),
                user.getFullName() != null ? user.getFullName() : "",
                user.getEmail() != null ? user.getEmail() : ""));
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) return users;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                line = line.trim();
                if (line.isEmpty()) continue;
                
                String[] data = line.split(",", 6);
                if (data.length >= 4) {
                    User user;
                    if ("ADMIN".equals(data[3])) {
                        user = new Admin(data[0], data[1], data[2]);
                    } else {
                        user = new Traveler(data[0], data[1], data[2]);
                    }
                    
                    if (data.length == 6) {
                        user.setFullName(data[4]);
                        user.setEmail(data[5]);
                    }
                    users.add(user);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return users;
    }

    public void updateUser(User updatedUser) {
        List<User> allUsers = getAllUsers();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (User u : allUsers) {
                if (u.getUsername().equals(updatedUser.getUsername())) {
                    u = updatedUser;
                }
                writer.write(String.format("%s,%s,%s,%s,%s,%s",
                    u.getId(), u.getUsername(), u.getPassword(), u.getRole(),
                    u.getFullName() != null ? u.getFullName() : "",
                    u.getEmail() != null ? u.getEmail() : ""));
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public User findByUsername(String username) {
        return getAllUsers().stream()
                .filter(u -> u.getUsername().equals(username))
                .findFirst()
                .orElse(null);
    }
}
