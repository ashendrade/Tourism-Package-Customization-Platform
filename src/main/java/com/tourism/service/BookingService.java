package com.tourism.service;

import com.tourism.model.Booking;
import com.tourism.util.FileHandler;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class BookingService {

    private final String FILE_PATH = "src/main/resources/data/bookings.txt";

    public Booking createBooking(Booking booking) throws IOException {
        FileHandler.appendLine(FILE_PATH, booking.toTextLine());
        return booking;
    }

    public List<Booking> getBookingsByUser(String userId) throws IOException {
        return FileHandler.readLines(FILE_PATH).stream()
                .map(Booking::fromTextLine)
                .filter(b -> b != null && b.getUserId().equals(userId))
                .collect(Collectors.toList());
    }

    public boolean cancelBooking(String bookingId) throws IOException {
        List<Booking> allBookings = FileHandler.readLines(FILE_PATH).stream()
                .map(Booking::fromTextLine)
                .collect(Collectors.toList());

        boolean found = false;
        List<String> updatedLines = new ArrayList<>();
        for (Booking b : allBookings) {
            if (b != null) {
                if (b.getId().equals(bookingId)) {
                    b.setStatus("CANCELLED");
                    found = true;
                }
                updatedLines.add(b.toTextLine());
            }
        }

        if (found) {
            FileHandler.writeLines(FILE_PATH, updatedLines);
        }
        return found;
    }

    public Booking getBookingById(String bookingId) throws IOException {
        return FileHandler.readLines(FILE_PATH).stream()
                .map(Booking::fromTextLine)
                .filter(b -> b != null && b.getId().equals(bookingId))
                .findFirst()
                .orElse(null);
    }

    public boolean deleteBooking(String bookingId) throws IOException {
        List<Booking> allBookings = FileHandler.readLines(FILE_PATH).stream()
                .map(Booking::fromTextLine)
                .collect(Collectors.toList());

        boolean found = false;
        List<String> updatedLines = new ArrayList<>();
        for (Booking b : allBookings) {
            if (b != null) {
                if (b.getId().equals(bookingId)) {
                    found = true;
                    continue; // Skip this booking to delete it
                }
                updatedLines.add(b.toTextLine());
            }
        }

        if (found) {
            FileHandler.writeLines(FILE_PATH, updatedLines);
        }
        return found;
    }
}
