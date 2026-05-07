package com.tourism.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Payment {
    private String id;
    private double amount;
    private String status;
    private String method;
    private String bookingId;

    // Helper for serialization
    public String toTextLine() {
        return id + "|" + amount + "|" + status + "|" + method + "|" + bookingId;
    }

    public static Payment fromTextLine(String line) {
        String[] parts = line.split("\\|");
        if (parts.length == 5) {
            return new Payment(parts[0], Double.parseDouble(parts[1]), parts[2], parts[3], parts[4]);
        }
        return null;
    }
}
