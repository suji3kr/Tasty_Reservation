package com.company.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.company.model.Review;
import com.company.service.ReviewService;

@RequestMapping("/snaps/*")
@Controller
public class ReviewSpotController {

    private final ReviewService reviewService;

    public ReviewSpotController(ReviewService reviewService) {
        this.reviewService = reviewService;
    }

    @GetMapping("/reviewSpot")
    public String reviewSpotPage(Model model) {
        model.addAttribute("reviews", reviewService.getAllReviews());
        model.addAttribute("newReview", new Review());
        return "/snaps/reviewSpot";
    }

    @PostMapping("/addReview")
    public String addReview(@ModelAttribute Review newReview, @RequestParam("imageFile") MultipartFile imageFile, Model model) {
        if (!imageFile.isEmpty()) {
            String fileName = UUID.randomUUID().toString() + "_" + imageFile.getOriginalFilename();
            String uploadDir = "C:\\uploads\\"; // Windows 경로 설정
            File directory = new File(uploadDir);

            if (!directory.exists() && !directory.mkdirs()) {
                model.addAttribute("errorMessage", "Could not create upload directory!");
                return "/snaps/reviewSpot"; // Return to the review page on failure
            }

            try {
                File uploadFile = new File(uploadDir + fileName);
                imageFile.transferTo(uploadFile);
                newReview.setImagePath(fileName);
            } catch (IOException e) {
                e.printStackTrace();
                model.addAttribute("errorMessage", "File upload failed!");
                return "/snaps/reviewSpot"; // Return to the review page on failure
            }
        }

        reviewService.addReview(newReview);
        return "redirect:/snaps/reviewSpot";
    }
}
