package com.kh.apartmentor.fee.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Fee {
	
//	APT_NO	VARCHAR2(30 BYTE)
//	USER_NO	NUMBER
//	FEE_MONTH	NUMBER
//	DUE_DATE	DATE
//	APT_FEE	VARCHAR2(30 BYTE)
	
	private String aptNo;
	private int userNo;
	private int feeMonth;
	private Date dueDate;
	private String aptFee;
	
}
