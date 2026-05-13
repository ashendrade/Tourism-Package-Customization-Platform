package com.tourism.controller;

import com.tourism.model.Payment;
import com.tourism.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("/api/payments")
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

    @PostMapping("/pay")
    public ResponseEntity<Payment> pay(@RequestBody Payment payment) {
        try {
            Payment completed = paymentService.pay(payment);
            return new ResponseEntity<>(completed, HttpStatus.OK);
        } catch (IOException e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PutMapping("/{id}/refund")
    public ResponseEntity<String> refund(@PathVariable String id) {
        try {
            boolean success = paymentService.refund(id);
            if (success) {
                return new ResponseEntity<>("Refund processed successfully", HttpStatus.OK);
            } else {
                return new ResponseEntity<>("Payment ID not found", HttpStatus.NOT_FOUND);
            }
        } catch (IOException e) {
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
