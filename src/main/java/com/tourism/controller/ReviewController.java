package com.tourism.controller;

import com.tourism.model.Review;
import com.tourism.model.User;
import com.tourism.service.ReviewService;
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

    @GetMapping("/reviews")
    public String viewReviews(Model model) throws IOException {
        model.addAttribute("reviews", reviewService.getAllReviews());
        return "reviews";
    }

    @PostMapping("/reviews/add")
    public String addReview(@RequestParam String packageId, 
                            @RequestParam int rating, 
                            @RequestParam String comment, 
                            HttpSession session) throws IOException {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        Review review = new Review();
        review.setPackageId(packageId);
        review.setUserId(user.getUsername());
        review.setRating(rating);
        review.setComment(comment);

        reviewService.addReview(review);
        return "redirect:/reviews";
    }
}
