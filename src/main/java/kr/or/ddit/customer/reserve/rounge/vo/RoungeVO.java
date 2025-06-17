package kr.or.ddit.customer.reserve.rounge.vo;

import java.util.Date;

import lombok.Data;

@Data
public class RoungeVO {

	private int rgNo;
	private String rgName;
	private String rgLoc;
	private Date rgTime;
	private String rgUsetime;
	private int rgSeat;
	private int rgCost;
	private String rgPhoto;
	private String rgReview;
	private String rgContent;
	
	
	private int rrNo;
	private String rrName;
	private String rrTel;
	private int rrCount;
	private String rrStatus;
	private int rrCost;
	private Date rrDate;
	private String rrWay;
	private int cusNo;
	private int countY;
	private int countN;
	private int totalCount;
	private int totalCost;
}
