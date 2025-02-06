package com.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Arrays;
import java.util.List;
import java.util.Random;

@Controller
public class RestaurantController {

    private List<String> restaurants = Arrays.asList(
        "육식파", "한식파", "채식파", "세계 요리"
    );

    @GetMapping("/recommend")
    public String recommendRestaurant(Model model) {
        Random random = new Random();
        String recommended = restaurants.get(random.nextInt(restaurants.size()));
        model.addAttribute("restaurant", recommended);
        return "/board/recommend";
    }
}