package com.tourism.service;

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
        if (userRepository.findByUsername(username) != null) {
            return false;
        }
        String id = UUID.randomUUID().toString().substring(0, 8);
        User user = new Traveler(id, username, password); // Default to Traveler for now
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
}
