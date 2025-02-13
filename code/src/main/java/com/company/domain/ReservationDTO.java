package com.company.domain;



import java.sql.Time;
import java.util.Date;

import lombok.Data;

@Data
public class ReservationDTO {
    private int id;
    private int storeId;
    private String storeName;
    private String userName;
    private String phone;
    private String phoneNumber;
    private Date reservationDate;
    private Time reservationTime;
    private int peopleCount;
	public Object getCustomerEmail() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
