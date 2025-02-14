package com.company.controller;

import com.company.service.PhotoGalleryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@Controller
public class PhotoGalleryController {

    @Autowired
    private PhotoGalleryService photoGalleryService;

    @GetMapping("/photoGallery")
    public String showPhotoGallery(Model model) {
        model.addAttribute("comments", photoGalleryService.getComments());
        model.addAttribute("ratings", photoGalleryService.getRatings());
        model.addAttribute("images", photoGalleryService.getImages()); // 이미지 목록 추가

        // 예시 데이터: 실제 데이터는 DB에서 가져와야 합니다.
        List<String> photoList = Arrays.asList(
            "photo1.jpg",
            "photo2.jpg",
            "photo3.jpg"
        );
        
        model.addAttribute("photos", photoList);

        return "/photoGallery"; // views/photoGallery.jsp로 이동
    }

    @PostMapping("/upload")
    public String uploadImage(@RequestParam("file") MultipartFile file) {
        try {
            photoGalleryService.uploadImage(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/photoGallery";
    }

    @PostMapping("/rate")
    public String rate(@RequestParam("rating") int rating) {
        photoGalleryService.addRating(rating);
        return "redirect:/photoGallery";
    }

    @PostMapping("/comment")
    public String comment(@RequestParam("user") String user, @RequestParam("comment") String comment) {
        photoGalleryService.addComment(user, comment);
        return "redirect:/photoGallery";
    }
}
