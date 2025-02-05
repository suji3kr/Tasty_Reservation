package com.company.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.company.domain.StoreDTO;
import com.company.service.StoreService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/store")
public class StoreController {

    @Autowired
    private StoreService storeService;

    // ✅ 가게 등록 폼 페이지
    @GetMapping("/register")
    public String showRegisterForm() {
        return "store/register"; // store/register.jsp 파일을 반환
    }

    // ✅ 가게 등록 처리 (파일 업로드 포함)
    @PostMapping("/register")
    public String registerStore(
            @RequestParam("storeName") String storeName,
            @RequestParam("storeLocation") String storeLocation,
            @RequestParam("storeDescription") String storeDescription,
            @RequestParam("storeCategory") String storeCategory,
            @RequestParam("phoneNumber") String phoneNumber,
            @RequestParam(value = "storeImage", required = false) MultipartFile storeImage
    ) throws IOException {

        // 디버깅 로그
        System.out.println("=== [디버깅] 가게 등록 데이터 ===");
        System.out.println("가게 이름: " + storeName);
        System.out.println("가게 위치: " + storeLocation);
        System.out.println("가게 설명: " + storeDescription);
        System.out.println("가게 종류: " + storeCategory);
        System.out.println("전화번호: " + phoneNumber);

        // 업로드 경로 설정 (C:/uploads/)
        String uploadDir = "C:/uploads/";
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs(); // 폴더가 없으면 생성
        }

        // 기본 이미지 설정
        String fileName = "default.jpg";

        // 파일 업로드 처리
        if (storeImage != null && !storeImage.isEmpty()) {
            String originalFileName = storeImage.getOriginalFilename();
            String fileExtension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 확장자 추출
            fileName = UUID.randomUUID().toString() + fileExtension; // 새로운 파일명 생성

            File uploadFile = new File(uploadDir, fileName);
            storeImage.transferTo(uploadFile); // 파일 저장

            System.out.println("업로드된 파일명: " + fileName);
        }

        // StoreDTO 객체 생성 및 저장
        StoreDTO storeDTO = new StoreDTO(storeName, storeLocation, storeDescription, storeCategory, phoneNumber,
                "/uploads/" + fileName);
        storeService.registerStore(storeDTO);

        return "redirect:/store/storeList"; // 가게 목록으로 이동
    }

    // ✅ 가게 목록 조회
    @GetMapping("/storeList")
    public String listStores(
    		@RequestParam(name = "searchKeyword", required = false, defaultValue = "") String searchKeyword,
    		Model model) {
        List<StoreDTO> stores = storeService.getAllStores();
        model.addAttribute("storeList", stores);
        return "/store/storeList"; // storeList.jsp 파일 반환
    }

    @GetMapping("/detail")
    public String storeDetail(@RequestParam("id") Long id, Model model) {
        log.info("📌 요청된 가게 ID: " + id);

        StoreDTO store = storeService.getStoreById(id);
        
        if (store == null) {
            log.warn("❌ 가게 ID " + id + "를 찾을 수 없습니다.");
            return "redirect:/store/storeList"; // 존재하지 않는 ID일 경우 목록으로 이동
        }

        log.info("✅ 가게 정보 로드 성공: " + store.getStoreName());

        model.addAttribute("store", store);
        
        return "storeDetail"; // ✅ Tiles에 등록된 "storeDetail" 이름을 반환해야 함
    }

    
}
