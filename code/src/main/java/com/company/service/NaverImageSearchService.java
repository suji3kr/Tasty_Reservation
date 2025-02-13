package com.company.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class NaverImageSearchService {

    private static final String CLIENT_ID = "Bsj4CuW24syzCXqGUT7f";  // 네이버 API 클라이언트 ID
    private static final String CLIENT_SECRET = "VscfwAXaw7";  // 네이버 API 클라이언트 시크릿
    private static final String API_URL = "https://openapi.naver.com/v1/search/image";

 // 🔹 정상적인 이미지 URL을 저장할 캐시 (음식 이름 → 이미지 URL)
    private static final Map<String, String> imageCache = new HashMap<>();

    public String searchImage(String query) {
        // 1️⃣ 캐시에 저장된 이미지 URL이 있다면 API를 호출하지 않고 반환
        if (imageCache.containsKey(query)) {
            System.out.println("✅ 캐시된 이미지 사용: " + imageCache.get(query));
            return imageCache.get(query);
        }

        try {
            String encodedQuery = URLEncoder.encode(query, StandardCharsets.UTF_8);
            String requestUrl = API_URL + "?query=" + encodedQuery + "&display=50&sort=sim";

            URL url = new URL(requestUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("X-Naver-Client-Id", CLIENT_ID);
            connection.setRequestProperty("X-Naver-Client-Secret", CLIENT_SECRET);

            // 응답 읽기
            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
            reader.close();

            // JSON 파싱
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode root = objectMapper.readTree(response.toString());
            JsonNode items = root.path("items");

            for (JsonNode item : items) {
                String imageUrl = item.path("link").asText();

                // HTTP → HTTPS 변환 (보안 문제 해결)
                if (imageUrl.startsWith("http://")) {
                    imageUrl = imageUrl.replace("http://", "https://");
                }

                // 🔹 2. 이미지가 정상적으로 접근 가능한지 확인
                if (isValidImage(imageUrl)) {
                    // 3️⃣ 정상적인 이미지라면 캐시에 저장하고 반환
                    imageCache.put(query, imageUrl);
                    System.out.println("✅ 정상 이미지 URL 저장: " + imageUrl);
                    return imageUrl;
                } else {
                    System.out.println("🚨 깨진 이미지 감지, 다음 이미지 확인...");
                }
            }

            System.out.println("⚠️ 모든 이미지가 깨짐, 기본 이미지 반환");

        } catch (Exception e) {
            e.printStackTrace();
        }

        // 기본 이미지 반환
        return "/resources/image/logo.jpg";
    }

    // 🔹 이미지가 정상적으로 로드될 수 있는지 확인하는 메서드
    private boolean isValidImage(String imageUrl) {
        try {
            URL url = new URL(imageUrl);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("HEAD");
            connection.setConnectTimeout(3000);
            connection.setReadTimeout(3000);
            int responseCode = connection.getResponseCode();

            // HTTP 응답 코드가 200이면 정상 이미지
            return responseCode == 200;
        } catch (Exception e) {
            return false; // URL이 깨진 경우 false 반환
        }
    }
}

