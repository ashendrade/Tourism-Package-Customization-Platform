package com.tourism.service;

import com.tourism.model.Admin;
import com.tourism.model.Traveler;
import com.tourism.model.User;
import com.tourism.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public boolean register(String username, String password, String role) {
        return register(username, password, role, "", "");
    }

    public boolean register(String username, String password, String role, String fullName, String email) {
        if (userRepository.findByUsername(username) != null) {
            return false;
        }
        String id = UUID.randomUUID().toString().substring(0, 8);
        User user;
        if ("ADMIN".equalsIgnoreCase(role)) {
            user = new Admin(id, username, password);
        } else {
            user = new Traveler(id, username, password);
        }
        user.setFullName(fullName);
        user.setEmail(email);
        userRepository.saveUser(user);
        return true;
    }

    public User login(String username, String password) {
        User user = userRepository.findByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }

    public java.util.List<User> getAllUsers() {
        return userRepository.getAllUsers();
    }

    public User getUserById(String id) {
        return userRepository.findById(id);
    }

    public void updateUser(User user) {
        userRepository.updateUser(user);
    }

    public void deleteUser(String id) {
        userRepository.deleteUser(id);
    }
}
