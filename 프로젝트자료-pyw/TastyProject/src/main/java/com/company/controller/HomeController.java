package com.company.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("맛집 추천 사이트에 오신걸 환영합니다", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		// 사용자 맞춤 메시지 추가
	    String welcomeMessage = "안녕하세요! 오늘도 맛있는 하루 되세요!";
	    model.addAttribute("welcomeMessage", welcomeMessage);
	    
	 // 최근 추천 항목 추가
	    String[] recentRecommendations = {"본프레레", "스테이크하우스", "연어상회"};
	    model.addAttribute("recentRecommendations", recentRecommendations);
		
		return "home";
	}
	
}
