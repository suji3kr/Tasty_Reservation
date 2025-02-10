package com.company.service;

import java.text.SimpleDateFormat;
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

    @Transactional
    public void saveReservation(ReservationDTO reservation) {
        reservationRepository.saveReservation(reservation);
    }

    public List<ReservationDTO> getReservationsByStoreId(int storeId) {
        return reservationRepository.findByStoreId(storeId);
    }
    
    
    public List getReservationDate(Date searchDate) {
        // Date → String 변환
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String formattedDate = dateFormat.format(searchDate);
        
        // 데이터베이스에서 해당 날짜의 예약 조회
        return reservationRepository.findByReservationDate(formattedDate);
    }
}
