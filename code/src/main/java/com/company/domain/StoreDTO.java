package com.company.domain;

import lombok.Data;


@Data
public class StoreDTO {
    private int id;
    private String storeName;
    private String storeLocation;
    private String storeDescription;
    private String storeCategory;
    private String phoneNumber;
    private String storeImage;
    
 // 기본 생성자 (필수)
    public StoreDTO() {}

    // 모든 필드를 포함한 생성자 추가 (해결 방법)
    public StoreDTO(String storeName, String storeLocation, String storeDescription, 
                    String storeCategory, String phoneNumber, String storeImage) {
        this.storeName = storeName;
        this.storeLocation = storeLocation;
        this.storeDescription = storeDescription;
        this.storeCategory = storeCategory;
        this.phoneNumber = phoneNumber;
        this.storeImage = storeImage;
    }
};