package com.tourism.model;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class BankTransfer extends Payment {
    private String accountNumber;

    public BankTransfer(String id, double amount, String status, String bookingId, String accountNumber) {
        super(id, amount, status, "BANK_TRANSFER", bookingId);
        this.accountNumber = accountNumber;
    }
}
