package com.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Arrays;
import java.util.List;

@Controller
public class PhotoGalleryController {

    @GetMapping("/photoGallery")
    public String showPhotoGallery(Model model) {
        // 예시 데이터: 실제 데이터는 DB에서 가져와야 합니다.
        List<String> photoList = Arrays.asList(
            "/resources/image/photo1.jpg",
            "/resources/image/photo2.jpg",
            "/resources/image/photo3.jpg"
        );

        model.addAttribute("photos", photoList);
        return "photoGallery"; // views/photoGallery.jsp로 이동
    }
}