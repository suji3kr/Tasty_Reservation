package com.company.service;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.company.domain.ReservationDTO;
import com.company.repository.ReservationRepository;

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
}
