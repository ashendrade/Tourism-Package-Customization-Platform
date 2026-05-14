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
    private double price;
    
    // New fields for summary
    private String hotelTier;
    private int duration;

    // Helper for serialization
    public String toTextLine() {
        return id + "|" + userId + "|" + packageId + "|" + bookingDate + "|" + status + "|" + price + "|" + hotelTier + "|" + duration;
    }

    public static Booking fromTextLine(String line) {
        try {
            String[] parts = line.split("\\|", 8);
            if (parts.length == 8) {
                return new Booking(parts[0], parts[1], parts[2], parts[3], parts[4], Double.parseDouble(parts[5]), parts[6], Integer.parseInt(parts[7]));
            } else if (parts.length == 6) {
                // Backward compatibility
                return new Booking(parts[0], parts[1], parts[2], parts[3], parts[4], Double.parseDouble(parts[5]), "Standard", 5);
            }
        } catch (Exception e) {
            System.err.println("Error parsing booking line: " + line);
        }
        return null;
    }
}
