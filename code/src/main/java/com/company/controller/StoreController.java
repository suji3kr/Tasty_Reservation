package com.company.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.company.domain.StoreDTO;
import com.company.service.StoreService;

@Controller
@RequestMapping("/store")
public class StoreController {

    @Autowired
    private StoreService storeService;

    // 가게 등록 폼 페이지
    @GetMapping("/register")
    public String showRegisterForm() {
        return "store/register";  // 올바른 JSP 파일 경로 사용
    }

    // 가게 등록 처리
    @PostMapping("/register")
    public String registerStore(
            @RequestParam("storeName") String storeName,
            @RequestParam("storeLocation") String storeLocation,
            @RequestParam("storeDescription") String storeDescription,
            @RequestParam("storeCategory") String storeCategory,
            @RequestParam("phoneNumber") String phoneNumber,
            @RequestParam(value = "storeImage", required = false) MultipartFile storeImage,
            HttpServletRequest request) throws IOException {

        // 디버깅 로그 추가
        System.out.println("=== [디버깅] 컨트롤러에서 받은 데이터 ===");
        System.out.println("가게 이름: " + storeName);
        System.out.println("가게 위치: " + storeLocation);
        System.out.println("가게 설명: " + storeDescription);
        System.out.println("가게 종류: " + storeCategory);
        System.out.println("전화번호: " + phoneNumber);

        // 파일 업로드 처리
        String uploadDir = request.getServletContext().getRealPath("/uploads/");
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        String fileName = "default.jpg"; // 기본 이미지 설정
        if (storeImage != null && !storeImage.isEmpty()) {
            fileName = storeImage.getOriginalFilename();
            File uploadFile = new File(uploadDir, fileName);
            storeImage.transferTo(uploadFile);
        }

        // StoreDTO 객체 생성 및 저장
        StoreDTO storeDTO = new StoreDTO(storeName, storeLocation, storeDescription, storeCategory, phoneNumber, "/uploads/" + fileName);
        storeService.insertStore(storeDTO);

        return "redirect:/store/storeList";  // 가게 목록으로 이동
    }

    // 가게 목록 조회
    @GetMapping("/storeList")
    public String listStores(Model model) {
        List<StoreDTO> stores = storeService.getAllStores();
        model.addAttribute("storeList", stores);
        return "store/storeList";  // JSP 경로 수정 (store 폴더 안의 storelist.jsp로 연결)
    }
}
