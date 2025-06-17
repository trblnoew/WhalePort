package kr.or.ddit.customer.reserve.parking.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ParkingVO {

	private int plNo;
	private String plName;
	private int plCost;
	
	private int prNo;
	private String prCarno;
	private String prEntry;
	private String prExit;
	private int prCost;
	private Date prDate;
	private String prWay;
	private String prStatus;
	private int cusNo;
	private String prName;
	private String prTel;
	private int countY;
	private int countN;
	private int totalCount;
	private int totalCost;
}
