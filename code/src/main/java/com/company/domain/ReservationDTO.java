package com.company.domain;

import lombok.Data;

@Data
public class ReservationDTO {
    private int id;
    private int storeId;
    private String customerName;
    private String phoneNumber;
    private String reservationDate;
    private String reservationTime;
    private int peopleCount;
}
