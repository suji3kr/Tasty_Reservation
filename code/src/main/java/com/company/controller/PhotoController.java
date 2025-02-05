package com.company.controller;

import com.company.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PhotoController {

    @Autowired
    private PhotoService photoService;

    @GetMapping("/photo/view")
    public String viewPhoto(@RequestParam("id") Long id, Model model) {
        model.addAttribute("photo", photoService.getPhoto(id));
        model.addAttribute("comments", photoService.getComments(id));
        model.addAttribute("averageRating", photoService.getAverageRating(id));
        return "photoView";
    }
}