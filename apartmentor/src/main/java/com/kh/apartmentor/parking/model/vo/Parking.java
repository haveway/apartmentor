package com.kh.apartmentor.parking.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Parking {
	
	private String carNo;
	private String carPhone;
	private String status;
	private int carCategory;
	private Date carDate;
	private String carPurpose;
	private int userNo;

}
