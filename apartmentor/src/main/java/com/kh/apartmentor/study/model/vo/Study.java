package com.kh.apartmentor.study.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Study {
	
//	RESERVE_NO	NUMBER //예약번호
//	START_DATE	DATE //시작시간
//	END_DATE	DATE //종료시간
//	FACILITY	VARCHAR2(10 BYTE) //시설명
//	SEAT_NUMBER	NUMBER //좌석번호
//	USER_NO	NUMBER //회원번호
//	STATUS	VARCHAR2(1 BYTE) //상태
//	CREATE_DATE	DATE //신청날짜
	
	private int reserveNo;
	private Date startDate;
	private Date endDate;
	private String facility;
	private int seatNo;
	private int userNo;
	private String status;
	private Date createDate;
	
	
	

}
