package com.company.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.domain.ReservationDTO;
import com.company.repository.ReservationRepository;

@Service
public class ReservationService {

    private final ReservationRepository reservationRepository;

    @Autowired
    public ReservationService(ReservationRepository reservationRepository) {
        this.reservationRepository = reservationRepository;
    }

    // 예약 저장
    @Transactional
    public void saveReservation(ReservationDTO reservation) {
        reservationRepository.saveReservation(reservation);
    }

    // 특정 가게의 예약 목록 조회
    public List<ReservationDTO> getReservationsByStoreId(int storeId) {
        return reservationRepository.findByStoreId(storeId);
    }

    // 특정 날짜의 예약 목록 조회
    public List<ReservationDTO> getReservationDate(Date searchDate) {
        // Date → String 변환 (YYYY-MM-DD)
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = dateFormat.format(searchDate);

        // 디버깅 로그
        System.out.println("🔍 검색 날짜 (Service): " + formattedDate);

        // 데이터베이스에서 해당 날짜의 예약 조회
        List<ReservationDTO> reservations = reservationRepository.findByReservationDate(formattedDate);

        // 디버깅 로그
        System.out.println("🔍 조회된 예약 개수: " + reservations.size());

        return reservations;
    }

    // 특정 예약 정보 조회
    public ReservationDTO getReservationById(Long reservationId) {
        return reservationRepository.findById(reservationId);
    }
    
    public List<ReservationDTO> getAllReservations() {
        System.out.println("🔍 [Service] 전체 예약 목록 조회");
        List<ReservationDTO> reservations = reservationRepository.findAllReservations();

        if (reservations == null) {
            System.out.println("🚨 [Service] reservations가 null입니다! 빈 리스트 반환");
            return new ArrayList<>();
        }

        System.out.println("🔍 [Service] 조회된 전체 예약 개수: " + reservations.size());
        return reservations;
    }
 // 특정 사용자의 예약 조회
    public List<ReservationDTO> findByUserName(String userName) {
        return reservationRepository.findByUserName(userName);
    }
 // 특정 사용자와 특정 날짜에 해당하는 예약 조회
    public List<ReservationDTO> findByUserNameAndDate(String userName, String searchDate) {
        return reservationRepository.findByUserNameAndDate(userName, searchDate);
    }
 // 특정 예약 조회
    public ReservationDTO findById(Long id) {
        return reservationRepository.findById(id);
    }
 // 예약 수정
    public boolean updateReservation(ReservationDTO reservation) {
        return reservationRepository.updateReservation(reservation) > 0;
    }

    // 예약 삭제
    public boolean deleteReservation(Long id) {
        return reservationRepository.deleteReservation(id) > 0;
    }

}
