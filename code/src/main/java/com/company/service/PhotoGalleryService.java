package com.company.service;

import com.company.model.Comment;
import com.company.model.Photo;
import com.company.model.Rating;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

@Service
public class PhotoGalleryService {

    private final List<Comment> comments = new ArrayList<>();
    private final List<Rating> ratings = new ArrayList<>();
    private final List<Photo> photos = new ArrayList<>(); // 이미지 목록

    public void uploadImage(MultipartFile file) throws IOException {
        String uploadDir = "src/main/resources/static/image/";
        Path uploadPath = Paths.get(uploadDir);

        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        File transferFile = new File(uploadDir + file.getOriginalFilename());
        file.transferTo(transferFile);

        // 업로드된 이미지를 목록에 추가
        photos.add(new Photo((long) (photos.size() + 1), "/resources/static/image/" + file.getOriginalFilename(), "업로드된 이미지"));
    }

    public List<Photo> getImages() {
        return new ArrayList<>(photos); // 이미지 목록 반환
    }

    public void addComment(String user, String text) {
        comments.add(new Comment(user, text));
    }

    public List<Comment> getComments() {
        return new ArrayList<>(comments);
    }

    public void addRating(int score) {
        ratings.add(new Rating(score));
    }

    public List<Rating> getRatings() {
        return new ArrayList<>(ratings);
    }
}
