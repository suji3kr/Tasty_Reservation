package com.company.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.company.service.NaverImageSearchService;

@RequestMapping("/snaps/*")
@Controller
public class RecommendController {
	
	private final NaverImageSearchService naverImageSearchService;
	
	public RecommendController(NaverImageSearchService naverImageSearchService) {
        this.naverImageSearchService = naverImageSearchService;
    }

	private static final String[] FOOD_LIST = {
		    // ✅ 한식 (Korean)
		    "김치찌개", "된장찌개", "비빔밥", "삼겹살", "불고기", "제육볶음", "돼지갈비", "순두부찌개", "갈비찜", "찜닭",
		    "낙지볶음", "해물찜", "곱창전골", "감자탕", "설렁탕", "우거지해장국", "추어탕", "장어구이", "삼계탕",
		    "떡볶이", "순대국", "부대찌개", "쭈꾸미볶음", "매운탕", "도토리묵", "보쌈", "족발", "닭갈비", "해장국",
		    "전복죽", "콩나물국밥", "오징어볶음", "잔치국수", "비빔냉면", "물냉면", "수제비", "칼국수", "동태찌개", "고등어조림",

		    // ✅ 중식 (Chinese)
		    "짜장면", "짬뽕", "탕수육", "깐풍기", "양장피", "마라탕", "마라샹궈", "베이징덕", "유산슬", "고추잡채",
		    "칠리새우", "멘보샤", "양꼬치", "딤섬", "훠궈", "마파두부", "홍샤오러우", "고량주 안주", "차슈덮밥", "우육면",

		    // ✅ 일식 (Japanese)
		    "초밥", "라멘", "돈카츠", "규카츠", "텐동", "덴푸라", "오므라이스", "타코야끼", "오코노미야끼", "우동",
		    "소바", "스키야키", "샤브샤브", "에비후라이", "스시롤", "장어덮밥", "카레라이스", "야키소바", "규동", "사케동",

		    // ✅ 서양식 (Western)
		    "스테이크", "파스타", "햄버거", "피자", "크림파스타", "까르보나라", "봉골레파스타", "리조또", "스프", "미트볼",
		    "바베큐 폭립", "포크찹", "칠리콘카르네", "클램차우더", "시저샐러드", "그릭 샐러드", "오믈렛", "클럽샌드위치", "베이글",

		    // ✅ 동남아 음식 (Southeast Asian)
		    "팟타이", "똠얌꿍", "카오팟", "나시고랭", "바쿠테", "베트남 쌀국수", "분짜", "반미", "미고렝", "사테꼬치",
		    "락사", "바비큐 치킨", "카레라이스", "캉콩볶음", "말레이시아 닭고기 덮밥", "싱가포르 칠리크랩",

		    // ✅ 중동 & 인도 (Middle Eastern & Indian)
		    "케밥", "훔무스", "팔라펠", "샤와르마", "카레", "난", "탄두리 치킨", "달카레", "사모사",
		    "비리야니", "파니르 버터 마살라", "라씨", "할루미 치즈 샐러드", "무사카", "파코라",

		    // ✅ 남미 음식 (South American)
		    "타코", "퀘사디아", "부리또", "엔칠라다", "세비체", "아사도", "엠파나다", "빠에야", "감바스 알 아히요",
		    "페이조아다", "브라질리언 스테이크", "멕시칸 칠리",

		    // ✅ 디저트 (Dessert)
		    "와플", "팬케이크", "마카롱", "티라미수", "치즈케이크", "브라우니", "푸딩", "도넛", "초콜릿 무스",
		    "크로와상", "에끌레어", "아포가토", "젤라또", "슈크림", "애플파이", "크렘브륄레", "타르트", "푸딩",

		    // ✅ 건강식 & 채식 (Healthy & Vegetarian)
		    "그린 샐러드", "퀴노아 샐러드", "두부스테이크", "렌틸수프", "바나나 스무디", "아보카도 토스트", "토마토 브루스케타",
		    "콜드프레스 주스", "두유 요거트", "바질페스토 파스타", "마파두부",

		    // ✅ 다양한 간식류 (Snacks)
		    "치킨 너겟","핫도그", "떡꼬치", "어묵", "튀김만두", "순대", "옥수수 구이", "감자튀김",
		    "팝콘", "바게트 샌드위치", "핫윙", "도리아", "치즈볼",

		    // ✅ 이색 음식 (Exotic Foods)
		    "에스카르고", "랍스터", "캐비어", "푸아그라", "타프나드", "스네일 수프", "카르파초", "문어 숙회",
		    "말고기 스테이크", "블루치즈 샐러드", "프로슈토"
		};

    @GetMapping("/recommend")
    public Object recommend(Model model, HttpServletRequest request) {
        String food = getRandomFood();
        List<Restaurant> restaurants = getNaverSearchResults(food);
        String imageUrl = naverImageSearchService.searchImage(food);

        // 일반 요청 (JSP 렌더링)
        if (request.getHeader("X-Requested-With") == null) {
            model.addAttribute("food", food);
            model.addAttribute("restaurants", restaurants);
            model.addAttribute("imageUrl", imageUrl);
            return "/snaps/recommend"; // JSP 반환
        }

        // Ajax 요청 (JSON 반환)
        return new RecommendResponse(food, imageUrl, restaurants);
    }

    private String getRandomFood() {
        return FOOD_LIST[new Random().nextInt(FOOD_LIST.length)];
    }

    private List<Restaurant> getNaverSearchResults(String food) {
        List<Restaurant> list = new ArrayList<>();
        try {
            String encodedQuery = URLEncoder.encode(food + " 맛집", "UTF-8");
            String searchUrl = "https://m.map.naver.com/search2/search.naver?query=" + encodedQuery;
            list.add(new Restaurant(food + " 맛집 검색 결과", "네이버 검색에서 직접 확인하세요.", searchUrl));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            list.add(new Restaurant("네이버 검색 실패", "검색 결과를 찾을 수 없습니다.", "https://map.naver.com"));
        }
        return list;
    }

    public static class RecommendResponse {
        private String food;
        private String imageUrl;
        private List<Restaurant> restaurants;

        public RecommendResponse(String food, String imageUrl, List<Restaurant> restaurants) {
            this.food = food;
            this.imageUrl = imageUrl;
            this.restaurants = restaurants;
        }

        public String getFood() {
            return food;
        }

        public String getImageUrl() {
            return imageUrl;
        }

        public List<Restaurant> getRestaurants() {
            return restaurants;
        }
    }

    public static class Restaurant {
        private String name;
        private String address;
        private String link;

        public Restaurant(String name, String address, String link) {
            this.name = name;
            this.address = address;
            this.link = link;
        }

        public String getName() {
            return name;
        }

        public String getAddress() {
            return address;
        }

        public String getLink() {
            return link;
        }
    }
}

