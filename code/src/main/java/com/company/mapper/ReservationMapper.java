package com.company.mapper;

import java.util.Date;
import java.util.List;

import com.company.domain.ReservationDTO;

public interface ReservationMapper {
    List<ReservationDTO> selectReservationsByDate(Date searchDate);
}