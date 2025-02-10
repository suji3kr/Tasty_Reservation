package com.company.domain;

import lombok.Data;

@Data
public class ReservationDTO {
    private int id;
    private int storeId;
    private String userName;
    private String phone;
    private String reservationDate;
    private String reservationTime;
    private int peopleCount;
	public Object getCustomerEmail() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
