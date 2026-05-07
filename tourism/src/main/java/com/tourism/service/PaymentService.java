package com.tourism.service;

import com.tourism.model.Payment;
import com.tourism.util.FileHandler;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class PaymentService {

    private final String FILE_PATH = "data/payments.txt";

    public Payment pay(Payment payment) throws IOException {
        payment.setStatus("COMPLETED");
        FileHandler.appendLine(FILE_PATH, payment.toTextLine());
        return payment;
    }

    public boolean refund(String paymentId) throws IOException {
        List<Payment> allPayments = FileHandler.readLines(FILE_PATH).stream()
                .map(Payment::fromTextLine)
                .collect(Collectors.toList());

        boolean found = false;
        List<String> updatedLines = new ArrayList<>();
        for (Payment p : allPayments) {
            if (p != null) {
                if (p.getId().equals(paymentId)) {
                    p.setStatus("REFUNDED");
                    found = true;
                }
                updatedLines.add(p.toTextLine());
            }
        }

        if (found) {
            FileHandler.writeLines(FILE_PATH, updatedLines);
        }
        return found;
    }

    public List<Payment> getPaymentsByBooking(String bookingId) throws IOException {
        return FileHandler.readLines(FILE_PATH).stream()
                .map(Payment::fromTextLine)
                .filter(p -> p != null && p.getBookingId().equals(bookingId))
                .collect(Collectors.toList());
    }
}
