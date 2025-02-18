package com.company.controller;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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

    // 날짜 문자열을 Date 객체로 변환하는 메서드
    private Date parseDateString(String searchDateStr) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date searchDate = sdf.parse(searchDateStr);
        return searchDate;
    }

    // 예약 만들기
    @PostMapping("")
    public String makeReservation(
            @RequestParam("storeId") int storeId,
            @RequestParam("phone") String phone,
            @RequestParam("reservationDate") String reservationDate,
            @RequestParam("reservationTime") String reservationTime,
            @RequestParam("peopleCount") int peopleCount,
            RedirectAttributes redirectAttributes,
            HttpSession session) throws ParseException {

        ReservationDTO reservation = new ReservationDTO();
        reservation.setStoreId(storeId);
        reservation.setUserName((String) session.getAttribute("loginUserName"));
        reservation.setPhone(phone);
        reservation.setReservationDate(parseDateString(reservationDate));
        reservation.setReservationTime(Time.valueOf(reservationTime + ":00"));
        reservation.setPeopleCount(peopleCount);

        reservationService.saveReservation(reservation);
        redirectAttributes.addFlashAttribute("message", "예약이 완료되었습니다!");
        return "redirect:/store/detail?id=" + storeId;
    }

    // 예약 수정 페이지 (관리자 전용)
    @GetMapping("/edit/{id}")
    public String editReservation(@PathVariable("id") Long id, Model model) {
        ReservationDTO reservation = reservationService.findById(id);
        model.addAttribute("reservation", reservation);
        return "/reservation/edit"; // 수정 JSP 페이지 경로
    }

    // 예약 수정 처리
    @PostMapping("/update")
    public String updateReservation(
            @RequestParam("id") Long id,
            @RequestParam("reservationDate") String reservationDateStr,
            @RequestParam("reservationTime") String reservationTimeStr,
            @RequestParam("peopleCount") int peopleCount,
            @RequestParam("phone") String phone) throws ParseException {

        System.out.println("Received reservationDate: " + reservationDateStr);
        System.out.println("Received reservationTime: " + reservationTimeStr);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date reservationDate = dateFormat.parse(reservationDateStr);
        Time reservationTime = Time.valueOf(reservationTimeStr + ":00");

        ReservationDTO reservation = reservationService.findById(id);
        if (reservation != null) {
            reservation.setReservationDate(reservationDate);
            reservation.setReservationTime(reservationTime);
            reservation.setPeopleCount(peopleCount);
            reservation.setPhone(phone);

            reservationService.updateReservation(reservation);
        }
        return "redirect:/reservation/admin?searchDate=" + reservationDateStr;
    }

    // 예약 삭제 처리 (POST 방식)
    @PostMapping("/delete")
    public String deleteReservation(@RequestParam("id") Long id,
                                    RedirectAttributes redirectAttributes) {
        try {
            reservationService.deleteReservation(id);
            redirectAttributes.addFlashAttribute("message", "예약이 삭제되었습니다.");
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("message", "예약 삭제에 실패하였습니다.");
        }
        return "redirect:/reservation/admin";
    }

    // 관리자용 예약 목록 조회
    @GetMapping("/admin")
    public String listReservations(@RequestParam(value = "searchDate", required = false) String searchDateStr, Model model) {
        System.out.println("🔍 [Controller] 검색 요청이 들어옴!");

        List<ReservationDTO> reservations;
        if (searchDateStr == null || searchDateStr.isEmpty()) {
            System.out.println("🔍 [Controller] 전체 예약 목록 조회");
            reservations = reservationService.getAllReservations();
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
        model.addAttribute("reservationList", reservations);
        return "/reservation/admin";
    }

    // 사용자용 예약 목록 조회
    @GetMapping("/user")
    public String userReservationList(@RequestParam(value = "searchDate", required = false) String searchDate,
                                      HttpSession session, Model model) {
        String loginUserName = (String) session.getAttribute("loginUserName");
        if (searchDate == null || searchDate.isEmpty()) {
            searchDate = java.time.LocalDate.now().toString();
        }
        List<ReservationDTO> reservationList = reservationService.findByUserNameAndDate(loginUserName, searchDate);
        model.addAttribute("reservationList", reservationList);
        model.addAttribute("searchDate", searchDate);
        return "/reservation/user";
    }
}
