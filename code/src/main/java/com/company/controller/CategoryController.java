package com.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CategoryController {

    @GetMapping("/category/japen")
    public String meatCategory(Model model) {
        model.addAttribute("category", "일식");
        return "/category/japen";
    }

    @GetMapping("/category/korean")
    public String koreanCategory(Model model) {
        model.addAttribute("category", "한식");
        return "/category/korean";
    }

    @GetMapping("/category/china")
    public String vegetarianCategory(Model model) {
        model.addAttribute("category", "중식");
        return "/category/china";
    }

    @GetMapping("/category/western")
    public String worldCategory(Model model) {
        model.addAttribute("category", "양식");
        return "/category/western";
    }
}