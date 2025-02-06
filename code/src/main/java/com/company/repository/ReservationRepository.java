package com.company.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.company.domain.ReservationDTO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ReservationRepository {
	
	private final SqlSessionTemplate sql;
	
	// 예약 저장
	public int saveReservation(ReservationDTO reservation) {
		return sql.insert("reservation.save", reservation);
	}

	// 특정 가게의 예약 목록 조회
	public List<ReservationDTO> findByStoreId(int storeId) {
		return sql.selectList("reservation.findByStoreId", storeId);
	}
}
