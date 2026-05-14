package com.tourism.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Review {
    private String id;
    private String userId;
    private String packageId;
    private int rating; // 1-5
    private String comment;

    public String toTextLine() {
        return id + "|" + userId + "|" + packageId + "|" + rating + "|" + comment;
    }

    public static Review fromTextLine(String line) {
        String[] parts = line.split("\\|");
        if (parts.length == 5) {
            return new Review(parts[0], parts[1], parts[2], Integer.parseInt(parts[3]), parts[4]);
        }
        return null;
    }
}
