package kr.or.ddit.customer.reserve.hotel.vo;

import java.util.Date;

import lombok.Data;

@Data
public class HotelVO {

	private int htNo;
	private String htName;
	
	private int hrNo;
	private String hrName;
	private String hrTel;
	private String hrStatus;
	private String hrCheckin;
	private int hrCost;
	private Date hrDate;
	private String hrWay;
	private int cusNo;
	private int countY;
	private int countN;
	private int totalCount;
	private int totalCost;
}
