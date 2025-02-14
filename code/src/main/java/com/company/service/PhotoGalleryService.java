package com.company.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.company.model.Comment;
import com.company.model.Photo;
import com.company.model.Rating;

@Service
public class PhotoGalleryService {

    private final List<Comment> comments = new ArrayList<>();
    private final List<Rating> ratings = new ArrayList<>();
    private static final String UPLOAD_DIR = "C:/uploads"; // 저장 경로

    public void uploadImage(MultipartFile file) throws IOException {
        Path uploadPath = Paths.get(UPLOAD_DIR);

        if (!Files.exists(uploadPath)) {
            Files.createDirectories(uploadPath);
        }

        File transferFile = new File(UPLOAD_DIR + "/" + file.getOriginalFilename());
        file.transferTo(transferFile);
    }
    

    public List<Photo> getImages() {
        File folder = new File(UPLOAD_DIR);
        File[] listOfFiles = folder.listFiles();
        if (listOfFiles != null) {
            return Arrays.stream(listOfFiles)
                    .filter(File::isFile)
                    .map(file -> new Photo((long) (file.hashCode()), "/upload/" + file.getName(), "업로드된 이미지"))
                    .collect(Collectors.toList());
        }
        
        return new ArrayList<>();
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
