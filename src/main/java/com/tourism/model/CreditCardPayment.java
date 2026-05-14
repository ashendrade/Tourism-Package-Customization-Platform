package com.tourism.model;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class CreditCardPayment extends Payment {
    private String cardNumber;

    public CreditCardPayment(String id, double amount, String status, String bookingId, String cardNumber) {
        super(id, amount, status, "CREDIT_CARD", bookingId);
        this.cardNumber = cardNumber;
    }
}
