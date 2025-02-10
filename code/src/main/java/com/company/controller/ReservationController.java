package com.company.controller;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.company.domain.ReservationDTO;
import com.company.service.ReservationService;

@Controller
public class ReservationController {
   
   @Autowired
   private ReservationService reservationService;

   @PostMapping("/reservation")
   public String makeReservation(
           @RequestParam("storeId") int storeId,
           @RequestParam("phone") String phone,
           @RequestParam("reservationDate") String reservationDate,
           @RequestParam("reservationTime") String reservationTime,
           @RequestParam("peopleCount") int peopleCount,
           RedirectAttributes redirectAttributes,
           HttpSession session) {
       
       // 올바르게 DTO 객체 생성
       ReservationDTO reservation = new ReservationDTO();
       reservation.setStoreId(storeId);
       reservation.setUserName((String)session.getAttribute("loginUserName"));
       reservation.setPhone(phone);
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

   @GetMapping("/reservation/list")
   public String listReservations(@RequestParam(required = false) Date searchDate, Model model) {
       if (searchDate == null) {
           searchDate = new Date(); // Default to today's date
       }
       
       List<ReservationDTO> reservations = reservationService.getReservationDate(searchDate);
       // Sort reservations by time
       Collections.sort(reservations, (r1, r2) -> r1.getReservationTime().compareTo(r2.getReservationTime()));
       
       model.addAttribute("reservationList", reservations);
       model.addAttribute("currentDate", searchDate);
       return "reservation/list";
   }
}