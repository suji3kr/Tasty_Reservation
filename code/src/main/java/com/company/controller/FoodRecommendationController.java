package com.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.company.model.FoodRecommendation;

import java.util.Arrays;
import java.util.List;

@Controller
public class FoodRecommendationController {

    @GetMapping("/recommendations")
    public String showRecommendations(Model model) {
        List<FoodRecommendation> recommendations = Arrays.asList(
            new FoodRecommendation("맛집1", "서울 최고의 맛집!", "image1.jpg", Arrays.asList("#한식", "#서울")),
            new FoodRecommendation("맛집2", "이태원 인기 맛집!", "image2.jpg", Arrays.asList("#이태원", "#양식")),
            new FoodRecommendation("맛집3", "강남 최고의 레스토랑!", "image3.jpg", Arrays.asList("#강남", "#일식"))
        );

        model.addAttribute("recommendations", recommendations);
        return "/recommendations"; // views/recommendations.jsp로 이동
    }
}
