package com.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.ReservationDTO;
import com.company.service.ReservationService;

import org.springframework.beans.factory.annotation.Autowired;

@Controller
public class ReservationController {
    
    @Autowired
    private ReservationService reservationService;

    @PostMapping("/reservation")
    public String makeReservation(
            @RequestParam("storeId") int storeId,
            @RequestParam("customerName") String customerName,
            @RequestParam("phoneNumber") String phoneNumber,
            @RequestParam("reservationDate") String reservationDate,
            @RequestParam("reservationTime") String reservationTime,
            @RequestParam("peopleCount") int peopleCount,
            RedirectAttributes redirectAttributes) {
        
        // 올바르게 DTO 객체 생성
        ReservationDTO reservation = new ReservationDTO();
        reservation.setStoreId(storeId);
        reservation.setCustomerName(customerName);
        reservation.setPhoneNumber(phoneNumber);
        reservation.setReservationDate(reservationDate);
        reservation.setReservationTime(reservationTime);
        reservation.setPeopleCount(peopleCount);

        // 서비스 계층에 예약 정보 저장
        reservationService.saveReservation(reservation);

        // 성공 메시지를 리다이렉트할 때 전달
        redirectAttributes.addFlashAttribute("message", "예약이 완료되었습니다!");

        // 가게 상세 페이지로 리다이렉트
        return "redirect:/store/detail?id=" + storeId;

    }
}
