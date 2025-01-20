//package com.company.domain;
//
//import lombok.ToString;
//
//import lombok.Setter;
//
//import lombok.Getter;
//
//@Getter
//@Setter
//@ToString
//public class Criteria {
//	private int pageNum; //페이지 번호 
//	private int amount; // 페이지당 보여쥴 개수
//	
//	private String type; // 검색조건
//	private String keyword; //검색조건
//	
//	public Criteria() {
//		this(1,10);
//	}
//	public Criteria(int pageNum, int amount) {
//		this.pageNum = pageNum;
//		this.amount = amount;
//	}
//	
//	//TCW(문자열) 
//	public String[] getTypeArr() {
//		return type==null? new String[] {} : type.split("");
//	}
//
//}
package com.company.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
    private int pageNum; // 페이지 번호
    private int amount;  // 페이지당 보여줄 개수

    private String type;    // 검색 조건
    private String keyword; // 검색 키워드

    public Criteria() {
        this(1, 10); // 기본값: 페이지 번호 1, 페이지당 10개
    }

    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }

    // 검색 조건을 배열로 변환 (예: "TCW" → ["T", "C", "W"])
    public String[] getTypeArr() {
        return type == null ? new String[] {} : type.split(",");
    }

    // MyBatis에서 사용할 offset 값 계산
    public int getOffset() {
        return (pageNum - 1) * amount;
    }

    // MyBatis에서 사용할 limit 값 반환
    public int getLimit() {
        return amount;
    }
}
