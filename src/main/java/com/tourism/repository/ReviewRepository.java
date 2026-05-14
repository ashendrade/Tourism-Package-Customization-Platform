package com.tourism.repository;

import com.tourism.model.Review;
import com.tourism.util.FileHandler;
import org.springframework.stereotype.Repository;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class ReviewRepository {
    private static final String FILE_PATH = "src/main/resources/data/reviews.txt";

    public void save(Review review) throws IOException {
        FileHandler.appendLine(FILE_PATH, review.toTextLine());
    }

    public List<Review> findAll() throws IOException {
        return FileHandler.readLines(FILE_PATH).stream()
                .map(Review::fromTextLine)
                .filter(r -> r != null)
                .collect(Collectors.toList());
    }

    public List<Review> findByPackageId(String packageId) throws IOException {
        return findAll().stream()
                .filter(r -> r.getPackageId().equals(packageId))
                .collect(Collectors.toList());
    }
}
