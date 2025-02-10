package com.company.service;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.company.domain.ReservationDTO;
import com.company.mapper.ReservationMapper;
import com.company.repository.ReservationRepository;

import java.util.Date;
import java.util.List;

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
    
    
    @Autowired
    private ReservationMapper reservationMapper; // ReservationMapper를 주입받음

    public List<ReservationDTO> getReservationDate(Date searchDate) {
        // 데이터베이스에서 해당 날짜의 예약 조회
        return reservationMapper.selectReservationsByDate(searchDate);
    }
}
