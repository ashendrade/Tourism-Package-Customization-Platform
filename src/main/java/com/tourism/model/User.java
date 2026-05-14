package com.tourism.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public abstract class User {
    private String id;
    private String username;
    private String password;
    private String role; // "TRAVELER" or "ADMIN"

    public abstract String getDashboardUrl();
}
