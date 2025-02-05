package com.company.service;

import com.company.model.Photo;
import com.company.model.Comment;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class PhotoService {

    public Photo getPhoto(Long id) {
        // DB에서 사진 정보 가져오기 (예시)
        return new Photo(id, "/resources/image/sample.png", "사진 설명");
    }

    public List<Comment> getComments(Long id) {
        // DB에서 댓글 목록 가져오기 (예시)
        return Arrays.asList(new Comment("User1", "Nice photo!"));
    }

    public double getAverageRating(Long id) {
        // DB에서 평균 별점 가져오기 (예시)
        return 4.5;
    }
}
