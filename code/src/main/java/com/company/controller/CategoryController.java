package com.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CategoryController {

    @GetMapping("/category/meat")
    public String meatCategory(Model model) {
        model.addAttribute("category", "육식파");
        return "/category/meat";
    }

    @GetMapping("/category/korean")
    public String koreanCategory(Model model) {
        model.addAttribute("category", "한식파");
        return "/category/korean";
    }

    @GetMapping("/category/vegetarian")
    public String vegetarianCategory(Model model) {
        model.addAttribute("category", "채식파");
        return "/category/vegetarian";
    }

    @GetMapping("/category/world")
    public String worldCategory(Model model) {
        model.addAttribute("category", "세계 요리");
        return "/category/world";
    }
}