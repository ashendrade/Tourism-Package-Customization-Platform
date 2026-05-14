package com.tourism.service;

import com.tourism.model.Review;
import com.tourism.repository.ReviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class ReviewService {

    @Autowired
    private ReviewRepository reviewRepository;

    public void addReview(Review review) throws IOException {
        review.setId(UUID.randomUUID().toString().substring(0, 8));
        reviewRepository.save(review);
    }

    public List<Review> getReviewsForPackage(String packageId) throws IOException {
        return reviewRepository.findByPackageId(packageId);
    }

    public List<Review> getAllReviews() throws IOException {
        return reviewRepository.findAll();
    }
}
