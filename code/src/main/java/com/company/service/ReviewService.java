package com.company.service;

import org.springframework.stereotype.Service;
import com.company.model.Review;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

@Service
public class ReviewService {
    private final List<Review> reviews = new ArrayList<>();
    private final AtomicLong counter = new AtomicLong();

    public List<Review> getAllReviews() {
        return new ArrayList<>(reviews);
    }

    public void addReview(Review review) {
        review.setId(counter.incrementAndGet());
        reviews.add(review);
    }
    public void deleteReview(Long reviewId) {
        // review 삭제 로직
    }
}