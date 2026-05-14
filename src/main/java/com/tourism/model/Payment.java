package com.tourism.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public abstract class Payment {
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
        if (parts.length >= 5) {
            String method = parts[3];
            if ("CREDIT_CARD".equals(method)) {
                return new CreditCardPayment(parts[0], Double.parseDouble(parts[1]), parts[2], parts[4], "N/A");
            } else if ("BANK_TRANSFER".equals(method)) {
                return new BankTransfer(parts[0], Double.parseDouble(parts[1]), parts[2], parts[4], "N/A");
            }
        }
        return null;
    }
}
