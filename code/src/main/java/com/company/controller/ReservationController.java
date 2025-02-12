package com.company.controller;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.ReservationDTO;
import com.company.service.ReservationService;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	
	    @Autowired
    private ReservationService reservationService;

	    
	private Date parseDateString(String searchDateStr) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date searchDate = sdf.parse(searchDateStr);
        return searchDate;
	}
    // 예약 만들기 (기존 코드)
    @PostMapping("")
    public String makeReservation(
            @RequestParam("storeId") int storeId,
            @RequestParam("phone") String phone,
            @RequestParam("reservationDate") String reservationDate,
            @RequestParam("reservationTime") String reservationTime,
            @RequestParam("peopleCount") int peopleCount,
            RedirectAttributes redirectAttributes,
            HttpSession session) throws ParseException {
        
        // 올바르게 DTO 객체 생성
        ReservationDTO reservation = new ReservationDTO();
        reservation.setStoreId(storeId);
        reservation.setUserName((String)session.getAttribute("loginUserName"));
        reservation.setPhone(phone);
        reservation.setReservationDate(parseDateString(reservationDate));
        reservation.setReservationTime(Time.valueOf(reservationTime + ":00"));
        reservation.setPeopleCount(peopleCount);
        // 서비스 계층에 예약 정보 저장
        reservationService.saveReservation(reservation);
        // 성공 메시지를 리다이렉트할 때 전달
        redirectAttributes.addFlashAttribute("message", "예약이 완료되었습니다!");
        // 가게 상세 페이지로 리다이렉트
        return "redirect:/store/detail?id=" + storeId;
    }

    @GetMapping("/list")
    public String listReservations(@RequestParam(value = "searchDate", required = false) String searchDateStr, Model model) {
        System.out.println("🔍 [Controller] 검색 요청이 들어옴!");

        List<ReservationDTO> reservations;

        if (searchDateStr == null || searchDateStr.isEmpty()) {
            System.out.println("🔍 [Controller] 전체 예약 목록 조회");
            reservations = reservationService.getAllReservations(); // 전체 예약 조회
        } else {
            System.out.println("🔍 [Controller] 특정 날짜 예약 조회: " + searchDateStr);
            try {
            	Date searchDate = parseDateString(searchDateStr);
                model.addAttribute("currentDate", searchDate);
                reservations = reservationService.getReservationDate(searchDate);
            } catch (ParseException e) {
                reservations = new ArrayList<>();
            }
        }

        System.out.println("🔍 [Controller] 조회된 예약 개수: " + reservations.size());
        for(var reservation : reservations) {
        	System.out.println(reservation);
        }
        model.addAttribute("reservationList", reservations);
       

        return "/board/reservation_admin";
    }


    // 예약 수정 페이지로 이동 (GET)
    @GetMapping("/edit/{reservationId}")
    public String editReservation(@PathVariable("reservationId") Long reservationId, Model model, HttpSession session) {
        // 세션에서 로그인된 사용자 이메일을 가져옴
        String userEmail = (String) session.getAttribute("loginEmail");
        
        // 예약 정보를 가져옴
        ReservationDTO reservation = reservationService.getReservationById(reservationId);
        
        // 예약자가 본인인지 확인
        if (reservation != null && reservation.getCustomerEmail().equals(userEmail)) {
            model.addAttribute("reservation", reservation);
            return "/reservation/edit"; // 예약 수정 페이지로 이동
        } else {
            return "redirect:/reservation/error"; // 본인 예약이 아니면 에러 페이지로 리다이렉트
        }
    }

    // 예약 수정 처리 (POST)
    @PostMapping("/update")
    public String updateReservation(@RequestParam("reservationId") Long reservationId, 
                                    @RequestParam("reservationTime") Date reservationTime, 
                                    @RequestParam("peopleCount") int peopleCount, 
                                    @RequestParam("phoneNumber") String phoneNumber, 
                                    HttpSession session) {
        String userEmail = (String) session.getAttribute("loginEmail");
        ReservationDTO reservation = reservationService.getReservationById(reservationId);

        // 예약자가 본인 예약인지 확인
        if (reservation != null && reservation.getCustomerEmail().equals(userEmail)) {
            reservation.setReservationTime((Time) reservationTime);
            reservation.setPeopleCount(peopleCount);
            reservation.setPhone(phoneNumber);
            reservationService.updateReservation(reservation);
            return "redirect:/reservation/list";
        } else {
            // 본인 예약이 아닌 경우
            return "redirect:/reservation/error"; // 에러 페이지로 리다이렉트
        }
    }
}
