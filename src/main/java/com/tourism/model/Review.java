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
    private int rating; // Overall 1-5
    private String comment;
    
    // New fields from updates.md
    private String imageUrl;
    private String videoUrl;
    private int accommodationRating;
    private int transportRating;
    private int guideRating;

    public String toTextLine() {
        return String.format("%s|%s|%s|%d|%s|%s|%s|%d|%d|%d",
            id, userId, packageId, rating, comment, 
            imageUrl != null ? imageUrl : "",
            videoUrl != null ? videoUrl : "",
            accommodationRating, transportRating, guideRating);
    }

    public static Review fromTextLine(String line) {
        try {
            String[] parts = line.split("\\|", 10);
            if (parts.length == 10) {
                return new Review(parts[0], parts[1], parts[2], Integer.parseInt(parts[3]), parts[4],
                                 parts[5], parts[6], Integer.parseInt(parts[7]), 
                                 Integer.parseInt(parts[8]), Integer.parseInt(parts[9]));
            } else if (parts.length == 5) {
                // Check if parts[3] is numeric (standard: id|userId|pkg|rating|comment)
                // or if parts[2] is numeric (legacy: userId|pkg|rating|comment|id)
                if (isNumeric(parts[3])) {
                    return new Review(parts[0], parts[1], parts[2], Integer.parseInt(parts[3]), parts[4],
                                     "", "", Integer.parseInt(parts[3]), 
                                     Integer.parseInt(parts[3]), Integer.parseInt(parts[3]));
                } else if (isNumeric(parts[2])) {
                    return new Review(parts[4], parts[0], parts[1], Integer.parseInt(parts[2]), parts[3],
                                     "", "", Integer.parseInt(parts[2]), 
                                     Integer.parseInt(parts[2]), Integer.parseInt(parts[2]));
                }
            }
        } catch (Exception e) {
            System.err.println("Error parsing review line: " + line);
        }
        return null;
    }

    private static boolean isNumeric(String str) {
        if (str == null || str.isEmpty()) return false;
        try {
            Integer.parseInt(str.trim());
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}
