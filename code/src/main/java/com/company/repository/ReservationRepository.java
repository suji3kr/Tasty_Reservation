package com.company.repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		System.out.println("🔍 저장할 예약 데이터: " + reservation);
		return sql.insert("reservation.save", reservation);
	}

	// 특정 가게의 예약 목록 조회
	public List<ReservationDTO> findByStoreId(int storeId) {
		return sql.selectList("reservation.findByStoreId", storeId);
	}

	// 특정 날짜의 예약 목록 조회 (디버깅 추가)
    public List<ReservationDTO> findByReservationDate(String formattedDate) {
        System.out.println("🔍 검색 날짜 (Repository): " + formattedDate);
        List<ReservationDTO> reservations = sql.selectList("reservation.findByReservationDate", formattedDate);
        System.out.println("🔍 조회된 예약 개수: " + reservations.size());
        return reservations;
    }
    
 // 예약 수정
    public int updateReservation(ReservationDTO reservation) {
        return sql.update("reservation.updateReservation", reservation);
    }

    // 특정 예약 조회 (ID로 조회)
    public ReservationDTO findById(Long reservationId) {
        return sql.selectOne("reservation.findById", reservationId);
    }
    public List<ReservationDTO> findAllReservations() {
        System.out.println("🔍 [Repository] 전체 예약 목록 조회");
        List<ReservationDTO> reservations = sql.selectList("reservation.findAllReservations");

        if (reservations == null) {
            System.out.println("🚨 [Repository] reservations가 null입니다! 빈 리스트 반환");
            return new ArrayList<>();
        }

        System.out.println("🔍 [Repository] 조회된 전체 예약 개수: " + reservations.size());
        return reservations;
    }
 // 특정 사용자의 예약 목록 조회
    public List<ReservationDTO> findByUserName(String userName) {
        return sql.selectList("reservation.findByUserName", userName);
    }
 // 특정 사용자와 날짜에 해당하는 예약 목록 조회
    public List<ReservationDTO> findByUserNameAndDate(String userName, String searchDate) {
        Map<String, Object> params = new HashMap<>();
        params.put("userName", userName);
        params.put("searchDate", searchDate);
        return sql.selectList("reservation.findByUserNameAndDate", params);
    }
    

}
