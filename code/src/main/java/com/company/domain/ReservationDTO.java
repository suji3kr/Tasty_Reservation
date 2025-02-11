package com.company.domain;



import java.util.Date;

import lombok.Data;

@Data
public class ReservationDTO {
    private int id;
    private int storeId;
    private String storeName;
    private String userName;
    private String phone;
    private Date reservationDate;
    private Date reservationTime;
    private int peopleCount;
	public Object getCustomerEmail() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
