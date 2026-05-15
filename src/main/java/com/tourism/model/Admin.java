package com.tourism.model;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class Admin extends User {

    public Admin(String id, String username, String password) {
        super(id, username, password, "ADMIN", "", "");
    }

    @Override
    public String getDashboardUrl() {
        return "/admin/dashboard";
    }
}
