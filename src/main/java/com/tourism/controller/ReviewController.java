package com.tourism.controller;

import com.tourism.model.Review;
import com.tourism.model.User;
import com.tourism.service.ReviewService;
import com.tourism.service.DestinationService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;

@Controller
public class ReviewController {

    @Autowired
    private ReviewService reviewService;

    @Autowired
    private DestinationService destinationService;

    @GetMapping({"/reviews", "/reviews/", "/reviews/list"})
    public String viewReviews(Model model) throws IOException {
        model.addAttribute("reviews", reviewService.getAllReviews());
        return "reviews";
    }

    @PostMapping("/reviews/add")
    public String addReview(@RequestParam String packageId, 
                            @RequestParam int rating, 
                            @RequestParam String comment,
                            @RequestParam(required = false) Integer accommodationRating,
                            @RequestParam(required = false) Integer transportRating,
                            @RequestParam(required = false) Integer guideRating,
                            @RequestParam(required = false) String imageUrl,
                            @RequestParam(required = false) String videoUrl,
                            HttpSession session,
                            Model model) throws IOException {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        if (destinationService.getDestinationById(packageId) == null) {
            model.addAttribute("error", "Invalid Destination ID. Please review a valid destination.");
            model.addAttribute("reviews", reviewService.getAllReviews());
            return "reviews";
        }

        Review review = new Review();
        review.setPackageId(packageId);
        review.setUserId(user.getUsername());
        review.setRating(rating);
        review.setComment(comment);
        review.setAccommodationRating(accommodationRating != null ? accommodationRating : rating);
        review.setTransportRating(transportRating != null ? transportRating : rating);
        review.setGuideRating(guideRating != null ? guideRating : rating);
        review.setImageUrl(imageUrl);
        review.setVideoUrl(videoUrl);

        reviewService.addReview(review);
        return "redirect:/reviews";
    }
}
