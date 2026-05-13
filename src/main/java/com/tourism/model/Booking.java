package com.tourism.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Booking {
    private String id;
    private String userId;
    private String packageId;
    private String bookingDate;
    private String status;

    // Helper for serialization
    public String toTextLine() {
        return id + "|" + userId + "|" + packageId + "|" + bookingDate + "|" + status;
    }

    public static Booking fromTextLine(String line) {
        String[] parts = line.split("\\|");
        if (parts.length == 5) {
            return new Booking(parts[0], parts[1], parts[2], parts[3], parts[4]);
        }
        return null;
    }
}
