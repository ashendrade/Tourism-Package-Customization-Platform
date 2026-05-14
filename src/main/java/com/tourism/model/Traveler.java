package com.tourism.model;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class Traveler extends User {
    
    public Traveler(String id, String username, String password) {
        super(id, username, password, "TRAVELER");
    }

    @Override
    public String getDashboardUrl() {
        return "/traveler/dashboard";
    }
}
